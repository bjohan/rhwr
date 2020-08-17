import sys
sys.path.append('../../external_dependencies/Corbomite/trunk/src/py/')
from client import corbomiteClient
#from common import corbomiteIo
import serial
import time

port = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
print("waiting for arduino to sleep");
time.sleep(1) #allow time to boot

print("creating client");
c = corbomiteClient.CorbomiteClient(port)
autocalEnable = c.widgets['AUTOCAL_ENABLE']
calTrig = c.widgets['CAL_TRIG']

print("Enabling BITE");

autocalEnable.writeValue(True)
calTrig.writeValue(True)

print("Setting up LMX");

import corbomite_lmx_interface
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594
w = c.widgets
hwif = corbomite_lmx_interface.CorbomiteLmxInterface(w['registerAddress'], w['setRegisterWriteData'], w['getRegisterData'], w['read'],  w['write']);
lmx = lmx2594.Lmx2594(hwif, fosc=320e6)
lmx.reset()
lmx.applyConfig('../../external_dependencies/Lmx2594/py/10GOut320MRef.txt')
print("done")
print(lmx.isLocked())
for fn in lmx.getAllFieldNames():
    v = lmx.getField(fn)
    print("%s:"%(fn), v)
time.sleep(10)
