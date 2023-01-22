#pragma once
#include <libserial/SerialPort.h>
#include <string>
#include <vector>
#include "my_thread.hpp"

class AvrMessage{
	public:
		AvrMessage(std::vector<std::string> toks);
		std::string m_time;
		float m_yaw;
		float m_tilt;
		float m_antennaDist;
		int m_gpsQuality;
		float m_pdop;
		int m_numSat;
};

class GgaMessage{
	public:
		GgaMessage(std::vector<std::string> toks);
		std::string m_time;
		float m_latitude;
		float m_longitude;
		int m_gpsQuality;
		int m_numSat;
		float m_horDilution;
		float m_altitudeGeoid;
		float m_heightWgs84;
};

class NmeaReader{
	public:
		NmeaReader(std::string port, LibSerial::BaudRate baud);
		std::string readLine(uint32_t timeout_ms=1000);
		std::vector<std::string> tokenize(std::string s);
		void parseMessage();
		void parseGga(std::string line);
		void parseAvr(std::string line);

		~NmeaReader();
	private:
		LibSerial::SerialPort m_port;
};

class NmeaThread: public MyThread{
	public:
		NmeaThread(std::string port);
		void run();
	private:
		std::string m_port;
};
