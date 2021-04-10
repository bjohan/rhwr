#pragma once
#include "messages.hpp"
#include <map>
#include <memory>

class MessageFactory{
	private:
		std::map<uint32_t, std::unique_ptr<BaseMessage> (*)()> m_factoryMap;
	public:
		MessageFactory();
		void registerFactory(uint32_t baseType, std::unique_ptr<BaseMessage>(*factory)());
		std::shared_ptr<BaseMessage> create(char *data);
};
			

