pcbDim=[73, 36, 0.6];
screwR = 1.75;
nscrew = 5;
dscrew = 15;
extra = 6;

module body(){
translate([0,-extra,0]) cube([pcbDim[0], pcbDim[1]+2*extra, 5]);
}


module screwHoles(n, d, r, l){
    for(i = [0:1:n-1]){
        translate([i*d,0,0])
        cylinder(l, r, r);
    }
}

module screws(){
translate([6,0,-1]){
    translate([0,-screwR,0]) screwHoles(nscrew,dscrew,1.5,12);
    translate([0,pcbDim[1]+screwR,0]) screwHoles(nscrew,dscrew,1.5,12);
}
}

difference(){ body(); screws();};