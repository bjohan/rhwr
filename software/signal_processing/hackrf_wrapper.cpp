#include "hackrf_wrapper.hpp"
#include <iostream>
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
	refCount++;
	status = hackrf_device_list_open(devs, index, &dev);
	if(status) cout << "Failed to open hackrf index: " << index << " status: " << status << endl;

	//cudaMalloc((void**) &gpuBuf, sizeof(float)*BUFLEN);
	running = false;

}

int MyHackRf::myRxCallback(hackrf_transfer* transfer){
	//cudaMemcpy(transfer->buffer, gpuBuf, transfer->valid_length, cudaMemcpyHostToDevice);
	return 0;
}

int MyHackRf::rx_callback(hackrf_transfer* transfer){
	return ((MyHackRf *)transfer->rx_ctx)->myRxCallback(transfer);
	//cudaMemcpy(transfer->buffer, transfer->rx_ctx, transfer->valid_length, cudaMemcpyHostToDevice);
	//return 0;
}

void MyHackRf::start(){
	if(dev != NULL){
		hackrf_start_rx(dev, rx_callback, (void *) this);
		running = true;
	} else {
		cout << "hackrf device is not open" << endl;
	}
}

void MyHackRf::stop(){
	if(running){
		hackrf_stop_rx(dev);
		running = false;
	}
}

MyHackRf::~MyHackRf(){
	stop();
	hackrf_close(dev);
	//cudaFree(gpuBuf);
	refCount--;
	if(refCount == 0){
		cout << "Last hackrf object is beeing destroyed, freeing hackrf device list and deiniting library" << endl;
		hackrf_device_list_free(devs);
	       	hackrf_exit();
	}
}


