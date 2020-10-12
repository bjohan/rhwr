#pragma once
#include <string>
#include <thread>

using namespace std;
class MyThread{
	private:
		thread m_thread;
		string m_name;
		void threadSetup();
	public:
		MyThread(const char *name);
		~MyThread();
		void start();
		virtual void run();
		void join();
};
