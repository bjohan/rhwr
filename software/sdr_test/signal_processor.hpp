#include "thread_safe_queue.hpp"
#include "my_thread.hpp"

template <typename I, typename O>
class SignalProcessor{
	public:
		SignalProcessor(std::string name, std::shared_ptr<ThreadSafeQueue<I>>in, std::shared_ptr<ThreadSafeQueue<O>> out):m_name(name), m_qin(in), m_qout(out){};
		virtual void process(){};
	protected:
		std::string m_name;
		std::shared_ptr<ThreadSafeQueue<I>> m_qin;
		std::shared_ptr<ThreadSafeQueue<O>> m_qout;
};
