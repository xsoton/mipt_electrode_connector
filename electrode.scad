e_w = 7.66;
e_h = 23.1;
e_l = 0.7;
e_hh = 12;

b_d = 1;
b_c_l = 4;
b_s_l = 1.1;
b_s_h = e_hh-2;
b_s_w = 8;

module connector()
{
	translate([0,-2.1,4])
		rotate(a=180,v=[0,1,0])
			import("70AAJ2MO.stl");
}

module electrode()
{
	w = e_w;
	h = e_h;
	l = e_l;
	
	translate([-w/2,b_s_l-l,0])
		cube([w, l, h]);
}

module piptik(d=1)
{
	difference()
	{
		sphere(d=d,$fn=100);
		translate([-d/2,0,-d/2])
			cube([d,d,d]);
	}
}

module box()
{
	w = b_s_w+2*b_d;
	h = b_s_h+b_d;
	l = b_c_l+b_s_l+b_d;
	
	c_w = 5.1;
	c_l = 2.7;
	c_g = 0.4;
	//c_h = 9-c_g;
	c_h = h-c_g-b_d+0.01;
	
	cw_w1 = 1;
	cw_l1 = 0.5;
	cw_h1 = h+0.02;
	
	cw_w2 = 1.5;
	cw_l2 = 0.1;
	cw_h2 = c_h-0.01-1;
	
	difference()
	{
		translate([-w/2, -b_c_l, -b_d])
			cube([w, l, h]);
		translate([-b_s_w/2,0,0])
			cube([b_s_w, b_s_l, b_s_h+0.1]);
		
		translate([-c_w/2,-c_l-0.1,c_g])
			cube([c_w,c_l,c_h]);
				
		translate([-cw_w1/2+1.28,-cw_l1-0.1-c_l,-b_d-0.01])
			cube([cw_w1,cw_l1+0.01,cw_h1]);
		translate([-cw_w1/2-1.28,-cw_l1-0.1-c_l,-b_d-0.01])
			cube([cw_w1,cw_l1+0.01,cw_h1]);
				
		translate([-cw_w2/2+1.28,-cw_l2-0.01,c_g])
			cube([cw_w2,cw_l2+0.02,cw_h2]);
		translate([-cw_w2/2-1.28,-cw_l2-0.01,c_g])
			cube([cw_w2,cw_l2+0.02,cw_h2]);
				
		translate([0,-1.2,-b_d-0.01])
			cylinder(d=1.55, h=b_d+c_g+0.02,$fn=100);
	}
	
	translate([0,-0.05,c_g+7.9])
		piptik(d=0.75);
}

box();
color("yellow")	*connector();
color("yellow")	*electrode();
