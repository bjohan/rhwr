import sys
import corbomite_lmx_interface
sys.path.append('../../external_dependencies/Lmx2594/py/')
import lmx2594

class ReceiverBase:
    def __init__(self, pll):
        self.pll = pll
        self.pll.reset()
        self.pll.applyConfig('../../external_dependencies/Lmx2594/py/10GOut320MRef.txt')

    def tune(self, frf, fif):
        lo = frf-fif
        self.setFilter(frf)
        self.pll.setFrequency(lo)
        self.pll.enableLockDetect(True)

class HighBandReceiver(ReceiverBase):
    def __init__(self, c, pll):
        ReceiverBase.__init__(self, pll)
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

class LowBandReceiver(ReceiverBase):
    def __init__(self, c, pll):
        ReceiverBase.__init__(self, pll)
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
            self.bl_low.writeValue(False)

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


class ReceiverController:
    def __init__(self, c):
        self.c = c;
        print("Setting up LMX2594 PLLs");
        w = c.widgets
        self.hwif1 = corbomite_lmx_interface.CorbomiteLmxInterface(w['regAddr_hi'], w['writeReg_hi'], w['readReg_hi'], w['read_hi'],  w['write_hi'], w['CE_LO_HI']);
        self.hwif2 = corbomite_lmx_interface.CorbomiteLmxInterface(w['regAddr_lo'], w['writeReg_lo'], w['readReg_lo'], w['read_lo'],  w['write_lo'], w['CE_LO_LO']);
        self.lmx1 = lmx2594.Lmx2594(self.hwif1, fosc=320.069334e6)
        self.lmx2 = lmx2594.Lmx2594(self.hwif2, fosc=320.069334e6)

        self.highBandReceiver = HighBandReceiver(self.c, self.lmx2)
        self.lowBandReceiver = LowBandReceiver(self.c, self.lmx1)

