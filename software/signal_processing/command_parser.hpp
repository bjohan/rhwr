#include <string>
#include <vector>

class BaseCommand{
	private:
		std::string m_name;
	public:
		BaseCommand(std::string name);
		std::string getName();
		int execute(std::string name);
};

class CommandSet{
	private:
		std::vector<BaseCommand> m_commands;

	public:
		BaseCommand findCommand(std::string name);
		int execute(std::string cmdLine);

};
