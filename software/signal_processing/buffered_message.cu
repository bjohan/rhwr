#include "buffered_message.hpp"
#include <thrust/complex.h>
using namespace std;
template<typename T>
BufferedMessage<T>::BufferedMessage(int buflen, T* bufPtr){
	m_buflen = buflen;
	m_ptr = bufPtr;
}


template<typename T>
BufferedMessage<T>::BufferedMessage(){
	m_buflen = 0;
	m_ptr = NULL;
}


template<typename T>
void BufferedMessage<T>::setBufferLength(int buflen){
	m_buflen = buflen;
}

template<typename T>
void BufferedMessage<T>::toStream(ostream &os){
	os << "this address " << hex << static_cast<void*>(this) << " m_ptr " << hex << static_cast<void*>(m_ptr) << " m_buflen " << m_buflen << " m_messageLength " << m_messageLength;
}
template class BufferedMessage<float>;
template class BufferedMessage<int8_t>;
template class BufferedMessage<char>;
template class BufferedMessage<thrust::complex<float>>;
