#pragma once
#include "hackrf_wrapper.hpp"
#include "inter_thread_buffer.hpp"
#include "buffered_message_device.hpp"
#include "data_source.hpp"

#include <cuda_runtime.h>
class HackRfGpu : public MyHackRf, public DataSource<int8_t>{
	friend class DataSource;
	private:
		uint64_t m_success;
		uint64_t m_fail;
		float m_runTime;
		float m_tStart;
	public:
		//InterThreadBuffer<BufferedMessageDevice<int8_t>> m_itb;
		HackRfGpu(int idx);
		~HackRfGpu();
		int myRxCallback(hackrf_transfer *transfer);
		void myStop();
		
};

