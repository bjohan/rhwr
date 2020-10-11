#pragma once
#include "hackrf_wrapper.hpp"
#include "thread_stuff.hpp"
#include "buffered_message.hpp"

#include <cuda_runtime.h>
class HackRfGpu : public MyHackRf{
	private:
		uint64_t m_success;
		uint64_t m_fail;
	public:
		InterThreadBuffer<BufferedMessage<int8_t>> m_itb;
		HackRfGpu(int idx);
		~HackRfGpu();
		int myRxCallback(hackrf_transfer *transfer);
		void myStop();
		
};

