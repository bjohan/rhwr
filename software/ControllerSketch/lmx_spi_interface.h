#ifndef lmx_spi_interface
#define lmx_spi_interface
#include <Arduino.h>



class LmxSpiInterface{
	public:
		LmxSpiInterface(int CSB, int SCK, int SDI_DATA_OUT, int MUX, int CE);
		uint16_t readRegister(uint32_t addr);
		void writeRegister(uint32_t addr, uint32_t data);
	private:
		void sendWord(uint32_t word);
		uint16_t receiveWord(uint32_t word);
		void writeBits(uint32_t word, uint8_t nbits);
		uint16_t readBits(uint8_t nbits);
		void init_registers();
		int _CSB;
		int _SCK;
		int _SDI_DATA_OUT;
		int _MUX;
		int _CE;
};
#endif
