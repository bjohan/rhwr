#pragma once
#include "hackrf_wrapper.hpp"
#include "inter_thread_buffer.hpp"
#include "buffered_message_device.hpp"

#include <cuda_runtime.h>
class HackRfGpu : public MyHackRf{
	private:
		uint64_t m_success;
		uint64_t m_fail;
	public:
		InterThreadBuffer<BufferedMessageDevice<int8_t>> m_itb;
		HackRfGpu(int idx);
		~HackRfGpu();
		int myRxCallback(hackrf_transfer *transfer);
		void myStop();
		
};

