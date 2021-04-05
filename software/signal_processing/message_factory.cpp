#include "message_factory.hpp"
#include <iostream>

MessageFactory::MessageFactory()
{
}

void MessageFactory::registerFactory(uint32_t baseType, std::unique_ptr<BaseMessage> (*factory)()){
	m_factoryMap[baseType] = factory;
}

std::unique_ptr<BaseMessage> MessageFactory::create(char *data){
	uint32_t type = *((uint32_t *)data);
	std::cout << "factorying " << type << std::endl;
	return m_factoryMap[type]();
}
