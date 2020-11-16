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
	TcpClient("localhost", 7000);	
	t0 =getTime();
	char *buf;
	while(true){
		buf = readline(">>");
		if(buf){
			if(strlen(buf)){
				add_history(buf);
				cout << "Command entered" << buf << " at run time " << getTime()-t0 << endl;
			}
		}
		if(strcmp(buf, "quit")==0) break;
		free(buf);
		//hrg.process();
	}
	hrt.stop();
	cout << "exitied loop" << endl;
	//hrg.stop();
	srv.stop();
	srv.join();

	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	free(h_A);
	free(h_B);
	free(h_C);
	return 0;
}
