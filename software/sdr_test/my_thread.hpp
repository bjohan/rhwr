#pragma once
#include <string>
#include <thread>

using namespace std;
class MyThread{
	public:
		MyThread(const char *name);
		~MyThread();
		void start();
		void stop();
		virtual void run();
		void join();
		bool joinable();
	protected:
		string m_name;
		bool m_stop;
	private:
		thread m_thread;
		void threadSetup();
};
