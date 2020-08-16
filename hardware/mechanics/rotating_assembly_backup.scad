use <threads.scad>
bearingRi=40.5/2;
scaleFactor = bearingRi/20;
bearingRo=68.1*scaleFactor/2-0.15;
bearingHeight = 15;

firstBearingOffset = 5;
bearingPitch = 45;

stepperOffset=110+10;


slipRing12PRadiusBottom = 16/2;
slipRing12PThicknessBottom = 21;
slipRing12PRadiusFlange = 35/2;
slipRing12PThicknessFlange = 1.5;
slipRing12PRadiusTop=14/2;
slipRing12PThicknessTop=7;
slipRing12PTotalLength=slipRing12PThicknessBottom+slipRing12PThicknessFlange+slipRing12PThicknessTop;
slipRing12PHoleRadius=4/2;

hiBandReceiverAngle=-45/2;

module loBandAntenna(){
    cube([58,58,23]);
}

module hiBandAntenna(){
    r = 30.5/2;
    l = 10;
    cylinder(l,r,r);
}

module tnc(){
    bw = 18;
    bh = 3;
    r = 11/2;
    l= 15;
    translate([-bw/2, -bw/2, 0]) cube([bw, bw, bh]);
    translate([0,0,bh]) cylinder(l, r, r);
}

module mainConnector(){
    bw = 37;
    bh = 3;
    r = 32/2;
    l= 20;
    translate([-bw/2, -bw/2, 0]) cube([bw, bw, bh]);
    translate([0,0,bh]) cylinder(l, r, r);
}

module antennas(){
    co = 23/2;
    rotate([0, 90, 0])translate([0,2,0]){
    rotate([0,-45,0]) translate([-58/2,0,-co])loBandAntenna();
    translate([0,104,0])rotate([0,45,0]) translate([-58/2,0,-co])loBandAntenna();
    translate([0,83,0])rotate([0,45,0]) translate([0,0,co+5])hiBandAntenna();
    translate([0,83,0])rotate([0,-45,0]) translate([0,0,co+5])hiBandAntenna();
    }
}

module hiBandReceiverBody(){
    cube([220, 165, 58]);
    translate([0,9+7,9+6])rotate([0, -90, 0])tnc();
    translate([0,9+7,9+6+29])rotate([0, -90, 0])tnc();
    translate([0,31,0]){
        translate([0,9+7,9+6])rotate([0, -90, 0])tnc();
            translate([0,9+7,9+6+29])rotate([0, -90, 0])tnc();
    }
    translate([0,31+73,0]){
        translate([0,9+7,9+6])rotate([0, -90, 0])tnc();
            translate([0,9+7,9+6+29])rotate([0, -90, 0])tnc();
    }
    
    translate([0,64+16,16+11])rotate([0, -90, 0]) mainConnector();
    translate([248.7+2,0,58/2])antennas();
    
    translate([82, -17, 27]) cube([22, 17, 28]);
    translate([82+120, -17, 27]) cube([18, 17, 28]);
    translate([82+120, 165, 27]) cube([18, 17, 28]);
    translate([82, 165, 27]) cube([22, 17, 28]);

}


module hiBandReceiverHolePattern(r, l, corners=[true, true, true, true]){
    x1 = 93;
    x2 = x1+(126-5.7);
    y1 = 10.5;
    if(corners[0]) translate([x1, -y1, 27]) uCylinder(-l,r,r);
    if(corners[1]) translate([x2, -y1, 27]) uCylinder(-l,r,r);
    if(corners[2]) translate([x1, 165+y1, 27]) uCylinder(-l,r,r);
    if(corners[3]) translate([x2, 165+y1, 27]) uCylinder(-l,r,r);
}

module hiBandReceiver(){
    difference(){
        hiBandReceiverBody();
        hiBandReceiverHolePattern(5.7/2, 100);
    }
}



module loBandReceiverBody(){
    cube([270, 189, 64]);
    
    translate([0,0,0]){
        translate([0,9+16,9+5])rotate([0, -90, 0])tnc();
        translate([0,9+16,9+5+34])rotate([0, -90, 0])tnc();
    }
    
    translate([0,25.4,0]){
        translate([0,9+16,9+5])rotate([0, -90, 0])tnc();
        translate([0,9+16,9+5+34])rotate([0, -90, 0])tnc();
    }
    
    translate([0,2*25.4,0]){
        translate([0,9+16,9+5])rotate([0, -90, 0])tnc();
        translate([0,9+16,9+5+34])rotate([0, -90, 0])tnc();
    }
    
    translate([0,97+16,16+13])rotate([0, -90, 0]) mainConnector();
}

module uCylinder(l, r1, r2){
    if(l < 0){
        translate([0,0,l]) cylinder(-l, r1, r2);
    } else {
        cylinder(l, r1, r2);
    }
}
    
module loBandReceiverHolePattern(r, l, corners=[true, true, true, true, true, true, true, true]){
    bh=64;
    d=6.7;
    x1=23-d/2;
    x2=x1+231;
    yd=49.6-d;
    
    if(corners[0]) translate([x1,0,bh/2-yd/2]) rotate([90,0,0]) uCylinder(l,r,r);
    if(corners[1]) translate([x1,0,bh/2+yd/2]) rotate([90,0,0]) uCylinder(l,r,r);
    if(corners[2]) translate([x2,0,bh/2-yd/2]) rotate([90,0,0]) uCylinder(l,r,r);
    if(corners[3]) translate([x2,0,bh/2+yd/2]) rotate([90,0,0]) uCylinder(l,r,r);
    
    if(corners[4]) translate([x1,189,bh/2-yd/2]) rotate([-90,0,0]) uCylinder(l,r,r);
    if(corners[5]) translate([x1,189,bh/2+yd/2]) rotate([-90,0,0]) uCylinder(l,r,r);
    if(corners[6]) translate([x2,189,bh/2-yd/2]) rotate([-90,0,0]) uCylinder(l,r,r);
    if(corners[7]) translate([x2,189,bh/2+yd/2]) rotate([-90,0,0]) uCylinder(l,r,r);
    
}

module loBandReceiver(){
    difference(){
        loBandReceiverBody();
        loBandReceiverHolePattern(6.7/2, -20);
    }
}

module placeHiBandReceiver(zoffs=0){
    translate([20,(189-165)/2,80+50]) rotate([0,hiBandReceiverAngle,0]) translate([0,0,zoffs])children();
}

module receivers(){
    loBandReceiver();
    placeHiBandReceiver() hiBandReceiver();
}

module receiversVolume(){
       minkowski(){
            receivers();
            sphere(1);
        }
}

module consoleOneBody(){
    hull(){
        placeHiBandReceiver() hiBandReceiverHolePattern(6,5, [true, false, false, false]);
        loBandReceiverHolePattern(10,5, [true, true, false, false, false, false, false, false]);
    }
}

module consoleOne1(){
    difference(){
        consoleOneBody();
        placeHiBandReceiver(zoffs=1) hiBandReceiverHolePattern(2.5,15, [true, false, false, false]);
        placeHiBandReceiver(zoffs=-5) hiBandReceiverHolePattern(6,15, [true, false, false, false]);
        loBandReceiverHolePattern(3.5,15, [true, true, false, false, false, false, false, false]);
        loBandReceiverHolePattern(3.5,-15, [true, true, false, false, false, false, false, false]);
        receiversVolume();
    }
}

module consoleBody(vs, vl){
    hull(){
        placeHiBandReceiver() hiBandReceiverHolePattern(8,15, vs);
        loBandReceiverHolePattern(10,5, vl);
    }
}
module console(vs, vl){
    //consoleBody(vs, vl);
    difference(){
        consoleBody(vs, vl);
        placeHiBandReceiver(zoffs=1) hiBandReceiverHolePattern(2.5,30, vs);
        hull(){
            //placeHiBandReceiver(zoffs=-5) hiBandReceiverHolePattern(6,100, vs);
            //translate([20,0, 0]) placeHiBandReceiver(zoffs=-5) hiBandReceiverHolePattern(6,100, vs);
            placeHiBandReceiver(zoffs=-5) hiBandReceiverHolePattern(5.5,5.5, vs, $fn=6);
            placeHiBandReceiver(zoffs=-5) translate([20,0, 0]) hiBandReceiverHolePattern(5.5,5.5, vs, $fn=6);
        }
        loBandReceiverHolePattern(3.5,15, vl);
        loBandReceiverHolePattern(3.5,-15, vl);
        receiversVolume();
    }
}

