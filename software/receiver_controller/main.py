import sys
sys.path.append('../../external_dependencies/Corbomite/trunk/src/py/')
from client import corbomiteClient
#from common import corbomiteIo
import serial
import time
import numpy as np
import receiverController
import turntableController

#Create receiver controller
port = serial.Serial('/dev/ttyUSB1', 115200, timeout=1)
print("waiting for arduino to sleep");
time.sleep(1) #allow time to boot
print("creating client");
c = corbomiteClient.CorbomiteClient(port)
rxc =receiverController.ReceiverController(c)

#create turntable controller
port = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
print("waiting for arduino to sleep");
time.sleep(1) #allow time to boot
print("creating client");
c = corbomiteClient.CorbomiteClient(port)
ttc = turntableController.TurntableController(c)

hbr = rxc.highBandReceiver
lbr = rxc.lowBandReceiver

frf = 6200e6;
fif = 377e6;
hbr.setFilter(frf)
lbr.setFilter(frf)
hbr.unBlank()
lbr.unBlank()
hbr.setHighGain(False)
lbr.setHighGain(True)
lbr.enableBite(True)
lbr.tune(2001e6, 375e6)
hbr.tune(5900e6, 375e6)
#time.sleep(3600)
#lbr.enableBite(True)
#for i in range(1000):
#    lbr.tune((600+i)*1e6, 375)
#    time.sleep(1)
#ttc.setEnable(True)
#ttc.rampTo(1, 3.0)
#time.sleep(10)
#ttc.rampTo(0, 3.0)
#ttc.setEnable(False)
c=None
