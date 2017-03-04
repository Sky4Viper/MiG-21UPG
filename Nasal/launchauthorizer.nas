props.globals.initNode("/sim/is-MP-Aircraft", 0, "BOOL");
##########################################
# Primitive Range Finder for guns and Rockets
##########################################
props.globals.initNode("/controls/armament/LAMarkerON", 0, "BOOL");

var range = 0.0;
var LArange = 6500.0;
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
var ac_alt = getprop("/position/altitude-ft");
var sin_pitch = math.sin(-ac_pitch *D2R);
var range = ac_alt/sin_pitch;

if (master_arm == 1){
RangeTest.start();
}
else{
RangeTest.stop();
setprop("/controls/armament/LAMarkerON", 0);
}
}

setlistener("controls/armament/masterarm", WeaponsHot);

var RangeTest = maketimer (0.1, func()
{
var ac_pitch = getprop("/orientation/pitch-deg");
var ac_alt = getprop("/position/altitude-ft");
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