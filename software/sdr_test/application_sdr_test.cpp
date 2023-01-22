#include <iostream>
#include <thread>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <algorithm>
#include <cuda_runtime.h>
#include "hackrf_wrapper.hpp"
#include "thread_safe_queue.hpp"
#include "gui/gui_thread.hpp"
#include "gui/plot_window.hpp"
#include "signal_processors/pulse_extractor.cpp"
#include "signal_processors/signal_processor.hpp"
#include "gps.hpp"

std::ostream &operator <<(std::ostream &os, const std::complex<int8_t> &c){
	os << "("<< (int)c.real() <<"," << (int)c.imag() << ")";
	return os;
}


template<typename T>
std::ostream &operator <<(std::ostream &os, const std::vector<T> &vec){
	for(T v : vec) os << v << " ";
	return os;
}

int main(int argc, char *argv[]){


	std::shared_ptr<DroppingThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> pulseq = 
			std::make_shared<DroppingThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("pulse queue"), 2, std::chrono::milliseconds(100));
	std::shared_ptr<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> tap_queue = 
			std::make_shared<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("tap queue"), 20, std::chrono::milliseconds(100));
	std::shared_ptr<TeeThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> rxq = 
			std::make_shared<TeeThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("raw baseband"), tap_queue, 20, std::chrono::milliseconds(100));
	std::shared_ptr<PulseExtractor<int8_t>> pe = std::make_shared<PulseExtractor<int8_t>>("tapped pulse extractor", 20, 10, tap_queue, pulseq);
	

	MyHackRf hrf(0, rxq);
	ProcessorThread pt("processor thread");
	GuiThread gt;
	NmeaThread nmt("/dev/ttyUSB0");

	pt.addProcessor(pe);
	gt.displayQueue(rxq);
	gt.displayQueue(pulseq);

	gt.start();
	hrf.start();
	pt.start();
	nmt.start();
	
	std::cout << "waitng for gui to exit" << std::endl;
	gt.join();
	std::cout << "gui exited" << std::endl;

	std::cout << "Bye!" << std::endl;
	return 0;
}
