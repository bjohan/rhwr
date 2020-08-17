import sys
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594
import time
import Queue

class CorbomiteLmxInterface(lmx2594.HardwareInterface):
    def __init__(self, regAddressWidget, writeDataWidget, getRegisterDataWidget, readEventWidget, writeEventWidget, ce):
        lmx2594.HardwareInterface.__init__(self)
        self.regAddressWidget = regAddressWidget
        self.writeDataWidget = writeDataWidget
        self.getRegisterDataWidget = getRegisterDataWidget
        self.readEventWidget = readEventWidget
        self.writeEventWidget = writeEventWidget
        self.ce = ce
        self.rdQ = Queue.Queue()
        self.getRegisterDataWidget.addCallback(self.readCallback)

    def chipEnable(self, v):
        if v:
            self.ce.writeValue(1)
        else:
            self.ce.writeValue(0)

    def readCallback(self, widget):
        #print("Read callback called", widget.value.getRaw());
        self.rdQ.put(widget.value.getRaw())

    def readReg(self, ra):
        self.regAddressWidget.writeValue(ra)
        self.readEventWidget.writeValue(None)
        #print("waiting for data")
        #time.sleep(0.3)
        v = self.rdQ.get()
        #v = self.getRegisterDataWidget.value.getRaw()
        #print("got", v)
        return v

    def writeReg(self, ra, v):
        self.regAddressWidget.writeValue(ra)
        self.writeDataWidget.writeValue(v)
        self.writeEventWidget.writeValue(None)
