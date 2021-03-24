#include "data_source.hpp"
#include "data_processor.hpp"

template <typename Tin, typename Tout>
class ProcessorExecutor : public DataSource<Tout>, public DataProcessor<Tin, Tout>{
	private:
		DataSource<Tin> *m_source;
	public:
		ProcessorExecutor();
		ProcessorExecutor(DataSource<Tin> *source);
		void setSource(DataSource<Tin> *source);
		void processOne();

};

template <typename Tin, typename Tout>
ProcessorExecutor<Tin, Tout>::ProcessorExecutor(){
	m_source = NULL;
}

template <typename Tin, typename Tout>
ProcessorExecutor<Tin, Tout>::ProcessorExecutor(DataSource<Tin> *source){
	setSource(source);
}

template <typename Tin, typename Tout>
void ProcessorExecutor<Tin, Tout>::setSource(DataSource<Tin> *source){
	m_source=source;
}

template <typename Tin, typename Tout>
void ProcessorExecutor<Tin, Tout>::processOne(){
	auto inMsg=m_source.consumerCheckout();
	auto outMsg=producerCheckout();
	process(inMsg, outMsg);
	m_source.consumerCheckin();
	producerCheckin();	
}

