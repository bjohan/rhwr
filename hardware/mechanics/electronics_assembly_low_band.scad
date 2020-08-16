pcbx = 102+1.5-1;
pcby = 72;
pcbz = 1;
module pcb(){
    cube([pcbx,pcby,pcbz]);
}

module placePcbs(){
translate([0,-3,0])rotate([90,0,0]) children();
translate([0,3+pcbz,0])rotate([90,0,0]) children();
}

module pcbs(){
    placePcbs() pcb();
}

module base(){
    el = 15;
    bx = pcbx+el;
    by = 70;
    bz = 3;
    translate([-el/2, -by/2, -bz])cube([bx, by, bz]);
}

module pillars(){
    cylinder(pcby+4, 5, 5);
    translate([pcbx,0,0])cylinder(pcby+4, 5, 5);
    rotate([90,0,0])translate([0,0,-2])cube([pcbx,pcby,4]);
}

module board_fixture(){
   translate([0,0,pcby+4+1+3+2])rotate([180,0,0]) translate([-pcbx/2,0,0]){
difference(){
minkowski(){
    difference(){
        pillars();
        minkowski(){
            pcbs();
            sphere(0.5);
        }
    }
    sphere(1);
}
minkowski(){
            union(){
            translate([0,0,10])pcbs();
            pcbs();
            }
            sphere(0.65);
        }
}
//pcbs();
base();
}
}





enclosure_inner_length = 120;
enclosure_inner_width = 100;
enclosure_inner_depth = 80;

enclosure_thickness = 2;

cover_thickness = 3;

part = "enclosure"; // [enclosure:Enclosure, cover:Cover, both:Enclosure and Cover]
part = "cover";
//part = "both";
panel();

module grid(nx, ny, dx, dy,rx){
    tx = nx*dx-rx;
    ty = (ny-1)*dy;
    translate([-tx/2,-ty/2,0])
    for(x = [0:1:nx-1])
        for(y=[0:1:ny-1]){
            if(y%2==1)
                translate([x*dx, y*dy, 0]) children();
            else
                translate([x*dx+dx/2, y*dy, 0]) children();
        }
}

module reliefVents(){
translate([0,0,enclosure_thickness+enclosure_inner_depth/2])rotate([0,90,0])grid(10, 14, 7, 6,3) rotate([0,0,30]) translate([0,0,-100])cylinder(200, 3,3, $fn=6);
    rotate([0,0,90])translate([0,0,enclosure_thickness+enclosure_inner_depth/2])rotate([0,90,0])grid(10, 18, 7, 6,3) rotate([0,0,30]) translate([0,0,-100])cylinder(200, 3,3, $fn=6);
}
module bottomLabel(label){
    rotate([180*0,0,0])
    linear_extrude(height=4)
    text(label, size = 3, halign = "center", valign="center");
}

module d(l,d,dd){
    di=d-dd;
    difference(){
    cylinder(l, d/2, d/2);
        translate([-d/2,d/2-di,0])cube([d,d,l]);
    }
}
module bnc(label, flat = 1, bottom=true){
    
    translate([0,0,-1])
        rotate([0,0,90*flat])d(10,10.2,9.5-0.2);//cylinder(10, 5+0.1,5+0.1);
        
    if(bottom) translate([0,-8,1]) bottomLabel(label);
    if(!bottom) translate([0,8,1]) bottomLabel(label);
}

module diffpair(label, flat = 1, bottom = true){
    bnc(label,flat, bottom);
    translate([20,0,0])bnc(str("~",label), flat, bottom);
}

module labeledHole(d, label){
    translate([0,0,-1]) cylinder(10, d/2,d/2);
    translate([0,-d/2-3,1])
    bottomLabel(label);
}

module insulatedBanana(label){
    labeledHole(9, label);
    translate([0,-4.5,0]) cylinder(10, 1.3,1.3);
}

module groundBanana(label){
    labeledHole(4.5+0.7, label);
}

