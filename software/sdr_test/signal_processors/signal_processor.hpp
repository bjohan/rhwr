#pragma once
#include "../thread_safe_queue.hpp"
#include "../my_thread.hpp"

class Processor{
	public:
		Processor(std::string name):m_name(name){};
		virtual void process(){};

	protected:
		std::string m_name;
};

template <typename I, typename O>
class SignalProcessor: public Processor{
	public:
		SignalProcessor(std::string name, std::shared_ptr<ThreadSafeQueue<I>>in, std::shared_ptr<ThreadSafeQueue<O>> out):Processor(name), m_qin(in), m_qout(out){};
		virtual void process(){};
	protected:
		std::shared_ptr<ThreadSafeQueue<I>> m_qin;
		std::shared_ptr<ThreadSafeQueue<O>> m_qout;
};

class ProcessorThread: public MyThread{
	public:
		ProcessorThread(const char* name):MyThread(name){};
		void addProcessor(std::shared_ptr<Processor> proc);
		void run();
	private:
		std::vector<std::shared_ptr<Processor>> m_processors;
		std::mutex m_processorListMutex;
};

