//#include <thrust/complex.h>
#include "int8_to_complex_float.hpp"
#include <cuda_runtime.h>
#include <iostream>
using namespace std;


__global__ void IntToFloat(int8_t *in, thrust::complex<float> *out, int N){
	int i = blockDim.x*blockIdx.x+threadIdx.x;

	if(i < N) out[i] = thrust::complex<float>(in[2*i], in[2*i+1]);
}




Int8ToComplexFloat::Int8ToComplexFloat()
{
}

void Int8ToComplexFloat::process(int8_t *in, size_t sizeIndata, thrust::complex<float> *out, size_t maxSizeOutData){
	int outDataElems = sizeIndata/2;
	int inDataElems = sizeIndata/2;
	size_t outSize = outDataElems*sizeof(thrust::complex<float>);
	if(outSize > maxSizeOutData){
		cout << "Out data does not fit in designated array" << endl;
	}
        	
	int threadsPerBlock = 32;
	int blocksPerGrid = (inDataElems + threadsPerBlock -1)/threadsPerBlock;
	IntToFloat<<<blocksPerGrid, threadsPerBlock>>>(in, out, inDataElems);
	//cout << "processed " << inDataElems << " samples" << endl;	
}
