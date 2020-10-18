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


