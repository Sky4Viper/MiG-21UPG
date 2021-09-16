props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");
##########################################
# SUO - Weapons Control
##########################################

#initialize triggers
props.globals.initNode("/controls/armament/trigger", 0, "BOOL");
setprop("/controls/armament/trigger", 0);

var selected_wpn = 0.0;
var gun_powered = 0;
var pylons12_powered = 0;
var pylons34_powered = 0;
var rktmsl_powered = 0;
var master_arm = 0;
var pylon1_load = 0.0;
var pylon2_load = 0.0;
var pylon3_load = 0.0;
var pylon4_load = 0.0;
var pylon5_load = 0.0;
var station_sel = 3.0;


var fire_selected = func{
var selected_wpn = getprop("controls/armament/selectedweapon");
var master_arm = getprop("controls/armament/masterarm");
var pylon1_load = getprop("/sim/weight[1]/payload-int");
var pylon2_load = getprop("/sim/weight[6]/payload-int");
var pylon3_load = getprop("/sim/weight[0]/payload-int");
var pylon4_load = getprop("/sim/weight[7]/payload-int");
var pylon5_load = getprop("/sim/weight[4]/payload-int");
var gun_powered = getprop("controls/power/gun");
var pylons12_powered = getprop("controls/power/pln1-2");
var pylons34_powered = getprop("controls/power/pln3-4");
var rktmsl_powered = getprop("controls/power/mslrkt");

var triggerState = getprop("controls/armament/trigger");

# Guns
if (triggerState == 1 and master_arm == 1 and selected_wpn == 1 and gun_powered == 1){
setprop("/controls/armament/trigger0", 1);
}

if (triggerState == 0 and master_arm == 1 and selected_wpn == 1){
setprop("/controls/armament/trigger0", 0);
}

#Air to Ground mode
if (triggerState == 1 and master_arm == 1 and selected_wpn == 2){
#Rockets
if (rktmsl_powered ==1){
if (pylons12_powered == 1 and (pylon1_load == 8 or pylon2_load == 8) and getprop("controls/armament/station[1]/release") == 0){
setprop("/controls/armament/trigger1", 1);
}
if (pylons34_powered == 1 and (pylon3_load == 8 or pylon4_load == 8) and getprop("controls/armament/station[3]/release") == 0){
setprop("/controls/armament/trigger1", 1);
}
}
#Bombs
if (rktmsl_powered !=1){
if (pylons12_powered == 1 and pylon1_load == 7 and pylon2_load == 7){
setprop("/controls/armament/trigger3", 1);
setprop("controls/armament/station[1]/release", 1);
setprop("controls/armament/station[2]/release", 1);
setprop("/sim/weight[1]/selected", "none");
setprop("/sim/weight[6]/selected", "none");
setprop("/sim/multiplay/generic/int[11]", 1);
setprop("controls/armament/sound/drop", 1);
settimer(func {
	setprop("controls/armament/sound/drop", 0);
	}, 0.2);
}
if (pylons12_powered == 1 and pylon1_load == 10 and pylon2_load == 10){
setprop("/controls/armament/trigger4", 1);
setprop("controls/armament/station[1]/release", 1);
setprop("controls/armament/station[2]/release", 1);
setprop("/sim/weight[1]/selected", "none");
setprop("/sim/weight[6]/selected", "none");
setprop("/sim/multiplay/generic/int[11]", 1);
setprop("controls/armament/sound/drop", 1);
settimer(func {
	setprop("controls/armament/sound/drop", 0);
	}, 0.2);
}
}
}

if (triggerState == 0 and master_arm == 1 and selected_wpn == 2 and (pylon1_load == 8 or pylon2_load == 8 or pylon3_load == 8 or pylon4_load == 8)){
setprop("/controls/armament/trigger1", 0);
}

##Bombs
#if (triggerState and master_arm == 1 and selected_wpn == 2 and pylons12_powered == 1 and pylon1_load == 7 and pylon2_load == 7){
#setprop("/controls/armament/trigger3", 1);
#setprop("controls/armament/station[1]/release", 1);
#setprop("controls/armament/station[2]/release", 1);
#setprop("/sim/weight[1]/selected", "none");
#setprop("/sim/weight[6]/selected", "none");
#setprop("/sim/multiplay/generic/int[11]", 1);
#setprop("controls/armament/sound/drop", 1);
#settimer(func {
#	setprop("controls/armament/sound/drop", 0);
#	}, 0.2);
#}
#if (triggerState and master_arm == 1 and selected_wpn == 2 and pylons12_powered == 1 and pylon1_load == 10 and pylon2_load == 10){
#setprop("/controls/armament/trigger4", 1);
#setprop("controls/armament/station[1]/release", 1);
#setprop("controls/armament/station[2]/release", 1);
#setprop("/sim/weight[1]/selected", "none");
#setprop("/sim/weight[6]/selected", "none");
#setprop("/sim/multiplay/generic/int[11]", 1);
#setprop("controls/armament/sound/drop", 1);
#settimer(func {
#	setprop("controls/armament/sound/drop", 0);
#	}, 0.2);
#}

#Long range missiles

if (triggerState and master_arm == 1 and selected_wpn == 3 and pylons12_powered == 1 and rktmsl_powered ==1 and pylon1_load == 6){
setprop("controls/armament/station[1]/m1release", 1);
setprop("/sim/weight[1]/selected", "none");
setprop("controls/armament/sound/launch2", 1);
settimer(func {
	setprop("controls/armament/sound/launch2", 0);
	}, 4.0);
}
if (triggerState and master_arm == 1 and selected_wpn == 3 and pylons12_powered == 1 and rktmsl_powered ==1 and pylon1_load == 0 and pylon2_load == 6){
setprop("controls/armament/station[2]/m1release", 1);
setprop("/sim/weight[6]/selected", "none");
setprop("controls/armament/sound/launch2", 1);
settimer(func {
	setprop("controls/armament/sound/launch2", 0);
	}, 4.0);
}
if (triggerState and master_arm == 1 and selected_wpn == 3 and pylons12_powered == 1 and rktmsl_powered ==1 and pylon1_load == 9){
setprop("controls/armament/station[1]/m2release", 1);
setprop("/sim/weight[1]/selected", "none");
setprop("controls/armament/sound/launch2", 1);
settimer(func {
	setprop("controls/armament/sound/launch2", 0);
	}, 4.0);
}
if (triggerState and master_arm == 1 and selected_wpn == 3 and pylons12_powered == 1 and rktmsl_powered ==1 and pylon1_load == 0 and pylon2_load == 9){
setprop("controls/armament/station[2]/m2release", 1);
setprop("/sim/weight[6]/selected", "none");
setprop("controls/armament/sound/launch2", 1);
settimer(func {
	setprop("controls/armament/sound/launch2", 0);
	}, 4.0);
}

#Short range missiles

if (triggerState and master_arm == 1 and selected_wpn == 4 and pylons34_powered == 1 and rktmsl_powered ==1 and pylon3_load == 2){
setprop("controls/armament/station[3]/m1release", 1);
setprop("/sim/weight[0]/selected", "none");
setprop("controls/armament/sound/launch1", 1);
settimer(func {
	setprop("controls/armament/sound/launch1", 0);
	}, 1.1);
}
if (triggerState and master_arm == 1 and selected_wpn == 4 and pylons34_powered == 1 and rktmsl_powered ==1 and pylon3_load == 0 and pylon4_load == 2){
setprop("controls/armament/station[4]/m1release", 1);
setprop("/sim/weight[7]/selected", "none");
setprop("controls/armament/sound/launch1", 1);
settimer(func {
	setprop("controls/armament/sound/launch1", 0);
	}, 1.1);
}
if (triggerState and master_arm == 1 and selected_wpn == 4 and pylons34_powered == 1 and rktmsl_powered ==1 and pylon3_load == 1){
setprop("controls/armament/station[3]/m2release", 1);
setprop("/sim/weight[0]/selected", "none");
setprop("controls/armament/sound/launch1", 1);
settimer(func {
	setprop("controls/armament/sound/launch1", 0);
	}, 1.1);
}
if (triggerState and master_arm == 1 and selected_wpn == 4 and pylons34_powered == 1 and rktmsl_powered ==1 and pylon3_load == 0 and pylon4_load == 1){
setprop("controls/armament/station[4]/m2release", 1);
setprop("/sim/weight[7]/selected", "none");
setprop("controls/armament/sound/launch1", 1);
settimer(func {
	setprop("controls/armament/sound/launch1", 0);
	}, 1.1);
}

else {
return;
}
}

