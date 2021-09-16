################################################################################
#
#                     ECM SUIT
#
################################################################################
var ecmInterval = 0.1;
var ecmControl = func{
	ecmMode = getprop("controls/armament/ecm-prog");
	ecmON = getprop("controls/armament/ecm-on");
	ecmFlares = getprop("controls/armament/ecm-flares");
	if (ecmMode == 0 and ecmON ==1){
	#screen.log.write("Select ECM program! ", 1, 0.6, 0.1);
	}
	else if (ecmMode > 0 and ecmON ==1 and getprop("/sim/weight[2]/selected") != "ECM pod left" and getprop("/sim/weight[5]/selected") != "ECM pod right"){
		screen.log.write("You must have ECM pods loaded! ", 1, 0.6, 0.1);
	}
	else if (ecmMode == 1 and ecmON ==1){
		#screen.log.write("ECM PRG1 - ON", 1, 0.6, 0.1);
		ECM2.stop();
		ECM3.stop();
		ECM1.start();
		#ECMOFF.stop();
	}
	else if (ecmMode == 2 and ecmON ==1){
		#screen.log.write("ECM PRG2 - ON", 1, 0.6, 0.1);
		ECM2.start();
		ECM3.stop();
		ECM1.stop();
		#ECMOFF.stop();
	}
	else if (ecmMode == 3 and ecmON ==1){
			#screen.log.write("ECM PRG3 - ON", 1, 0.6, 0.1);
			ECM2.stop();
			ECM3.start();
			ECM1.stop();
			#ECMOFF.stop();
		}
	else {
			#screen.log.write("ECM PRG - OFF", 1, 0.6, 0.1);
			ECM1.stop();
			ECM2.stop();
			ECM3.stop();
			ECMOFF.stop();
			setprop("/controls/armament/trigger2", 0);
	}
}

setlistener("controls/armament/ecm-on", ecmControl);

#var ECMOFF = func()
#{
#setprop("/controls/armament/trigger2", 0);
#}

var ECMOFF = maketimer (ecmInterval, func()
{
setprop("/controls/armament/trigger2", 0);
});

#2x1 flare every 3 seconds
var ECM1 = maketimer (3, func()
{
	if (getprop("/controls/armament/ecm-flares") > 0){
	setprop("/controls/armament/trigger2", 1);
    setprop("/controls/armament/ecm-flares", getprop("/controls/armament/ecm-flares") - 2);
	#screen.log.write("Flares left: 2x" ~ getprop("/controls/armament/ecm-flares"), 1, 0.6, 0.1);
	ECMOFF.restart(0.25);
	}
	else {
	screen.log.write("Flares Out", 1, 0.6, 0.1);
	setprop("/controls/armament/ecm-on", 0);
	switchclicksound.click("switch");
	ECM1.stop();
	}
});

#2x3 flares every 6 seconds
var ECM2 = maketimer (6, func()
{
	if (getprop("/controls/armament/ecm-flares") > 0){
	setprop("/controls/armament/trigger2", 1);
    setprop("/controls/armament/ecm-flares", getprop("/controls/armament/ecm-flares") - 6);
	#screen.log.write("Flares left: 2x" ~ getprop("/controls/armament/ecm-flares"), 1, 0.6, 0.1);
	ECMOFF.restart(0.75);
	}
	else {
	screen.log.write("Flares Out", 1, 0.6, 0.1);
	setprop("/controls/armament/ecm-on", 0);
	switchclicksound.click("switch");
	ECM2.stop();
	}
});

#2x6 flares every 9 seconds
var ECM3 = maketimer (9, func()
{
	if (getprop("/controls/armament/ecm-flares") > 0){
	setprop("/controls/armament/trigger2", 1);
    setprop("/controls/armament/ecm-flares", getprop("/controls/armament/ecm-flares") - 12);
	#screen.log.write("Flares left: 2x" ~ getprop("/controls/armament/ecm-flares"), 1, 0.6, 0.1);
	ECMOFF.restart(1.5);
	}
	else {
	screen.log.write("Flares Out", 1, 0.6, 0.1);
	setprop("/controls/armament/ecm-on", 0);
	switchclicksound.click("switch");
	ECM3.stop();
	}
});










