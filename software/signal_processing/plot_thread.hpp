#include "my_thread.hpp"
#include "subscriber_queue.hpp"
#include "messages.hpp"
#include "publisher.hpp"
class PlotThread:public MyThread{
	private:
		static PlotThread *m_currentInstance;
		bool m_stop;
		int *m_argc;
		char **m_argv;
		std::shared_ptr<SubscriberQueue<std::shared_ptr<StringMessage>>> m_queue;
		void initGlut();
		static void drawCallback();
		static void idleCallback();
		static void closeCallback();
	public:
		PlotThread(int *argc, char **argv, std::shared_ptr<Publisher<std::shared_ptr<StringMessage>>> pub);
		PlotThread(int *argc, char **argv);
		void loopIteration();
		~PlotThread();
		void setupCallbacks();
		void draw();
		void idle();
		void close();
		void run();
		void stop();
};
