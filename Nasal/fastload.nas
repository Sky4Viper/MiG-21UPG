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
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 - Load R-73 missiles
		Pylons34R73.singleShot = 1; # timer will only be run once
		Pylons34R73.start();
        
        # pylon 1-2 - Load R-77 missiles
		Pylons12R77.singleShot = 1; # timer will only be run once
		Pylons12R77.start();
        
        # pylon 5
        #setprop("/sim/weight[2]/selected",                   "ECM pod left");
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
        
        # pylon 8 - Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AA1)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Air2 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 - Load wing droptanks
		Pylons34PTB490.singleShot = 1; # timer will only be run once
		Pylons34PTB490.start();
        
        # pylon 1-2 - Load R-77 missiles
		Pylons12R77.singleShot = 1; # timer will only be run once
		Pylons12R77.start();
        
        # pylons 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AA2)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Air3 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 - Load R-60 missiles
		Pylons34R60.singleShot = 1; # timer will only be run once
		Pylons34R60.start();
        
        # pylon 1-2 - Load R-27 missiles
		Pylons12R27.singleShot = 1; # timer will only be run once
		Pylons12R27.start();
        
        # pylon 5
        #setprop("/sim/weight[2]/selected",                   "ECM pod left");
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
        
        # pylon 8 - Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft!(AA3)...........", 1, 0.6, 0.1);
        
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
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 - Load R-73 missiles
		Pylons34R73.singleShot = 1; # timer will only be run once
		Pylons34R73.start();
        
        # pylons 1-2 Load rockets
		Pylons12Rockets.singleShot = 1; # timer will only be run once
		Pylons12Rockets.start();
        
        # pylons 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		# pylon 8 - Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft!(AG1)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground2 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 Load R-73 missiles
		Pylons34R73.singleShot = 1; # timer will only be run once
		Pylons34R73.start();
        
        # pylon 1-2 Load FAB-250 bombs
		Pylons12FAB250.singleShot = 1; # timer will only be run once
		Pylons12FAB250.start();
        
        # pylon 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		# pylon 8 - Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft!(AG2)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground3 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 Load wing droptanks
		Pylons34PTB490.singleShot = 1; # timer will only be run once
		Pylons34PTB490.start();
        
        # pylon 1-2 Load rockets
		Pylons12Rockets.singleShot = 1; # timer will only be run once
		Pylons12Rockets.start();
        
        # pylons 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Weapon stores loaded! (AG3)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground4 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 Load wing droptanks
		Pylons34PTB490.singleShot = 1; # timer will only be run once
		Pylons34PTB490.start();
        
        # pylon 1-2 Load FAB-250 bombs
		Pylons12FAB250.singleShot = 1; # timer will only be run once
		Pylons12FAB250.start();
        
        # pylons 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AG4)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground5 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylon 3-4 Load wing droptanks
		Pylons34PTB490.singleShot = 1; # timer will only be run once
		Pylons34PTB490.start();
        
        # pylon 1-2 Load FAB-500 bombs
		Pylons12FAB500.singleShot = 1; # timer will only be run once
		Pylons12FAB500.start();
        
        # pylons 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AG4)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground6 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylons 3-4
		Pylons34Rockets.singleShot = 1; # timer will only be run once
		Pylons34Rockets.start();
        
        # pylon 1-2 Load rockets
		Pylons12Rockets.singleShot = 1; # timer will only be run once
		Pylons12Rockets.start();
        
        # pylon 5-6 ECM FLARES
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
        
        # pylon 8 - Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AG6)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var Air2Ground7 = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		# pylons 3-4
		Pylons34Rockets.singleShot = 1; # timer will only be run once
		Pylons34Rockets.start();
        
        # pylon 1-2 Load FAB-250 bombs
		Pylons12FAB250.singleShot = 1; # timer will only be run once
		Pylons12FAB250.start();
        
        # pylons 5-6 ECM FLARES
        #setprop("/sim/weight[2]/selected",                   "ECM pod left");
		FLARESrearm.singleShot = 1; # timer will only be run once
		FLARESrearm.start();
        
        # pylon 7
        #setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
		GSh23rearm.singleShot = 1; # timer will only be run once
		GSh23rearm.start();
        
        # pylon 8 Load Central droptank
		Pylons8PTB490.singleShot = 1; # timer will only be run once
		Pylons8PTB490.start();
		
		#Rearming Complete
		RearmEnd.singleShot = 1; # timer will only be run once
		RearmEnd.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (AG7)...........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

