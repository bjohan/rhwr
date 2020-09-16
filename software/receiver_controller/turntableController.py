import time
class TurntableController:
    def __init__(self, c):
        self.c = c
        self.speedWidget = c.widgets['speed']
        self.enableBarWidget = c.widgets['ENBL_BAR']
        self.speed = 0
        self.setEnable(False)
        time.sleep(2)
        self.setEnable(True)

    def setSpeed(self, s):
        self.speedWidget.setValue(s)
        self.speed = float(s)

    def setEnable(self, status):
        if status:
            self.enableBarWidget.writeValue(False)
        else:
            self.enableBarWidget.writeValue(True)


    def rampTo(self, target, rampTime, steps = 40):
        delta = float(target-self.speed)/steps
        start = self.speed
        for i in range(steps+1):
            print "Setting speed", start+i*delta
            self.setSpeed(start+i*delta)
            time.sleep(rampTime/steps)
        print "Target", target, "current", self.speed
