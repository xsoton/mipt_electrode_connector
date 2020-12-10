module connector()
{
	translate([0, -2.1, 3.55+2])
		rotate(a=180, v=[0,1,0])
			import("70AAJ2MO.stl");
}

module connector_box(gap=0.1)
{
	w = 2*2.56;
	h = 8.6;
	l = 3;
	
	translate([-w/2-gap/2, -l-gap/2, 1.9-gap])
		cube([w+gap, l+gap, h+gap]);
}

module connector_box_extra(gap=0.1)
{
	w = 2*2.56;
	h = 8.6+4;
	l = 3;
	
	translate([-w/2-gap/2, -l-gap/2, -4+1.9-gap])
		cube([w+gap, l+gap, h+gap]);
}

module pcb()
{
    w = 10;
	h = 20;
	l = 2;
	
	translate([-w/2, -l-3, -h+2+10])
		cube([w, l, h]);
}

module pcb_box(gap = 0.2)
{
    w = 10;
	h = 20;
	l = 2;
	
	translate([-w/2-gap/2, -l-3-gap/2, -h+2+10-gap])
		cube([w+gap, l+gap, h+gap]);
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
	
	translate([-w/2-gap/2, -gap/2, 0])
		cube([w+gap, l+gap, h+gap]);
}

module piptik(d=1)
{
	difference()
	{
		sphere(d=d, $fn=100);
		translate([-d/2, 0, -d/2])
			cube([d,d,d]);
	}
}

module box()
{
    w = 12;
    l = 10;
    h = 15;
    
	difference()
	{
		translate([-w/2, -l+1+2, -2])
			cube([w, l, h]);
		connector_box_extra();
		pcb_box();
		electrode_box();
				
		//translate([0,-1.2,-b_d-0.01])
		//	cylinder(d=1.55, h=b_d+c_g+0.02,$fn=100);
	}
	
	//translate([0,-0.05,c_g+7.9])
	//	piptik(d=0.75);
}

box();
union(){
	%connector();
	%pcb();
	%electrode();
}
*union(){
    connector_box();
    pcb_box();
    electrode_box();
}

*union(){
	connector();
	%connector_box_extra();
}
