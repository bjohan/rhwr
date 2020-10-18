#pragma once
#include "thread_stuff.hpp"
#include "buffered_message.hpp"
#include <vector>

using namespace std;

template <typename Tin, typename Tout>
class DataProcessor{
	private:
		//vector<InterThreadBuffer<BufferedMessage<Tin>>*> m_itbs;
		//vector<InterThreadBuffer<BufferedMessage<Tout>>*> m_itbs;

	public:
		virtual void  process(BufferedMessage<Tin> &msgIn, BufferedMessage<Tout> &msgOut);
};


using namespace std;

template <typename Tin, typename Tout>
void DataProcessor<Tin, Tout>::process( BufferedMessage<Tin> &msgIn, BufferedMessage<Tout> &msgOut){
}

