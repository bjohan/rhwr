#include "buffered_message.hpp"
#include <thrust/complex.h>
using namespace std;
/*template<typename T>
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
void BufferedMessage<T>::allocate(int msgsize){
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

template<typename T>
int BufferedMessage<T>::len(){
	return m_buflen;
}*/
/*
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



template class BufferedMessage<float>;
template class BufferedMessage<int8_t>;
template class BufferedMessage<char>;
template class BufferedMessage<thrust::complex<float>>;

template class BufferedMessageHost<float>;
template class BufferedMessageHost<int8_t>;
template class BufferedMessageHost<char>;
template class BufferedMessageHost<thrust::complex<float>>;

template class BufferedMessageDevice<float>;
template class BufferedMessageDevice<int8_t>;
template class BufferedMessageDevice<char>;
template class BufferedMessageDevice<thrust::complex<float>>;
*/
