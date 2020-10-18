#include "buffered_message.hpp"
using namespace std;


template <typename T>
class BufferedMessageDevice: public BufferedMessage<T>{
	public:
		BufferedMessageDevice(int buflen);
		void allocate(int msglen);
		~BufferedMessageDevice();
};


template<typename T>
BufferedMessageDevice<T>::BufferedMessageDevice(int buflen){
	allocate(buflen);
}

template<typename T>
void BufferedMessageDevice<T>::allocate(int buflen){
	cudaMalloc(&(this->m_ptr), buflen*sizeof(T));
	BufferedMessage<T>::m_buflen = buflen;
}

template<typename T>
BufferedMessageDevice<T>::~BufferedMessageDevice(){
	cudaFree(BufferedMessage<T>::m_ptr);
	BufferedMessage<T>::m_ptr = NULL;
	BufferedMessage<T>::m_buflen = 0;
}


