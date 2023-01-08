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
#include "pulse_extractor.cpp"

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
	//try{
		GuiThread gt;
		gt.start();
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> tap_queue = 
				std::make_shared<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("tap queue"), 2, std::chrono::milliseconds(100));
		std::shared_ptr<TappedThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> rxq = 
				std::make_shared<TappedThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("raw baseband"), tap_queue, 2, std::chrono::milliseconds(100));
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>> pulseq = 
				std::make_shared<ThreadSafeQueue<std::shared_ptr<complex_vector<int8_t>>>>(std::string("pulse queue"), 2, std::chrono::milliseconds(100));

		PulseExtractor<int8_t> pe("tapped pulse extractor", 20, 10, tap_queue, pulseq);
		gt.displayQueue(rxq);
		gt.displayQueue(pulseq);
		std::cout << "q created" << std::endl;
		MyHackRf hrf(0, rxq);
		std::cout << "hrf created" << std::endl;
		hrf.start();
	
		std::cout << "waitng for gui to exit" << std::endl;
		std::cout << "gui exited" << std::endl;
		while(gt.joinable()) pe.process();
		gt.join();
	//} catch (std::exception &e) {
	//	std::cerr << "Unhandled exception: " << e.what() << std::endl;
	//}
	std::cout << "Bye!" << std::endl;
	return 0;
}
