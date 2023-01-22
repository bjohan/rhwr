#include "gps.hpp"
#include <iostream>
#include <sstream>
#include <exception>

AvrMessage::AvrMessage(std::vector<std::string> toks){
	if(toks[0].compare("$PTNL")) throw std::invalid_argument("Message must begin with $PTNL");
	m_time = toks[1+1];
	m_yaw = std::stof(toks[2+1]);
	m_tilt = std::stof(toks[4+1]);
	m_antennaDist = std::stof(toks[8+1]);
	m_gpsQuality = std::stoi(toks[9+1]);
	m_pdop = std::stof(toks[10+1]);
	m_numSat = std::stoi(toks[11+1]);
}


GgaMessage::GgaMessage(std::vector<std::string> toks){
	if(toks[0].compare("$GPGGA")) throw std::invalid_argument("Message must begin with $GPGGA");
	m_time = toks[1];
	m_latitude = std::stof(toks[2]);
	m_longitude = std::stof(toks[4]);
	m_gpsQuality = std::stoi(toks[6]);
	m_numSat = std::stoi(toks[7]);
	m_horDilution = std::stof(toks[8]);
	m_altitudeGeoid = std::stof(toks[9]);
	m_heightWgs84 = std::stof(toks[11]);
}

NmeaReader::NmeaReader(std::string port, LibSerial::BaudRate baud):m_port(port){
	m_port.SetBaudRate(baud);
}

NmeaReader::~NmeaReader(){
	std::cout << "closing serial port" << std::endl;
	m_port.Close();
}

std::string NmeaReader::readLine(uint32_t timeout_ms){
	std::string line;
	char chr;
	line.reserve(256);
	while(true){
		m_port.ReadByte(chr, timeout_ms);
		line.push_back(chr);
		if(chr == '\n') break;
	}
	return line;
}

std::vector<std::string> NmeaReader::tokenize(std::string s){
	std::vector<std::string> toks;
	std::stringstream ss(s);
	std::string tok;
	while(std::getline(ss, tok, ',')) toks.push_back(tok);
	return toks;
}

void NmeaReader::parseMessage(){
	std::string line = readLine();
	if(line.find(std::string("$GPGGA"))==0) parseGga(line);
	if(line.find(std::string("$PTNL,AVR"))==0)parseAvr(line);
}

void NmeaReader::parseGga(std::string line){
	std::vector<std::string> toks = tokenize(line);
	GgaMessage m(toks);
}

void NmeaReader::parseAvr(std::string line){
	std::vector<std::string> toks = tokenize(line);
	AvrMessage m(toks);
}

NmeaThread::NmeaThread(std::string port):MyThread("NMEA thread"), m_port(port){
}


void NmeaThread::run(){
	NmeaReader reader(m_port, LibSerial::BaudRate::BAUD_115200);
	std::cout << "NMEA thread started" << std::endl;
	while(true){
		//std::cout << reader.readLine();
		reader.parseMessage();
		if(m_stop) break;
	}
	std::cout << "NMEA thread stopped" << std::endl;
}
