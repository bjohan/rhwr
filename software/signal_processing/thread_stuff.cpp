#include "thread_stuff.hpp"
#include "buffered_message.hpp"
#include <thrust/complex.h>
#include <stdexcept>

using namespace std;



void EventSynchronizer::set(){
	m_mutex.lock();
	if(!eventHappened()) m_eventMutex.unlock();
	m_mutex.unlock();
}

void EventSynchronizer::wait(){
	m_eventMutex.lock();
	m_eventMutex.unlock();
}

void EventSynchronizer::clear(){
	if(eventHappened())
	m_eventMutex.lock();
}

void EventSynchronizer::lock(){
	m_mutex.lock();
}

bool EventSynchronizer::eventHappened(){
	bool status = m_eventMutex.try_lock();
	if(status) m_eventMutex.unlock();
	return status;
}

void EventSynchronizer::unlock(){
	m_mutex.unlock();
}



template < typename T>
InterThreadBuffer<T>::InterThreadBuffer(int sz){
	m_buffs = new T[sz];
	cout << "Allocated " << sz << " buffers at " << hex << static_cast<void *>(m_buffs) << endl;
	m_sz = sz;
	m_stopped = false;
}

template < typename T>
InterThreadBuffer<T>::~InterThreadBuffer(){
	delete[] m_buffs;
}

template <typename T>
T& InterThreadBuffer<T>::producerCheckout(){
	m_mutex.lock();
	int next = (m_producerPos+1)%m_sz;
	if(next == m_consumerPos){
		m_mutex.unlock();
		throw overflow_error("producer can not get element from already full queue");
	}
	T& result = m_buffs[m_producerPos];
	m_mutex.unlock();
	return result;
}

template <typename T>
void InterThreadBuffer<T>::producerCheckin(){
	m_mutex.lock();
	int next = (m_producerPos+1)%m_sz;
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
	T& result = m_buffs[m_consumerPos];
	m_mutex.unlock();
	return result;
}

template <typename T>
void InterThreadBuffer<T>::consumerCheckin(){
	m_mutex.lock();
	int next = (m_consumerPos+1)%m_sz;
	m_consumerPos = next;
	m_mutex.unlock();
}

template <typename T>
T& InterThreadBuffer<T>::getBufferIndexUnsafe(int i){
	return m_buffs[i];
}

template <typename T>
int InterThreadBuffer<T>::getSize(){
	return m_sz;
}

template <typename T>
bool InterThreadBuffer<T>::isStopped(){
	return m_stopped;
}

template class InterThreadBuffer<float *>;
template class InterThreadBuffer<int8_t *>;
template class InterThreadBuffer<char *>;
template class InterThreadBuffer<thrust::complex<float>*>;
template class InterThreadBuffer<BufferedMessage<float>>;
template class InterThreadBuffer<BufferedMessage<int8_t>>;
template class InterThreadBuffer<BufferedMessage<char>>;
template class InterThreadBuffer<BufferedMessage<thrust::complex<float>>>;
