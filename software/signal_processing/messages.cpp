#include "messages.hpp"
#include <exception>



//BaseField is intended to be an abstract class, however linking fails if the methods are not implemetned...
BaseField::~BaseField() {};

uint32_t BaseField::length(){
	throw std::logic_error("Length is not implemented");
	return -1;
}

void BaseField::write(char *buffer){
	throw std::logic_error("write is not implemented");
}

void BaseField::read(char *buffer){
	throw std::logic_error("read is not implemented");
}

//AbstractFieldTemplate is intended to be an abstract class, however linking fails if the methods are not implemetned...
template <class T>
AbstractFieldTemplate<T>::~AbstractFieldTemplate() {};

template <class T>
uint32_t AbstractFieldTemplate<T>::length(){
	throw std::logic_error("Length is not implemented");
	return -1;
}

template <class T>
void AbstractFieldTemplate<T>::write(char *buffer){
	throw std::logic_error("write is not implemented");
}

template <class T>
void AbstractFieldTemplate<T>::read(char *buffer){
	throw std::logic_error("read is not implemented");
}

uint32_t StringField::length(){
 	return m_data.length()+sizeof(uint32_t);
}

void StringField::write(char *buffer){
	*((uint32_t*)buffer)=m_data.length();
	m_data.copy(&buffer[sizeof(uint32_t)], m_data.length());
}

void StringField::read(char *buffer){
	uint32_t toRead = *((uint32_t*)buffer);
	m_data = std::string(buffer+sizeof(uint32_t), toRead);
}

BaseMessage::BaseMessage(uint32_t msgId){
	m_msgId.set(msgId);
	m_length.set(length());
	addField(&m_msgId);
	addField(&m_length);
}

void BaseMessage::addField(BaseField *f){
	m_fields.push_back(f);
}

uint32_t BaseMessage::length(){
	uint32_t l=0;
	for(BaseField *f : m_fields){
		l+=f->length();
	}
	return l;
}

void BaseMessage::serialize(char *buf, uint32_t buflen){
	uint32_t pos=0;
	uint32_t len = length();
	if(buflen < len) throw std::length_error("Buffer length must be bigger than messagesize");
	for(BaseField *f : m_fields){
		f->write(&buf[pos]);
		pos+=f->length();
	}
}

void BaseMessage::unpack(char *buf, uint32_t buflen){
	uint32_t pos=0;
	uint32_t bufMsg=*((uint32_t*)buf);
	if(bufMsg != m_msgId.get()) throw std::runtime_error("buffer message id "+std::to_string(bufMsg)+" is not equal to "+std::to_string(m_msgId.get()));

	for(BaseField *f : m_fields){
		f->read(&buf[pos]);
		pos+=f->length();
	}
}

StringMessage::StringMessage(std::string m):BaseMessage(1){
	this->set(m);
	addField(&m_string);
}

void StringMessage::set(std::string s){
	m_string.set(s);
}

std::string StringMessage::get(){
	return m_string.get();
}

