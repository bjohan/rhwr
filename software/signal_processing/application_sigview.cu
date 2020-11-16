#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include "simple_tcp.hpp"
#include <readline/readline.h>
#include <readline/history.h>

using namespace std;


double getTime(){

	return(chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now().time_since_epoch()).count())/1000.0;
}
int main(int argc, char *argv[]){
	double t0;
	TcpClient(7000, "localhost");	
	t0 =getTime();
	cout << "start time " << t0 << endl;
}
