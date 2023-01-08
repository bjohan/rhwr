#pragma once
#include <string>

double getTime();
int64_t getTimeNs();
int64_t getTimeUs();
class LifeTimer{
	public:
		LifeTimer(std::string name);
		~LifeTimer();
	private:
		int64_t m_startTime;
		std::string m_name;
};


