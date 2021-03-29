#include "hackrf_gpu.hpp"
#include <stdexcept>
#include <iostream>
#include "aux_util.hpp"
#define BUFLEN 262144
using namespace std;

HackRfGpu::HackRfGpu(int index) : MyHackRf(index), DataSource(8, BUFLEN){
	/*for(int i = 0 ; i < m_itb.getSize() ; i++){
		BufferedMessage<int8_t> &msg = m_itb.getBufferIndexUnsafe(i);
		msg.allocate(BUFLEN);
		//cudaMalloc(&(msg.m_ptr), BUFLEN);
		//msg.setBufferLength(BUFLEN);
		//msg.m_messageLength = 0;
	}*/
	m_tStart = getTime();
	cout << "Starting hackrf at " << m_tStart << endl;
	m_success = 0;
	m_fail = 0;
}

HackRfGpu::~HackRfGpu(){
	stop();
	/*for(int i = 0 ; i < m_itb.getSize() ; i++){
		auto &msg = m_itb.getBufferIndexUnsafe(i);
		cudaFree(msg.m_ptr);
		msg.setBufferLength(0);
	}*/
	cout << "Hackrf " << m_idx << dec << " was destroyed. Result; Success: " << m_success << " Fails: " << m_fail << endl;
	cout << "ran for " << m_runTime << " with a rate of " << m_success/m_runTime<< endl;
	
}

void HackRfGpu::myStop(){
	double stopTime = getTime();
	m_runTime = stopTime-m_tStart;
	cout << "My stop called a  " << stopTime << endl;
	producerStop();
}

int HackRfGpu::myRxCallback(hackrf_transfer* xfer){
	try {
		if(xfer->valid_length > 0){
			auto &msg = producerCheckout();
			cudaMemcpy(msg.m_ptr, xfer->buffer, xfer->valid_length, cudaMemcpyHostToDevice);
			msg.m_messageLength = xfer->valid_length;
			m_success+=xfer->valid_length/2;
			producerCheckin();
		} else {
			cout << "Valid length " << xfer->valid_length << endl;
		}
	} catch (overflow_error &e) {
		m_fail+=xfer->valid_length/2;
	}
	return 0;
}

