#include <string>
#include <vector>
#include <memory>

class BaseCommand{
	private:
		std::string m_name;
	public:
		BaseCommand(std::string name);
		std::string getName();
		virtual	int execute(std::string args);
};

class CommandSet{
	private:
		std::vector<std::unique_ptr<BaseCommand>> m_commands;
		std::string m_name;
	public:
		CommandSet(std::string name);
		std::unique_ptr<BaseCommand>& getCommand(std::string cmd);
		void addCommand(std::unique_ptr<BaseCommand> cmd);
		BaseCommand& findCommand(std::string name);
		int execute(std::string cmdLine);

};
