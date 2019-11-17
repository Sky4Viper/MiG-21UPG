################################################################################
#
#                     ECM SUIT
#
################################################################################
var ecmInterval = 0.1;
var ecmControl = func{
	ecmMode = getprop("controls/armament/ecm-prog");
	ecmON = getprop("controls/armament/ecm-on");
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

var ECM1 = maketimer (4, func()
{
setprop("/controls/armament/trigger2", 1);
#var ecmInterval = 0.2;
ECMOFF.restart(0.25);
#settimer(ECMOFF, 0.2);
});

var ECM2 = maketimer (5, func()
{
setprop("/controls/armament/trigger2", 1);
#var ecmInterval = 1.0;
ECMOFF.restart(0.5);
#settimer(ECMOFF, 1);
});

var ECM3 = maketimer (3, func()
{
setprop("/controls/armament/trigger2", 1);
#var ecmInterval = 2.0;
ECMOFF.restart(1.5);
#settimer(ECMOFF, 1.8);
});










