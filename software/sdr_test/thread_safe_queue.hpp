#pragma once
#include <queue>
#include <chrono>
#include <condition_variable>
#include <mutex>

class QueueFullException : public std::exception { public: virtual const char * what() { return "Queue full";} };
class QueueEmptyException : public std::exception { public: virtual const char * what() { return "Queue empty";} };


template <typename T>
class ThreadSafeQueue{
	public:
		ThreadSafeQueue():ThreadSafeQueue(0){};
		ThreadSafeQueue(size_t maxSize){m_maxSize = maxSize;};

		void put(T v, std::chrono::nanoseconds timeout){
			if(full()){
				std::mutex mtx;
				std::unique_lock<std::mutex> lck(mtx);
				if(m_readCondition.wait_for(lck, timeout) == std::cv_status::timeout)
					throw QueueFullException();
			}
			std::lock_guard<std::mutex> lk(m_accessMutex);
			m_q.push(v);
			m_writeCondition.notify_all();
		};

		T get(std::chrono::nanoseconds timeout){
			if(empty()){
				std::mutex mtx;
				std::unique_lock<std::mutex> lck(mtx);
				if(m_writeCondition.wait_for(lck, timeout) == std::cv_status::timeout)
					throw QueueEmptyException();
			}
			std::lock_guard<std::mutex> lk(m_accessMutex);
			T v = m_q.front();
			m_q.pop();
			m_readCondition.notify_all();
			return v;
		};

		bool full(){ 
			if(!m_maxSize) return false;
			std::lock_guard<std::mutex> lk(m_accessMutex);
			return m_q.size() >= m_maxSize;
		};

		bool empty(){
			std::lock_guard<std::mutex> lk(m_accessMutex);
			return m_q.size() == 0;
		};

	private:
		size_t m_maxSize;
		std::queue<T, std::deque<T>> m_q;
		std::mutex m_accessMutex;
		std::condition_variable m_writeCondition;
		std::condition_variable m_readCondition;
};
