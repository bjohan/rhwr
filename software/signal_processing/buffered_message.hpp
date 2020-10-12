#pragma once
#include <ostream>
using namespace std;
template<typename T>
class BufferedMessage{
	private:
		int m_buflen;
	public:
		int m_messageLength;
		T* m_ptr;
		BufferedMessage(int buflen, T* buf);
		BufferedMessage();
		void setBufferLength(int buflen);
		void toStream(ostream &os);
};

