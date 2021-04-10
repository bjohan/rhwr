#pragma once
#include <string>
#include <iostream>
#include <stdint.h>
#include <vector>
#include <memory>

class BaseField{
	public:
		//BaseField();
		virtual ~BaseField();
		virtual uint32_t length();
		virtual void write(char *buffer);
		virtual void read(char *buffer);
};


template <class T>
class AbstractFieldTemplate:public BaseField{
	protected:
		 	T m_data;
	public:
		~AbstractFieldTemplate();
		void set(T v){m_data=v;}
		T get() {return m_data;}
		virtual uint32_t length();
		virtual void write(char *buffer);
		virtual void read(char *buffer);
};


template <class T>
class FieldTemplate:public AbstractFieldTemplate<T>{
	public:
		uint32_t length() {return sizeof(T);}
		void write(char *buffer){*((T*)buffer)=this->get();}
		void read(char *buffer){this->set(*((T*)buffer));}
};

class StringField:public AbstractFieldTemplate<std::string>{
	public:
		uint32_t length();
		void write(char *buffer);
		void read(char *buffer);
};

class BaseMessage{
	private:
		FieldTemplate<uint32_t> m_msgId;
		FieldTemplate<uint32_t> m_length;
		std::vector<BaseField*> m_fields;
	public:
		~BaseMessage(){};
		BaseMessage(uint32_t msgId=0);
		void addField(BaseField *f);
		void serialize(char *buf, uint32_t buflen);
		void unpack(char *buf, uint32_t msgsize);
		uint32_t length();
};

class StringMessage: public BaseMessage{
	private:
	public:
		~StringMessage(){};
		static uint32_t msgType;
		static std::unique_ptr<BaseMessage> createInstance();
		StringField m_string;
		StringMessage(std::string m);
		void set(std::string s);
		std::string get();
};

