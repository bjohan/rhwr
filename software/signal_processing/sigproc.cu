#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <cuda_runtime.h>
#include "thread_stuff.hpp"
#include "hackrf_gpu.hpp"
#include "hackrf_gpu_gang.hpp"
#include "my_tcp_server.hpp"
#include <matplotlibcpp.h>
#define BUFLEN 262144

using namespace std;
namespace plt = matplotlibcpp;

__global__ void VecAdd(float* A, float* B, float* C, int N){
	int i = blockDim.x*blockIdx.x+threadIdx.x;
	if(i < N) C[i] = A[i]+B[i];
}

double getTime(){

	return(chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now().time_since_epoch()).count())/1000.0;
}
int main(int argc, char *argv[]){
	vector<double> yqplot(1024);
	vector<double> yiplot(1024);
	vector<double> absplot(1024);
	vector<double> argplot(1024);
	vector<double> freqplot(1024);
	int N = 1024;
	size_t size = N*sizeof(float);
	float* h_A = (float*) malloc(size);
	float* h_B = (float*) malloc(size);
	float* h_C = (float*) malloc(size);
	double t0;
	for(int i = 0 ; i < N ; i++){
		h_A[i] = 1;
		h_B[i] = 3;
	}
	MyTcpServer srv(7000);
	srv.start();
	float* d_A;
	cudaMalloc(&d_A, size);
	float* d_B;
	cudaMalloc(&d_B, size);
	float* d_C;
	cudaMalloc(&d_C, size);
	cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
	cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);

	int threadsPerBlock = 256;
	int blocksPerGrid = (N + threadsPerBlock -1)/threadsPerBlock;
	VecAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, N);
	cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);


	vector<int> hackRfDeviceIndex{0, 1, 2, 3};
	HackRfGpuGang hrg(hackRfDeviceIndex);
	hrg.start();

	t0 =getTime();
	while(getTime()-t0 < 30){
		hrg.process();
	}
	cout << "exitied loop" << endl;
	hrg.stop();
	srv.stop();
	srv.join();

	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	free(h_A);
	free(h_B);
	free(h_C);
	return 0;
}
