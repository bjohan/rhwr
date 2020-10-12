#include "simple_tcp.hpp"
#include <poll.h>
using namespace std;

TcpConnectedClient::TcpConnectedClient()
{
	m_connection=0;
	m_socklen=(sizeof(m_addr));
}

TcpConnectedClient::~TcpConnectedClient()
{
	cout << "Closing client" << endl;
	close(m_connection);
}
struct sockaddr* TcpConnectedClient::getAddrP()
{
	return (struct sockaddr*) &m_addr;
}

socklen_t* TcpConnectedClient::getAddrLengthP()
{
	return &m_socklen;
}

void TcpConnectedClient::setConnection(int connection)
{
	m_connection=connection;
	if(m_connection < 0) cout << "Error setting conneection, got value less than 0: "<< m_connection << endl;
}

int TcpConnectedClient::recv(char *buf, uint32_t buflen){
	return ::recv(m_connection, buf, buflen, 0);
}

int TcpConnectedClient::send(char *buf, uint32_t buflen){
	return ::send(m_connection, buf, buflen ,0);
}

TcpServer::TcpServer(int port, int maxconn){
    	m_socket = socket(AF_INET, SOCK_STREAM, 0);
	m_sockAddr.sin_family=AF_INET;
	m_sockAddr.sin_port=htons(port);
	m_sockAddr.sin_addr.s_addr=htonl(INADDR_ANY);
	m_maxconn=maxconn;
	if( bind(m_socket, (struct sockaddr*) &m_sockAddr, sizeof(m_sockAddr)) < 0){
		cout << "Error binding socket" << endl;
	}
	if(listen(m_socket, m_maxconn) <  0){
		cout << "Listen error" << endl;
	}
}

TcpServer::~TcpServer(){
	cout << "Closing server" << endl;
	close(m_socket);
}

TcpConnectedClient TcpServer::acceptConnection(){
	TcpConnectedClient client;
	client.setConnection(accept(m_socket, client.getAddrP(), client.getAddrLengthP()));
	return client;
}

bool TcpServer::incommingConnection(int timeout){
	struct pollfd poll_set[1];
	poll_set[0].fd=m_socket;
	poll_set[0].events =POLLIN;
	int status = poll(poll_set, 1, 1000);
	if(status < 0){
		cout << "Failed to poll socket with fd " << m_socket << endl;
	}
	return poll_set[0].revents&POLLIN;
}

TcpClient::TcpClient(int port, const char *addr)
{
	m_socket = socket(AF_INET, SOCK_STREAM, 0);
	memset(&m_server_addr, 0, sizeof(m_server_addr));
	m_server_addr.sin_family = AF_INET;
	m_server_addr.sin_port = htons(port);
	m_server_addr.sin_addr.s_addr = inet_addr(addr);
	if(connect(m_socket, (struct sockaddr*) &m_server_addr, sizeof(m_server_addr)) < 0){
		cout << "Unable to connect" << endl;
	}
}

TcpClient::~TcpClient()
{
	cout << "Closing client" << endl;
	close(m_socket);
}

int TcpClient::recv(char *buf, uint32_t buflen){
	return ::recv(m_socket, buf, buflen, 0);
}

int TcpClient::send(char *buf, uint32_t buflen){
	return ::send(m_socket, buf, buflen, 0);
}


