#include "my_tcp_server.hpp"
#include <iostream>
MyTcpServer::MyTcpServer(uint16_t port) : MyThread("TCP accept thread"), m_tcpServer(7000){
	m_stop = false;
	//m_tcpServer = TcpServer(port);
}

void MyTcpServer::run(){
	bool in;
	while(true){
		in = m_tcpServer.incommingConnection();
		if(in){
		       	m_clients.push_back(m_tcpServer.acceptConnection());
			cout << "Added new recently connected client" << endl;
		}
		cout << "Has incomming " << in << endl;
		if(m_stop) break;
	}
	cout << "exited accept loop" << endl;
}

void MyTcpServer::stop(){
	m_stop = true;
}
