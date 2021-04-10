#pragma once
#include <queue>
#include <mutex>
#include "thread_stuff.hpp"

template <typename T>
class InterThreadQueue {
	private:
		std::queue<T> m_q;
		std::mutex m_lock;
		EventSynchronizer m_writeEvent;
	protected:
		T waitWriteAndGet();
	public:
		void put(T obk);
		T get();
		uint32_t size();
};

template <typename T>
void InterThreadQueue<T>::put(T o){
	m_lock.lock();
	m_q.push(o);
	m_writeEvent.set();
	m_lock.unlock();
}

template <typename T>
T InterThreadQueue<T>::get(){
	T o;
	m_lock.lock();
	if(m_q.empty()){
		m_writeEvent.clear();
		m_lock.unlock();
		m_writeEvent.wait();
		return get();
	}
	o=m_q.front();
	m_q.pop();
	m_lock.unlock();
	return o;
}

template <typename T>
uint32_t InterThreadQueue<T>::size(){
	uint32_t l;
	m_lock.lock();
	l=m_q.size();
	m_lock.unlock();
	return l;
}


