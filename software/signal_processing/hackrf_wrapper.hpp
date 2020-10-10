#pragma once
#include <libhackrf/hackrf.h>
#include <cstddef>
class MyHackRf{
	private:
		static int rx_callback(hackrf_transfer* transfer);
		static int refCount;
		static hackrf_device_list_t* devs;

	public:
		//float *gpuBuf;
		int m_idx;
		bool running;
		hackrf_device *dev = NULL;
		MyHackRf(int index);
		virtual int myRxCallback(hackrf_transfer *transfer);
		~MyHackRf();
		void start();
		void stop();
		virtual void myStop();

};

