$fn=30;
module d(l,d,dd){
    di=d-dd;
    difference(){
    cylinder(l, d/2, d/2);
        translate([-d/2,d/2-di,0])cube([d,d,l]);
    }
}

intersection(){
difference(){
    minkowski(){
cylinder(12, 6,6);
        sphere(2);
    }
d(12, 6+0.7, 4.5+0.7);
}
cylinder(100,100,100);
}