module consoleOne(){
    vs = [true, false, false, false];
    vl = [true, true, false, false, false, false, false, false];
    console(vs, vl);
}

module consoleTwo(){
    vs = [false, true, false, false];
    vl = [false, false, true, true, false, false, false, false];
    console(vs, vl);
}

module consoleThree(){
    vs = [false, false, false, true];
    vl = [false, false, false, false, false, false, true, true];
    console(vs, vl);
}

module consoleFour(){
    vs = [false, false, true, false];
    vl = [false, false, false, false, true, true, false, false];
    console(vs, vl);
}

module bearing6008Z(){
    ro = bearingRo-0.5;
    ri = bearingRi+0.5;
    t = 15;
    difference(){
        cylinder(t, ro,ro);
        translate([0,0,-1])
        cylinder(t+2, ri,ri);
        
    }
    
}

slipRing6PRadiusBottom = 22/2;
slipRing6PThicknessBottom = 5.5;
slipRing6PRadiusFlange = 44.5/2;
slipRing6PThicknessFlange=2.3;
slipRing6PRadiusTop=22/2;
slipRing6PThicknessTop=13;
slipRing6PTotalLength=slipRing6PThicknessBottom+slipRing6PThicknessFlange+slipRing6PThicknessTop;
slipRing6PHoleRadius=5/2;

module slipRing6PHolePattern(l, r, bodyHole=false){
    rb = slipRing6PRadiusBottom;
    translate([rb+7,0,0])cylinder(l, r, r);
    rotate([0,0,120])translate([rb+7,0,0])cylinder(l, r, r);
    rotate([0,0,-120])translate([rb+7,0,0])cylinder(l, r, r);
    if(bodyHole) cylinder(l,12,12);
    
}




module slipRing6P(){
    /*rb = 22/2;
    tb = 5.5;
    rf = 44.5/2;
    tf=2.3;
    rt=22/2;
    tt=13;
    tl = tb+tf+tt;
    hr = 5/2;*/
    rb = slipRing6PRadiusBottom;
    tb = slipRing6PThicknessBottom;
    rf = slipRing6PRadiusFlange;
    tf = slipRing6PThicknessFlange;
    rt = slipRing6PRadiusTop;
    tt = slipRing6PThicknessTop;
    tl = slipRing6PTotalLength;
    hr = slipRing6PHoleRadius;
    
    difference(){
        union(){
            cylinder(tb,rb,rb);
            translate([0,0,tb]) cylinder(tf, rf, rf);
            translate([0,0,tb+tf]) cylinder(tt, rt, rt);
        }
        translate([0,0,-1]) cylinder(tl+2, hr, hr);
        slipRing6PHolePattern(tl, hr);
        
    }
    
}

module placeSlipRing6P(){
    translate([0,0,77-5.5]) children();
}

module innerSpacer(){
    ri=bearingRi+0.35;
    difference(){
        cylinder(30, ri+3, ri+3);
        translate([0,0,-1])cylinder(32, ri, ri, $fn=100);
    }
}

module outerSpacer(){
    ro=bearingRo-0.35;
    difference(){
        cylinder(30, ro, ro, $fn=100);
        translate([0,0,-1])cylinder(32, ro-3, ro-3);
    }
}

//bearing6008Z();
//slipRing();

module bottomPartBody(){
    cylinder(5,150/2, 150/2);
    cylinder(65, 20,20);
}

module bottomPart(){
    difference(){
        bottomPartBody();
        translate([0,0,-1])cylinder(100+1, 12,12, $fn=100);
    }
}

/*module topPart(){
    ro=bearingRo+4.2;
    ri = bearingRo;
    l = 60+10-2;
    difference(){
        cylinder(l, ro, ro, $fn=100);
        translate([0,0,-1]){
            cylinder(l-10+1, ri, ri,$fn=100);
            slipRing6PHolePattern(120, 3/2, bodyHole=true);
        }
    }

translate([0,0,60+10-30-2])gear(124,2)translate([-0.5-0.5, -0.5, 0])cube([1, 1, 20]);
}*/

module placeBearings(){
    translate([0,0,firstBearingOffset])children();
    translate([0,0,firstBearingOffset+bearingPitch])children();
}

module placeSpacer(){
    translate([0,0,firstBearingOffset+bearingHeight])children();
    
}

/*
module placeTopPart(){
    translate([0,0,7]) children();
}
*/

module gear(nt, mod){
    circ = nt*mod;
    r = circ/(2*PI);
    echo("Gear radius");echo(r);
    for(i=[0:nt-1])
        rotate([0,0,i*360/nt]) translate([r, 0, 0]) children();
}

module circularPattern(n ,r){
    for(i=[0:n-1]) rotate([0,0,i*360/n]) translate([r, 0, 0]) children();
}

module t20Pulley(){
    cylinder(7.5, 8, 8);
    translate([0,0,7.5]){
        gear(20,2)translate([-0.5-0.5, -0.5, 0])cube([1, 1, 7.2]);
        cylinder(7.2,5,5);
    }
    translate([0,0,7.5+7.2]) cylinder(1.3, 8,8);
}


module nema17HolePattern(l, r){
    s = 31/2;
    translate([s,s,0])cylinder(l,r,r);
    translate([s,-s,0])cylinder(l,r,r);
    translate([-s,s,0])cylinder(l,r,r);
    translate([-s,-s,0])cylinder(l,r,r);
}

module nema17(){
    w = 42;
    h = 47;
    rr = 22/2;
    hr=49;
    
    bh=11;
    br = 54/2;
    
    difference(){
        intersection(){
            union(){
                translate([-w/2, -w/2, 0])cube([w,w,h]);
                cylinder(hr, rr, rr);
            }
            cylinder(hr, br, br);
        }
        nema17HolePattern(100,3/2);
    }
    cylinder(60, 5/2, 5/2);
}


module testPart(){
    ri=40.5/2;
    difference(){
        cylinder(20, ri, ri, $fn=100);
        //cylinder(20, ri-3, ri-3, $fn=100);
    }
}

module testPart2(){
    sf=40.5/40;
    ro=68.1*sf/2;
    difference(){
        cylinder(20, ro+4.2, ro+4.2, $fn=100);
        cylinder(20, ro, ro, $fn=100);
        
    }
    gear(124,2)translate([-0.5-0.5, -0.5, 0])cube([1, 1, 20]);
}

module nema17Assembly(){
    translate([stepperOffset,0,0]){
        nema17();
        translate([0, 0,51]) t20Pulley();
    }
}


module shaftHolePattern(totlen, r=3/2, centerHole=true){
            if(centerHole)cylinder(totlen+2, 12,12, $fn=100);
            circularPattern(6, (bearingRi+12)/2) cylinder(totlen+2, r, r);
}

module innerShaftBody(){
    cylinder(firstBearingOffset, bearingRi+4, bearingRi+4);
    translate([0,0, firstBearingOffset])cylinder(bearingHeight+bearingPitch, bearingRi, bearingRi, $fn=100);
    
}

module innerShaft(){
    totlen = firstBearingOffset+bearingHeight+bearingPitch;
    difference(){
        innerShaftBody();
        translate([0,0,-1]){
            //cylinder(totlen+2, 12,12, $fn=100);
            //circularPattern(6, (bearingRi+12)/2) cylinder(totlen+2, 3/2, 3/2);
            shaftHolePattern(totlen);
        }
    }
}

module placeShaftCap(){
   
    totlen = firstBearingOffset+bearingHeight+bearingPitch;
    translate([0,0,totlen]) children();
}

 screwHeadHeight = 3;
screwHeadRadius = 3.5;
shaftCapHeight =5;
module shaftCapBody(){
    cylinder(shaftCapHeight+screwHeadHeight, bearingRi+4, bearingRi+4);
}

