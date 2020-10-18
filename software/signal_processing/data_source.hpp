
#pragma once
#include "inter_thread_buffer.hpp"
#include "buffered_message.hpp"
#include <vector>

using namespace std;

template <typename T>
class DataSource{
	private:
		vector<InterThreadBuffer<BufferedMessage<T>>*> m_itbs;
		//vector<InterThreadBuffer<BufferedMessage<Tout>>*> m_itbs;

	public:
		DataSource();
};
