
#pragma once
#include "data_source.hpp"
#include "buffered_message.hpp"
#include <vector>

using namespace std;

template <typename T>
class DataSink{
	public:
		DataSource<T> *m_src;
		DataSink();
		DataSink(DataSource<T> *src);
		virtual void process(BufferedMessage<T> &msg);
};

template <typename T>
DataSink<T>::DataSink(){
	m_src = NULL;
}


template <typename T>
DataSink<T>::DataSink(DataSource<T> *src){
	m_src = src;
}

template <typename T>
void DataSink<T>::process(BufferedMessage<T> &msg){
}

