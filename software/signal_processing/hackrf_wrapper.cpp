#include "hackrf_wrapper.hpp"
#include <iostream>
#include "aux_util.hpp"

using namespace std;
int MyHackRf::refCount=0;
hackrf_device_list_t* MyHackRf::devs=NULL;

MyHackRf::MyHackRf(int index){
	int status;
	if(refCount == 0){
		cout << "First hackrf object created, calling hackrf_init() and creating device list" << endl;
		hackrf_init();
		devs = hackrf_device_list();
	}
	m_idx = index;
	refCount++;
	status = hackrf_device_list_open(devs, index, &dev);
	cout << "hackrf device list open" << status << endl;
	hackrf_set_freq(dev, 350.0e6);
	status = hackrf_set_baseband_filter_bandwidth(dev, 5e6);
	cout << "Set filter return " << status << endl;
	hackrf_set_sample_rate(dev, 5e6);
	hackrf_set_lna_gain(dev, 39);
	hackrf_set_vga_gain(dev, 10);
	if(status) cout << "Failed to open hackrf index: " << index << " status: " << status << endl;
	running = false;

}

int MyHackRf::myRxCallback(hackrf_transfer* transfer){
	return 0;
}

int MyHackRf::rx_callback(hackrf_transfer* transfer){
	//cout << (int)((int8_t)(transfer->buffer[0])) << " ";
	return ((MyHackRf *)transfer->rx_ctx)->myRxCallback(transfer);
}

void MyHackRf::start(){
	if(dev != NULL){
		hackrf_start_rx(dev, rx_callback, (void *) this);
		running = true;
	} else {
		cout << "hackrf device is not open" << endl;
	}
}

void MyHackRf::myStop(){
}

void MyHackRf::stop(){
	if(running){
		hackrf_stop_rx(dev);
		running = false;
		myStop();
	}
}

MyHackRf::~MyHackRf(){
	stop();
	hackrf_close(dev);
	refCount--;
	if(refCount == 0){
		cout << "Last hackrf object is beeing destroyed, freeing hackrf device list and deiniting library" << endl;
		hackrf_device_list_free(devs);
	       	hackrf_exit();
	}
}


