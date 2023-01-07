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
	try{
		GuiThread hej;
		hej.start();
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> rxq = std::make_shared<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>>();
		std::cout << "q created" << std::endl;
		MyHackRf hrf(0, rxq);
		std::cout << "hrf created" << std::endl;
		hrf.start();
	
		for(int i = 0 ; i < 5 ; i++){
				std::shared_ptr<std::vector<std::complex<int8_t>>> sample = rxq->get(std::chrono::milliseconds(1000));
				std::cout << (*sample)[0] << std::endl;
		}
	std::cout << "waitng for gui to exit" << std::endl;
	hej.join();
	} catch (std::exception &e) {
		std::cerr << "Unhandled exception: " << e.what() << std::endl;
	}
	return 0;
}
