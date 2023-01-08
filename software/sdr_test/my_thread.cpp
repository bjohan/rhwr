#include "my_thread.hpp"
#include <sys/prctl.h>
#include <iostream>

using namespace std;
MyThread::MyThread(const char *name) : m_name{string(name)}{
	//m_name=string(name);
	m_thread = thread();
	m_stop = false;
}

MyThread::~MyThread()
{
	std::cout << "dtor for " << m_name << " thread" << std::endl;
	stop();
	join();
}


void MyThread::threadSetup(){
	prctl(PR_SET_NAME, m_name.c_str(), 0, 0, 0);
	run();
}

void MyThread::start(){
	m_thread=thread([this] {threadSetup();});
}

void MyThread::stop(){
	m_stop=true;
}

void MyThread::run(){
}

void MyThread::join(){
	if(joinable())m_thread.join();
}

bool MyThread::joinable(){
	return m_thread.joinable();
}
