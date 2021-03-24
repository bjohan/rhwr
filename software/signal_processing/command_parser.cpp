#include "command_parser.hpp"
#include <vector>
#include <sstream>

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
