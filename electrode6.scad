$fn = 100;

// electrode size
ew = 7.66;
eh = 23.1;
el = 1;

// connector size
cw = 5.0038;
cl = 2.54;
ch = 8.4836;

// connector front contacts size
c1w = 1.27;
c1l = 1.2759;
c1h = 6.7056;
c1x = 1.27;

// connector back contacts size
c2w = 1;
c2l = 1;
c2h = ch;
c2x = 1.27;

// connector box size
bcw = ew-2;
bcl = cl+0.5+1+2;
bch = 9;

// electrode box size
bew = 10;
bel = bcl+el+2;
beh = 10+2;

// eccentric sizes
ecc_gap = 0.1;
ecc_d1 = 2;
ecc_d2 = 6;
ecc_e = 1;
ecc_b = 20;

module connector()
{
	translate([0, -1.905, 3.5433])
	rotate(a=180, v=[0,1,0])
	import("70AAJ2MO.stl");
}

module connector_box(gap=0.2)
{
	translate([-cw/2-gap/2, -cl-gap/2, -gap/2])
	cube([cw+gap, cl+gap, ch+gap]);
}

module connector_box_c1(gap=0.2)
{
	for(i=[-1:2:1])
	translate([i*c1x-c1w/2-gap/2, -gap/2, -gap/2])
	cube([c1w+gap, c1l+gap, c1h+gap]);
}

module connector_box_c2(gap=0.2)
{
	for(i=[-1:2:1])
	translate([i*c2x-c2w/2-gap/2, -cl-c2l-gap/2, -gap/2])
	cube([c2w+gap, c2l+gap, c2h+gap]);
}

module electrode()
{
	translate([-ew/2, 0, 0])
	cube([ew, el, eh]);
}

module electrode_box(gap=0.2)
{
	translate([-ew/2-gap/2, -gap/2, -gap/2])
	cube([ew+gap, el+gap, eh+gap]);
}

module box_connector()
{
	difference()
	{
		translate([-bcw/2, -bcl, 0])
		cube([bcw, bcl, bch]);

		translate([0, -0.5, bch-ch])
		{
			connector_box(0.1);
			connector_box_c1(0.1);
			hull()
			{
				connector_box_c2(0.1);
				translate([0, 0, -bch+ch])
				connector_box_c2(0.1);
			}
		}
	}

	translate([0, -0.5, bch-ch])
	{
		*connector_box(0);
		*connector_box_c1(0);
		*connector_box_c2(0);
		connector();
	}
}

module box_electrode()
{
	difference()
	{
		translate([-bew/2, -bcl, -2])
		cube([bew, bel, beh]);

		electrode_box();

		translate([-bcw/2-0.1, -bcl-0.1, -0.1])
		cube([bcw+0.2, bcl+0.2, bch+0.2]);

		translate([-bcw/2-0.1, -cl-1.1-1-0.55, -2.1])
		cube([bcw+0.2, 1.1+1+0.1, 2.2]);
	}

	%electrode();
}

box_connector();

#box_electrode();
