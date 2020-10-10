#include "hackrf_gpu.hpp"
#include <iostream>
#define BUFLEN 262144
using namespace std;

HackRfGpu::HackRfGpu(int index) : MyHackRf(index){
	float **p;
	m_itb = new InterThreadBuffer<float *>(8);
	for(int i = 0 ; i < m_itb->getSize() ; i++){
		p = m_itb->getBufferIndexUnsafe(i);
		cudaMalloc(p, BUFLEN*sizeof(float));
		//cout << "Allocated " << *p << endl;
	}
	m_success = 0;
	m_fail = 0;
}

HackRfGpu::~HackRfGpu(){
	float **p;
	stop();
	for(int i = 0 ; i < m_itb->getSize() ; i++){
		p = m_itb->getBufferIndexUnsafe(i);
		//cout << "freed " << *p << endl;
		cudaFree(p);
	}
	delete m_itb;
	cout << "Hackrf " << m_idx << " Success: " << m_success << " Fails: " << m_fail << endl;
	
}

void HackRfGpu::myStop(){
	cout << "My stop called" << endl;
	m_itb->producerStop();
}

int HackRfGpu::myRxCallback(hackrf_transfer* xfer){
	float *mem = m_itb->producerCheckout();
	if(mem != NULL){
		//cout << "copy to" << mem << " " << endl;
		cudaMemcpy(mem, xfer->buffer, xfer->valid_length, cudaMemcpyHostToDevice);
		m_success+=xfer->valid_length/2;
		m_itb->producerCheckin(mem);
	} else {
		m_fail+=xfer->valid_length/2;
	}
	return 0;
}

