#include "hackrf_gpu_gang.hpp"
#include "int8_to_complex_float.hpp"
#include <thrust/complex.h>
using namespace std;

#define BUFLEN 262144
HackRfGpuGang::HackRfGpuGang(vector<int> deviceIds){
	for(auto i:deviceIds){
		m_hackRfs.push_back(new HackRfGpu(i));
	}
	cudaMalloc(&computeBuf,BUFLEN*sizeof(thrust::complex<float>)); 
}

HackRfGpuGang::~HackRfGpuGang(){
	for(auto hrf:m_hackRfs){
		delete hrf;
	}
}

void HackRfGpuGang::start(){
	for(auto hrf:m_hackRfs){
		hrf->start();
	}
}

void HackRfGpuGang::process(){
	float *tbuf;
	Int8ToComplexFloat proc;
	//int8_t buf;
	for(auto hrf:m_hackRfs){
		tbuf=hrf->m_itb->consumerCheckout();
		if(tbuf != 0){

			//cudaMemcpy(buf, tbuf, BUFLEN, cudaMemcpyDeviceToHost;
			proc.process((int8_t*)tbuf, BUFLEN, (thrust::complex<float> *)computeBuf, BUFLEN*sizeof(thrust::complex<float>));
			hrf->m_itb->consumerCheckin();
		} else {
			cout << "Got null, itb->isStopped: " << hrf->m_itb->isStopped();
		}
	}
}

void HackRfGpuGang::stop(){
	for(auto hrf:m_hackRfs){
		hrf->stop();
	}
}
