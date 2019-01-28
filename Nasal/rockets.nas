
props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");

#GSh-23 cannon trigger

#initialize triggers
props.globals.initNode("/controls/armament/trigger1", 0, "BOOL");
setprop("/controls/armament/trigger1", 0);

props.globals.initNode("/controls/armament/trigger-UB32-1-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB32-2-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB32-3-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB32-4-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB16-1-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB16-2-R", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB16-3-L", 0, "BOOL");
props.globals.initNode("/controls/armament/trigger-UB16-4-R", 0, "BOOL");

#props.globals.initNode("/sim/multiplay/generic/int[9]", 0, "INT");

#ammo counter
props.globals.initNode("/controls/armament/rocketsLeft", 32, "INT");
props.globals.initNode("/controls/armament/rocketsCount", 32, "DOUBLE");
props.globals.initNode("/controls/armament/UB16rocketsLeft", 32, "INT");
props.globals.initNode("/controls/armament/UB16rocketsCount", 32, "DOUBLE");
var reload = func {
	if( getprop("/gear/gear[0]/wow") and getprop("/gear/gear[1]/wow") and getprop("/gear/gear[2]/wow") and (getprop("/velocities/groundspeed-kt") < 2) ) {
		setprop("/controls/armament/rocketsLeft", 32);
		setprop("/controls/armament/rocketsCount", 32);
		screen.log.write("UB-32 rocket pods reloaded (32 rockets per pod)", 1, 0.6, 0.1);
	}
	else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

#A resource friendly way of ammo counting: Instead of counting every bullet, I set an interpolate on float variant of ammo counter. But I need a timer to cut off fire when out of ammo. 

var outOfAmmo = maketimer(1.0, 
	func { 
		#print("Out of rockets! ");
		screen.log.write("Out of rockets! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger-UB32-1-L", 0);
		setprop("/controls/armament/trigger-UB32-2-R", 0);
		setprop("/controls/armament/trigger-UB32-3-L", 0);
		setprop("/controls/armament/trigger-UB32-4-R", 0);
		setprop("/sim/multiplay/generic/int[9]", 0);
		setprop("/controls/armament/rocketsCount", 0);
		setprop("/controls/armament/rocketsLeft", 0);
		setprop("/controls/armament/trigger1", 0);
	}
);
outOfAmmo.singleShot = 1;

#trigger control with ammo counting
# 3L(0) 1L(1) 2R(6) 4R(7)
var triggerControl = func {
	triggerState = getprop("controls/armament/trigger1");
	if(triggerState and getprop("/controls/armament/rocketsLeft") > 0) {
		var UB32mounted1L = (getprop("/sim/weight[1]/payload-int") == 8);
		var UB32mounted2R = (getprop("/sim/weight[6]/payload-int") == 8);
		var UB32mounted3L = (getprop("/sim/weight[0]/payload-int") == 8);
		var UB32mounted4R = (getprop("/sim/weight[7]/payload-int") == 8);
		
		if(UB32mounted1L or UB32mounted2R or UB32mounted3L or UB32mounted4R) {
			var fireTime = 1.2; #continuous fire for 0.15s intervals
			if(UB32mounted1L) {
				setprop("/controls/armament/trigger-UB32-1-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted2R) {
				setprop("/controls/armament/trigger-UB32-2-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted3L) {
				setprop("/controls/armament/trigger-UB32-3-L", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			if(UB32mounted4R) {
				setprop("/controls/armament/trigger-UB32-4-R", 1);
				setprop("/sim/multiplay/generic/int[9]", 1);
			}
			var rocketsLeft = getprop("/controls/armament/rocketsLeft");
			setprop("/controls/armament/rocketsCount", rocketsLeft);
			interpolate("/controls/armament/rocketsCount", 0, 
				fireTime*(rocketsLeft/32));
			outOfAmmo.restart(fireTime*(rocketsLeft/32));
		}
	}
	else {
		setprop("/controls/armament/trigger1", 0);
		setprop("/controls/armament/trigger-UB32-1-L", 0);
		setprop("/controls/armament/trigger-UB32-2-R", 0);
		setprop("/controls/armament/trigger-UB32-3-L", 0);
		setprop("/controls/armament/trigger-UB32-4-R", 0);
		
		setprop("/sim/multiplay/generic/int[9]", 0);
		
		setprop("/controls/armament/rocketsLeft", 
			getprop("/controls/armament/rocketsCount"));#gets truncated
		interpolate("/controls/armament/rocketsCount", 
			getprop("/controls/armament/rocketsLeft"), 0);
		outOfAmmo.stop();
		#ammo count report on trigger release
		if(getprop("/controls/armament/report-ammo"))
			screen.log.write("S-5 rockets left: " ~ getprop("/controls/armament/rocketsLeft") ~ ((getprop("/sim/weight[1]/payload-int") == 8 and  getprop("/sim/weight[6]/payload-int") == 8)?" x2":""), 1, 0.6, 0.1);
	}
}

setlistener("controls/armament/trigger1", triggerControl);