module shaftCap(){
    difference(){
        shaftCapBody();
        translate([0,0,-1])shaftHolePattern(shaftCapHeight+2,1.7, $fn=20, centerHole=false);
        translate([0,0,shaftCapHeight])shaftHolePattern(shaftCapHeight+2,screwHeadRadius, $fn=20, centerHole=false);
        rotate([0,0,30])translate([0,0,-1])slipRing12PHolePattern(shaftCapHeight+screwHeadHeight+2, 3/2,bodyHole=true);
        // translate([0,0,-1])cylinder(100, 17/2,17/2);
    }
}

module outerShaftBody(){
    ro = bearingRo+4.2;
    screwLength = 12;
    screwWidth = 8;
    screwTaper = 15;
    translate([0,0,2]){
        difference(){
            cylinder(3, ro, ro);
            translate([0,0,-1])cylinder(3+2, bearingRo-4, bearingRo-4);
        }
        translate([0,0,3]){
            difference(){
                union(){
                    cylinder(bearingHeight+bearingPitch, ro,ro);
                    translate([0,0, bearingHeight+bearingPitch-screwTaper-screwLength]){
                        cylinder(screwTaper, ro,ro+screwWidth);
                        translate([0,0, screwTaper]) cylinder(screwLength, ro+screwWidth,ro+screwWidth);
                    }
                }
                cylinder(bearingHeight+bearingPitch+2, bearingRo,bearingRo, $fn=100);
            }
        }
    }
}

module outerShaftHolePattern(totlen, r = 3/2){

    cylinder(totlen+2, 12,12, $fn=100);
    circularPattern(6, (bearingRo+6)) cylinder(totlen+2, r, r);
}

module outerShaft(){
    difference(){
        outerShaftBody();
         translate([0,0,-1]) outerShaftHolePattern(100);
    }
}


module outerShaftCapBody(){
    capHeight = 18;
    ro = bearingRo+4.2-0.4;
    screwWidth = 8-2;
    screwTaper = 15;
    difference(){
        cylinder(capHeight, ro+screwWidth+1.4,ro+screwWidth+1.4, $fn=100);
        cylinder(capHeight-4, bearingRo-4,bearingRo-4, $fn=100);
    }
    gear(147,2)translate([-0.5-0.5-0.25, -0.5, 0])cube([1, 1, capHeight]);
}

module outerShaftCap(){
    difference(){
        outerShaftCapBody();
        outerShaftHolePattern(100,1.8,$fn=30);
        translate([0,0,3])outerShaftHolePattern(100,4,$fn=30);
        circularPattern(18, (bearingRo+6)) cylinder(22, 3/2, 3/2);
        //slipRing6PHolePattern(100, 3/2, true);
        bigSprocketHolePattern(100, 3/2);
    }
}

reinforcementThickness = 7;
reinforcementFloorThickness = 7;
reinforcementLargeRadiusInternal = 45;
reinforcementSmallRadiusInternal = 30;
reinforcementRimHeight = 20;
reinforcementFixExtra = 2;

module reinforcementBody(lri,sri,th, h=reinforcementRimHeight, fth=reinforcementFloorThickness, fix=reinforcementFixExtra){
    
    difference(){
        hull(){
            cylinder(h, lri+th, lri+th);
            translate([stepperOffset,0,0])cylinder(h, sri+th, sri+th);
        }
        
        
        hull(){
            cylinder(h, lri, lri);
            translate([stepperOffset,0,0])cylinder(h, sri, sri);
        }
    }
    
    translate([0,0,-fth+fix])hull(){
            cylinder(fth, lri+th, lri+th);
            translate([stepperOffset,0,0])cylinder(fth, sri+th, sri+th);
        }
}

module linplace(p1, p2, n, skipStart=0, skipEnd=0, offs=0){
    delta=(p2-p1)/(n-1);
    for(i=[skipStart:n-skipEnd-1]){
        translate(p1+delta*i+delta*offs) children();
    }
}

module reinforcementHolePattern(hl=12, hr=3/2, lri=reinforcementLargeRadiusInternal,sri=reinforcementSmallRadiusInternal,th=reinforcementThickness){
    circularPattern(15, (lri+th/2)) cylinder(hl, hr, hr);
    translate([stepperOffset, 0, 0 ]) circularPattern(12, (sri+th/2)) cylinder(hl, hr, hr);
    linplace([0, lri+th/2, 0], [stepperOffset, sri+th/2, 0], 8, skipStart=2, skipEnd=1)  cylinder(hl, hr, hr);
    linplace([0, -(lri+th/2), 0], [stepperOffset, -(sri+th/2), 0], 8, skipStart=2, skipEnd=1)  cylinder(hl, hr, hr);
    
}

module reinforcement(){
    lri = reinforcementLargeRadiusInternal;
    sri = reinforcementSmallRadiusInternal;
    th=reinforcementThickness;
    difference(){
        reinforcementBody(lri,sri,th);
        translate([0,0,-reinforcementFloorThickness-1]){
        //circularPattern(15, (lri+th/2)) cylinder(32, 3/2, 3/2);
       // translate([stepperOffset, 0, 0 ]) circularPattern(12, (sri+th/2)) cylinder(32, 3/2, 3/2);
            reinforcementHolePattern(hl=32);
        }
    }
    
}


module stepperHolderBody(){
    hull(){
        translate([stepperOffset, 0, 0 ]) nema17HolePattern(56, 15);
        translate([stepperOffset-20, 0, 0 ]) nema17HolePattern(56, 15);
    }
}

module stepperRemove(){
    minkowski(){
        hull() nema17();
        translate([0,0,-10])cylinder(20, 1, 1);
    }
}

module stepperHolder(){
    difference(){
        stepperHolderBody();
        hull(){
            translate([stepperOffset, 0, 0 ])stepperRemove();
            translate([stepperOffset-20, 0, 0 ])stepperRemove();
        }
        reinforcementHolePattern();
        translate([stepperOffset, 26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset, -26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset-10, 26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset-10, -26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset-20, 26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset-20, -26.5, 0 ])cylinder(100, 3/2, 3/2);
        translate([stepperOffset,0,8]) rotate([0,-90,0]) cylinder(100, 8, 8);
    }
    
}

module basePlateBody(){
    reinforcement();
    stepperHolder();
}

module basePlate(){
    difference(){
        basePlateBody();
        translate([0,0,-6])shaftHolePattern(10,1.8, $fn=20);
        translate([0,0,-6])shaftHolePattern(3,3.5);
        translate([-4,0,-5])cube([8, 100,3]);
        
    }
    
}


module stepperBracketBody(){
    lx = 60;
    ly = 60;
    lz = 5;
    hull() {nema17HolePattern(5, 15);}
}

module stepperBracket(){
    difference(){
        stepperBracketBody();
        translate([0,0,-1]){
            nema17HolePattern(7, 1.8, $fn=20);
            cylinder(7,12,12);
            hull(){
                translate([15,-26.5,0]) cylinder(7,1.8,1.8,$fn=20);
                translate([-15,-26.5,0]) cylinder(7,1.8,1.8,$fn=20);
            }
            hull(){
                translate([15,26.5,0]) cylinder(7,1.8,1.8,$fn=20);
                translate([-15,26.5,0]) cylinder(7,1.8,1.8,$fn=20);
            }
        }
        
    }
}


module receiverHubBody(){
    capHeight = 22-10;
    ro = bearingRo+4.2;
    screwWidth = 8-2;
    screwTaper = 15;
    difference(){
        cylinder(capHeight, ro+screwWidth+1.2+1,ro+screwWidth+1.2+1);
        cylinder(capHeight+2, bearingRo-4,bearingRo-4);
    }
    
}

module receiverHub(){
    difference(){
        receiverHubBody();
        //outerShaftHolePattern(100,4,$fn=20);
        rotate([0,0,360/18]){
            circularPattern(6, (bearingRo+6)) cylinder(25, 1.8, 1.8, $fn=20);
            translate([0,0,3]) circularPattern(6, (bearingRo+6)) cylinder(25, 4, 4, $fn=20);
        }
        rotate([0,0,2*360/18]){
            circularPattern(6*3, (bearingRo+6)) cylinder(25, 3/2, 3/2);
        }
        
        translate([0,0,6])rotate([90,0,0])translate([-4, -7, 0 ]) cube([8, 14, 100]);//cylinder(100,6,6);
        
    }
    
}


