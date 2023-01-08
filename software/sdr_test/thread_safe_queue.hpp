#pragma once
#include <queue>
#include <chrono>
#include <condition_variable>
#include <mutex>
#include <iostream>

class QueueFullException : public std::exception { public: virtual const char * what() { return "Queue full";} };
class QueueEmptyException : public std::exception { public: virtual const char * what() { return "Queue empty";} };


template <typename T>
class ThreadSafeQueue{
	public:
		ThreadSafeQueue(std::string name, std::chrono::nanoseconds timeout):ThreadSafeQueue(name, 0,timeout){};
		ThreadSafeQueue(std::string name, size_t maxSize, std::chrono::nanoseconds timeout ):m_name(name), m_maxSize(maxSize), m_timeout(timeout), m_rejected(0) {};
		~ThreadSafeQueue() { std::cout << "Destructor for queue: " << m_name << std::endl;};

		virtual void offer(T v) {
			if(!full()) put(v);
			else m_rejected++;
		};
		virtual void put(T v) {
			put(v, m_timeout);
		}; 

		virtual void put(T v, std::chrono::nanoseconds timeout){
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

		T get() { 
			return get(m_timeout);
		}

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

		size_t size(){
			std::lock_guard<std::mutex> lk(m_accessMutex);
			return m_q.size();
		}

		bool full(){ 
			if(!m_maxSize) return false;
			std::lock_guard<std::mutex> lk(m_accessMutex);
			return m_q.size() >= m_maxSize;
		};

		bool empty(){
			std::lock_guard<std::mutex> lk(m_accessMutex);
			return m_q.size() == 0;
		};
		uint32_t getRejected() { return m_rejected;};
		std::string getName() { return m_name;};

	private:
		std::string m_name;
		size_t m_maxSize;
		std::chrono::nanoseconds m_timeout;
		uint32_t m_rejected;
		std::queue<T, std::deque<T>> m_q;
		std::mutex m_accessMutex;
		std::condition_variable m_writeCondition;
		std::condition_variable m_readCondition;
};

template <typename T>
class TappedThreadSafeQueue : public ThreadSafeQueue<T>{
		public:
			TappedThreadSafeQueue(std::string name, std::shared_ptr<ThreadSafeQueue<T>> tap, std::chrono::nanoseconds timeout):ThreadSafeQueue<T>(name, 0,timeout), m_tap(tap){};
			TappedThreadSafeQueue(std::string name, std::shared_ptr<ThreadSafeQueue<T>> tap, size_t maxSize, std::chrono::nanoseconds timeout ): ThreadSafeQueue<T>(name, maxSize, timeout), m_tap(tap){};
		void offer(T v) {m_tap->offer(v) ; ThreadSafeQueue<T>::offer(v);};
		void put(T v) { m_tap->offer(v) ; ThreadSafeQueue<T>::put(v);}
		void put(T v, std::chrono::nanoseconds timeout ) { m_tap->offer(v) ; ThreadSafeQueue<T>::put(v, timeout);}
		private:
			std::shared_ptr<ThreadSafeQueue<T>> m_tap;
};
