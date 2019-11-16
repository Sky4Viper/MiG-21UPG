props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");
##########################################
# Primitive Range Finder for guns and Rockets
##########################################
props.globals.initNode("/controls/armament/LAMarkerON", 0, "BOOL");

var range = 0.0;
var LArange = 5500.0;
var LAmarkerON = 0;
var gun_powered = 0;
var master_arm = 0;
var selected_wpn = 0.0;
var pylon1_load = 0.0;
var pylon2_load = 0.0;
var pylon3_load = 0.0;
var pylon4_load = 0.0;
var pylon5_load = 0.0;
var ac_pitch = 0.0;
var ac_alt = 0.0;

var WeaponsHot = func{
var LAmarkerON = getprop("/controls/armament/LAMarkerON");
var selected_wpn = getprop("controls/armament/selectedweapon");
var master_arm = getprop("controls/armament/masterarm");
var pylon1_load = getprop("/sim/weight[1]/payload-int");
var pylon2_load = getprop("/sim/weight[6]/payload-int");
var ac_pitch = getprop("/orientation/pitch-deg");
var ac_alt = getprop("/position/altitude-agl-ft");
var sin_pitch = math.sin(-ac_pitch *D2R);
var range = ac_alt/sin_pitch;

if (master_arm == 1){
RangeSet.start();
}
else{
RangeSet.stop();
RangeTest.stop();
setprop("/controls/armament/LAMarkerON", 0);

}
}

########################### NOT YET CONNECTED

#get the current missile max launch range, and set it to a certain property
#var max_launch_range_finder = func() {
#	var cur_missile = getprop("payload/weight["~(payloads.pylon_select()[0])~"]/selected") ;
#	var min = getprop("payload/armament/" ~ cur_missile ~ "/min-fire-range-nm");
#	var max = getprop("payload/armament/" ~ cur_missile ~ "/max-fire-range-nm");
#	if ( min != nil ) {
#		setprop("instrumentation/hud/missile/min-launch-range",min);
#	}
#	if ( max != nil ) {
#		setprop("instrumentation/hud/missile/max-launch-range",max);
#	}
#	settimer( func { max_launch_range_finder(); }, 1);
#}

#meters to feet table *by3.281
#1000m=3280.84ft
#1500m=4921.26ft
#2000m=6561.68ft
#2500m=8202.1ft
#3000m=9842.52ft
#3500m=11482.94ft
#4000m=13123.36ft

setlistener("controls/armament/masterarm", WeaponsHot);


var RangeSet = maketimer (0.1, func()
{
#GSh-23 gun
if (getprop("controls/armament/selectedweapon") == 1){
LArange = 1800*3.281;
RangeTest.start();
#screen.log.write("LA Range 1800", 1, 0.6, 0.1);
}
#Rockets
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 8 or getprop("/sim/weight[6]/payload-int") == 8)){
LArange = 3000*3.281;
RangeTest.start();
#screen.log.write("LA Range 3000м", 1, 0.6, 0.1);
}
#FAB-250
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 7 or getprop("/sim/weight[6]/payload-int") == 7)){
LArange = 1700*3.281;
RangeTest.start();
#screen.log.write("LA Range 1700м", 1, 0.6, 0.1);
}
#FAB-500
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 10 or getprop("/sim/weight[6]/payload-int") == 10)){
LArange = 1500*3.281;
RangeTest.start();
#screen.log.write("LA Range 1500м", 1, 0.6, 0.1);
}
#else{
#LArange = 5000;
#screen.log.write("Range Test OFF", 1, 0.6, 0.1);
#RangeTest.stop();
#}
});

var RangeTest = maketimer (0.1, func()
{
var ac_pitch = getprop("/orientation/pitch-deg");
var ac_alt = getprop("/position/altitude-agl-ft");
var sin_pitch = math.sin(-ac_pitch *D2R);
var range = ac_alt/sin_pitch;
if (ac_pitch < 0 and range < LArange){
setprop("/controls/armament/LAMarkerON", 1);
#screen.log.write("Range Test ON", 1, 0.6, 0.1);
}
else{
setprop("/controls/armament/LAMarkerON", 0);
#screen.log.write("Range Test OFF", 1, 0.6, 0.1);
}
});