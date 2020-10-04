#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <cuda_runtime.h>
#include "thread_stuff.hpp"
#include "hackrf_wrapper.hpp"

#define BUFLEN 262144

using namespace std;

/*template < class T>
class InterThreadBuffer{
	private:
		T m_buffs[];
		int m_producerPos=0;
		int m_consumerPos=0;
		int m_sz = 0;
		mutex m_mutex;

	public:
		InterThreadBuffer(int sz);
		~InterThreadBuffer();
		T producerCheckout();
		void producerCheckin(T);
		T consumerCheckout();
		void consumerCheckin();
		T getBufferUnsafe(int i);
};

template < class T>
InterThreadBuffer<T>::InterThreadBuffer(int sz){
	m_buffs = new T[sz];
	m_sz = sz;
	for(int i = 0 ; i < sz ; i++) m_buffs[i]=NULL;
}

template < class T>
InterThreadBuffer<T>::~InterThreadBuffer(){
	delete[] m_buffs;
}

template <class T>
T InterThreadBuffer<T>::producerCheckout(){
	T result;
	m_mutex.lock();
	int next = (m_producerPos+1)%m_sz;
	if(next == m_consumerPos){
		m_mutex.unlock();
		return NULL;
	}
	result = m_buffs[m_producerPos];
	m_mutex.unlock();
	return result;
}

template <class T>
void InterThreadBuffer<T>::producerCheckin(T p){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_sz;
	if(next == m_producerPos){
		m_mutex.unlock();
	       	throw "Error, try to commit to full buffer";
	}
	m_buffs[m_producerPos] = p;
	m_producerPos = next;
	m_mutex.unlock();
}

template <class T>
T InterThreadBuffer<T>::consumerCheckout(){
	T result;
	m_mutex.lock();
	if(m_consumerPos != m_producerPos){
		m_mutex.unlock();
	       return NULL;
	}
	result = m_buffs[m_consumerPos];
	m_mutex.unlock();
	return result;
}

template <class T>
void InterThreadBuffer<T>::consumerCheckin(){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_sz;
	m_consumerPos = next;
	m_mutex.unlock();
}

template <class T>
T InterThreadBuffer<T>::getBufferUnsafe(int i){
	return m_buffs[i];
}

class MyHackRf{
	private:
		static int rx_callback(hackrf_transfer* transfer);
		static int refCount;
		static hackrf_device_list_t* devs;

	public:
		//float *gpuBuf;
		bool running;
		hackrf_device *dev = NULL;
		MyHackRf(int index);
		virtual int myRxCallback(hackrf_transfer *transfer);
		~MyHackRf();
		void start();
		void stop();

};

int MyHackRf::refCount=0;
hackrf_device_list_t* MyHackRf::devs=NULL;

MyHackRf::MyHackRf(int index){
	int status;
	if(refCount == 0){
		cout << "First hackrf object created, calling hackrf_init() and creating device list" << endl;
		hackrf_init();
		devs = hackrf_device_list();
	}
	refCount++;
	status = hackrf_device_list_open(devs, index, &dev);
	if(status) cout << "Failed to open hackrf index: " << index << " status: " << status << endl;

	//cudaMalloc((void**) &gpuBuf, sizeof(float)*BUFLEN);
	running = false;

}

int MyHackRf::myRxCallback(hackrf_transfer* transfer){
	//cudaMemcpy(transfer->buffer, gpuBuf, transfer->valid_length, cudaMemcpyHostToDevice);
	return 0;
}

int MyHackRf::rx_callback(hackrf_transfer* transfer){
	return ((MyHackRf *)transfer->rx_ctx)->myRxCallback(transfer);
	//cudaMemcpy(transfer->buffer, transfer->rx_ctx, transfer->valid_length, cudaMemcpyHostToDevice);
	//return 0;
}

void MyHackRf::start(){
	if(dev != NULL){
		hackrf_start_rx(dev, rx_callback, (void *) this);
		running = true;
	} else {
		cout << "hackrf device is not open" << endl;
	}
}

void MyHackRf::stop(){
	if(running){
		hackrf_stop_rx(dev);
		running = false;
	}
}

MyHackRf::~MyHackRf(){
	stop();
	hackrf_close(dev);
	//cudaFree(gpuBuf);
	refCount--;
	if(refCount == 0){
		cout << "Last hackrf object is beeing destroyed, freeing hackrf device list and deiniting library" << endl;
		hackrf_device_list_free(devs);
	       	hackrf_exit();
	}
}
*/



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
	MyHackRf* hrfl[4];

	for(int i = 0 ; i < numHackrf ; i++){
		hrfl[i] = new MyHackRf(i);
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
