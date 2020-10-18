#pragma once
#include <thrust/complex.h>
#include "data_processor.hpp"
using namespace std;

class Int8ToComplexFloat : public DataProcessor<int8_t, thrust::complex<float>> {
	public:
		Int8ToComplexFloat();
		//void process(int8_t *in, size_t sizeIndata, thrust::complex<float> *out, size_t maxSizeOutData);
		void process(BufferedMessage<int8_t> &in, BufferedMessage<thrust::complex<float>> &out);
};

