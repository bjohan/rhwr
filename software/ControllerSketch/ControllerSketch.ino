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

//LOW band receiver LO controls
#define CE_LO_LO 38
#define CSB_LO_LO 50
#define SCK_LO_LO 44
#define SDI_DATA_OUT_LO_LO 46
#define MUX_LO_LO 48


#include "lmx_spi_interface.h"

LmxSpiInterface lmx_lo_hi = LmxSpiInterface(CSB_LO_HI, SCK_LO_HI, SDI_DATA_OUT_LO_HI, MUX_LO_HI, CE_LO_HI);
LmxSpiInterface lmx_lo_lo = LmxSpiInterface(CSB_LO_LO, SCK_LO_LO, SDI_DATA_OUT_LO_LO, MUX_LO_LO, CE_LO_LO);

extern "C"
{
	#include "uart_command_lib.h"
	#include "corbomite.h"
}

extern "C" {

	uint32_t registerAddressHi;
	uint32_t registerReadDataHi;
	uint32_t registerWriteDataHi;
	uint32_t registerAddressLo;
	uint32_t registerReadDataLo;
	uint32_t registerWriteDataLo;
	void setGHigh(uint8_t s){
		if(s){
			digitalWrite(G_HIGH, HIGH);
			digitalWrite(G_HIGH_BAR, LOW);
		//transmitString("setGHigh active");
		} else {
			digitalWrite(G_HIGH, LOW);
			digitalWrite(G_HIGH_BAR, HIGH);
		//transmitString("setGHigh inactive");
		}
	}
	
	void setBlHigh(uint8_t s){
		if(s){
			digitalWrite(BL_HIGH, HIGH);
			digitalWrite(BL_HIGH_BAR, LOW);
		//transmitString("setBlHigh active");
		} else {
			digitalWrite(BL_HIGH, LOW);
			digitalWrite(BL_HIGH_BAR, HIGH);
		//transmitString("setBlHigh inactive");
		}
	}

	void setHruHigh(uint8_t s){
		if(s){
			digitalWrite(HRU_HIGH, HIGH);
			digitalWrite(HRU_HIGH_BAR, LOW);
		//transmitString("setHruHigh active");
		} else {
			digitalWrite(HRU_HIGH, LOW);
			digitalWrite(HRU_HIGH_BAR, HIGH);
		//transmitString("setHruHigh inactive");
		}
	}

	void setGLow(uint8_t s){
		if(s){
			digitalWrite(G_LOW, HIGH);
			digitalWrite(G_LOW_BAR, LOW);
		//transmitString("setGLow active");
		} else {
			digitalWrite(G_LOW, LOW);
			digitalWrite(G_LOW_BAR, HIGH);
		//transmitString("setGLow inactive");
		}
	}

	void setBlLow(uint8_t s){
		if(s){
			digitalWrite(BL_LOW, HIGH);
			digitalWrite(BL_LOW_BAR, LOW);
		//transmitString("setBlLow active");
		} else {
			digitalWrite(BL_LOW, LOW);
			digitalWrite(BL_LOW_BAR, HIGH);
		//transmitString("setBlLow inactive");
		}
	}

	void setLru1Low(uint8_t s){
		if(s){
			digitalWrite(LRU1_LOW, HIGH);
			digitalWrite(LRU1_LOW_BAR, LOW);
		//transmitString("setLru1Low active");
		} else {
			digitalWrite(LRU1_LOW, LOW);
			digitalWrite(LRU1_LOW_BAR, HIGH);
		//transmitString("setLru1Low inactive");
		}
	}

	void setLru2Low(uint8_t s){
		if(s){
			digitalWrite(LRU2_LOW, HIGH);
			digitalWrite(LRU2_LOW_BAR, LOW);
		//transmitString("setLru2Low active");
		} else {
			digitalWrite(LRU2_LOW, LOW);
			digitalWrite(LRU2_LOW_BAR, HIGH);
		//transmitString("setLru2Low inactive");
		}
	}


	void setBtLow(uint8_t s){
		if(s){
			digitalWrite(BT_LOW, HIGH);
			digitalWrite(BT_LOW_BAR, LOW);
		//transmitString("setBtLow active");
		} else {
			digitalWrite(BT_LOW, LOW);
			digitalWrite(BT_LOW_BAR, HIGH);
		//transmitString("setBtLow inactive");
		}
	}

	void setCalTrig(uint8_t s){
		if(s){
			digitalWrite(CAL_TRIG, HIGH);
		//transmitString("setCalTrig active");
		} else {
			digitalWrite(CAL_TRIG, LOW);
		//transmitString("setCalTrig inactive");
		}
	}

	void setAutocalEnable(uint8_t s){
		if(s){
			digitalWrite(AUTOCAL_ENABLE, HIGH);
		//transmitString("setAutocalEnable active");
		} else {
			digitalWrite(AUTOCAL_ENABLE, LOW);
		//transmitString("setAutocalEnable inactive");
		}
	}

//High band pll access functions
	void setRegisterAddressHi(int32_t a){
		registerAddressHi = a;
	}

	void setRegisterDataHi(int32_t d){
		registerWriteDataHi = d;
	}

	/*int32_t getRegisterData(){
		return registerReadDataHi;
	}*/

	ANA_IN("readReg_hi", "raw", "0", "65535", 0, 65535, getRegisterDataHiWidget);
	void readHiBandLmxRegister(){
		registerReadDataHi = lmx_lo_hi.readRegister(registerAddressHi);
		transmitAnalogIn(&getRegisterDataHiWidget, registerReadDataHi);
	}

	void writeHiBandLmxRegister(){
		transmitString("Writing");
		transmitInt(registerAddressHi);
		transmitInt(registerWriteDataHi);
		transmitString("\n");	
		lmx_lo_hi.writeRegister(registerAddressHi, registerWriteDataHi);
	}

	void setHiBandCe(uint8_t s){
		if(s){
			digitalWrite(CE_LO_HI, HIGH);
		} else {
			digitalWrite(CE_LO_HI, LOW);
		}

	}
	
//Low band pll access functions
	void setRegisterAddressLo(int32_t a){
		registerAddressLo = a;
	}

	void setRegisterDataLo(int32_t d){
		registerWriteDataLo = d;
	}

	/*int32_t getRegisterData(){
		return registerReadDataLo;
	}*/

	ANA_IN("readReg_lo", "raw", "0", "65535", 0, 65535, getRegisterDataLoWidget);
	void readLoBandLmxRegister(){
		registerReadDataLo = lmx_lo_lo.readRegister(registerAddressLo);
		transmitAnalogIn(&getRegisterDataLoWidget, registerReadDataLo);
	}

	void writeLoBandLmxRegister(){
		transmitString("Writing");
		transmitInt(registerAddressLo);
		transmitInt(registerWriteDataLo);
		transmitString("\n");	
		lmx_lo_lo.writeRegister(registerAddressLo, registerWriteDataLo);
	}

	void setLoBandCe(uint8_t s){
		if(s){
			digitalWrite(CE_LO_LO, HIGH);
		} else {
			digitalWrite(CE_LO_LO, LOW);
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

	//high band pll widgets
	ANA_OUT("regAddr_hi", "raw", "0", "65535", ((const int32_t) 0), ((const int32_t) 65535), setRegisterAddressHi, setRegisterAddressHiWidget);
	ANA_OUT("writeReg_hi", "raw", "0", "65535", 0, 65535, setRegisterDataHi, setRegisterDataHiWidget);
	EVENT_OUT("read_hi", readHiBandLmxRegister, readHiBandLmxRegisterWidget);
	EVENT_OUT("write_hi", writeHiBandLmxRegister, writeHiBandLmxRegisterWidget);
	DIG_OUT("CE_LO_HI", setHiBandCe, setHiBandCeWidget);

	//low band pll widgets
	ANA_OUT("regAddr_lo", "raw", "0", "65535", ((const int32_t) 0), ((const int32_t) 65535), setRegisterAddressLo, setRegisterAddressLoWidget);
	ANA_OUT("writeReg_lo", "raw", "0", "65535", 0, 65535, setRegisterDataLo, setRegisterDataLoWidget);
	EVENT_OUT("read_lo", readLoBandLmxRegister, readLoBandLmxRegisterWidget);
	EVENT_OUT("write_lo", writeLoBandLmxRegister, writeLoBandLmxRegisterWidget);
	DIG_OUT("CE_LO_LO", setLoBandCe, setLoBandCeWidget);


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

		&setRegisterAddressHiWidget,
		&setRegisterDataHiWidget,
		&getRegisterDataHiWidget,
		&readHiBandLmxRegisterWidget,
		&writeHiBandLmxRegisterWidget,
		&setHiBandCeWidget,

		&setRegisterAddressLoWidget,
		&setRegisterDataLoWidget,
		&getRegisterDataLoWidget,
		&readLoBandLmxRegisterWidget,
		&writeLoBandLmxRegisterWidget,
		&setLoBandCeWidget,

		&initcmd, &last
	};
}
	
void setup()
{
  	Serial.begin(115200);
  	//Serial.print("Rotating Controller\n\r");
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