var NoLoad = func()
{
    if(getprop("/gear/gear[2]/wow") == 1)
    {
        #Reset triggers
		suoTRIGGERSreset.singleShot = 1; # timer will only be run once
		suoTRIGGERSreset.start();
		
		#Unload Pylons
		PYLONSunload.singleShot = 1; # timer will only be run once
		PYLONSunload.start();
		
		#Disarm Cannon
		GSh23disarm.singleShot = 1; # timer will only be run once
		GSh23disarm.start();
		
		#Disarm Flares
		FLARESdisarm.singleShot = 1; # timer will only be run once
		FLARESdisarm.start();
		
		#Begin Rearming
		RearmStart.singleShot = 1; # timer will only be run once
		RearmStart.start();
		
		#Repack Brake chute
		CHUTErepack.singleShot = 1; # timer will only be run once
		CHUTErepack.start();
		
		#Rearming Complete
		RearmEnd2.singleShot = 1; # timer will only be run once
		RearmEnd2.start();

		#screen.log.write("Ground Crew: Re-arming aircraft! (Clean).........", 1, 0.6, 0.1);
        
    }
		else {
		screen.log.write("You must be still on the ground to reload! ", 1, 0.6, 0.1);
	}
}

#timers########################################################################################################

var suoTRIGGERSreset = maketimer(1, func(){
	commsound.comms("msg1");
	setprop("controls/armament/station[1]/release", 0);
	setprop("controls/armament/station[2]/release", 0);
	setprop("controls/armament/station[1]/m1release", 0);
	setprop("controls/armament/station[1]/m2release", 0);
	setprop("controls/armament/station[1]/m1jettison", 0);
	setprop("controls/armament/station[1]/m2jettison", 0);
	setprop("controls/armament/station[1]/r1jettison", 0);
	setprop("controls/armament/station[1]/b1jettison", 0);
	setprop("controls/armament/station[1]/b2jettison", 0);
	setprop("controls/armament/station[2]/m1release", 0);
	setprop("controls/armament/station[2]/m2release", 0);
	setprop("controls/armament/station[2]/m1jettison", 0);
	setprop("controls/armament/station[2]/m2jettison", 0);
	setprop("controls/armament/station[2]/r1jettison", 0);
	setprop("controls/armament/station[2]/b1jettison", 0);
	setprop("controls/armament/station[2]/b2jettison", 0);
	setprop("controls/armament/station[3]/m1release", 0);
	setprop("controls/armament/station[3]/m2release", 0);
	setprop("controls/armament/station[3]/m1jettison", 0);
	setprop("controls/armament/station[3]/m2jettison", 0);
	setprop("controls/armament/station[3]/tjettison", 0);
	setprop("controls/armament/station[3]/r1jettison", 0);
	setprop("controls/armament/station[3]/b1jettison", 0);
	setprop("controls/armament/station[3]/b2jettison", 0);
	setprop("controls/armament/station[4]/m1release", 0);
	setprop("controls/armament/station[4]/m2release", 0);
	setprop("controls/armament/station[4]/m1jettison", 0);
	setprop("controls/armament/station[4]/m2jettison", 0);
	setprop("controls/armament/station[4]/tjettison", 0);
	setprop("controls/armament/station[4]/r1jettison", 0);
	setprop("controls/armament/station[4]/b1jettison", 0);
	setprop("controls/armament/station[4]/b2jettison", 0);
	setprop("controls/armament/station[5]/tjettison", 0);
});

