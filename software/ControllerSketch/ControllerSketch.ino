//Control pins for HI band receiver
//Outputs
#define G_HIGH (54+5)
#define G_HIGH_BAR (54+4)
#define BL_HIGH (54+3)
#define BL_HIGH_BAR (54+2)
#define HRU_HIGH (54+1)
#define HRU_HIGH_BAR (54+0)
//Inputs
#define HS2_HIGH_SE 3
#define HS1_HIGH_SE 18

//Control pins for LO band receiver
#define G_LOW 4
#define G_LOW_BAR 5
#define BL_LOW 6 
#define BL_LOW_BAR 7
#define LRU1_LOW 8
#define LRU1_LOW_BAR 9
#define LRU2_LOW 10
#define LRU2_LOW_BAR 11
#define BT_LOW 12
#define BT_LOW_BAR 4

//Inputs
#define LS1_LOW_SE 19
#define LS2_LOW_SE 20

#define CAL_TRIG 2
#define AUTOCAL_ENABLE 15

//Hi band receiver LO controls
#define CE_LO_HI 39
#define CSB_LO_HI 51
#define SCK_LO_HI 45 
#define SDI_DATA_OUT_LO_HI 47
#define MUX_LO_HI 49


#include "lmx_spi_interface.h"

LmxSpiInterface lmx_lo_hi = LmxSpiInterface(CSB_LO_HI, SCK_LO_HI, SDI_DATA_OUT_LO_HI, MUX_LO_HI, CE_LO_HI);

extern "C"
{
	#include "uart_command_lib.h"
	#include "corbomite.h"
}

extern "C" {

	uint32_t registerAddress;
	uint32_t registerData;
	uint32_t registerWriteData;
	void setGHigh(uint8_t s){
		if(s){
			digitalWrite(G_HIGH, HIGH);
			digitalWrite(G_HIGH_BAR, LOW);
		transmitString("setGHigh active");
		} else {
			digitalWrite(G_HIGH, LOW);
			digitalWrite(G_HIGH_BAR, HIGH);
		transmitString("setGHigh inactive");
		}
	}
	
	void setBlHigh(uint8_t s){
		if(s){
			digitalWrite(BL_HIGH, HIGH);
			digitalWrite(BL_HIGH_BAR, LOW);
		transmitString("setBlHigh active");
		} else {
			digitalWrite(BL_HIGH, LOW);
			digitalWrite(BL_HIGH_BAR, HIGH);
		transmitString("setBlHigh inactive");
		}
	}

	void setHruHigh(uint8_t s){
		if(s){
			digitalWrite(HRU_HIGH, HIGH);
			digitalWrite(HRU_HIGH_BAR, LOW);
		transmitString("setHruHigh active");
		} else {
			digitalWrite(HRU_HIGH, LOW);
			digitalWrite(HRU_HIGH_BAR, HIGH);
		transmitString("setHruHigh inactive");
		}
	}

	void setGLow(uint8_t s){
		if(s){
			digitalWrite(G_LOW, HIGH);
			digitalWrite(G_LOW_BAR, LOW);
		transmitString("setGLow active");
		} else {
			digitalWrite(G_LOW, LOW);
			digitalWrite(G_LOW_BAR, HIGH);
		transmitString("setGLow inactive");
		}
	}

	void setBlLow(uint8_t s){
		if(s){
			digitalWrite(BL_LOW, HIGH);
			digitalWrite(BL_LOW_BAR, LOW);
		transmitString("setBlLow active");
		} else {
			digitalWrite(BL_LOW, LOW);
			digitalWrite(BL_LOW_BAR, HIGH);
		transmitString("setBlLow inactive");
		}
	}

	void setLru1Low(uint8_t s){
		if(s){
			digitalWrite(LRU1_LOW, HIGH);
			digitalWrite(LRU1_LOW_BAR, LOW);
		transmitString("setLru1Low active");
		} else {
			digitalWrite(LRU1_LOW, LOW);
			digitalWrite(LRU1_LOW_BAR, HIGH);
		transmitString("setLru1Low inactive");
		}
	}

	void setLru2Low(uint8_t s){
		if(s){
			digitalWrite(LRU2_LOW, HIGH);
			digitalWrite(LRU2_LOW_BAR, LOW);
		transmitString("setLru2Low active");
		} else {
			digitalWrite(LRU2_LOW, LOW);
			digitalWrite(LRU2_LOW_BAR, HIGH);
		transmitString("setLru2Low inactive");
		}
	}


	void setBtLow(uint8_t s){
		if(s){
			digitalWrite(BT_LOW, HIGH);
			digitalWrite(BT_LOW_BAR, LOW);
		transmitString("setBtLow active");
		} else {
			digitalWrite(BT_LOW, LOW);
			digitalWrite(BT_LOW_BAR, HIGH);
		transmitString("setBtLow inactive");
		}
	}

	void setCalTrig(uint8_t s){
		if(s){
			digitalWrite(CAL_TRIG, HIGH);
		transmitString("setCalTrig active");
		} else {
			digitalWrite(CAL_TRIG, LOW);
		transmitString("setCalTrig inactive");
		}
	}

	void setAutocalEnable(uint8_t s){
		if(s){
			digitalWrite(AUTOCAL_ENABLE, HIGH);
		transmitString("setAutocalEnable active");
		} else {
			digitalWrite(AUTOCAL_ENABLE, LOW);
		transmitString("setAutocalEnable inactive");
		}
	}

	void setRegisterAddress(uint32_t a){
		registerAddress = a;
	}

	void setRegisterData(uint32_t d){
		registerWriteData = d;
	}

	int32_t getRegisterData(){
		return registerData;
	}

	ANA_IN("readReg", "raw", "0", "65535", 0, 65535, getRegisterDataWidget);
	void readHiBandLmxRegister(){
		registerData = lmx_lo_hi.readRegister(registerAddress);
		transmitAnalogIn(&getRegisterDataWidget, registerData);
	}

	void writeHiBandLmxRegister(){
		transmitString("Writing");
		transmitInt(registerAddress);
		transmitInt(registerWriteData);
		transmitString("\n");	
		lmx_lo_hi.writeRegister(registerAddress, registerWriteData);
	}

	void setHiBandCe(uint8_t s){
		if(s){
			digitalWrite(CE_LO_HI, HIGH);
		} else {
			digitalWrite(CE_LO_HI, LOW);
		}

	}
	

	DIG_OUT("G_HI", setGHigh, setGHighWidget);
	DIG_OUT("BL_HI", setBlHigh, setBlHighWidget);
	DIG_OUT("HRU_HI", setHruHigh, setHruHighWidget);

	DIG_OUT("G_LOW", setGLow, setGLowWidget);
	DIG_OUT("BL_LOW", setBlLow, setBlLowWidget);
	DIG_OUT("LRU1_LOW", setLru1Low, setLru1LowWidget);
	DIG_OUT("LRU2_LOW", setLru2Low, setLru2LowWidget);
	DIG_OUT("BT_LOW", setBtLow, setBtLowWidget);

	DIG_OUT("AUTOCAL_ENABLE", setAutocalEnable, setAutocalEnableWidget);
	DIG_OUT("CAL_TRIG", setCalTrig, setCalTrigWidget);

	ANA_OUT("registerAddress", "raw", "0", "65535", ((const int32_t) 0), ((const int32_t) 65535), setRegisterAddress, setRegisterAddressWidget);
	ANA_OUT("writeReg", "raw", "0", "65535", 0, 65535, setRegisterData, setRegisterDataWidget);

	EVENT_OUT("read", readHiBandLmxRegister, readHiBandLmxRegisterWidget);
	EVENT_OUT("write", writeHiBandLmxRegister, writeHiBandLmxRegisterWidget);
	DIG_OUT("CE_LO_HI", setHiBandCe, setHiBandCeWidget);
	const CorbomiteEntry last PROGMEM = {LASTTYPE, "", 0};
	const EventData initEvent PROGMEM = {registeredEntries};
	const CorbomiteEntry initcmd PROGMEM = {EVENT_OUT, internalId, (CorbomiteData*)&initEvent};	

	const CorbomiteEntry * const entries [] PROGMEM = {
		&setGHighWidget,
		&setBlHighWidget,
		&setHruHighWidget,
		&setGLowWidget,
		&setBlLowWidget,
		&setLru1LowWidget,
		&setLru2LowWidget,
		&setBtLowWidget,
		&setCalTrigWidget,
		&setAutocalEnableWidget,
		&setRegisterAddressWidget,
		&setRegisterDataWidget,
		&getRegisterDataWidget,
		&readHiBandLmxRegisterWidget,
		&writeHiBandLmxRegisterWidget,
		&setHiBandCeWidget,
		&initcmd, &last
	};
}
	
