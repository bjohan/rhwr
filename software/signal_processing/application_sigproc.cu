#include <iostream>
#include <thread>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <cuda_runtime.h>
#include "thread_stuff.hpp"
//#include "hackrf_gpu.hpp"
//#include "hackrf_gpu_gang.hpp"
#include "hackrf_thread.hpp"
#include "my_tcp_server.hpp"
#define BUFLEN 262144
#include <readline/readline.h>
#include <readline/history.h>
#include "aux_util.hpp"
#include "signal_server.hpp" 


using namespace std;

__global__ void VecAdd(float* A, float* B, float* C, int N){
	int i = blockDim.x*blockIdx.x+threadIdx.x;
	if(i < N) C[i] = A[i]+B[i];
}


int main(int argc, char *argv[]){
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
	SignalServer sigsrv(srv.pub);
	sigsrv.start();
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
	HackRfThread hrt(hackRfDeviceIndex);
	hrt.start();
	//HackRfGpuGang hrg(hackRfDeviceIndex);
	//hrg.start();

	t0 =getTime();
	char *buf;
	while(true){
		buf = readline(">> ");
		if(buf){
			if(strlen(buf)){
				add_history(buf);
				cout << "Command entered" << buf << " at run time " << getTime()-t0 << endl;
			}
		}
		if(strcmp(buf, "quit")==0) break;
		free(buf);
		//hrg.process();
	}
	hrt.stop();
	cout << "exitied loop" << endl;
	//hrg.stop();


	sigsrv.stop();
	cout << "joining signal server" << endl;
	sigsrv.join();


	srv.stop();
	cout << "joining server thread" << endl;
	srv.join();

	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	free(h_A);
	free(h_B);
	free(h_C);
	cout << "return from main";
	return 0;
}
