#include "my_tcp_server.hpp"
#include <iostream>
#include "messages.hpp"
MyTcpServer::MyTcpServer(uint16_t port) : MyThread("TCP accept thread"), m_tcpServer(7000){
	m_stop = false;
	//m_tcpServer = TcpServer(port);
}

MyTcpServer::~MyTcpServer()
{
	std::cout << "Destroying server thread" << std::endl;
	stop();
	if(this->joinable()) this->join();
}

void MyTcpServer::run(){
	cout << "Server thread running" << endl;
	char recvBuf[65536];
	bool in;
	StringMessage rxmsg("");

	while(true){
		in = m_tcpServer.incommingConnection();
		if(in){
		       	m_clients.push_back(m_tcpServer.acceptAndGetConnection());
			cout << "Added new recently connected client" << endl;
		}
		cout << "Has incomming " << in << endl;
		if(m_stop) break;
		for ( auto& element : m_clients){
			cout << "Reading from client" << flush;
			int n = element->recv(recvBuf, 1024);
			cout << " got " << n << " bytes" <<  endl;
			rxmsg.unpack(recvBuf, 256);
			cout << "message contents: " << rxmsg.m_string.get() << endl;
		}
	}
	cout << "exited accept loop" << endl;
	


}

void MyTcpServer::stop(){
	m_stop = true;
}
