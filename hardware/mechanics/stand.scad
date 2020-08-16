length = 111;
module highBandStand(){
cube([22, length, 8]);
translate([0,30,8]){
    difference(){
    cube([22, 22, 16]);
    translate([11, 25, 7])rotate([90,0,0])cylinder(30, 4.2/2, 4.2/2);
    }
}
}

module screwHole(){
     cylinder(8,3.5, 3.5);
     cylinder(6,9, 9);
}

module lowBandStand(){
    s=(48.5-6)/2;
difference(){
translate([-22/2,-length/2]) cube([22, length, 8]);
translate([0,-s,0])screwHole();
    translate([0,s,0])screwHole();
}
}
rotate([0,180,0]) lowBandStand();
//highBandStand();