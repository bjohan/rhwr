#pragma once
#include <iostream>
#include <mutex>
#include <vector>
using namespace std;

class EventSynchronizer{
	private:
		mutex m_mutex;
		mutex m_eventMutex;
	public:
		void set();
		void wait();
		void lock();
		bool eventHappened();
		void clear();
		void unlock();
		
};