module potentiometer(label){
    labeledHole(7+1, label);
    rotate([0,0,0])translate([0,-3.5-2,1]) cylinder(10, 1,1);
    rotate([0,0,90])translate([0,-3.5-2,1]) cylinder(10, 1,1);
    rotate([0,0,180])translate([0,-3.5-2,1]) cylinder(10, 1,1);
    rotate([0,0,270])translate([0,-3.5-2,1]) cylinder(10, 1,1);
}

module switch(label){
    labeledHole(6+1, label);
}

module led(label){
    labeledHole(4.8+0.5, label);
}

module wireHole(er=0){
    hull(){
                translate([25,45,pcby+5])rotate([-90,0,0])cylinder(10,4+er,4+er);
                translate([25,45,pcby+5+10])rotate([-90,0,0])cylinder(10,4+er,4+er);
            }
        }
module panel(){
    difference(){  
        union(){
                print_part();
                if(part != "enclosure")
                board_fixture();
        }
        
        translate([-5,0,pcby+4+1+3+2]){
            //translate([-50,-18,-1])cube([100,36,10]);
            translate([0,40,0]){
                translate([-40,0,0]) diffpair("LS1");
                //translate([-40,0,0]) bnc("LS1_SE");
                //translate([-40, -15,0]) led("");
                translate([40-15,0,0]) insulatedBanana("12V");
                translate([20-15,0,0]) groundBanana("GND");
                translate([55, -0,0]) led("ON");
                translate([55, -15,0]) switch("PWR");
                
                translate([40, -0,0]) led("");
                translate([40, -15,0]) switch("BT");
                translate([-0,0,0]){
                    translate([40-15, -15,0]) insulatedBanana("18V");
                    translate([40-35, -15,0]) insulatedBanana("8V");
                    translate([40-60, -15,0]) insulatedBanana("-8V");
                    translate([40-80, -15,0]) insulatedBanana("-18V");
                }
                //translate([-20,0,0])diffpair("HS2");
                //translate([0,0,0])diffpair("G");
                //translate([20,0,0])diffpair("BL");
                //translate([40,0,0])diffpair("HRU");
            }
            translate([0,-40,0]){
                translate([-40,0,0]) diffpair("LS2", bottom=false);
                //translate([-40,0,0]) bnc("LS2_SE", bottom=false);
                //translate([-40, 15,0]) led("");
                translate([5,0,0]) switch("LRU1");
                translate([20, 0,0]) switch("LRU2");
                translate([35, 0,0]) switch("BL");
                translate([50, 0,0]) switch("G");
                translate([5, 10,0]) led("");
                translate([20, 10,0]) led("");
                translate([35, 10,0]) led("");
                translate([50, 10,0]) led("");
            }            
            
        }
        if(part != "cover"){
            wireHole();
            difference(){
            reliefVents();
                wireHole(3.5);
            }
        }
    }
}

module centerCube(v){
    translate([-v[0]/2, -v[1]/2, 0]) cube(v);
}

module squarePlace(x,y){
    translate([-x, -y, 0]) children();
    translate([-x, y, 0]) children();
    translate([x, -y, 0]) children();
    translate([x, y, 0]) children();
}

module lid(){
print_part();
translate([0,0,enclosure_inner_depth+enclosure_thickness-5]){
    difference(){ 
        centerCube([102.5, 72, 5]);
        centerCube([102.5-5, 72-5, 5]);
    }
    translate([0,0,-2]){
        difference(){
        centerCube([102.5+10-2, 72+10-2, 7]);
        centerCube([102.5, 72, 7]);
        squarePlace((102.5+10-8)/2, (72+10-8)/2)cylinder(10, 1.5, 1.5);
        }
    }
    
}
}


module print_part() {
	if (part == "enclosure") {
		box2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2-0.10,cover_thickness);
	} else if (part == "cover") {
		lid2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2+0.10,cover_thickness);
	} else {
		both();
	}
}

