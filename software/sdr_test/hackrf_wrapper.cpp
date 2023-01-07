#include "hackrf_wrapper.hpp"
#include <iostream>
#include "aux_util.hpp"

using namespace std;
int MyHackRf::refCount=0;
hackrf_device_list_t* MyHackRf::devs=NULL;

MyHackRf::MyHackRf(int index, std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> rxQueue){
	m_rxQueue=rxQueue;
	m_success = 0;
	m_fail = 0;
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
	hackrf_set_sample_rate(dev, 20e6);
	hackrf_set_lna_gain(dev, 39);
	hackrf_set_vga_gain(dev, 10);
	if(status) cout << "Failed to open hackrf index: " << index << " status: " << status << endl;
	running = false;

}

int MyHackRf::myRxCallback(hackrf_transfer* transfer){
	try {
		if(transfer->valid_length > 0){
			std::shared_ptr<std::vector<std::complex<int8_t>>> msg = 
				std::make_shared<std::vector<std::complex<int8_t>>>((std::complex<int8_t> *)transfer->buffer, (std::complex<int8_t> *)transfer->buffer+((size_t) transfer->valid_length/2));
				m_rxQueue->put(msg, std::chrono::milliseconds(50));
			
			m_success+=transfer->valid_length/2;
		} else {
			cout << "Valid length " << transfer->valid_length << endl;
		}
	} catch (QueueFullException &e) {
		m_fail+=transfer->valid_length/2;
	}
	return 0;
}

int MyHackRf::rx_callback(hackrf_transfer* transfer){
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


