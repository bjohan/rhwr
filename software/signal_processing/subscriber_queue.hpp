#pragma once
#include "inter_thread_queue.hpp"

template <typename T>
class SubscriberQueue{
	private:
		InterThreadQueue<T> m_q;
	public:
		T getMessage();
		SubscriberQueue();
		void TakeMessage(T);

};


template <typename T>
SubscriberQueue<T>::SubscriberQueue()
{

}

template <typename T>
void SubscriberQueue<T>::TakeMessage(T m){
	m_q.put(m);
}

template <typename T>
T SubscriberQueue<T>::getMessage(){
	return m_q.get();
}
