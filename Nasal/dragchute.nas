##########################################
# Jettison Dragchute
##########################################

#dragchute reload
var reload = func {
	if( getprop("/gear/gear[0]/wow") and getprop("/gear/gear[1]/wow") and getprop("/gear/gear[2]/wow") and (getprop("/velocities/groundspeed-kt") < 2) ) {
		setprop("/controls/flight/chute_loaded", 1);
		#screen.log.write("Ground Crew: Brake chute re-packed...............", 1, 0.6, 0.1);
	}
	else {
		screen.log.write("You must be still on the ground to reload dragchute! ", 1, 0.6, 0.1);
	}
};

var jettison = func () {
    # cut the chute
	if (getprop("controls/flight/chute_deploy") == 1){
	setprop("controls/flight/chute_deploy", 0);
    setprop("controls/flight/chute_jettisoned", 1);
	setprop("controls/flight/chute_loaded", 0);

    # Reset the property after 0.2 seconds so that the sound can be
    # played again.
    settimer(func {
        setprop("controls/flight/chute_jettisoned", 0);
    }, 0.1);
	}
	else {return;}
};

setlistener("controls/flight/chute_jettisoned", jettison);

