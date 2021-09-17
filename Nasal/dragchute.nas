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
	chute_speed_checkTimer.stop();
	#screen.log.write("Chute jettisoned! ", 1, 0.6, 0.1);

    # Reset the property after 0.2 seconds so that the sound can be played again.
    
    	settimer(func {
        setprop("controls/flight/chute_jettisoned", 0);
    }, 0.1);
	}
	else {return;}
};

setlistener("controls/flight/chute_jettisoned", jettison);

var chute_deployed = func {

    if (getprop("controls/flight/chute_deploy") == 1) {
      	if(getprop("/velocities/airspeed-kt") > 165) {
      	#screen.log.write("Overspeed! Chute ripped off! ", 1, 0.6, 0.1); 
      	jettison();
      	} #rip off paracute above 300kmh (approx 163 kts)
      	else {
      	chute_speed_checkTimer.restart(0.1); # adjust the timer frequency (ms)
      	#screen.log.write("Chute deployed! ", 1, 0.6, 0.1);
      	}
      }
    else { 
      chute_speed_checkTimer.stop();
      } #cancel the timer. Timer can be started again later.
}

chute_speed_checkTimer = maketimer(0.25, chute_deployed);
chute_speed_checkTimer.simulatedTime = 1; # use simulated time, as maketimer defaults to using wallclock time and continues during pause.
chute_speed_checkTimer.start();

