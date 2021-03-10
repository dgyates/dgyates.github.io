// IBM logo for IBM branded 3d representations
// Author Sean Donnellan Oct 2020
// Based on original design material here:
// https://www.ibm.com/design/language/ibm-logos/8-bar/#legal-requirements
// todos: not 100% parametric yet but scalable and most parameters work
// should add a for loop with the stripe parameters and hieghts but no time.
// should probabby pass it by legela but no time and for a draft it's probably 99.999% on the mark.
// if there is a next iteration it should remove the absolutes in  i b m modules
// possibly add a list of official colors with exact hue also currently r0g0b1
// why all this trouble? why not use the font? This works and was a bit of fun to revisit a classic design.
// This is a mix of methods and ways of doing this. The result is the eight bar.
// The way the original was done was by subtracting the bars across the entire IBM
// I only did that for parts of the B. It COULD have been done for the whole lot ad probably SHOULD have been.
// The result is the same and it was fun to play around with.

StripeDepth=11;
StripeHeight=11;
StripeWidth=11;
SpaceHeight=10;
BRad=42;
StartI=2*StripeWidth;
StartB=10*StripeWidth;
StartM=22*StripeWidth;
LogoColor=[0,0,1];

module subtract(Start) {
	translate([Start,-.5,(1*StripeHeight+0*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(2*StripeHeight+1*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(3*StripeHeight+2*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(4*StripeHeight+3*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(5*StripeHeight+4*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(6*StripeHeight+5*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(7*StripeHeight+6*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
	translate([Start,-.5,(8*StripeHeight+7*SpaceHeight)]) cube([13*StripeWidth,StripeDepth+1,SpaceHeight]);
}

module I () {
	//Ic
	 union(){
		translate([StartI,0,0]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI,0,21]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI+2*StripeWidth,0,42]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI+2*StripeWidth,0,63]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI+2*StripeWidth,0,84]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI+2*StripeWidth,0,105]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI,0,126]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
		translate([StartI,0,147]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
	}
}
module B () {
	union(){
		difference() {
			union() {
				offset=3*StripeWidth;
				difference(){
					translate([StartB+BRad+offset,StripeDepth,BRad]) rotate([90,0,0]) cylinder($fn=100,h=StripeDepth,r=BRad);
					subtract(StartB-StripeWidth);
				}
				difference(){
					translate([StartB+BRad+offset,StripeDepth,74+BRad]) rotate([90,0,0]) cylinder($fn=100,h=StripeDepth,r=BRad);
					subtract(StartB-StripeWidth);
				}
				translate([StartB,0,0]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB,0,21]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB+2*StripeWidth,0,42]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB+2*StripeWidth,0,63]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB+2*StripeWidth,0,84]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB+2*StripeWidth,0,105]) cube([3*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB,0,126]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
				translate([StartB,0,147]) cube([7*StripeWidth,StripeDepth,StripeHeight]);
			}
			translate([StartB+5*StripeWidth,-.5,42-.5]) cube([3*StripeWidth,StripeDepth+1,StripeHeight+1]);
			translate([StartB+5*StripeWidth,-.5,105-.5]) cube([3*StripeWidth,StripeDepth+1,StripeHeight+1]);
		}
	}
}

module M () {
	//Ic
	difference() {
		union(){
			translate([StartM,0,0]) cube([16*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM,0,21]) cube([16*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM+2*StripeWidth,0,42]) cube([12*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM+2*StripeWidth,0,63]) cube([12*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM+2*StripeWidth,0,84]) cube([12*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM+2*StripeWidth,0,105]) cube([12*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM,0,126]) cube([16*StripeWidth,StripeDepth,StripeHeight]);
			translate([StartM,0,147]) cube([16*StripeWidth,StripeDepth,StripeHeight]);
		}
		union(){
			color([1,1,1])rotate([90,0,0]){
				triangle_points =[[StartM+5*StripeWidth,-1],[StartM+8*StripeWidth,0],[StartM+5*StripeWidth,95]];
 				triangle_paths =[[0,1,2]];
 				linear_extrude(height = 30, center = true, convexity = 10, twist = 0) polygon(triangle_points,triangle_paths,10);
			}
			color([1,1,1])rotate([90,0,0]){
				triangle_points =[[StartM+8*StripeWidth,0],[StartM+11*StripeWidth,-1],[StartM+11*StripeWidth,95]];
 				triangle_paths =[[0,1,2]];
 				linear_extrude(height = 30, center = true, convexity = 10, twist = 0) polygon(triangle_points,triangle_paths,10);
			}

			color([1,1,1])rotate([90,0,0]){
				triangle_points =[[StartM+5*StripeWidth,179],[StartM+11*StripeWidth,179],[StartM+8*StripeWidth,87]];
 				triangle_paths =[[0,1,2]];
 				linear_extrude(height = 30, center = true, convexity = 10, twist = 0) polygon(triangle_points,triangle_paths,10);
			}
		}
	}
}

module IBM(scale,color){
	color(color) scale([scale,scale,scale]){
		I();
		B();
		M();
	}
}

//uncomment to use stand alone
//IBM(1,LogoColor);
