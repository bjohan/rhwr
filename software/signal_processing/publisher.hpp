#pragma once
#include "subscriber_queue.hpp"

#include <vector>
#include <memory>

template <typename T>
class Publisher{
	private:
		std::vector<std::shared_ptr<SubscriberQueue<T>>> m_subscribers;

	public:
		void addSubscriber(std::shared_ptr<SubscriberQueue<T>> s) {m_subscribers.push_back(s);}
		void publish(T m){
			for(std::shared_ptr<SubscriberQueue<T>> s : m_subscribers)
				s->TakeMessage(m);
		}
		
};
