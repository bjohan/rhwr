
enclosure_inner_length = 120;
enclosure_inner_width = 100;
enclosure_inner_depth = 50;

enclosure_thickness = 2;

cover_thickness = 3;

part = "enclosure"; // [enclosure:Enclosure, cover:Cover, both:Enclosure and Cover]
//part = "cover";
//part = "both";

module bottomLabel(label){
    rotate([180,0,0])
    linear_extrude(height=4)
    text(label, size = 3, halign = "center");
}

module d(l,d,dd){
    di=d-dd;
    difference(){
    cylinder(l, d/2, d/2);
        translate([-d/2,d/2-di,0])cube([d,d,l]);
    }
}
module bnc(label, flat = 1){
    
    translate([0,0,-1])
        rotate([0,0,90*flat])d(10,10.2,9.5);//cylinder(10, 5+0.1,5+0.1);
        
    translate([0,-10,1])
    bottomLabel(label);
    
}

module diffpair(label, flat = 1){
    bnc(label,flat);
    translate([0,-20,0])bnc(str("~",label), flat);
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

module panel(){
difference(){
    print_part();
    translate([0,-30,0]){
        translate([-50,0,0])insulatedBanana("+15V");
        translate([-40,5,0])led("+");
        translate([-30,0,0])groundBanana("GND");
        translate([-20,5,0])led("-");
        translate([-10,0,0])insulatedBanana("-15V");
        translate([10,0,0])potentiometer("LLIM");
        translate([30,0,0])potentiometer("HLIM");
        translate([50,0,0])potentiometer("CMM");
    }
    
    translate([0,10,0]){
        translate([-50,-15,0]) bnc("IN1");
        translate([-30,-5,0]) switch("BNC/INT");
        translate([-10,30-45/2,0]) switch("HI/LOW");
        translate([-10,-15,0]) potentiometer("HI");
        translate([-10,30,0]) potentiometer("LOW");
        translate([-50, 30, 0])diffpair("OUT1");
    }
    
    translate([0,10,0]){
        translate([50,-15,0]) bnc("IN2",flat=3);
        translate([30,-5,0]) switch("BNC/INT");
        translate([10,30-45/2,0]) switch("HI/LOW");
        translate([10,-15,0]) potentiometer("HI");
        translate([10,30,0]) potentiometer("LOW");
        translate([50, 30, 0])diffpair("OUT2",flat=3);
    }
    
    
    /*translate([0,30,0]){
        translate([-40,0,0])diffpair("HS1");
        translate([-20,0,0])diffpair("HS2");
        translate([0,0,0])diffpair("G");
        translate([20,0,0])diffpair("BL");
        translate([40,0,0])diffpair("HRU");
    }
    translate([0,-30,0]){
        translate([-40,0,0])labeledHole(9, "+15V");
        translate([-20,0,0])labeledHole(9, "+5V");
        translate([0,0,0])labeledHole(4.5, "GND");
        translate([20,0,0])labeledHole(9, "-5V");
        translate([40,0,0])labeledHole(9, "-15V");
    }
    translate([0,0,25])rotate([-90,0,0]) cylinder(200, 5, 5);*/
}
}
panel();
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



