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

setlistener("controls/armament/masterarm", WeaponsHot);


var RangeSet = maketimer (0.1, func()
{
if (getprop("controls/armament/selectedweapon") == 1){
LArange = 5500;
RangeTest.start();
#screen.log.write("LA Range 5100", 1, 0.6, 0.1);
}
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 8 or getprop("/sim/weight[6]/payload-int") == 8)){
LArange = 6500;
RangeTest.start();
#screen.log.write("LA Range 6500", 1, 0.6, 0.1);
}
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 7 or getprop("/sim/weight[6]/payload-int") == 7)){
LArange = 5100;
RangeTest.start();
#screen.log.write("LA Range 4800", 1, 0.6, 0.1);
}
if (getprop("controls/armament/selectedweapon") == 2 and (getprop("/sim/weight[1]/payload-int") == 10 or getprop("/sim/weight[6]/payload-int") == 10)){
LArange = 4900;
RangeTest.start();
#screen.log.write("LA Range 4900", 1, 0.6, 0.1);
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