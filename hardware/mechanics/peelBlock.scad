module peelBlock(){
    difference(){
    cube([40, 20, 15]);
    translate([0, 10, 5]) cube([40,3.5, 3.5]);
        translate([0, 10, 5]) cube([40,2, 23.5]);
    }
}

peelBlock();