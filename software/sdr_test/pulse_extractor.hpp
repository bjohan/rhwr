#pragma once
#include "signal_processor.hpp"
#include "vector_operations.hpp"

template <typename T>
class PulseExtractor: public SignalProcessor<std::shared_ptr<complex_vector<T>>, std::shared_ptr<complex_vector<T>>>{
	public:
		PulseExtractor(	std::string name, 
				T begin, 
				T end, 
				std::shared_ptr<ThreadSafeQueue<std::shared_ptr<complex_vector<T>>>> in, 
				std::shared_ptr<ThreadSafeQueue<std::shared_ptr<complex_vector<T>>>> out)
			:SignalProcessor<std::shared_ptr<complex_vector<T>>, std::shared_ptr<complex_vector<T>>>(name, in, out), 
			m_pulse(nullptr), 
			m_begin(begin), 
			m_end(end){m_inPulse=false;};
		void process();

		void newPulse();
	private:
		std::shared_ptr<std::vector<complex<T>>> m_pulse;
		T m_begin; //threshold for begin
		T m_end; //threshold for end
		bool m_inPulse;
};
