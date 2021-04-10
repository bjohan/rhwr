#include "my_thread.hpp"
#include "thread_stuff.hpp"
#include "subscriber_queue.hpp"
#include "publisher.hpp"
#include "messages.hpp"
#include <vector>
#include <memory>

class SignalServer:public MyThread{
	private:
		bool m_stop;
		std::shared_ptr<SubscriberQueue<std::shared_ptr<StringMessage>>> m_queue;
	public:
		SignalServer(std::shared_ptr<Publisher<std::shared_ptr<StringMessage>>> pub);
		~SignalServer();
		void run();
		void stop();
};
