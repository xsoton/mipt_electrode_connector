module connector()
{
	translate([0, -2.1, 3.54+2.56])
		rotate(a=180, v=[0,1,0])
			import("70AAJ2MO.stl");
}

module connector_box(gap=0.2)
{
	w = 2*2.56;
	h = 8.48;
	l = 3;
	
	c_h = 12-2.56;
	
	translate([-w/2-gap/2, -l-gap/2, 2.56-gap/2])
		cube([w+gap, l+gap, c_h+gap]);
}

module pcb()
{
    w = 10;
	h = 12;
	l = 1;
	
	difference()
	{
		translate([-w/2, -l-3, 0])
			cube([w, l, h]);

		translate([-1.28, -3-l/2, 1.28])
			rotate(a=-90, v=[1,0,0])
				cylinder(d=0.8, h=l+0.2, center=true, $fn = 100);
		translate([1.28, -3-l/2, 1.28])
			rotate(a=-90, v=[1,0,0])
				cylinder(d=0.8, h=l+0.2, center=true, $fn = 100);
	}
}

module pcb_box(gap = 0.2)
{
    w = 10;
	h = 12;
	l = 1;

	translate([-w/2-gap/2, -l-3-gap/2, -gap/2])
		cube([w+gap, l+gap, h+gap]);
	
	c_w = 2.56*2;
	c_l = 12+3;
	c_h = 2.56;
	
	translate([-c_w/2-gap/2, -3-c_l+2+3-gap/2, -gap/2])
		cube([c_w+gap, c_l+gap, h+gap]);
}

module electrode()
{
	w = 7.66;
	h = 23.1;
	l = 1;
	
	translate([-w/2, 0, 0])
		cube([w, l, h]);
}

module electrode_box(gap=0.2)
{
	w = 7.66;
	h = 23.1;
	l = 1;
	
	translate([-w/2-gap/2, -gap/2, -gap/2])
		cube([w+gap, l+gap, h+gap]);
}

module box()
{
    w = 12;
    l = 7;
    h = 12;
	gap = 0.2;
	
	r_w = w/2-1-2.56-gap/2+gap/2;
	
	e_w = 7.66;
	e_h = 23.1;
	e_l = 1;
	
	r2_w = w/2-(e_w+gap)/2-1+gap/2;
	r2_l = 3+gap;
    
	difference()
	{
		translate([-w/2, -l+2, 0])
			cube([w, l, h]);
		connector_box();
		pcb_box();
		electrode_box();
		translate([-r_w-2.56-gap/2-1, -2, -gap/2])
			cube([r_w, 1, h+gap]);
		translate([2.56+gap/2+1, -2, -gap/2])
			cube([r_w, 1, h+gap]);
		translate([-r2_w-(e_w+gap)/2-1, -1-gap/2, -gap/2])
			cube([r2_w, r2_l, h+gap]);
		translate([(e_w+gap)/2+1, -1-gap/2, -gap/2])
			cube([r2_w, r2_l, h+gap]);
	}
	
	translate([-w/2, -l+2, -2])
		cube([w, l+10, 2]);
}

box();
%union(){
	connector();
	pcb();
	electrode();
}

*union(){
	connector_box();
	pcb_box();
	electrode_box();
}
