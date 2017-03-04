
props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");

#GSh-23 cannon trigger

#initialize triggers
props.globals.initNode("/controls/armament/trigger0", 0, "BOOL");
setprop("/controls/armament/trigger0", 0);


props.globals.initNode("/controls/armament/trigger-GSh-23", 0, "BOOL");

props.globals.initNode("/sim/multiplay/generic/int[8]", 0, "INT");

#ammo counter
props.globals.initNode("/controls/armament/roundsLeft", 200, "INT");
props.globals.initNode("/controls/armament/roundsCount", 200, "DOUBLE");
var reload = func {
	if( getprop("/gear/gear[0]/wow") and getprop("/gear/gear[1]/wow") and getprop("/gear/gear[2]/wow") and (getprop("/velocities/groundspeed-kt") < 2) ) {
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);
		screen.log.write("GSh-23 cannon reloaded (200 rounds)", 1, 0.6, 0.1);
	}
	else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

#A resource friendly way of ammo counting: Instead of counting every bullet, I set an interpolate on float variant of ammo counter. But I need a timer to cut off fire when out of ammo. 

var outOfAmmo = maketimer(1.0, 
	func { 
		#print("Out of ammo! ");
		screen.log.write("Out of ammo! ", 1, 0.6, 0.1);
		setprop("/controls/armament/trigger-GSh-23", 0);
		setprop("/sim/multiplay/generic/int[8]", 0);
		setprop("/controls/armament/roundsCount", 0);
		setprop("/controls/armament/roundsLeft", 0);
		setprop("controls/armament/trigger0", 0);
	}
);
outOfAmmo.singleShot = 1;

#trigger control with ammo counting
var triggerControl = func {
	triggerState = getprop("controls/armament/trigger0");
	if(triggerState and getprop("/controls/armament/roundsLeft") > 0) {
		var mounted = (getprop("/sim/weight[3]/payload-int") == 4);
		
		if(mounted) {
			var fireTime = 3.42857; #continuous fire for 3500 r/min 
			setprop("/controls/armament/trigger-GSh-23", 1);
			setprop("/sim/multiplay/generic/int[8]", 1);
			var roundsLeft = getprop("/controls/armament/roundsLeft");
			setprop("/controls/armament/roundsCount", roundsLeft);
			interpolate("/controls/armament/roundsCount", 0, 
				fireTime*(roundsLeft/200));
			outOfAmmo.restart(fireTime*(roundsLeft/200));
		}
	}
	else {
		setprop("/controls/armament/trigger-GSh-23", 0);
		setprop("/controls/armament/trigger0", 0);
		setprop("/sim/multiplay/generic/int[8]", 0);
		setprop("/controls/armament/roundsLeft", 
			getprop("/controls/armament/roundsCount"));#gets truncated
		interpolate("/controls/armament/roundsCount", 
			getprop("/controls/armament/roundsLeft"), 0);
		outOfAmmo.stop();
		#ammo count report on trigger release
		if(getprop("/controls/armament/report-ammo"))
			screen.log.write("GSh-23 rounds left: " ~ getprop("/controls/armament/roundsLeft"), 1, 0.6, 0.1);
	}
}

setlistener("controls/armament/trigger0", triggerControl);

