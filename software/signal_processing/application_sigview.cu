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
#include "messages.hpp"

using namespace std;


class HelloCommand: public BaseCommand{
	private:
		TcpClient& m_client;
	public:
		HelloCommand(TcpClient& cli): BaseCommand("hello"), m_client(cli){
		}
		virtual int execute(std::string args){
			StringMessage msg("hejhopp");
			char buf[256];
			uint32_t msglen=msg.length();
			msg.serialize(buf, 256);
			return m_client.send(buf, msglen);
			/*char m[] = "hello";
			cout << "Sending" <<endl;
			return m_client.send(m, 5);*/
		}

};


int main(int argc, char *argv[]){
	double t0;
	TcpClient cli(7000, "127.0.0.1");
	//cli.send("hejsan", 6);	
	t0 =getTime();
	cout << "start time " << t0 << endl;
	
	CommandSet cs("clientCommands");
	cs.addCommand(std::unique_ptr<BaseCommand>(new HelloCommand(cli)));
	//BaseCommand& bc = cs.getCommand("hello");
	//bc.execute("tj");

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
				if(strcmp(buf, "boh")==0){
					cli.send("boh", 3);
				}
				cs.execute(std::string(buf));
			}
		}
		free(buf);
		//hrg.process();
	}
}
