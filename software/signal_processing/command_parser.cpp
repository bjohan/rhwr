#include "command_parser.hpp"
#include <vector>
#include <sstream>
#include <iostream>
#include <stdexcept>

std::vector<std::string> split(const std::string& s, char delim){
	std::vector<std::string> words;
	std::string currentWord;
	std::istringstream ss(s);

	while( std::getline(ss, currentWord, delim)) words.push_back(currentWord);
	return words;

}

BaseCommand::BaseCommand(std::string name){
	m_name = name;
}

std::string BaseCommand::getName(){
	return m_name;
}

int BaseCommand::execute(std::string args){
	std::cout << m_name << " has not been implemented" << std::endl;
	return -1;
}

CommandSet::CommandSet(std::string name){
	std::cout << "Command set "  << name << " Created" << std::endl;
       	m_name = name;	
}

void CommandSet::addCommand(BaseCommand&& cmd){
	m_commands.push_back(cmd);
}

BaseCommand& CommandSet::getCommand(std::string cmdName){
	std::string t;
	for(auto& cmd : m_commands){
		t = cmd.getName();
		if(t.compare(cmdName) == 0) return cmd;
	}
	throw std::invalid_argument("No command named "+cmdName);
}

int CommandSet::execute(std::string cmdline){
	auto toks = split(cmdline, ' ');
	if(toks.size() > 0){
		try {
			BaseCommand& cmd = getCommand(toks[0]);
			return cmd.execute(cmdline);
		} catch (const std::invalid_argument &e){
			std::cout << e.what() << std::endl;
		}
	}
	std::cout << "Did nothing, empty command" << std::endl;
	return 0;
}

