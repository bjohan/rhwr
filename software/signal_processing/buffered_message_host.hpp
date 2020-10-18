#include "buffered_message.hpp"
#include <thrust/complex.h>
using namespace std;

template <typename T>
class BufferedMessageHost: public BufferedMessage<T>{
	public:
		BufferedMessageHost(int buflen);
		void allocate(int msglen);
		~BufferedMessageHost();
};

template<typename T>
BufferedMessageHost<T>::BufferedMessageHost(int buflen){
	allocate(buflen);
}

template<typename T>
void BufferedMessageHost<T>::allocate(int buflen){
	BufferedMessage<T>::m_ptr = new T[buflen];
	BufferedMessage<T>::m_buflen = buflen;
}

template<typename T>
BufferedMessageHost<T>::~BufferedMessageHost(){
	delete BufferedMessage<T>::m_ptr;
	BufferedMessage<T>::m_ptr = NULL;
	BufferedMessage<T>::m_buflen = 0;
}

