#include "my_thread.hpp"
#include <sys/prctl.h>

using namespace std;
MyThread::MyThread(const char *name) : m_name{string(name)}{
	//m_name=string(name);
	m_thread = thread();
}

MyThread::~MyThread()
{
}


void MyThread::threadSetup(){
	prctl(PR_SET_NAME, m_name.c_str(), 0, 0, 0);
	run();
}

void MyThread::start(){
	m_thread=thread([this] {threadSetup();});
}

void MyThread::run(){
}

void MyThread::join(){
	m_thread.join();
}
