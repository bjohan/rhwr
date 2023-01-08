#include "pulse_extractor.hpp"

template<typename T>
void PulseExtractor<T>::newPulse(){
		 m_pulse = std::make_shared<std::vector<complex<T>>>();
		 m_pulse->reserve(16384);
}

template<typename T>
void PulseExtractor<T>::process(){
	if(m_pulse == nullptr) newPulse();

	std::shared_ptr<complex_vector<T>> sig = SignalProcessor<std::shared_ptr<complex_vector<T>>, std::shared_ptr<complex_vector<T>>>::m_qin->get();

	for(std::complex<T> s : *sig){
		T mags = std::abs(s);
		if(mags > m_begin) m_inPulse = true;
		if(mags < m_end){
			if(m_inPulse && m_pulse->size() > 0) SignalProcessor<std::shared_ptr<complex_vector<T>>, std::shared_ptr<complex_vector<T>>>::m_qout->offer(m_pulse);
			newPulse();
			m_inPulse = false;
		}
		if(m_inPulse) m_pulse->push_back(s);
	}
}
