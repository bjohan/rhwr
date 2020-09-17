import SoapySDR
import numpy
from SoapySDR import *
import time
import pycuda.driver as cuda
import pycuda.autoinit

serials={'LOW_BAND_IF_B': '0000000000000000925866e62c9b69e3', 
        'HIGH_BAND_IF_B': '000000000000000087c867dc2d0d705f', 
        'LOW_BAND_IF_A': '0000000000000000654067dc2c977167',
        'HIGH_BAND_IF_A': '0000000000000000a06063c82b534a1b'}

class Digitizer:
    def __init__(self, serial, frequency=375e6, sampleRate=20e6):
        buffSize = 16384*2
        self.buff = numpy.array([0]*buffSize, numpy.complex64)
        self.gpumem =  cuda.mem_alloc(self.buff.nbytes)
        args = dict(driver="hackrf", serial=serial)
        self.sdr = SoapySDR.Device(args)

        print(self.sdr.listAntennas(SOAPY_SDR_RX, 0))
        print(self.sdr.listGains(SOAPY_SDR_RX, 0))
        freqs = self.sdr.getFrequencyRange(SOAPY_SDR_RX, 0)
        for freqRange in freqs: print(freqRange)

        #apply settings
        self.sdr.setSampleRate(SOAPY_SDR_RX, 0, sampleRate)
        self.sdr.setFrequency(SOAPY_SDR_RX, 0, frequency)

        #setup a stream (complex floats)
        self.rxStream = self.sdr.setupStream(SOAPY_SDR_RX, SOAPY_SDR_CF32)
        self.sdr.activateStream(self.rxStream) #start streaming

        #create a re-usable buffer for rx samples


    def read(self):
        sr = self.sdr.readStream(self.rxStream, [self.buff], len(self.buff))
        cuda.memcpy_htod(self.gpumem, self.buff)
        ##receive some samples
        #for i in range(10):
        #    sr = sdr.readStream(rxStream, [buff], len(buff))
        #    print(sr.ret) #num samples or error code
        #    print(sr.flags) #flags set by receive operation
        #    print(sr.timeNs) #timestamp for receive buffer

#shutdown the stream
#sdr.deactivateStream(rxStream) #stop streaming
#sdr.closeStream(rxStream)

devs=[]
for key in serials:
    devs.append(Digitizer(serials[key]))

t0 = time.time()
while True:
    for d in devs:
        d.read()
    if time.time()-t0>100:
        break
