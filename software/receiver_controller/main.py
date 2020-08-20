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
g = c.widgets['G_LOW'];
lru1.writeValue(True)
lru2.writeValue(True)
g.writeValue(True)
print("Enabling BITE");

autocalEnable.writeValue(True)
calTrig.writeValue(True)

print("Setting up LMX");
time.sleep(1)
import corbomite_lmx_interface
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594
w = c.widgets
hwif = corbomite_lmx_interface.CorbomiteLmxInterface(w['registerAddress'], w['writeReg'], w['readReg'], w['read'],  w['write'], w['CE_LO_HI']);
lmx = lmx2594.Lmx2594(hwif, fosc=320e6)
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
lmx.setFrequency(619e6)
#after = getAllFields(lmx)
#compareFields(before, after)
#for fn in lmx.getAllFieldNames():
#    v = lmx.getField(fn)
#    print("%s:"%(fn), v)
print("done")
print("Lock status:", lmx.isLocked())
#hwif.chipEnable(False)
#for fn in lmx.getAllFieldNames():
#    v = lmx.getField(fn)
#    print("%s:"%(fn), v)
time.sleep(10)
c=None