module receiverConsoleBody(q1=true, q2=true, q3=true, q4=true){
    capHeight = 10;
    ro = bearingRo+4.2;
    screwWidth = 8-2;
    screwTaper = 15;
    intersection(){
        difference(){
            cylinder(capHeight, ro+screwWidth+1.2+1,ro+screwWidth+1.2+1);
            cylinder(capHeight+2, bearingRo-4,bearingRo-4);
        }
        union(){
            if(q1) rotate([0,0,0]) cube(200);
            if(q2) rotate([0,0,90]) cube(200);
            if(q3) rotate([0,0,180]) cube(200);
            if(q4) rotate([0,0,270]) cube(200);
                
        }
    }
    
}


module receiverConsoleHoles(){
    capHeight = 10;
    cylinder(capHeight+2, bearingRo-4,bearingRo-4);
       /*rotate([0,0,-360/18]){
             circularPattern(6, (bearingRo+6)) cylinder(25, 1.8, 1.8, $fn=20);
             translate([0,0,3]) circularPattern(6, (bearingRo+6)) cylinder(25, 4, 4, $fn=20);
        }*/
        circularPattern(18, (bearingRo+6)) cylinder(25, 1.8, 1.8, $fn=20);
        translate([0,0,3])circularPattern(18, (bearingRo+6)) cylinder(25, 4, 4, $fn=20);
}

module receiverConsoleRing(){
    difference(){
        receiverConsoleBody(false,true,false,true);
        receiverConsoleHoles();
    }
    
}


module receiverConsoles(){
    receiverConsoleRing();
}

module placeReceiverConsoles(){
    translate([0,0,77+12+0]) children();
}

module placeReceivers(){
    translate([-270+141+6.4,-189/2,99]) children();
}

module placeCorner1(){
    translate([113,90,0]) children();
}

module placeCorner2(){
    translate([-118,90,0]) children();
}

module placeCorner3(){
    translate([-118,-90-10,0]) children();
}

module placeCorner4(){
    translate([113,-90-10,0]) children();
}

module sideBraceScrewHoles(l, r=1.8){
    
    translate([5,0,5] )rotate([90,0,0]) translate([0,0,-l])cylinder(l*2,r, r);
    translate([25,0,5] )rotate([90,0,0]) translate([0,0,-l])cylinder(l*2,r, r);
}

module ringConsole1(){
    difference(){
        hull(){
            receiverConsoleBody(true,false,false,false);
            placeCorner1() cube([30, 10, 10]);
        }
        receiverConsoleHoles();
        placeCorner1() sideBraceScrewHoles(20,3/2);   
    }
}

module ringConsole2(){
    difference(){
        hull(){
            receiverConsoleBody(false,true,false,false);
            placeCorner2() cube([30, 10, 10]);
        }
        receiverConsoleHoles();
        placeCorner2() sideBraceScrewHoles(20,3/2);   
    }
}

module ringConsole3(){
    difference(){
        hull(){
            receiverConsoleBody(false,false,true,false);
            placeCorner3() cube([30, 10, 10]);
        }
        receiverConsoleHoles();
        placeCorner3() sideBraceScrewHoles(20,3/2);   
    }
}


module ringConsole4(){
    difference(){
        hull(){
            receiverConsoleBody(false,false,false,true);
            placeCorner4() cube([30, 10, 10]);
        }
        receiverConsoleHoles();
        placeCorner4() sideBraceScrewHoles(20,3/2);   
    }
}

module sideBrace1(){
    difference(){
        placeReceiverConsoles() placeCorner1() translate([0,10,0])cube([30,4, 75]);
        placeReceiverConsoles() placeCorner1() sideBraceScrewHoles(20,1.8, $fn=20);   
        placeReceivers() loBandReceiverHolePattern(3.5,15);
    }
}

module sideBrace2(){
    difference(){
        placeReceiverConsoles() placeCorner2() translate([0,10,0])cube([30,4, 75]);
        placeReceiverConsoles() placeCorner2() sideBraceScrewHoles(20,1.8, $fn=20);   
        placeReceivers() loBandReceiverHolePattern(3.5,15);
    }
}

module sideBrace3(){
    difference(){
        placeReceiverConsoles() placeCorner3() translate([0,-4,0])cube([30,4, 75]);
        placeReceiverConsoles() placeCorner3() sideBraceScrewHoles(20,1.8, $fn=20);   
        placeReceivers() loBandReceiverHolePattern(3.5,15);
    }
}

module sideBrace4(){
    difference(){
        placeReceiverConsoles() placeCorner4() translate([0-90,-4,0])cube([30+90,4, 75]);
        placeReceiverConsoles() placeCorner4() sideBraceScrewHoles(20,1.8, $fn=20);   
        placeReceivers() loBandReceiverHolePattern(3.5,15);
    }
}



//testPart();
//testPart2();
//innerSpacer();



module receiverAssembly(){
    consoleOne();
    consoleTwo();
    consoleThree();
    consoleFour();
    receivers();
}

module quad(x,y){
        translate([-x, -y, 0]) children();
        translate([-x, y, 0]) children();
        translate([x, -y, 0]) children();
        translate([x, y, 0]) children();
}

module centerRoundedCornerCube(r, v){
    x = v[0]/2-r;
    y = v[1]/2-r;
    z = v[2];
    hull(){
        quad(x, y) cylinder(z, r, r);
    }
}

module centerCube(v){
    x = v[0]/2;
    y = v[1]/2;
    z = v[3];
    
        translate([-x, -y, 0]) cube(v);
}

hackRfPcb = [120,75,1.6+0.5];
hackRfPcbCornerR = 4;
hackRfPcbEdgeClearance = 4;
hackRfComponentHeight = 9;
hackRfSolderHeight = 3+1;
hackRfHoleDistance = 4;
hackRfHoleRadius = 1.5;
hackRfTotalHeight = hackRfPcb[2]+hackRfComponentHeight+hackRfSolderHeight;
hackRfSpacing = 2;

hackRfWallThickness = 3;
hackRfFlangeWidth = 10;
numHackRf=2;

module hackRfPcbBody(){
    centerRoundedCornerCube(hackRfPcbCornerR, hackRfPcb);
    translate([0,0,-hackRfSolderHeight])centerCube([hackRfPcb[0], hackRfPcb[1]-hackRfPcbEdgeClearance*2, hackRfTotalHeight]);
    //centerCube([120,75-8,1.6+9]);
}

module hackRfPcb(){
    x = hackRfPcb[0];
    y = hackRfPcb[1];
    difference(){
        hackRfPcbBody();
        quad(x/2-hackRfHoleDistance, y/2-hackRfHoleDistance) translate([0,0,-(hackRfSolderHeight+1)]) cylinder(hackRfTotalHeight+2, hackRfHoleRadius, hackRfHoleRadius);
    }
}

module hackRf(){
     translate([0, 0, hackRfSolderHeight]) hackRfPcb();
}



module hackRfStack(){
    d = hackRfTotalHeight+hackRfSpacing;
    for(i=[0:numHackRf-1]) translate([0,0,d*i]) hackRf();
}

module hackRfRack(){
    x = hackRfPcb[0];
    y = hackRfPcb[1];
    translate([0,0,hackRfWallThickness])
    difference(){
        translate([0,0,-hackRfWallThickness])centerCube([hackRfPcb[0], hackRfPcb[1]+2*hackRfWallThickness, 2*hackRfWallThickness+(hackRfTotalHeight+hackRfSpacing)*numHackRf]);
        centerCube([hackRfPcb[0], hackRfPcb[1]-2*hackRfPcbEdgeClearance, (hackRfTotalHeight+hackRfSpacing)*numHackRf]);
        quad(x/2-hackRfHoleDistance, y/2-hackRfHoleDistance) translate([0,0,-(hackRfSolderHeight+1)]) cylinder((hackRfTotalHeight+hackRfSpacing)*4+2*hackRfWallThickness+2, hackRfHoleRadius+0.5, hackRfHoleRadius+0.5,$fn=20);
        minkowski(){
            union(){
                translate([hackRfPcb[0]/3, 0, 0]) hackRfStack();
                translate([-hackRfPcb[0]/3, 0, 0]) hackRfStack();
            }
            sphere(0.3);
        }
        
        
        quad(x/2-10, y/2) translate([0,0,-(hackRfSolderHeight+1)]) cylinder((hackRfTotalHeight+hackRfSpacing)*4+2*hackRfWallThickness+2, hackRfHoleRadius, hackRfHoleRadius);
        
        
    }
    difference(){
        centerCube([hackRfPcb[0], hackRfPcb[1]+2*(hackRfFlangeWidth+hackRfWallThickness), hackRfWallThickness]);
         quad(x/2-hackRfFlangeWidth/2, y/2+hackRfWallThickness+hackRfFlangeWidth/2) cylinder(hackRfWallThickness+2, hackRfHoleRadius,hackRfHoleRadius);
    }
}

