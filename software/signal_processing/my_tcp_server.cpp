#include "my_tcp_server.hpp"
#include <iostream>
#include "message_factory.hpp"
#include <memory>
#include "subscriber_queue.hpp"

MyTcpServer::MyTcpServer(uint16_t port) : MyThread("TCP accept thread"), m_tcpServer(7000){
	m_stop = false;
	pub = std::make_shared<Publisher<std::shared_ptr<StringMessage>>>();
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
	MessageFactory msgFactory;
	msgFactory.registerFactory(StringMessage::msgType, StringMessage::createInstance);
	StringMessage rxmsg("");
	
	std::shared_ptr<BaseMessage> msg;
	std::shared_ptr<StringMessage> smsg;

	while(true){
		in = m_tcpServer.incommingConnection();
		if(in){
		       	m_clients.push_back(m_tcpServer.acceptAndGetConnection());
			cout << "Added new recently connected client" << endl;
		}
		//cout << "Has incomming " << in << endl;
		if(m_stop) break;
		for ( auto& element : m_clients){
			cout << "Reading from client" << flush;
			int n = element->recv(recvBuf, 1024);
			cout << " got " << n << " bytes" <<  endl;
			msg=msgFactory.create(recvBuf);
			cout << "unpacking msg" << endl;
			msg->unpack(recvBuf, 256);
			//rxmsg.unpack(recvBuf, 256);
			smsg = std::static_pointer_cast<StringMessage>(msg);
			//BaseMessage *bm=msg.get();
			//std::shared_ptr<StringMessage> sm=static_cast<StringMessage*>(bm);
			//cout << "message contents: " << sm->m_string.get() << endl;
			cout << "message contents: " << smsg->m_string.get() << endl;
			pub->publish(smsg);
		}
	}
	cout << "exited accept loop" << endl;
	


}

void MyTcpServer::stop(){
	m_stop = true;
}
