#pragma once
#include <vector>
#include <functional>
using namespace std;

template <class T>
class Dispatcher{
	private:
		vector<function<void(T)>> subscribers;
	public:
		void subscribe(function<void(T)> f);
		void publish(T data);
};

