#pragma once
#include <libhackrf/hackrf.h>
#include <cstddef>
#include <vector>
#include <memory>
#include <complex>
#include "thread_safe_queue.hpp"

class MyHackRf{
	public:
		//float *gpuBuf;
		MyHackRf(int index, std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> rxQueue);
		virtual int myRxCallback(hackrf_transfer *transfer);
		~MyHackRf();
		void start();
		void stop();
		virtual void myStop();
	private:
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> m_rxQueue;
		uint32_t m_success;
		uint32_t m_fail;
		int m_idx;
		bool running;
		hackrf_device *dev = NULL;
		static int rx_callback(hackrf_transfer* transfer);
		static int refCount;
		static hackrf_device_list_t* devs;

};

