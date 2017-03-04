################################################################################
#
#                     EXTERNAL STORES SETTINGS
#
################################################################################

# Here is where quick load management is managed...
# These 4 function can't be active when flying : This mean a little preparation for the mission
# It's an anti kiddo script
var Air2Air1 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[6]/selected",        0);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "R-77 missile");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[7]/selected",        1);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    127);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "R-77 missile");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[8]/selected",        0);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
		
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AA1)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Air2 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[6]/selected",        1);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    127);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "R-77 missile");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "none");
		setprop("/consumables/fuel/tank[7]/selected",        0);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "R-77 missile");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[8]/selected",        1);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    127);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AA2)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Air3 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "R-60 missile");
		setprop("/consumables/fuel/tank[6]/selected",        0);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "R-27 missile");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[7]/selected",        1);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    127);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "R-27 missile");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "R-60 missile");
		setprop("/consumables/fuel/tank[8]/selected",        0);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AA3)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}


#
####################################### Air To Ground    ##########################################################
#

var Air2Ground1 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[6]/selected",        0);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "UB-32 rockets");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[7]/selected",        1);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    127);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "UB-32 rockets");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[8]/selected",        0);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);
		
		setprop("/controls/armament/rocketsLeft", 32);
		setprop("/controls/armament/rocketsCount", 32);

		screen.log.write("Weapon stores loaded! (AG1)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground2 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[6]/selected",        0);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "FAB-250 bomb");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[7]/selected",        1);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    127);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "FAB-250 bomb");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "R-73 missile");
		setprop("/consumables/fuel/tank[8]/selected",        0);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AG2)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground3 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[6]/selected",        1);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    127);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "UB-32 rockets");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "none");
		setprop("/consumables/fuel/tank[7]/selected",        0);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "UB-32 rockets");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[8]/selected",        1);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    127);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);
		
		setprop("/controls/armament/rocketsLeft", 32);
		setprop("/controls/armament/rocketsCount", 32);

		screen.log.write("Weapon stores loaded! (AG3)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground4 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[6]/selected",        1);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    127);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "FAB-250 bomb");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "none");
		setprop("/consumables/fuel/tank[7]/selected",        0);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "FAB-250 bomb");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[8]/selected",        1);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    127);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AG4)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground5 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[6]/selected",        1);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    127);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "FAB-500 bomb");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "ECM pod left");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "none");
		setprop("/consumables/fuel/tank[7]/selected",        0);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "ECM pod right");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "FAB-500 bomb");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "PTB-490 tank");
		setprop("/consumables/fuel/tank[8]/selected",        1);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 127);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    127);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 200);
		setprop("/controls/armament/roundsCount", 200);

		screen.log.write("Weapon stores loaded! (AG4)", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var NoLoad = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        # pylon 3
        setprop("/sim/weight[0]/selected",                   "none");
		setprop("/consumables/fuel/tank[6]/selected",        0);
        setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
        
        # pylon 1
        setprop("/sim/weight[1]/selected",                   "none");
        
        # pylon 5
        setprop("/sim/weight[2]/selected",                   "none");
        
        # pylon 7
        setprop("/sim/weight[3]/selected",                   "none");
        
        # pylon 8
        setprop("/sim/weight[4]/selected",                   "none");
		setprop("/consumables/fuel/tank[7]/selected",        0);
        setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
        
        # pylon 6
        setprop("/sim/weight[5]/selected",                   "none");
        
        # pylon 2
        setprop("/sim/weight[6]/selected",                   "none");
        
        # pylon 4
        setprop("/sim/weight[7]/selected",                   "none");
		setprop("/consumables/fuel/tank[8]/selected",        0);
        setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
		
		setprop("controls/armament/station[1]/release", 0);
		setprop("controls/armament/station[2]/release", 0);
		setprop("controls/armament/station[1]/m1release", 0);
		setprop("controls/armament/station[1]/m2release", 0);
		setprop("controls/armament/station[1]/m1jettison", 0);
		setprop("controls/armament/station[1]/m2jettison", 0);
		setprop("controls/armament/station[2]/m1release", 0);
		setprop("controls/armament/station[2]/m2release", 0);
		setprop("controls/armament/station[2]/m1jettison", 0);
		setprop("controls/armament/station[2]/m2jettison", 0);
		setprop("controls/armament/station[3]/m1release", 0);
		setprop("controls/armament/station[3]/m2release", 0);
		setprop("controls/armament/station[3]/m1jettison", 0);
		setprop("controls/armament/station[3]/m2jettison", 0);
		setprop("controls/armament/station[3]/tjettison", 0);
		setprop("controls/armament/station[4]/m1release", 0);
		setprop("controls/armament/station[4]/m2release", 0);
		setprop("controls/armament/station[4]/m1jettison", 0);
		setprop("controls/armament/station[4]/m2jettison", 0);
		setprop("controls/armament/station[4]/tjettison", 0);
		setprop("controls/armament/station[5]/tjettison", 0);
		
		setprop("/controls/armament/roundsLeft", 0);
		setprop("/controls/armament/roundsCount", 0);

		screen.log.write("Weapon stores unloaded! ", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}


