$fn = 100;

dx = 0.1;

d1 = 2;
d2 = 6;
e = 1;
b = 20;

translate([0, -dx, 0])
rotate([-90, 0, 0])
cylinder(d = d1, h = 10+dx);

translate([0, -1-dx, 0])
rotate([-90, 0, 0])
cylinder(d = d1+2, h = 1);

translate([b, -dx, 0])
rotate([-90, 0, 0])
cylinder(d = d1, h = 10+dx);

translate([b, 0, 0])
difference()
{
	translate([e, -dx, 0])
	rotate([-90, 0, 0])
	cylinder(d = d2, h = 2+dx);
	
	translate([0, -dx, 0])
	rotate([-90, 0, 0])
	cylinder(d = d1, h = 2+2*dx);
}

translate([b, -2-dx, 0])
rotate([-90, 0, 0])
cylinder(d = d1, h = 2);

translate([b, -2-dx, -1])
cube([10, 2, 2]);

difference()
{
	hull()
	{
		rotate([-90, 0, 0])
		cylinder(d = d1+2*1+2*dx, h = 2);

		translate([b+e, 0, 0])
		rotate([-90, 0, 0])
		cylinder(d = d2+2*1+2*dx, h = 2);
	}
	
	translate([0, -dx, 0])
	rotate([-90, 0, 0])
	cylinder(d = d1+2*dx, h = 2+2*dx);
	
	translate([b+e, -dx, 0])
	rotate([-90, 0, 0])
	cylinder(d = d2+2*dx, h = 2+2*dx);
}