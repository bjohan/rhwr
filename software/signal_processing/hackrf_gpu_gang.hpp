#pragma once
#include "hackrf_gpu.hpp"
#include <vector>

using namespace std;

class HackRfGpuGang{
	private:
		vector<HackRfGpu*> m_hackRfs;
		float *computeBuf;

	public:
		HackRfGpuGang(vector<int> deviceIds);
		~HackRfGpuGang();

		void start();
		void process();
		void stop();
};
