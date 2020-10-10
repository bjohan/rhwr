#pragma once
#include <thrust/complex.h>
using namespace std;

class Int8ToComplexFloat{
	public:
		Int8ToComplexFloat();
		void process(int8_t *in, size_t sizeIndata, thrust::complex<float> *out, size_t maxSizeOutData);
};

