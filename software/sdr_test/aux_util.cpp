#include "aux_util.hpp"
#include <chrono>
#include <iostream>

using namespace std;
double getTime(){
	return ((double) (chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now().time_since_epoch()).count()))/1000.0;
}

int64_t getTimeNs(){
	return chrono::duration_cast<chrono::nanoseconds>(chrono::system_clock::now().time_since_epoch()).count();
}

int64_t getTimeUs(){
	return chrono::duration_cast<chrono::microseconds>(chrono::system_clock::now().time_since_epoch()).count();
}

LifeTimer::LifeTimer(std::string name){
	m_startTime = getTimeUs();
	m_name = name;
	//std::cout << m_name << " started at " << m_startTime << std::endl;
}

LifeTimer::~LifeTimer(){
	//std::cout << m_name << " stopped at " << getTime() << std::endl;
	m_startTime = getTimeUs()-m_startTime;
	std::cout << m_name << " took: " << (float)m_startTime << "us " << std::endl;
}

