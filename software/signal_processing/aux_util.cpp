#include <chrono>
using namespace std;
double getTime(){
	return (double) (chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now().time_since_epoch()).count())/1000.0;
}

