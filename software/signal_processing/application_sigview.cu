#include <iostream>
#include <thread>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include "simple_tcp.hpp"
#include <readline/readline.h>
#include <readline/history.h>
#include "aux_util.hpp"
#include "command_parser.hpp"

using namespace std;


int main(int argc, char *argv[]){
	double t0;
	TcpClient cli(7000, "127.0.0.1");	
	t0 =getTime();
	cout << "start time " << t0 << endl;
	
CommandSet cs("clientCommands");
cs.addCommand(BaseCommand("hello"));
	char *buf;
	while(true){
		buf = readline(">> ");
		if(buf){
			//cli.send(buf, strlen(buf));
			if(strlen(buf)){
				add_history(buf);
				cout << "Command entered " << buf << " at run time " << getTime()-t0 << endl;
				if(strcmp(buf, "quit")==0){
					cout << "Exiting" << endl;
				       	break;
				}
				cs.execute(std::string(buf));
			}
		}
		free(buf);
		//hrg.process();
	}
}