var PYLONSunload = maketimer(5, func(){
	commsound.comms("msg4");
	switchclicksound.click("detach1");
	# pylon 3
	setprop("/sim/weight[0]/selected",                   "none");
	setprop("/consumables/fuel/tank[6]/selected",        0);
    setprop("/consumables/fuel/tank[6]/capacity-gal_us", 0);
    setprop("/consumables/fuel/tank[6]/level-gal_us",    0);
	# pylon 1
    setprop("/sim/weight[1]/selected",                   "none");  
    # pylon 8
    setprop("/sim/weight[4]/selected",                   "none");
	setprop("/consumables/fuel/tank[7]/selected",        0);
    setprop("/consumables/fuel/tank[7]/capacity-gal_us", 0);
    setprop("/consumables/fuel/tank[7]/level-gal_us",    0);
	# pylon 2
	setprop("/sim/weight[6]/selected",                   "none");
    # pylon 4
    setprop("/sim/weight[7]/selected",                   "none");
	setprop("/consumables/fuel/tank[8]/selected",        0);
    setprop("/consumables/fuel/tank[8]/capacity-gal_us", 0);
    setprop("/consumables/fuel/tank[8]/level-gal_us",    0);
	#screen.log.write("Ground Crew: Pylons cleared......................", 1, 0.6, 0.1);
});

var GSh23disarm = maketimer(9, func(){
	commsound.comms("msg2");
	switchclicksound.click("detach2");
	setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
	setprop("/controls/armament/roundsLeft", 0);
	setprop("/controls/armament/roundsCount", 0);
    #screen.log.write("Ground Crew: GSh-23 gun disarmed! (0 rounds).....", 1, 0.6, 0.1);
});

var FLARESdisarm = maketimer(13, func(){
	switchclicksound.click("detach3");
	commsound.comms("msg3");
	setprop("/sim/weight[2]/selected",                   "ECM pod left");
	setprop("/sim/weight[5]/selected",                   "ECM pod right");
	setprop("/controls/armament/ecm-flares", 0);
    #screen.log.write("Ground Crew: Flares disarmed! (0 flares).........", 1, 0.6, 0.1);
});

var RearmStart = maketimer(17, func(){
	commsound.comms("msg5");
	#screen.log.write("Ground Crew: Rearming aircraft...................", 1, 0.6, 0.1);
});

var CHUTErepack = maketimer(21, func(){
	switchclicksound.click("attach1");
	commsound.comms("msg6");
	dragchute.reload();
});

var GSh23rearm = maketimer(25, func(){
	switchclicksound.click("attach2");
	commsound.comms("msg7");
	setprop("/sim/weight[3]/selected",                   "GSh-23 gun");
	setprop("/controls/armament/roundsLeft", 200);
	setprop("/controls/armament/roundsCount", 200);
    #screen.log.write("Ground Crew: GSh-23 gun re-armed! (200 rounds)...", 1, 0.6, 0.1);
});

var FLARESrearm = maketimer(29, func(){
	switchclicksound.click("attach2");
	commsound.comms("msg8");
	setprop("/sim/weight[2]/selected",                   "ECM pod left");
	setprop("/sim/weight[5]/selected",                   "ECM pod right");
	setprop("/controls/armament/ecm-flares", 120);
    #screen.log.write("Ground Crew: Flares re-armed! (120 flares).......", 1, 0.6, 0.1);
});



var Pylons12Rockets = maketimer(33, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg13");
	setprop("/sim/weight[1]/selected",                   "UB-32 rockets");
	setprop("/sim/weight[6]/selected",                   "UB-32 rockets");
	setprop("/controls/armament/rocketsLeft", 32);
	setprop("/controls/armament/rocketsCount", 32);
	#screen.log.write("Ground Crew: Pylons 1-2 loaded!......2x32 Rockets", 1, 0.6, 0.1);
});

var Pylons12R27 = maketimer(33, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg9");
	setprop("/sim/weight[1]/selected",                   "R-27 missile");
	setprop("/sim/weight[6]/selected",                   "R-27 missile");
	#screen.log.write("Ground Crew: Pylons 1-2 loaded!............2xR-27", 1, 0.6, 0.1);
});