module both() {

box2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2-0.10,cover_thickness);
lid2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2+0.10,cover_thickness);

}

module screws(in_x, in_y, in_z, shell) {

	sx = in_x/2 - 4;
	sy = in_y/2 - 4;
	sh = shell + in_z - 12;
	nh = shell + in_z - 4;

translate([0,0,0]) {
	translate([sx , sy, sh]) cylinder(r=1.5, h = 15, $fn=32);
	translate([sx , -sy, sh ]) cylinder(r=1.5, h = 15, $fn=32);
	translate([-sx , sy, sh ]) cylinder(r=1.5, h = 15, $fn=32);
	translate([-sx , -sy, sh ]) cylinder(r=1.5, h = 15, $fn=32);


	translate([-sx , -sy, nh ]) rotate([0,0,-45]) 
		translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
	translate([sx , -sy, nh ]) rotate([0,0,45]) 
		translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
	translate([sx , sy, nh ]) rotate([0,0,90+45]) 
		translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
	translate([-sx , sy, nh ]) rotate([0,0,-90-45]) 
		translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
}
}

module bottom(in_x, in_y, in_z, shell) {

	hull() {
   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
	}
}

module sides(in_x, in_y, in_z, shell) {
translate([0,0,shell])
difference() {

	hull() {
   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
		translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
		translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
		translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
	}

	hull() {
   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
		translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
		translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
		translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
	}
}

intersection() {
	translate([-in_x/2, -in_y/2, shell]) cube([in_x, in_y, in_z+2]);

	union() {
	translate([-in_x/2 , -in_y/2,shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
	translate([-in_x/2 , -in_y/2,shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);

	translate([in_x/2 , -in_y/2, shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
	translate([in_x/2 , -in_y/2, shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);

	translate([in_x/2 , in_y/2,  shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
	translate([in_x/2 , in_y/2,  shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);

	translate([-in_x/2 , in_y/2, shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
	translate([-in_x/2 , in_y/2, shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);
	}

}
}

module lid_top_lip2(in_x, in_y, in_z, shell, top_lip, top_thickness) {

	cxm = -in_x/2 - (shell-top_lip);
	cxp = in_x/2 + (shell-top_lip);
	cym = -in_y/2 - (shell-top_lip);
	cyp = in_y/2 + (shell-top_lip);

	translate([0,0,shell+in_z])

difference() {

	hull() {
   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
		translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
		translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
		translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
	}

	
	translate([0, 0, -1]) linear_extrude(height = top_thickness + 2) polygon(points = [
		[cxm+5, cym],
		[cxm, cym+5],
		[cxm, cyp-5],
		[cxm+5, cyp],
		[cxp-5, cyp],
		[cxp, cyp-5],
		[cxp, cym+5],
		[cxp-5, cym]]);
}
}

module lid2(in_x, in_y, in_z, shell, top_lip, top_thickness) {

	cxm = -in_x/2 - (shell-top_lip);
	cxp = in_x/2 + (shell-top_lip);
	cym = -in_y/2 - (shell-top_lip);
	cyp = in_y/2 + (shell-top_lip);	

difference() {
	translate([0, 0, in_z+shell]) linear_extrude(height = top_thickness ) polygon(points = [
		[cxm+5, cym],
		[cxm, cym+5],
		[cxm, cyp-5],
		[cxm+5, cyp],
		[cxp-5, cyp],
		[cxp, cyp-5],
		[cxp, cym+5],
		[cxp-5, cym]]);
		

		screws(in_x, in_y, in_z, shell);

	
}
}

module box2(in_x, in_y, in_z, shell, top_lip, top_thickness) {
	bottom(in_x, in_y, in_z, shell);
	difference() {
		sides(in_x, in_y, in_z, shell);
		screws(in_x, in_y, in_z, shell);
	}
	lid_top_lip2(in_x, in_y, in_z, shell, top_lip, top_thickness);
}



