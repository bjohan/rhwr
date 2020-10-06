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
	vector<double> yplot(1024);
	int N = 1024;
	float *tbuf;
	int8_t buf[BUFLEN];
	size_t size = N*sizeof(float);
	float* h_A = (float*) malloc(size);
	float* h_B = (float*) malloc(size);
	float* h_C = (float*) malloc(size);
	double t0;
	for(int i = 0 ; i < N ; i++){
		h_A[i] = 1;
		h_B[i] = 3;
	}

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


	int numHackrf=1;
	HackRfGpu* hrfl[4];

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i] = new HackRfGpu(3);
	}

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i]->start();
	}

	t0 =getTime();
	while(getTime()-t0 < 2){
		//this_thread::sleep_for(chrono::milliseconds(2));
		for(int i = 0 ; i < numHackrf ; i++){
			tbuf=hrfl[i]->m_itb->consumerCheckout();
			if(tbuf!=NULL){
				//cout << "reading" << tbuf << endl;
				if(i==0)
				cudaMemcpy(buf, tbuf, BUFLEN, cudaMemcpyDeviceToHost);
				hrfl[i]->m_itb->consumerCheckin();
			}
		}
	}
	for(int i = 0 ; i < 1024 ; i++){
		yplot[i] = (int) buf[i*2];
	}
	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i]->stop();
	}

	for(int i = 0 ; i < numHackrf ; i++){
		delete hrfl[i];
	}
	cout << "plotting" << endl;
	plt::plot(yplot);
	plt::grid(true);
	plt::show();

	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	//for(int i = 0 ; i < N ; i++) cout << "C["<< i <<"] is "<< h_C[i] << endl;
	free(h_A);
	free(h_B);
	free(h_C);
	return 0;
}
