#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <memory>

using namespace std;
class TcpConnectedClient{
	private:
	      	struct sockaddr_in m_addr;
		int m_connection;
		socklen_t m_socklen;
       	public:
		TcpConnectedClient();
		TcpConnectedClient(int m_socket);
		~TcpConnectedClient();
		void acceptConnection(int m_socket);
 		struct sockaddr* getAddrP();
		socklen_t* getAddrLengthP();
		void setConnection(int connection);
		int recv(char *buf, uint32_t buflen);
		int send(const char *buf, uint32_t buflen); 
};


class TcpServer{
	private:
		int m_socket;
		struct sockaddr_in m_sockAddr;
		int m_maxconn;

	public:
		TcpServer(int port, int maxconn=20);
		~TcpServer();
		TcpConnectedClient acceptConnection();
		std::unique_ptr<TcpConnectedClient> acceptAndGetConnection();
		bool incommingConnection(int timeout = 1000);
};

using namespace std;

class TcpClient{
	private:
		struct sockaddr_in m_server_addr;
		int m_socket;
	public:
		TcpClient(int port, const char *addr);
		~TcpClient();
		int recv(char *buf, uint32_t buflen);
		int send(const char *buf, uint32_t buflen);
};

