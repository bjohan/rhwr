import sys
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594
import time

class CorbomiteLmxInterface(lmx2594.HardwareInterface):
    def __init__(self, regAddressWidget, writeDataWidget, getRegisterDataWidget, readEventWidget, writeEventWidget):
        lmx2594.HardwareInterface.__init__(self)
        self.regAddressWidget = regAddressWidget
        self.writeDataWidget = writeDataWidget
        self.getRegisterDataWidget = getRegisterDataWidget
        self.readEventWidget = readEventWidget
        self.writeEventWidget = writeEventWidget
        #self.rddat=None
        #self.readEventWidget.addCallback(self.readCallback)

    #def readCallback(self, value):
    #    self.rddat = value

    def readReg(self, ra):
        self.regAddressWidget.writeValue(ra)
        #self.rddat= None
        self.readEventWidget.writeValue(None)
        time.sleep(0.1)
        v = self.getRegisterDataWidget.value.getRaw()
        print(v)
        return v

    def writeReg(self, ra, v):
        self.regAddressWidget.writeValue(ra)
        self.writeDataWidget.writeValue(v)
        self.writeEventWidget.writeValue(None)
