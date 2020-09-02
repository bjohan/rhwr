import sys
sys.path.append('../../external_dependencies/Corbomite/trunk/src/py/')
from client import corbomiteClient
#from common import corbomiteIo
import serial
import time
import numpy as np

def getAllFields(lmx):
    d={}
    for fn in lmx.getAllFieldNames():
        v = lmx.getField(fn)
        d[fn]=v
    return d

def compareFields(a, b):
    for fn in a:
        if a[fn] != b[fn]:
            print fn, a[fn], b[fn]

port = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
print("waiting for arduino to sleep");
time.sleep(1) #allow time to boot



print("creating client");
c = corbomiteClient.CorbomiteClient(port)

class HighBandReceiver:
    def __init__(self, c):
        self.bl_high = c.widgets['BL_HI']
        self.g_high = c.widgets['G_HI']
        self.hru = c.widgets['HRU_HI']
        self.bl_high.writeValue(False)

    def setHighGain(self, state):
        self.g_high.writeValue(state)

    def blank(self):
        self.bl_high.writeValue(True)

    def unBlank(self):
        self.bl_high.writeValue(False)

    def setFilter(self, f):
        if f < 10250e6:
            self.setFilter0()
        else:
            self.setFilter1()

    def setFilter0(self):
        self.hru.writeValue(False)

    def setFilter1(self):
        self.hru.writeValue(True)

class LowBandReceiver:
    def __init__(self, c):
        self.autocalEnable = c.widgets['AUTOCAL_ENABLE']
        self.calTrig = c.widgets['CAL_TRIG']
        self.lru1 = c.widgets['LRU1_LOW']
        self.lru2 = c.widgets['LRU2_LOW']
        self.bl_low = c.widgets['BL_LOW']
        self.g_low = c.widgets['G_LOW']
        self.bl_low.writeValue(False)

    def setHighGain(self, state):
        self.g_low.writeValue(state)

    def blank(self):
            self.bl_low.writeValue(True)

    def unBlank(self):
            self.bl_low.writeValue(false)

    def setFilter(self, f):
        if f < 1200e6:
            self.setFilter0()
        elif f < 2000e6:
            self.setFilter1()
        elif f < 3500e6:
            self.setFilter2()
        else:
            self.setFilter3()

    def setFilter0(self): #600MHz to 1300MHz
        self.lru1.writeValue(False)
        self.lru2.writeValue(False)

    def setFilter1(self): #1030MHz to 2300MHz
        self.lru1.writeValue(True)
        self.lru2.writeValue(False)

    def setFilter2(self): #1800MHz to 3900MHz
        self.lru1.writeValue(False)
        self.lru2.writeValue(True)

    def setFilter3(self): #3050MHz to 6000MHz
        self.lru1.writeValue(True)
        self.lru2.writeValue(True)

    def enableBite(self, state):
        if state:
            print("Enabling BITE");
            self.autocalEnable.writeValue(True)
            self.calTrig.writeValue(True)
        else:
            print("Disabling BITE");
            self.autocalEnable.writeValue(True)
            self.calTrig.writeValue(False)

hbr = HighBandReceiver(c)
lbr = LowBandReceiver(c)

print("Setting up LMX");
time.sleep(1)
import corbomite_lmx_interface
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594
w = c.widgets
hwif = corbomite_lmx_interface.CorbomiteLmxInterface(w['registerAddress'], w['writeReg'], w['readReg'], w['read'],  w['write'], w['CE_LO_HI']);
lmx = lmx2594.Lmx2594(hwif, fosc=320.069334e6)
lmx.reset()
lmx.applyConfig('../../external_dependencies/Lmx2594/py/10GOut320MRef.txt')
frf = 6200e6;
fif = 300e6;
hbr.setFilter(frf)
lbr.setFilter(frf)
hbr.setHighGain(False)
lbr.setHighGain(False)
lbr.enableBite(True)
lmx.setFrequency(frf+fif)
quit()
for i in range(90):
    frf = i*200e6;
    lmx.setFrequency(frf+fif)
    print "Tuned to", frf, "lock status", lmx.isLocked()
    time.sleep(3)
#print lmx.getFpd()/1e6
#before = getAllFields(lmx)
#time.sleep(10)
#lmx.applyConfig('../../external_dependencies/Lmx2594/py/4640HexReg.txt')
#print lmx.getFpd()/1e6
#lmx.setField('OUTB_PD', 0)
#lmx.setField('OUTA_PD', 0)
#lmx.setField('OUTA_MUX', 1)
#lmx.setField('OUTB_MUX', 1)
#lmx.setField('PLL_R', 1)
#lmx.setField('PLL_R_PRE', 1)
#for i in np.linspace(600e6, 2600e6, 200):
#    lmx.setFrequency(i)
#    time.sleep(3)
#lmx.setFrequency(1101e6)
#lmx.setFrequency(1600e6)
#lmx.setFrequency(6500e6)
#after = getAllFields(lmx)
#compareFields(before, after)
#for fn in lmx.getAllFieldNames():
#    v = lmx.getField(fn)
#    print("%s:"%(fn), v)
print("done")
print("Lock status:", lmx.isLocked())

#while True:
#    g_low.writeValue(True)
#    g_high.writeValue(True)
#    time.sleep(1)
#    g_low.writeValue(False)
#    g_high.writeValue(False)
#    time.sleep(1)
time.sleep(10000)
for i in np.arange(300e6, 2000e6, 1e6):
    lmx.setFrequency(i)
    print "Locked", lmx.isLocked(), "frequency", i/1e6
#hwif.chipEnable(False)
#for fn in lmx.getAllFieldNames():
#    v = lmx.getField(fn)
#    print("%s:"%(fn), v)
time.sleep(10)
c=None
