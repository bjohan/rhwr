#include <string>
#include <vector>

class BaseCommand{
	private:
		std::string m_name;
	public:
		BaseCommand(std::string name);
		std::string getName();
		int execute(std::string args);
};

class CommandSet{
	private:
		std::vector<BaseCommand> m_commands;
		std::string m_name;
	public:
		CommandSet(std::string name);
		BaseCommand& getCommand(std::string cmd);
		void addCommand( BaseCommand&& cmd);
		BaseCommand& findCommand(std::string name);
		int execute(std::string cmdLine);

};
