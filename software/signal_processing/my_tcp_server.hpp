#include "my_thread.hpp"
#include "simple_tcp.hpp"
#include "thread_stuff.hpp"
#include "publisher.hpp"
#include "messages.hpp"
#include <vector>
#include <memory>

class MyTcpServer:public MyThread{
	private:
		vector <unique_ptr<TcpConnectedClient>> m_clients;
		TcpServer m_tcpServer;
		bool m_stop;
	public:
		std::shared_ptr<Publisher<std::shared_ptr<StringMessage>>> pub;	
		MyTcpServer(uint16_t port);
		~MyTcpServer();
		void run();
		void stop();
};
