module cCube(v){
    translate(-0.5*[v[0], v[1], 0]) cube(v);
}

module contour(){
    cylinder(75, 5,5);
    translate([0,0,75]) sphere(5);
}

module quad(dx, dy){
    hdx=dx/2;
    hdy = dy/2;
    translate([hdx, hdy, 0]) children();
    translate([hdx, -hdy, 0]) children();
    translate([-hdx, hdy, 0]) children();
    translate([-hdx, -hdy, 0]) children();
}

module oscillatorBody() {
    hull() quad(52-10, 52-10)contour();
}

module oscillatorHolePattern(r=3/2, l=13){
    translate([0,0,-13]) quad(36, 36) cylinder(l,r, r);
}

module oscillator(){
    oscillatorBody();
    oscillatorHolePattern();
}

module screwTowers(r,l){
    translate([57/2-3,0,0])rotate([90,0,0])translate([0,0,-l/2])cylinder(l,r,r);
}

module sleeveBody(){
    difference(){
    union(){
        screwTowers(3, 57+10);
        translate([0,0,-3]) cCube([57,57,73]);
    }
    screwTowers(3/2, 57+10+1);
}
    
}



module sleeveTube(){
difference(){
    sleeveBody();
    minkowski(){    
        oscillator();
        translate([0,0,-5]) cylinder(10, 0.5,0.5);
    }
}
}
module sleeve(){
    sleeveTube();
    difference(){
    translate([0,0,10]) oscillatorHolePattern(10,3);
        minkowski(){    
            oscillator();
            translate([0,0,0]) cylinder(0.1, 0.5,0.5);
        }
    }
}


module assembly(){
//oscillator();
sleeve();
}



assembly();