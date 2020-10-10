#include "dispatcher.hpp"
using namespace std;

template <class T>
void Dispatcher<T>::subscribe(function<void(T)> f){
	subscribers.push_back(f);
}

template <class T>
void Dispatcher<T>::publish(T data){
	for(auto s:subscribers) s(data);
}	
