#include "my_thread.hpp"
#include "simple_tcp.hpp"
#include "thread_stuff.hpp"
#include <vector>
class MyTcpServer:public MyThread{
	private:
		vector <TcpConnectedClient> m_clients;
		TcpServer m_tcpServer;
		bool m_stop;
	public:
		MyTcpServer(uint16_t port);
		void run();
		void stop();
};
