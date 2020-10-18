
#pragma once
#include "inter_thread_buffer.hpp"
#include "buffered_message.hpp"
#include <vector>

using namespace std;

template <typename T>
class DataSource: public InterThreadBuffer<BufferedMessage<T>>{
	public:
		//InterThreadBuffer<BufferedMessage<T>> m_itb;
		DataSource(int nmsg, int msglen);
};

template <typename T>
DataSource<T>::DataSource(int nmsg, int msglen): InterThreadBuffer<BufferedMessage<T>>(nmsg, msglen){
}

