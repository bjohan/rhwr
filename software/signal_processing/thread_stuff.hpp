#pragma once
#include <iostream>
#include <mutex>
using namespace std;

template < typename T>
class InterThreadBuffer{
	private:
		T* m_buffs;
		int m_producerPos=0;
		int m_consumerPos=0;
		int m_sz = 0;
		mutex m_mutex;

	public:
		InterThreadBuffer(int sz);
		~InterThreadBuffer();
		T producerCheckout();
		void producerCheckin(T);
		T consumerCheckout();
		void consumerCheckin();
		T* getBufferIndexUnsafe(int i);
		int getSize();
};

