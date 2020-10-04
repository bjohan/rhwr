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

#define BUFLEN 262144

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


	int numHackrf=4;
	HackRfGpu* hrfl[4];

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i] = new HackRfGpu(i);
	}

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i]->start();
	}

	this_thread::sleep_for(chrono::seconds(30));

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i]->stop();
	}

	for(int i = 0 ; i < numHackrf ; i++){
		delete hrfl[i];
	}



	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	//for(int i = 0 ; i < N ; i++) cout << "C["<< i <<"] is "<< h_C[i] << endl;
	free(h_A);
	free(h_B);
	free(h_C);
	return 0;
}
