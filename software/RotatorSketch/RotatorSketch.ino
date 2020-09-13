uint8_t stepperP = 3;
uint8_t stepperDir = 2;
uint8_t stepperSleepBar = 4;
uint8_t stepperResetBar = 5;
uint8_t stepperMs3 = 6;
uint8_t stepperMs2 = 7;
uint8_t stepperMs1 = 8;
uint8_t stepperEnableBar = 9;
uint16_t newSpeed = 0;

extern "C"
{
	#include "uart_command_lib.h"
	#include "corbomite.h"
}

extern "C"
{
void setMotorSpeed(int32_t d){
	int32_t value;
	if(d < 0){
		digitalWrite(stepperDir, LOW);
		d = -d;
	} else {
		digitalWrite(stepperDir, HIGH);
	}
	value = 250000/d;
	//value = 8*250000/d;
	if(value > 65535) value=65535;
	//OCR1A = value;	
	newSpeed = value;
}

void setEnableBar(uint8_t s){
	if(s) digitalWrite(stepperEnableBar, HIGH);
	else digitalWrite(stepperEnableBar, LOW);
}
}


SIGNAL(TIMER1_COMPA_vect)
{
	//static int steps=1470*32;
	static int t=0;
	if((t&0x1)==0)
		//if(steps){
			digitalWrite(stepperP, HIGH);
			digitalWrite(stepperP, LOW);
			//steps--;
		//}
	t++;
	OCR1A = newSpeed;
}


void stepperPower(uint8_t state){
	if(state == 0){
		digitalWrite(8, HIGH);
		digitalWrite(12, LOW);
	} else {
		digitalWrite(8, LOW);
		digitalWrite(12, HIGH);
	}
}

ANA_OUT("speed", "RPM", "-1", "1", -2940*2, 2940*2, setMotorSpeed, setMotorSpeedWidget);
DIG_OUT("ENBL_BAR", setEnableBar, setEnableBarWidget);
const CorbomiteEntry last PROGMEM = {LASTTYPE, "", 0};
const EventData initEvent PROGMEM = {registeredEntries};
const CorbomiteEntry initcmd PROGMEM = {EVENT_OUT, internalId, (CorbomiteData*)&initEvent};	

const CorbomiteEntry * const entries [] PROGMEM = {
	&setMotorSpeedWidget,
	&setEnableBarWidget,
	&initcmd, &last
};



void setup()
{
  Serial.begin(115200);
  pinMode(stepperP, OUTPUT);
  pinMode(stepperDir, OUTPUT);
  pinMode(stepperSleepBar, OUTPUT);
  pinMode(stepperResetBar, OUTPUT);
  pinMode(stepperMs3, OUTPUT);
  pinMode(stepperMs2, OUTPUT);
  pinMode(stepperMs1, OUTPUT);
  pinMode(stepperEnableBar, OUTPUT);
  digitalWrite(stepperEnableBar, HIGH);

  digitalWrite(stepperSleepBar, HIGH);
  digitalWrite(stepperResetBar, HIGH);
  digitalWrite(stepperMs3, LOW);
  digitalWrite(stepperMs2, LOW);
  digitalWrite(stepperMs1, HIGH);
  //digitalWrite(stepperEnableBar, LOW);

  digitalWrite(stepperDir, LOW);
  //Set timer1 to 4us resolution
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;;

  OCR1A = 64435;//500;16384/100; //512/6;
  TCCR1B |= (1 << WGM12);
  TCCR1B |= (1 << CS10) | (1<<CS11);
  TIMSK1 |= (1 <<OCIE1A);
  setMotorSpeed(0);
  setEnableBar(1);
//  OCR0A = 0xAF;
//  TIMSK0 |= _BV(OCIE0A);

	//setup 
}

void loop()
{
	/*static uint32_t speed = 0;
	setMotorSpeed(speed);
  	digitalWrite(stepperEnableBar, LOW);
	delay(10);
	//if(speed < 160) speed+=1;
	if(speed<2940*2) speed+=10;*/
	commandLine();
	delay(10);
}

void serialEvent(){
	while(Serial.available()){
		addCharToBuffer(Serial.read());
	}
}

void platformSerialWrite(const char *buf, uint16_t len){
	Serial.write((uint8_t *) buf, len);
} 
