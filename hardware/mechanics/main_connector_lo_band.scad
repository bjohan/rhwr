pinWideLength=13.8;
pinWideWidth=1.8;
pinFlare=0.2;
pinNarrowLength = 6.1;
pinNarrowWidth = 1.0;
pinFlangeOffset=8.8;
pinFlangeLength=0.8;
pinFlangeWidth=2.2;
pinTol=0.15;
retainerTol = 0.3;

connectorPinBodyL=pinFlangeOffset;//pinWideLength;
connectorPinBodyR=27.6/2-0.15;

rinkHeight=10;
flangeHeight = 9;
flangeWidening = 6;

pinHolderThickness = 3;
pinHolderWall = 2;

 keyDepth = 0.8;

module pin(ne=0){
    $fn=8;
    cylinder(pinWideLength, pinWideWidth/2+pinFlare, pinWideWidth/2);
    translate([0,0,pinWideLength])cylinder(pinNarrowLength, (pinNarrowWidth+ne)/2, (pinNarrowWidth+ne)/2);
    translate([0,0,pinFlangeOffset])cylinder(pinFlangeLength, pinFlangeWidth/2, pinFlangeWidth/2);
}

module circularPattern(r, n){
    for(i = [0:1:n-1]){
        rotate([0,0,i*360/n]) translate([r,0,0]) children();
    }
}


module placePins(){
    circularPattern(21.5/2, 20) children();
    circularPattern(14.5/2, 13) children();
    circularPattern(7.5/2, 7) children();
    children();
}

module connectorBody(){
    cylinder(connectorPinBodyL,connectorPinBodyR ,connectorPinBodyR);
}


module key(r,w, d,l){
    translate([r-d,-w/2,0])cube([d*2,w,l]);
}

module keys(){
   
    key(connectorPinBodyR,2.2,1,connectorPinBodyL);
    rotate([0,0,-95]) key(connectorPinBodyR,1.2,keyDepth,connectorPinBodyL);
    rotate([0,0,-95-50]) key(connectorPinBodyR,1.2,keyDepth,connectorPinBodyL);
    rotate([0,0,-90-45-90+5+1]) key(connectorPinBodyR,1.2,keyDepth,connectorPinBodyL);
    rotate([0,0,-90-45-90+5-34]) key(connectorPinBodyR,1.2,keyDepth,connectorPinBodyL);
}

module pins(ne=0){
    placePins()minkowski(){ pin(ne); sphere(pinTol);}
}
module pinBody(){
    difference(){
        connectorBody();
        pins();
    }
    rotate([0,0,127])keys();
}

module pinHull(l){
    cylinder(l, 21.5/2+pinFlangeWidth/2+pinTol,21.5/2+pinFlangeWidth/2+pinTol);
}

module flange(){
    fcr = 0.5*(2*connectorPinBodyR+flangeWidening);
    difference(){
        cylinder(flangeHeight, connectorPinBodyR, connectorPinBodyR+flangeWidening);
        pinHull(30);
        circularPattern(fcr, 6)cylinder(30, 1.5, 1.5);
    }
}

module connectorUpper(){
    translate([0,0,connectorPinBodyL]){
        difference(){
            cylinder(rinkHeight-connectorPinBodyL+4,connectorPinBodyR+keyDepth,connectorPinBodyR+keyDepth);
            pinHull(30);
        }
        translate([0,0,rinkHeight-connectorPinBodyL]){
            flange();
        }
    }
}

module pinHolderBase(){
     th = rinkHeight-connectorPinBodyL+flangeHeight+0.1;
    
     ro = 21.5/2+pinFlangeWidth/2+pinTol+pinHolderWall;
     cylinder(pinHolderThickness, 21.5/2+pinFlangeWidth/2+pinTol,21.5/2+pinFlangeWidth/2+pinTol);
     translate([0,0,pinHolderThickness])
     cylinder(pinHolderThickness, 21.5/2+pinFlangeWidth/2+pinTol,21.5/2+pinFlangeWidth/2+pinTol+pinHolderWall);
     translate([0,0,pinHolderThickness*2]){
         difference(){
            cylinder(th-2*pinHolderThickness,ro,ro);
             cylinder(th-2*pinHolderThickness,ro-pinHolderWall,ro-pinHolderWall);
         }
     }
}

module pinHolder(){
    difference(){
        //cylinder(pinHolderThickness, 21.5/2+pinFlangeWidth/2+pinTol,21.5/2+pinFlangeWidth/2+pinTol);
        pinHolderBase();
        translate([0,0,-pinFlangeOffset])pins(ne=0.2);
    }
    
    
}

module upper(){
    difference(){
        connectorUpper();
        translate([0,0,connectorPinBodyL]){
            minkowski(){
                pinHolder();
                cylinder(0.1,retainerTol, retainerTol);
            }
            
        }
    }
}

module connectorHouseBody(){
    pinBody();
upper();
}

//pinBody();
connectorHouseBody();


//cylinder(flangeHeight, connectorPinBodyR, connectorPinBodyR+flangeWidening);

pinHolder();
//translate([0,0,connectorPinBodyL]) 




