#pragma once
#include <ostream>
using namespace std;
template<typename T>
class BufferedMessage{
	protected:
		int m_buflen;
	public:
		int m_messageLength;
		T* m_ptr;
		BufferedMessage(int buflen, T* buf);
		BufferedMessage(int buflen);
		BufferedMessage();
		virtual void allocate(int msglen);
		void setBufferLength(int buflen);
		void toStream(ostream &os);
		int len();
	
};

template<typename T>
BufferedMessage<T>::BufferedMessage(int buflen, T* bufPtr){
	m_buflen = buflen;
	m_ptr = bufPtr;
}

template<typename T>
BufferedMessage<T>::BufferedMessage(int buflen){
	allocate(buflen);
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
}


