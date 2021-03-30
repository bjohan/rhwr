#include "hackrf_thread.hpp"
#include <iostream>
HackRfThread::HackRfThread(vector<int> deviceIds) : MyThread("Hackrf thread"), m_deviceIds(deviceIds), m_hrg(HackRfGpuGang(deviceIds)){
	m_stop = false;
	//HackRfGpuGang hrg(hackRfDeviceIndex);
}

void HackRfThread::run(){
	m_hrg.start();
	while(true){
		m_hrg.process();
		if(m_stop) break;
	}
	m_hrg.stop();
	cout << "hackrf thread stopping" << endl;
}

void HackRfThread::stop(){
	m_stop = true;
	cout << "Waiting for hrg thread to join";
	this->join();
}
