#include <iostream>
#include "signal_server.hpp"
SignalServer::SignalServer(std::shared_ptr<Publisher<std::shared_ptr<StringMessage>>> pub) : MyThread("Signal server thread"){
	m_stop = false;
	m_queue = std::make_shared<SubscriberQueue<std::shared_ptr<StringMessage>>>();
	pub->addSubscriber(m_queue);
}

SignalServer::~SignalServer()
{
	std::cout << "Destroying signal server thread" << std::endl;
	stop();
	if(this->joinable()) this->join();
}

void SignalServer::run(){
	std::shared_ptr<StringMessage> msg;
	cout << "Signal server thread running" << endl;
	while(true){
		msg = m_queue->getMessage();
		cout << "in consumer thread " << msg->m_string.get() << endl;
		if(m_stop) break;
	}
	cout << "exited Signal server loop" << endl;
}

void SignalServer::stop(){
	m_stop = true;
}
