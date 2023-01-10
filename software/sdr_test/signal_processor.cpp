#include "signal_processor.hpp"

void ProcessorThread::addProcessor(std::shared_ptr<Processor> proc){
	std::lock_guard<std::mutex> lk(m_processorListMutex);
	m_processors.push_back(proc);
}

void ProcessorThread::run(){
	while(!m_stop){
		{
			std::lock_guard<std::mutex> lk(m_processorListMutex);
			for(std::shared_ptr<Processor> p : m_processors)
				p->process();
		}
	}
}