void setup()
{
  	Serial.begin(115200);
  	Serial.print("Rotating Controller\n\r");
	pinMode(G_HIGH, OUTPUT);
	pinMode(G_HIGH_BAR, OUTPUT);
	pinMode(BL_HIGH, OUTPUT);
	pinMode(BL_HIGH_BAR, OUTPUT);
	pinMode(HRU_HIGH, OUTPUT);
	pinMode(HRU_HIGH_BAR, OUTPUT);
	pinMode(G_HIGH, OUTPUT);
	pinMode(G_LOW , OUTPUT);
	pinMode(G_LOW_BAR , OUTPUT);
	pinMode(BL_LOW , OUTPUT);
	pinMode(BL_LOW_BAR , OUTPUT);
	pinMode(LRU1_LOW , OUTPUT);
	pinMode(LRU1_LOW_BAR , OUTPUT);
	pinMode(LRU2_LOW , OUTPUT);
	pinMode(LRU2_LOW_BAR , OUTPUT);
	pinMode(BT_LOW , INPUT);
	pinMode(BT_LOW_BAR , INPUT);
	pinMode(CAL_TRIG, OUTPUT);
	pinMode(AUTOCAL_ENABLE, OUTPUT);

	setGHigh(1);
	setBlHigh(0);
	setHruHigh(0);
	setGLow(1);
	setBlLow(0);
	setLru1Low(0);
	setLru2Low(0);
	setBtLow(0);
	setAutocalEnable(1);
	setCalTrig(0);
	
}

void loop()
{
	commandLine();
	delay(10);
}


void platformSerialWrite(const char *buf, uint16_t len){
	Serial.write((uint8_t *) buf, len);
}

void serialEvent(){
	while(Serial.available()){
		addCharToBuffer(Serial.read());
	}
} 
