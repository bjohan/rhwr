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
autocalEnable = c.widgets['AUTOCAL_ENABLE']
calTrig = c.widgets['CAL_TRIG']

lru1 = c.widgets['LRU1_LOW']
lru2 = c.widgets['LRU2_LOW']
bl_low = c.widgets['BL_LOW']
g = c.widgets['G_LOW']

bl_low.writeValue(False)

def setFilter0():
    #600MHz to 1300MHz
    print "Enabling filter from 600MHz to 1300MHz"
    lru1.writeValue(False)
    lru2.writeValue(False)


def setFilter1():
    #1030MHz to 2300MHz
    print "Enabling filter from 1030MHz to 2300MHz"
    lru1.writeValue(True)
    lru2.writeValue(False)

def setFilter2():
    #1800MHz to 3900MHz
    print "Enabling filter from 1800Mhz to 3900Mhz"
    lru1.writeValue(False)
    lru2.writeValue(True)

def setFilter3():
    #3050MHz to 6000MHz
    print "Enabling filter from 3050MHz to 6000MHz"
    lru1.writeValue(True)
    lru2.writeValue(True)

def enableBite():
    print("Enabling BITE");
    autocalEnable.writeValue(True)
    calTrig.writeValue(True)


setFilter1()
enableBite()

#quit()
g.writeValue(True)

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
lmx.setFrequency(1100e6)
#after = getAllFields(lmx)
#compareFields(before, after)
#for fn in lmx.getAllFieldNames():
#    v = lmx.getField(fn)
#    print("%s:"%(fn), v)
print("done")
print("Lock status:", lmx.isLocked())
while True:
    g.writeValue(True)
    time.sleep(1)
    g.writeValue(False)
    time.sleep(1)
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
