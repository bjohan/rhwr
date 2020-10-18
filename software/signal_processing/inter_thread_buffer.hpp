#pragma once
#include "thread_stuff.hpp"
#include <iostream>
#include <mutex>
#include <vector>
using namespace std;

template < typename T>
class InterThreadBuffer{
	private:
		int m_producerPos=0;
		int m_consumerPos=0;
		int m_nMsg = 0;
		bool m_stopped;
		mutex m_mutex;
		EventSynchronizer m_writeEvent;

	public:
		vector<T*> m_buffs;
		InterThreadBuffer(int nMsg, int msgLen);
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

template < typename T>
InterThreadBuffer<T>::InterThreadBuffer(int nMsg, int msgLen){
	for(int i = 0 ; i < nMsg ; i++) m_buffs.push_back(new T(msgLen));
	//m_buffs = new T[nMsg](msgLen);
	//cout << "Allocated " << nMsg << " buffers at " << hex << static_cast<void *>(m_buffs) << endl;
	m_nMsg = nMsg;
	m_stopped = false;
}

template < typename T>
InterThreadBuffer<T>::~InterThreadBuffer(){
	for(auto elem : m_buffs) delete elem;
	//delete[] m_buffs;
	
}

template <typename T>
T& InterThreadBuffer<T>::producerCheckout(){
	m_mutex.lock();
	int next = (m_producerPos+1)%m_nMsg;
	if(next == m_consumerPos){
		m_mutex.unlock();
		throw overflow_error("producer can not get element from already full queue");
	}
	T& result = *m_buffs[m_producerPos];
	m_mutex.unlock();
	return result;
}

template <typename T>
void InterThreadBuffer<T>::producerCheckin(){
	m_mutex.lock();
	int next = (m_producerPos+1)%m_nMsg;
	if(next == m_consumerPos){
		m_mutex.unlock();
		cout << "next " << next << " m_consumerPos " << m_consumerPos << endl;
		throw logic_error("Checking in object in queue that is already full. Should not happen since producerCheckout sould raise exception if queue is full");
	}
	m_producerPos = next;
	m_writeEvent.set();
	m_mutex.unlock();
}

template <typename T>
void InterThreadBuffer<T>::producerStop(){
	m_mutex.lock();
	m_stopped = true;
	m_mutex.unlock();
	m_writeEvent.set();
}

template <typename T>
T& InterThreadBuffer<T>::consumerCheckout(){
	m_mutex.lock();
	if(m_stopped){
		m_mutex.unlock();
		throw underflow_error("Queue is stopped");
	}
	m_writeEvent.lock();
	if(m_consumerPos == m_producerPos){
		m_writeEvent.clear();
		m_writeEvent.unlock();
		m_mutex.unlock();
	       	m_writeEvent.wait();
	       	return consumerCheckout();

	}
	m_writeEvent.unlock();
	T& result = *m_buffs[m_consumerPos];
	m_mutex.unlock();
	return result;
}

template <typename T>
void InterThreadBuffer<T>::consumerCheckin(){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_nMsg;
	m_consumerPos = next;
	m_mutex.unlock();
}

template <typename T>
T& InterThreadBuffer<T>::getBufferIndexUnsafe(int i){
	return *m_buffs[i];
}

template <typename T>
int InterThreadBuffer<T>::getSize(){
	return m_nMsg;
}

template <typename T>
bool InterThreadBuffer<T>::isStopped(){
	return m_stopped;
}