var Pylons12R77 = maketimer(33, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg9");
	setprop("/sim/weight[1]/selected",                   "R-77 missile");
	setprop("/sim/weight[6]/selected",                   "R-77 missile");
	#screen.log.write("Ground Crew: Pylons 1-2 loaded!............2xR-77", 1, 0.6, 0.1);
});

var Pylons12FAB250 = maketimer(33, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg15");
	setprop("/sim/weight[1]/selected",                   "FAB-250 bomb");
	setprop("/sim/weight[6]/selected",                   "FAB-250 bomb");
	#screen.log.write("Ground Crew: Pylons 1-2 loaded!.........2xFAB-250", 1, 0.6, 0.1);
});

var Pylons12FAB500 = maketimer(33, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg15");
	setprop("/sim/weight[1]/selected",                   "FAB-500 bomb");
	setprop("/sim/weight[6]/selected",                   "FAB-500 bomb");
	#screen.log.write("Ground Crew: Pylons 1-2 loaded!.........2xFAB-500", 1, 0.6, 0.1);
});

var Pylons34Rockets = maketimer(37, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg14");
	setprop("/sim/weight[0]/selected",                   "UB-32 rockets");
	setprop("/sim/weight[7]/selected",                   "UB-32 rockets");
	setprop("/controls/armament/rocketsLeft", 32);
	setprop("/controls/armament/rocketsCount", 32);
	#screen.log.write("Ground Crew: Pylons 3-4 loaded!......2x32 Rockets", 1, 0.6, 0.1);
});

var Pylons34R60 = maketimer(37, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg10");
	setprop("/sim/weight[0]/selected",                   "R-60 missile");
	setprop("/sim/weight[7]/selected",                   "R-60 missile");
	#screen.log.write("Ground Crew: Pylons 3-4 loaded!............2xR-60", 1, 0.6, 0.1);
});

var Pylons34R73 = maketimer(37, func(){
	switchclicksound.click("attach3");
	commsound.comms("msg10");
	setprop("/sim/weight[0]/selected",                   "R-73 missile");
	setprop("/sim/weight[7]/selected",                   "R-73 missile");
	#screen.log.write("Ground Crew: Pylons 3-4 loaded!............2xR-73", 1, 0.6, 0.1);
});

var Pylons34PTB490 = maketimer(37, func(){
	switchclicksound.click("attach4");
	commsound.comms("msg18");
	setprop("/sim/weight[7]/selected",                   "PTB-490 tank");
	setprop("/sim/weight[0]/selected",                   "PTB-490 tank");
	setprop("/consumables/fuel/tank[6]/selected",        1);
    setprop("/consumables/fuel/tank[6]/capacity-gal_us", 127);
    setprop("/consumables/fuel/tank[6]/level-gal_us",    127);
	setprop("/consumables/fuel/tank[8]/selected",        1);
    setprop("/consumables/fuel/tank[8]/capacity-gal_us", 127);
    setprop("/consumables/fuel/tank[8]/level-gal_us",    127);
	#screen.log.write("Ground Crew: Wing droptanks loaded!.....2xPTB-490", 1, 0.6, 0.1);
});

var Pylons8PTB490 = maketimer(41, func(){
	switchclicksound.click("attach4");
	commsound.comms("msg17");
	setprop("/sim/weight[4]/selected",                   "PTB-490 tank");
	setprop("/consumables/fuel/tank[7]/selected",        1);
    setprop("/consumables/fuel/tank[7]/capacity-gal_us", 127);
    setprop("/consumables/fuel/tank[7]/level-gal_us",    127);
	#screen.log.write("Ground Crew: Central droptank loaded!.....PTB-490", 1, 0.6, 0.1);
});

var RearmEnd = maketimer(45, func(){
	commsound.comms("msg19");
	#screen.log.write("Ground Crew: Rearming complete!...................", 1, 0.6, 0.1);
});

var RearmEnd2 = maketimer(25, func(){
	commsound.comms("msg19");
	#screen.log.write("Ground Crew: Rearming complete!...................", 1, 0.6, 0.1);
});


