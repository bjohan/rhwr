#include "my_thread.hpp"
#include "hackrf_gpu_gang.hpp"
#include "thread_stuff.hpp"
#include <vector>
class HackRfThread:public MyThread{
	private:
		vector<int> m_deviceIds;
		HackRfGpuGang m_hrg;
		bool m_stop;
	public:
		HackRfThread(vector<int> deviceIds);
		void run();
		void stop();
};