var stop_fired = func{
var selected_wpn = getprop("controls/armament/selectedweapon");
if (selected_wpn == 1){
setprop("/controls/armament/trigger0", 0);
}
if (selected_wpn == 2){
setprop("/controls/armament/trigger1", 0);
setprop("/controls/armament/trigger3", 0);
setprop("/controls/armament/trigger4", 0);
}
if (selected_wpn == 3){
setprop("/controls/armament/trigger5", 0);
#settimer(func {
#				setprop("controls/armament/R77missile[1]/release", 0);
#				setprop("controls/armament/R77missile[2]/release", 0);
#			  }, 7.1);
}
else {
return;}
}

var emergency_jettison = func{

        pylon12_jettison();
        pylon34_jettison();
        tanks_jettison();
        
}

var pylon12_jettison = func{

	var pylon1_load = getprop("/sim/weight[1]/payload-int");
	var pylon2_load = getprop("/sim/weight[6]/payload-int");
     
        # pylon 1
        
            if(pylon1_load == 6){
            settimer(func {
			setprop("controls/armament/station[1]/m1jettison", 1);
			setprop("/sim/weight[1]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
        	if(pylon1_load == 7){
            settimer(func {
			setprop("controls/armament/station[1]/b1jettison", 1);
			setprop("/sim/weight[1]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon1_load == 8){
            settimer(func {
			setprop("controls/armament/station[1]/r1jettison", 1);
			setprop("/sim/weight[1]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon1_load == 9){
            settimer(func {
			setprop("controls/armament/station[1]/m2jettison", 1);
			setprop("/sim/weight[1]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon1_load == 10){
            settimer(func {
			setprop("controls/armament/station[1]/b2jettison", 1);
			setprop("/sim/weight[1]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
        #setprop("/sim/weight[1]/selected",                   "none");
        
        # pylon 2
        
            if(pylon2_load == 6){
            settimer(func {
			setprop("controls/armament/station[2]/m1jettison", 1);
			setprop("/sim/weight[6]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
        
        	if(pylon2_load == 7){
            settimer(func {
			setprop("controls/armament/station[2]/b1jettison", 1);
			setprop("/sim/weight[6]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	    	if(pylon2_load == 8){
            settimer(func {
			setprop("controls/armament/station[2]/r1jettison", 1);
			setprop("/sim/weight[6]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon2_load == 9){
            settimer(func {
			setprop("controls/armament/station[2]/m2jettison", 1);
			setprop("/sim/weight[6]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon2_load == 10){
            settimer(func {
			setprop("controls/armament/station[2]/b2jettison", 1);
			setprop("/sim/weight[6]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	    else {return;}

		
}

var pylon34_jettison = func{

	var pylon3_load = getprop("/sim/weight[0]/payload-int");
	var pylon4_load = getprop("/sim/weight[7]/payload-int");
     
        # pylon 3
        	if(pylon3_load == 1){
            settimer(func {
			setprop("controls/armament/station[3]/m1jettison", 1);
			setprop("/sim/weight[0]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon3_load == 2){
            settimer(func {
			setprop("controls/armament/station[3]/m2jettison", 1);
			setprop("/sim/weight[0]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon3_load == 8){
            settimer(func {
			setprop("controls/armament/station[3]/r1jettison", 1);
			setprop("/sim/weight[0]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
        #setprop("/sim/weight[1]/selected",                   "none");
        
        # pylon 4
        
        	if(pylon4_load == 1){
            settimer(func {
			setprop("controls/armament/station[4]/m1jettison", 1);
			setprop("/sim/weight[7]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	        if(pylon4_load == 2){
            settimer(func {
			setprop("controls/armament/station[4]/m2jettison", 1);
			setprop("/sim/weight[7]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	    	if(pylon4_load == 8){
            settimer(func {
			setprop("controls/armament/station[4]/r1jettison", 1);
			setprop("/sim/weight[7]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	    }, 0.4);
	    }
	    
	    else {return;}

		
}

var tanks_jettison = func{

	var pylon1_load = getprop("/sim/weight[1]/payload-int");
	var pylon2_load = getprop("/sim/weight[6]/payload-int");
	var pylon3_load = getprop("/sim/weight[0]/payload-int");
	var pylon4_load = getprop("/sim/weight[7]/payload-int");
	var pylon5_load = getprop("/sim/weight[4]/payload-int");

	if(pylon3_load == 3){
	settimer(func {
			setprop("controls/armament/station[3]/tjettison", 1);
			setprop("/sim/weight[0]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	}, 0.1);
	settimer(func {
				setprop("controls/armament/sound/drop", 0);
	}, 0.3);
	}
	if(pylon4_load == 3){
	settimer(func {
			setprop("controls/armament/station[4]/tjettison", 1);
			setprop("/sim/weight[7]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	}, 0.4);
	settimer(func {
				setprop("controls/armament/sound/drop", 0);
	}, 0.6);
	}
	if(pylon5_load == 3){
	
	settimer(func {
			setprop("controls/armament/station[0]/tjettison", 1);
			setprop("/sim/weight[4]/selected", "none");
			setprop("controls/armament/sound/drop", 1);
	}, 0.7);
	settimer(func {
				setprop("controls/armament/sound/drop", 0);
	}, 0.9);
	}
	else {return;}
}

setlistener("controls/armament/trigger", fire_selected);
