#include "hackrf_gpu_gang.hpp"
#include "int8_to_complex_float.hpp"
#include <thrust/complex.h>
#include <stdexcept>
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
	Int8ToComplexFloat proc;
	BufferedMessage<thrust::complex<float>> bm(BUFLEN, (thrust::complex<float>*) computeBuf);
	
	for(auto hrf:m_hackRfs){
		try {
			BufferedMessage<int8_t>& msg = hrf->consumerCheckout();
			if(msg.m_messageLength > 0) {
				//proc.process(msg.m_ptr, msg.m_messageLength, (thrust::complex<float> *)computeBuf, BUFLEN*sizeof(thrust::complex<float>));
				proc.process(msg, bm);
			} else {
				cout << "Wierd message length " << msg.m_messageLength << " in hackrf " << hrf->m_idx << endl;
				cout << "Message buffer " << hex << static_cast<void *>(msg.m_ptr)<< endl;
			}
			hrf->consumerCheckin();
		} catch (overflow_error &e){
			cout << "Got null, itb->isStopped: " << hrf->isStopped();
		}
	}
}

void HackRfGpuGang::stop(){
	for(auto hrf:m_hackRfs){
		hrf->stop();
	}
}
