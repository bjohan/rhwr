#include "my_thread.hpp"
#include "simple_tcp.hpp"
#include "thread_stuff.hpp"
#include <vector>
#include <memory>

class MyTcpServer:public MyThread{
	private:
		vector <unique_ptr<TcpConnectedClient>> m_clients;
		TcpServer m_tcpServer;
		bool m_stop;
	public:
		MyTcpServer(uint16_t port);
		~MyTcpServer();
		void run();
		void stop();
};
