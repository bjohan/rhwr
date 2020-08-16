antennaRadius=31/2;
antennaThickness=11;
flangeX=41.2;
flangeY=41.2;
flangeHoleR=4.25/2;
flangeHoleX=35.2-2*flangeHoleR;
flangeHoleY=36.8-2*flangeHoleR;
flangeThickness =3;
flangeWaveGuideX=22.8;
flangeWaveGuideY=10.2;
antennaTol=0.3;

module centerCube(v){
    translate([-v[0]/2, -v[1]/2, 0]) cube(v);
}

module quad(x, y){
    x2=x/2;
    y2=y/2;
    translate([x2,y2,0]) children();
    translate([x2,-y2,0]) children();
    translate([-x2,y2,0]) children();
    translate([-x2,-y2,0]) children();
}

module waveGuideFlange(flangeBore=flangeHoleR){
    difference(){
        centerCube([flangeX, flangeY, flangeThickness]);
        translate([0,0,-1]){
            centerCube([flangeWaveGuideX, flangeWaveGuideY, flangeThickness+2]);
            quad(flangeHoleX, flangeHoleY) cylinder(flangeThickness+2, flangeBore, flangeBore);
        }
    }
    
}

module antennaCylinder(){
difference(){
    cylinder(antennaThickness, antennaRadius+2, antennaRadius+2);
    cylinder(antennaThickness, antennaRadius+antennaTol, antennaRadius+antennaTol);
    
}
translate([0,0,antennaThickness])
}


module complete(){
    translate([0,0,-flangeThickness]){
        waveGuideFlange(3/2);
        translate([7/2+antennaRadius+antennaTol,0,0])centerCube([7-antennaTol, 20,antennaThickness+flangeThickness]);
    }
    antennaCylinder();
    
}

complete();

