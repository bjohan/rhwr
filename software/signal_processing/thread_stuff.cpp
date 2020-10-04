#include "thread_stuff.hpp"
using namespace std;


template < class T>
InterThreadBuffer<T>::InterThreadBuffer(int sz){
	m_buffs = new T[sz];
	m_sz = sz;
	for(int i = 0 ; i < sz ; i++) m_buffs[i]=NULL;
}

template < class T>
InterThreadBuffer<T>::~InterThreadBuffer(){
	delete[] m_buffs;
}

template <class T>
T InterThreadBuffer<T>::producerCheckout(){
	T result;
	m_mutex.lock();
	int next = (m_producerPos+1)%m_sz;
	if(next == m_consumerPos){
		m_mutex.unlock();
		return NULL;
	}
	result = m_buffs[m_producerPos];
	m_mutex.unlock();
	return result;
}

template <class T>
void InterThreadBuffer<T>::producerCheckin(T p){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_sz;
	if(next == m_producerPos){
		m_mutex.unlock();
	       	throw "Error, try to commit to full buffer";
	}
	m_buffs[m_producerPos] = p;
	m_producerPos = next;
	m_mutex.unlock();
}

template <class T>
T InterThreadBuffer<T>::consumerCheckout(){
	T result;
	m_mutex.lock();
	if(m_consumerPos != m_producerPos){
		m_mutex.unlock();
	       return NULL;
	}
	result = m_buffs[m_consumerPos];
	m_mutex.unlock();
	return result;
}

template <class T>
void InterThreadBuffer<T>::consumerCheckin(){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_sz;
	m_consumerPos = next;
	m_mutex.unlock();
}

template <class T>
T InterThreadBuffer<T>::getBufferUnsafe(int i){
	return m_buffs[i];
}

