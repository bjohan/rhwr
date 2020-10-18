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

//void Int8ToComplexFloat::process(int8_t *in, size_t sizeIndata, thrust::complex<float> *out, size_t maxSizeOutData){
void Int8ToComplexFloat::process(BufferedMessage<int8_t> &in, BufferedMessage<thrust::complex<float>> &out){
	int outDataElems = in.m_messageLength/2;//sizeIndata/2;
	int inDataElems = in.m_messageLength/2; //sizeIndata/2;
	if(outDataElems > out.len()){
		cout << "Out data does not fit in designated array. indataElems " << inDataElems <<  " outDataElems " << outDataElems << " maxOutDataElems " << out.len() << endl;
	}
        	
	int threadsPerBlock = 32;
	int blocksPerGrid = (inDataElems + threadsPerBlock -1)/threadsPerBlock;
	IntToFloat<<<blocksPerGrid, threadsPerBlock>>>(in.m_ptr, out.m_ptr, inDataElems);
	//cout << "processed " << inDataElems << " samples" << endl;	
}
