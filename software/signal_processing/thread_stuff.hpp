#pragma once
#include <iostream>
#include <mutex>
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


template < typename T>
class InterThreadBuffer{
	private:
		int m_producerPos=0;
		int m_consumerPos=0;
		int m_sz = 0;
		bool m_stopped;
		mutex m_mutex;
		EventSynchronizer m_writeEvent;

	public:
		T* m_buffs;
		InterThreadBuffer(int sz);
		~InterThreadBuffer();
		T& producerCheckout();
		void producerStop();
		void producerCheckin();
		T& consumerCheckout();
		void consumerCheckin();
		T& getBufferIndexUnsafe(int i);
		int getSize();
		bool isStopped();
};