module hackRfRacksPlaced(){
    translate([-81+0*(60+25),hackRfPcb[1]/2+hackRfWallThickness+hackRfFlangeWidth/2,163.0]) hackRfRack();
    translate([-81+0*(60+25),-(hackRfPcb[1]/2+hackRfWallThickness+hackRfFlangeWidth/2),163.0]) hackRfRack();
}

module hackRfRacksFinal(){
    difference(){
        hackRfRacksPlaced();
        placeReceivers() minkowski(){ consoleOne(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
        placeReceivers() minkowski(){ consoleFour(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
    }   
}

tripodInterfacePlateThickness = 10;
tripodThreadLength = 18;
tripodInterfacePlateRadius = reinforcementLargeRadiusInternal+reinforcementThickness;

tripodHoleDiameter = 63.8-0.5;
tripodHoleDepth = 6;

module tripodInterfaceBody(){
    
        translate([0,0, -reinforcementFloorThickness-tripodInterfacePlateThickness+reinforcementFixExtra]){
            difference(){
            cylinder(tripodInterfacePlateThickness,tripodInterfacePlateRadius,tripodInterfacePlateRadius);
            translate([0,0, -1]) reinforcementHolePattern(hl=tripodInterfacePlateThickness+2, hr=3.5/2, $fn=20);
            translate([0,0, -1]) reinforcementHolePattern(hl=7, hr=3, $fn=20);
                
        }
        translate([0,0, -tripodHoleDepth]) cylinder(tripodHoleDepth, tripodHoleDiameter/2, tripodHoleDiameter/2);
    }
}
module tripodInterface(){
    difference(){
        tripodInterfaceBody();
        translate([0,0,-reinforcementFloorThickness-tripodInterfacePlateThickness-tripodHoleDepth+reinforcementFixExtra])english_thread (diameter=5.25/8, threads_per_inch=11, length=1);
    }
}

 module placeDesktopRing(){
     translate([0,0, -reinforcementFloorThickness-tripodInterfacePlateThickness-tripodHoleDepth+reinforcementFixExtra]) children();
 }
 
 module desktopRing(){
     difference(){
        cylinder(tripodHoleDepth,tripodInterfacePlateRadius,tripodInterfacePlateRadius);
        translate([0,0,-1]) cylinder(tripodHoleDepth+2,tripodHoleDiameter/2+0.5,tripodHoleDiameter/2+0.5);
     }
 }
 
 module desktopStand(){
    rs = reinforcementSmallRadiusInternal+reinforcementThickness;
    h = tripodInterfacePlateThickness+tripodHoleDepth+reinforcementFixExtra*0;
    difference(){
        translate([stepperOffset,0,-h-reinforcementFloorThickness+reinforcementFixExtra]) cylinder(h, rs+1, rs+1);
        translate([stepperOffset,0,-h-reinforcementFloorThickness+reinforcementFixExtra]) cylinder(h, rs-reinforcementThickness-1, rs-reinforcementThickness-1);
        translate([0, 0, -h-reinforcementFloorThickness+reinforcementFixExtra-1]) reinforcementHolePattern(hl=h+2, hr=1.75, $fn=10);
        translate([0, 0, -h-reinforcementFloorThickness+reinforcementFixExtra-1]) reinforcementHolePattern(hl=h-4, hr=3, $fn=10);
        translate([0,0,-h-reinforcementFloorThickness+reinforcementFixExtra]) cylinder(h, stepperOffset, stepperOffset);
        
    }
       
}

 
 


module slipRing12PHolePattern(l, r, bodyHole=false){
    rb = slipRing12PRadiusBottom;
    translate([rb+5,0,0])cylinder(l, r, r);
    rotate([0,0,120])translate([rb+5,0,0])cylinder(l, r, r);
    rotate([0,0,-120])translate([rb+5,0,0])cylinder(l, r, r);
    if(bodyHole) cylinder(l,rb+0.5,rb+0.5);
}

module slipRing12P(){
    rb = slipRing12PRadiusBottom;
    tb = slipRing12PThicknessBottom;
    rf = slipRing12PRadiusFlange;
    tf = slipRing12PThicknessFlange;
    rt = slipRing12PRadiusTop;
    tt = slipRing12PThicknessTop;
    tl = slipRing12PTotalLength;
    hr = slipRing12PHoleRadius;
    
    difference(){
        union(){
            cylinder(tb,rb,rb);
            translate([0,0,tb]) cylinder(tf, rf, rf);
            translate([0,0,tb+tf]) cylinder(tt, rt, rt);
        }
        translate([0,0,-1]) cylinder(tl+2, hr, hr);
        slipRing12PHolePattern(tl, hr);
        
    }
    
}

module placeSlipRing12P(){
    translate([0,0,77-5.5]) children();
}


 
 slipRingAdapterHeight=6-slipRing12PThicknessFlange+1;

 module slipRingAdapter(){
     slipRingBottomClearance=0.5;
    difference(){
        cylinder(slipRingAdapterHeight, slipRing6PRadiusFlange, slipRing6PRadiusFlange);
        translate([0, 0, -1]) {
            cylinder(slipRingAdapterHeight+2, slipRing12PRadiusBottom+slipRingBottomClearance, slipRing12PRadiusBottom+slipRingBottomClearance);
            slipRing6PHolePattern(slipRingAdapterHeight+2, 1.75, $fn=10);
            rotate([0,0,60]) slipRing12PHolePattern(slipRingAdapterHeight+2, 1.5);
        }
        translate([0, 0, slipRing6PThicknessFlange]) slipRing6PHolePattern(slipRingAdapterHeight+2, 3);
        
    }
 }


outerShaftCapHoleR=20;
 
 module bigSprocketHolePattern(l, r){
     bodyHoleR=outerShaftCapHoleR;
    
    rb = bodyHoleR+5;
    translate([rb,0,0])cylinder(l, r, r);
    rotate([0,0,120])translate([rb,0,0])cylinder(l, r, r);
    rotate([0,0,-120])translate([rb,0,0])cylinder(l, r, r);
    cylinder(l,bodyHoleR,bodyHoleR);
}
 
 
 module wireSupport(){

   
    rf = outerShaftCapHoleR+8;
    tf = slipRing6PThicknessFlange;
    
    tl = slipRing6PTotalLength;
    hr = slipRing6PHoleRadius;
    sx=10;
    sy=8;
    difference(){
        union(){

            translate([0,0,0]) cylinder(tf, rf, rf);
            
        }
      
        bigSprocketHolePattern(tl, 1.75, $fn=20);
        
    }
    translate([0,-23,0]){
        difference(){
            translate([-sx/2,-sy/2,0])cube([sx,sy,7]);
            translate([0,0,4]) rotate([0,90,0]) translate([0,0,-10]) cylinder(20, 2, 2);
   
        }
    }
    
}

usbHubPcb = [166, 54, 1.2];
flatUsb = [15, 17, 7];
standingUsb = [15, 7, 15];
usbB = [19, 12, 13];
dcPower = [14, 9, 11];
module usbHubHolePattern(l, rh1=1.5, rh2=2){
    translate([2+1.5, 3+1.5,0]){
        cylinder(l, rh1, rh1);
        translate([159, 45, 0]) cylinder(l, rh1, rh1);
        translate([0, 45, 0]) cylinder(l, rh1, rh1);
        translate([159, 0, 0]) cylinder(l, rh1, rh1);
    }
    translate([81.4+2, 32.7+2]) cylinder(l, rh2, rh2);
}
module usbHubBody(extra=0){
    xextra=[extra,0,0];
    yextra=[0, extra, 0];
    zextra=[0,0, extra];
    cube(usbHubPcb);
    translate([6, -2-extra, usbHubPcb[2]]){
        for(i=[0:4]){
            translate([23.2*i, 0, 0]){
                cube(flatUsb+yextra);
            }
        }
    }
       translate([122.9, 8.8, usbHubPcb[2]]){
        for(i=[0:1]){
            translate([24.1*i, 0, 0]){
                cube(standingUsb+zextra);
            }
        }
    }
    translate([156, 17, usbHubPcb[2]]){
        cube(dcPower+xextra);
    }
    translate([151.5, 33, usbHubPcb[2]]){
        cube(usbB+xextra);
    }
}

module usbHub(){
    difference(){
        usbHubBody();
        translate([0,0,-1])usbHubHolePattern(10, $fn=10);
    }
}

module reinforcementAlignRight(){
     dy = reinforcementLargeRadiusInternal-reinforcementSmallRadiusInternal;
    dx = stepperOffset;
    translate([0,reinforcementLargeRadiusInternal+reinforcementThickness,0])rotate([0,0, -atan2(dy, dx)]) children();
}

module reinforcementAlignLeft(){
     dy = reinforcementLargeRadiusInternal-reinforcementSmallRadiusInternal;
    dx = stepperOffset;
    translate(-[0,reinforcementLargeRadiusInternal+reinforcementThickness,0])rotate([0,0, atan2(dy, dx)]) children();
}

module usbHousingJoinStripHolePattern( hr=3/2){
    dy = reinforcementLargeRadiusInternal-reinforcementSmallRadiusInternal;
    dx = stepperOffset;
    lri = reinforcementLargeRadiusInternal;
    sri = reinforcementSmallRadiusInternal;
    th=reinforcementThickness;
    joinHeight = 15;
   
    reinforcementHolePattern(hl=120, hr=3/2, ,lri=reinforcementLargeRadiusInternal,sri=reinforcementSmallRadiusInternal,th=reinforcementThickness);
            translate([0, 0, reinforcementRimHeight+joinHeight/2])linplace([0, lri+th/2, 0], [stepperOffset, sri+th/2, 0], 8, skipEnd=1, offs=0.5)  rotate([90,0,0]) translate([0,0,-10]) cylinder(20, hr, hr);
}

module usbHousingJoinStrip(){
    //reinforcementThickness = 7;
    //reinforcementFloorThickness = 5;
    //reinforcementLargeRadiusInternal = 45;
    //reinforcementSmallRadiusInternal = 30;
    //stepperOffset
    dy = reinforcementLargeRadiusInternal-reinforcementSmallRadiusInternal;
    dx = stepperOffset;
    
    lri = reinforcementLargeRadiusInternal;
    sri = reinforcementSmallRadiusInternal;
    th=reinforcementThickness;
    joinHeight = 15;
    hr=3/2;
    intersection(){
        difference(){
            difference(){
                reinforcementBody(lri,sri,th, fth=0, h=reinforcementRimHeight+joinHeight);
                reinforcementBody(lri,sri,th, fth=0, h=reinforcementRimHeight);
                translate([0,0,reinforcementRimHeight+4])reinforcementHolePattern(hl=120, hr=3, ,lri=reinforcementLargeRadiusInternal,sri=reinforcementSmallRadiusInternal,th=reinforcementThickness);
                minkowski(){
                    stepperHolder();
                    sphere(0.3);
                }
            }
            usbHousingJoinStripHolePattern();
        }
        //translate([0,reinforcementLargeRadiusInternal+reinforcementThickness,0])rotate([0,0, -atan2(dy, dx)]) translate([-10,-8,0])cube([145, 20, 50]);
        reinforcementAlignRight() translate([-10,-8,0])cube([145, 20, 50]);
    }
}

module usbBracketHolePattern(l, r1=3/2, r2=3/2){
     for(x=[10:15:160])
        for(y=[10:15:55])
            translate([x,y,-1])cylinder(l,r1, r2);
}

module usbHubBracketBody(bPart=false){
    difference(){
        union(){
            translate([15-4,0,4]){
                difference(){
                cube(usbHubPcb+[4,6,6]);
                usbBracketHolePattern(100);
                 /*for(x=[10:15:160])
                    for(y=[10:15:55])
                        translate([x,y,-1])cylinder(100,3/2,3/2);*/
    }
            }
            if(! bPart) translate([15,usbHubPcb[1]+2,4]) rotate([180,0,0]) usbHubHolePattern(4, rh1=3.5, rh2=5);
        }
        if(! bPart) translate([15,usbHubPcb[1]+2,30]) rotate([180,0,0]) usbHubHolePattern(40, rh1=1.25, rh2=1.25);
    }
     translate([11,0,4]){
        cube([110, 6, 31]);
}
}

module usbHubBracket(bPart=false){
    difference(){
        reinforcementAlignRight(){
            //translate([15,usbHubPcb[1]+2,0]) rotate([180,0,0]) usbHub();
            usbHubBracketBody(bPart=bPart);
        
        }
        usbHousingJoinStripHolePattern(hr=1.75, $fn=10);
    }
}

module placeJetson(){
 reinforcementAlignRight() translate([138,66,11.4]) rotate([90,0,90]) children();
}

module jetson(){
    import("/home/bjohan/Downloads/JetsonNanoCompact_Base.stl", convexity=300);
}

/*module finalJetson(){
    mirror([0,1,0]){  
        difference(){
            placeJetson() jetson();
            reinforcementAlignRight() usbBracketHolePattern(17);
            translate([0,0,13])reinforcementAlignRight() usbBracketHolePattern(2.6, r1=3/2, r2=3);
            translate([0,0,13+2.6])reinforcementAlignRight() usbBracketHolePattern(1, r1=3, r2=3);
        }
    }
}*/
module placeJetson(){
 //reinforcementAlignRight() translate([138,66,11.4]) rotate([90,0,90]) children();
    reinforcementAlignRight() translate([77-5,8,16]) rotate([0,0,0]) children();
}



module finalJetson(){
    mirror([0,1,0]){  
        difference(){
            placeJetson() jetson();
            translate([11,-1,0]){
            reinforcementAlignRight() usbBracketHolePattern(17);
            translate([0,0,13])reinforcementAlignRight() usbBracketHolePattern(2.6, r1=3/2, r2=3);
            translate([0,0,13+2.6])reinforcementAlignRight() usbBracketHolePattern(10, r1=3, r2=3);
            }
        }
    }
}

module usbStackHolePattern(l, r){
    cylinder(l, r, r);
    translate([22.5, 0, 0]) cylinder(l, r, r);
    translate([22.5+19.5, -9.5, 0]) cylinder(l, r, r);
}

module usbStackA(){
    difference(){
        union() {
            usbStackHolePattern(5, 3.5);
            translate([0,0,5]) hull()  usbStackHolePattern(1, 3.5);
        }
        translate([0,0,-1]) usbStackHolePattern(10, 1);
    }
    
}
module usbStackB(){
    difference(){
        union() {
            usbStackHolePattern(2, 3.5);
            translate([0,0,2]) hull()  usbStackHolePattern(1, 3.5);
        }
        translate([0,0,-1]) usbStackHolePattern(10, 1);
    }
    
}


psuHolderWallThickness = 3;

linRegPcb = [96, 66, 2];
module linRegPcb(){
    cube(linRegPcb);
}

switchRegPcb = [77, 72, 2];
module switchRegPcb(){
      cube(switchRegPcb);
}

controllerPcbv = [102, 72, 2];
arduinoHeight = 20;
controllerTotalHeight = 45;
module controllerPcb(){
    cube(controllerPcbv);
}


module placeControllerPcb(){
    translate([-psuHolderWallThickness+2,regulatorSeparation+psuHolderWallThickness+arduinoHeight,0])rotate([90, 0, 0]) children();
}




 regulatorSeparation = 50;
module placeLinReg(){
    translate([0,regulatorSeparation,0])rotate([90, 0, 0]) children();
}

module placeSwitchReg(){
     translate([0,switchRegPcb[2],0])rotate([90, 0, 0]) children();
}





module psuHolderBody(){
    ix = linRegPcb[0];
    iy = regulatorSeparation;
    iz = max(linRegPcb[1], switchRegPcb[1]);
   
    t = psuHolderWallThickness;
    inner = [ix, iy, iz];
    outer = [ix+t, iy+2*t, iz+2*t];
    difference(){
        cube(outer);
        translate([t,t,t]) cube(inner+[1,0,0]);
    }
     /*difference(){
        cube(outer+[0,controllerTotalHeight,0]);
        translate([-1,t,t]) cube(inner+[1+2*t,controllerTotalHeight,0]);
    }*/
    translate([t,t,t])cube(5);
    translate([t, t+iy-5,t+iz-5-3.5])cube(5);
    translate([t, t+iy-5,t])cube(5);
    translate([t, t,t+iz-5])cube(5);
    /*translate([0,t+iy+arduinoHeight-1,t])cube(6);
    translate([0,t+iy+arduinoHeight-1,t+iz-6])cube(6);
     translate([iz-6,t+iy+arduinoHeight-1,t])rotate([90,0,0])translate([0,0,-8])cylinder(10,3,3);
    translate([iz-6,t+iy+arduinoHeight-1,t+iz])rotate([90,0,0])translate([0,0,-8])cylinder(10,3,3);*/
}

module controllerHolderBody(){
    ix = linRegPcb[0];
    iy = regulatorSeparation;
    iz = max(linRegPcb[1], switchRegPcb[1]);
   
    t = psuHolderWallThickness;
    inner = [ix, iy, iz];
    outer = [ix+t, iy+2*t, iz+2*t];
    difference(){
        /*cube(outer);
        translate([t,t,t]) cube(inner+[1,0,0]);*/
    }
     difference(){
        translate([0,outer[1],0])cube(outer+[0,controllerTotalHeight-outer[1]+t*4-1,0]);
        translate([0,outer[1],0])translate([-1,t,t]) cube(inner+[1+2*t,controllerTotalHeight-outer[1]+t*4-1,0]);
    }
    /*translate([t,t,t])cube(5);
    translate([t, t+iy-5,t+iz-5-3.5])cube(5);
    translate([t, t+iy-5,t])cube(5);
    translate([t, t,t+iz-5])cube(5);*/
    translate([0,t+iy+arduinoHeight-1,t])cube(6);
    translate([0,t+iy+arduinoHeight-1,t+iz-6])cube(6);
     translate([iz-6,t+iy+arduinoHeight-1,t])rotate([90,0,0])translate([0,0,-8])cylinder(10,3,3);
    translate([iz-6,t+iy+arduinoHeight-1,t+iz])rotate([90,0,0])translate([0,0,-8])cylinder(10,3,3);
}

module fanHolePattern(l,r){
    fanRadius=42/2;
    xd=42/2;
    yd=32/2;
    cylinder(l, fanRadius, fanRadius);
    translate([-xd, -yd, 0]) cylinder(l, r, r);
    translate([-xd, yd, 0]) cylinder(l, r, r);
    translate([xd, -yd, 0]) cylinder(l, r, r);
    translate([xd, yd, 0]) cylinder(l, r, r);
}

module psuPcbs(){
    placeRegulatorsInPsuHolder(){
        placeLinReg() linRegPcb();
        placeSwitchReg() switchRegPcb();
        placeControllerPcb() controllerPcb();
    }
}


module psuHolder(){
    
    ix = linRegPcb[0];
    iy =regulatorSeparation;
    iz = max(linRegPcb[1], switchRegPcb[1]);
    t = psuHolderWallThickness;
    
    difference(){
        psuHolderBody();
        translate([0, t+iy/2, t+iz/2]) rotate([0,90,0]) translate([0,0,-2]) fanHolePattern(30, 3/2);
        translate([-t/2, 8, t])cube([t*2, 40, 10]);
        minkowski(){
            union(){
                psuPcbs();
            }
            sphere(0.25);
        }
    }
}

module controllerHolder(){
    
    ix = linRegPcb[0];
    iy =regulatorSeparation;
    iz = max(linRegPcb[1], switchRegPcb[1]);
    t = psuHolderWallThickness;
    outer = [ix+t, iy+2*t, iz+2*t];
    translate([0,-outer[1],0]){
    difference(){
        controllerHolderBody();
        translate([0, t+iy/2, t+iz/2]) rotate([0,90,0]) translate([0,0,-2]) fanHolePattern(30, 3/2);
        translate([-t/2, 8, t])cube([t*2, 40, 10]);
        minkowski(){
            union(){
                psuPcbs();
            }
            sphere(0.25);
        }
    }}
}

module placeRegulatorsInPsuHolder(){
    translate(psuHolderWallThickness*[1,1,1]) children();
}

module turnTableAssembly(){
    
    color([0,1,0])innerShaft();
    color([1,1,0])placeBearings() bearing6008Z();
    color([0,0,1])placeSpacer() innerSpacer();
    color([1,0,0])placeSpacer() outerSpacer();
    color([1,0,1])outerShaft();
    placeShaftCap() shaftCap();
    placeShaftCap() outerShaftCap();
    translate([0,0,9])nema17Assembly();
    basePlate();
    translate([stepperOffset,0,56]) stepperBracket();
    //placeSlipRing6P() slipRing6P();
    translate([0,0,77+6]) receiverHub();
    translate([0,0,80*0+6]){
    placeReceiverConsoles() ringConsole1();
    placeReceiverConsoles() ringConsole2();
    placeReceiverConsoles() ringConsole3();
    placeReceiverConsoles() ringConsole4();
    sideBrace1();
    sideBrace2();
    sideBrace3();
    sideBrace4();
    }
    
    translate([0,0,81+slipRing6PThicknessFlange]) wireSupport();
}


//psuPcbs();
module pcbControllerHolder(){
difference(){
    translate([0, -5, 0])rotate([90,0,0]) psuHolder();
    translate([70,0,regulatorSeparation]) rotate([90, 0, 0] )cylinder(200,3/2, 3/2);
translate([80,0,regulatorSeparation]) rotate([90, 0, 0] )cylinder(200,3/2, 3/2);
translate([90,0,regulatorSeparation]) rotate([90, 0, 0] )cylinder(200,3/2, 3/2);
}
translate([0, 78+5, 0])rotate([90,0,0])controllerHolder();
translate([99/2,0,0])
centerCube([99, 200-6, 3]);
}

module placeBcbControllerHolder(){
    translate([46, 0, 206*0+163.0]) children();
}

module pcbControllerHolderFinal(){

    
    difference(){
        placeBcbControllerHolder() pcbControllerHolder();
        placeReceivers() minkowski(){ consoleTwo(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
        placeReceivers() minkowski(){ consoleThree(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
    }   

}




statorPsuPcbV=[71+1.5, 35+1.5, 1.6];

module fanHolePattern(l, r){
    cylinder(l, 48/2, 48/2);
    translate([20, 20, 0]) cylinder(l, r, r);
    translate([20, -20, 0]) cylinder(l, r, r);
    translate([-20, 20, 0]) cylinder(l, r, r);
    translate([-20, -20, 0]) cylinder(l, r, r);
}



module statorPsuPcb(){
    centerCube(statorPsuPcbV);
    
}

module statorPsuPcbHolePattern(l , r){
    x = statorPsuPcbV[0]/2+r;
    y = statorPsuPcbV[1]/2+r;
    translate([x, y, 0]) cylinder(l, r, r);
    translate([x, -y, 0]) cylinder(l, r, r);
    translate([-x, y, 0]) cylinder(l, r, r);
    translate([-x, -y, 0]) cylinder(l, r, r);
    translate([0, y, 0]) cylinder(l, r, r);
    translate([0, -y, 0]) cylinder(l, r, r);
    translate([-x, 0, 0]) cylinder(l, r, r);
    translate([x, 0, 0]) cylinder(l, r, r);
}

statorPsuBoxI=[100, 80, 40];
statorPsuBoxT=3;

module statorBoxBodyCorners(){
    t = statorPsuBoxT;
    x = statorPsuBoxI[0]/2-t;
    y = statorPsuBoxI[1]/2-t;
    translate([x, y, 0]) children();
    translate([x, -y, 0]) children();
    translate([-x, y, 0]) children();
    translate([-x, -y, 0]) children();
}


module statorBoxBody(){
    v = statorPsuBoxI;
    t = statorPsuBoxT;
    difference(){
        centerCube(v+[2*t,2*t,t]);
        translate([0, 0, t]) centerCube(v+[0,0,t]);
    }
    statorBoxBodyCorners() cylinder(v[2]+t, 2*t, 2*t);
    difference(){
        hull() {statorPsuPcbHolePattern(10, 7, 7);}
        translate([0, 0, 10-1.2])statorPsuPcb();
    }
}

module grid(nx, ny, dx, dy){
    tx=(nx-1)*dx;
    ty=(ny-1)*dy;
    translate([-tx/2, -ty/2, 0]){
        for(ix = [0:nx-1]) {
            for(iy = [0:ny-1]) {
                translate([ix*dx, iy*dy, 0]) children();
            }
        }
    }
}

module statorBox(){
    difference(){
        statorBoxBody();
        statorPsuPcbHolePattern(10 , 3/2);
        statorBoxBodyCorners() cylinder(100, 3/2, 3/2);
        translate([0, 0, 0+43/2])rotate([0, 90, 0])grid(3, 8, 8, 8) translate([0, 0, -100])cylinder(200, 3, 3, $fn=6);
        translate([0, 0, 43/2+1]) rotate([90, 0, 0]) cylinder(100, 12, 12);
        translate([-20, 0, 43/2+1]) rotate([-90, 0, 0]) cylinder(100, 3, 3);
        translate([20, 0, 43/2+1]) rotate([-90, 0, 0]) dvmHolePattern(100);
    }
}

module dvmHolePattern(l){
    centerCube([23.5, 14.7, l]);
    translate([-14, 0, 0]) cylinder(l, 0.9, 0.9);
    translate([14, 0, 0]) cylinder(l, 0.9, 0.9);
}

module statorBoxLidBody(){
    v = statorPsuBoxI;
    t = statorPsuBoxT;
        centerCube([v[0]+2*t, v[1]+2*t, t]);      
}

module statorBoxLid(){
    difference(){
        statorBoxLidBody();
        fanHolePattern(10, 3/2);
        statorBoxBodyCorners() cylinder(100, 3.2/2, 3.2/2, $fn=10);
    }
}

module placeStatorBox(){
 //reinforcementAlignRight() translate([138,66,11.4]) rotate([90,0,90]) children();
    reinforcementAlignLeft() translate([27,-70,12]) rotate([0,0,90]) children();
}



module finalStatorBox(){
 
        difference(){
            placeStatorBox() statorBox();
            translate([11,1,10]){
            reinforcementAlignLeft() mirror([0,1,0])usbBracketHolePattern(17);
            
            }
        }
    
}


loPcb=[48, 48, 1.6];
module smaEdgeConnector(el=0){
    translate([0,0,-1.2])cube([6.5, 1.5, 6.5]);
    translate([6.5/2, 1.5, 6.5/2-1.2]) rotate([-90, 0, 0]){ cylinder(el+8, 6/2, 6/2);
        translate([0,0,2]) cylinder(el+8, 8/2, 8/2);
    }
}

module loBoardComponentsVolume(){
        bottomClearance = 6;
    topClearance = 30;
    sideClearance = 3;
    backClearance = 5;
    translate([0, 0, 0]) cube(loPcb+[0,0,topClearance]);
    translate([0, 0, -bottomClearance]) cube(loPcb+[0,0,bottomClearance]);
    translate([-sideClearance, -backClearance, 0]) cube([loPcb[0]+2*sideClearance, 24, 30+loPcb[2]]);
}

module loBoard(el=0){

    cube(loPcb);
    translate([7.6, loPcb[1], 0])smaEdgeConnector(el);
    translate([26.8, loPcb[1], 0])smaEdgeConnector(el);
    translate([0, 19.5, 0]) rotate([0, 0, 90]) smaEdgeConnector(el);
    translate([0, 39, 0]) rotate([0, 0, 90]) smaEdgeConnector(el);
    translate([loPcb[0], 6.5+19.5, 0])rotate([0, 0, -90]) smaEdgeConnector(el);
    translate([loPcb[0], 6.5+39, 0])rotate([0, 0, -90]) smaEdgeConnector(el);
    
}

module loBoardWithComponentsVolume(){
    loBoard();
    loBoardComponentsVolume();
}


module loHouseBody(){
    t = 3;
    difference(){
        hull(){
            minkowski(){
                loBoardComponentsVolume();
                translate(-[t,t,t]) cube(t*2);
            }
        }
        hull(){
          loBoardComponentsVolume();
            translate([0,-30,0])loBoardComponentsVolume();
        }
        minkowski(){
            minkowski(){
                loBoard();
                rotate([90, 0, 0]) cylinder(40, 0.1, 0.1);
            }
            sphere(0.5);
        }
        translate(loPcb/2)fanHolePattern(70, 3/2);
        translate([0,-5,10])rotate([0, 90, 0]) translate([0,0,-10]) cylinder(100, 3/2, 3/2);
    }
}

module loHolder(){
    translate([21,20,10])rotate([0,0, 90]) loHouseBody();
     translate([21,-20-48-3,10])rotate([0,0, 90]) loHouseBody();
    centerCube([60, 200-6, 3]);
}

module placeLoHolder(){
    translate([105, 0, 220]) children();
}

module loHolderFinal(){
    difference(){
       placeLoHolder() loHolder();
        placeReceivers() minkowski(){ consoleTwo(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
        placeReceivers() minkowski(){ consoleThree(); translate([0,0,-1]) cylinder(2, 0.5, 0.5);}
    }   

}

module assembly(){
    turnTableAssembly();
    placeReceivers() receiverAssembly();
    hackRfRacksFinal();
    usbHubBracket();
    usbHousingJoinStrip();
    mirror([0,1,0]){ 
        
        usbHousingJoinStrip();
        usbHubBracket(bPart=true);
    }
    tripodInterface();
    placeDesktopRing() desktopRing();
    desktopStand();
    reinforcementAlignRight() translate([15,usbHubPcb[1]+2,0]) rotate([180,0,0]) usbHub();
    pcbControllerHolderFinal();
    placeStatorBox() translate([0,0,43]) statorBoxLid();
    finalStatorBox();
}
 loHolderFinal();
//
//placeLoHolder() loHolder();
//loBoard(30);
//assembly();

//statorBoxLid();

//translate([0,0,50]) statorBoxLid();
//finalStatorBox();

//reinforcementAlignLeft() mirror([0,1,0]) translate([11, 0, 0]) usbBracketHolePattern(170);


//statorPsuPcb();
//statorPsuPcbHolePattern(10, 3/2, 3/2);
//translate([100, 0, 0]) fanHolePattern(10, 3/2);

//sideBrace4();
//assembly();
//hackRfRacksFinal();
//pcbControllerHolderFinal();

//usbStackB();

//consoleOne();
//consoleTwo();
//consoleThree();
//consoleFour();

//usbStack($fn=20);

/*usbHubBracket();
usbHousingJoinStrip();
mirror([0,1,0]){ 
    
    usbHousingJoinStrip();
    usbHubBracket(bPart=true);
}
tripodInterface();
placeDesktopRing() desktopRing();
desktopStand();
 reinforcementAlignRight() translate([15,usbHubPcb[1]+2,0]) rotate([180,0,0]) usbHub();*/
//placeReceivers() receiverAssembly();
//assembly();
//finalJetson();
 //outerShaft();
 
 //slipRingAdapter();
  //slipRing6PHolePattern(l, r, bodyHole=false)
 //slipRing6P();
//translate([0,0,hackRfWallThickness]) hackRfStack();
//hackRfRack();


//ringConsole3();
    
//nema17Assembly();
//receiverHub();

//stepperBracket();


//innerShaft();
//color([1,1,0])placeBearings() bearing6008Z();

//placeShaftCap() outerShaftCap();
//placeShaftCap() shaftCap();
//outerShaft();
//translate([0,0,9])nema17Assembly();

//shaftCap();

//color([0,0,1])placeSpacer() innerSpacer();
//color([1,0,0])placeSpacer() outerSpacer();
//bottomPart();

//ringConsole1();

//outerShaftCap();
/*difference(){
    assembly();
    translate([0,0,-100]) cube(400);
}*/
//placeReceivers() receiverAssembly();
//hackRfRacksFinal();
//receiverHub();
//assembly();
//wireSupport();



//mirror([0,1,0]) usbHubBracket(bPart=true);
//mirror([0,1,0]) usbHousingJoinStrip();
