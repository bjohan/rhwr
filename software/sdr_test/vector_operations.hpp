#pragma once
#include <complex>
#include <vector>
#include "aux_util.hpp"
template<typename T>
using complex_vector = std::vector<std::complex<T>>;

template<typename L, typename R>
void arrayCopyCast(L* l, R* r, size_t n){
	for(size_t i = 0 ; i < n ; i++) *(l++)=*(r++);
}

template<typename L, typename R> 
complex_vector<L> complexVectorConvert(const complex_vector<R> &v){
	//L lrv[v.size()*2];
	//arrayCopyCast<L, R>(lrv, (R*) v.data(), v.size()*2);
	//complex_vector<L> vl( (std::complex<L>*)lrv, ((std::complex<L>*) lrv)+v.size());
	complex_vector<L> vl(v.size(), std::complex<L>(0,0));
	arrayCopyCast<L, R>((L*)vl.data(), (R*)v.data(), v.size()*2);
	/*vl.reserve(v.size());
	for(std::complex<R> n : v)
		vl.push_back(std::complex<L>(n.real(), n.imag()));*/
	return vl;
}

template<typename T>
std::complex<T> complexVectorAbsMax(const complex_vector<T> &v){
	std::complex<T> max(0,0);
	for(const std::complex<T> &i : v) max = std::abs(i) > std::abs(max) ? i : max;
	return max;
}
