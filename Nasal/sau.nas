# Properties

var locks = "/autopilot/SAU/locks";
var settings = "/autopilot/SAU/settings";
var annunciators = "/autopilot/SAU/annunciators";
var internal = "/autopilot/internal";
var power = "/systems/electrical/outputs/autopilot";
var encoder =  "/instrumentation/altimeter";
var flightControls = "/controls/flight";

#var cur_altitude_ft = "/position/altitude-ft";
#var cur_pitch_deg = "/orientation/pitch-deg");
#var cur_roll_deg = "/orientation/roll-deg");


# locks
var propLocks = props.globals.getNode(locks, 1);

var lockAltHold   = propLocks.getNode("alt-hold", 1);
var lockAprHold   = propLocks.getNode("apr-hold", 1);
var lockGsHold    = propLocks.getNode("gs-hold", 1);
var lockHdgHold   = propLocks.getNode("hdg-hold", 1);
var lockNavHold   = propLocks.getNode("nav-hold", 1);
var lockRevHold   = propLocks.getNode("rev-hold", 1);
var lockRollAxis  = propLocks.getNode("roll-axis", 1);
var lockPitchAxis = propLocks.getNode("pitch-axis", 1);

# settings
var propSettings = props.globals.getNode(settings, 1);

var settingTargetAltFt          = propSettings.getNode("target-alt-ft", 1);
var settingTargetAglFt          = propSettings.getNode("target-agl-ft", 1);

#annunciators
var propAnnunciators = props.globals.getNode(annunciators, 1);

var annunciatorAp           = propAnnunciators.getNode("ap", 1);
var annunciatorApArm           = propAnnunciators.getNode("ap-arm", 1);
var annunciatorAtt          = propAnnunciators.getNode("att", 1);
var annunciatorAttArm       = propAnnunciators.getNode("att-arm", 1);
var annunciatorAlt          = propAnnunciators.getNode("alt", 1);
var annunciatorAltArm       = propAnnunciators.getNode("alt-arm", 1);
var annunciatorTfr          = propAnnunciators.getNode("tfr", 1);
var annunciatorTfrArm       = propAnnunciators.getNode("tfr-arm", 1);
var annunciatorNav          = propAnnunciators.getNode("nav", 1);
var annunciatorNavArm       = propAnnunciators.getNode("nav-arm", 1);
var annunciatorApp          = propAnnunciators.getNode("app", 1);
var annunciatorAppArm       = propAnnunciators.getNode("app-arm", 1);
var annunciatorRol          = propAnnunciators.getNode("rol", 1);
var annunciatorHdg          = propAnnunciators.getNode("hdg", 1);
var annunciatorVs           = propAnnunciators.getNode("vs", 1);
var annunciatorVsNumber     = propAnnunciators.getNode("vs-number", 1);
var annunciatorFpm          = propAnnunciators.getNode("fpm", 1);
var annunciatorAltNumber    = propAnnunciators.getNode("alt-number", 1);
var annunciatorAltAlert     = propAnnunciators.getNode("alt-alert", 1);
var annunciatorApr          = propAnnunciators.getNode("apr", 1);
var annunciatorAprArm       = propAnnunciators.getNode("apr-arm", 1);
var annunciatorGs           = propAnnunciators.getNode("gs", 1);
var annunciatorGsArm        = propAnnunciators.getNode("gs-arm", 1);
var annunciatorPtUp         = propAnnunciators.getNode("pt-up", 1);
var annunciatorPtDn         = propAnnunciators.getNode("pt-dn", 1);
var annunciatorBsHpaNumber  = propAnnunciators.getNode("bs-hpa-number", 1);
var annunciatorBsInhgNumber = propAnnunciators.getNode("bs-inhg-number", 1);
var annunciatorBeep         = propAnnunciators.getNode("beep", 1);

var valueTest = 0;
var lastValue = 0;
var newValue = 0;
var baroOffset = 0.0;
var baroChange = 1;
var minVoltageLimit = 8.0;

var altPreselect = 0;
var altButtonTimerRunning = 0;
var altButtonTimerIgnore = 0;
var altAlertOn = 0;
var altCaptured = 0;
var altDifference = 0.0;

var flightControls = 0.0;


var apInit = func {
  ##print("ap init");

  ##
  # Initialises the autopilot.
  ##
  lockAltHold.setBoolValue(0);
  lockAprHold.setBoolValue(0);
  lockGsHold.setBoolValue(0);
  lockHdgHold.setBoolValue(0);
  lockNavHold.setBoolValue(0);
  lockRevHold.setBoolValue(0);
  lockRollAxis.setBoolValue(0);
  lockPitchAxis.setBoolValue(0);
  
  settingTargetAltFt.setDoubleValue(altPreselect);
  settingTargetAglFt.setDoubleValue(altPreselect);
  
  ##annunciatorAp.getNode("state").setBoolValue(0);
  annunciatorAp.setBoolValue(0);
  annunciatorAtt.setBoolValue(0);
  annunciatorAttArm.setBoolValue(0);
  annunciatorAlt.setBoolValue(0);
  annunciatorAltArm.setBoolValue(0);
  annunciatorTfr.setBoolValue(0);
  annunciatorTfrArm.setBoolValue(0);
  annunciatorNav.setBoolValue(0);
  annunciatorNavArm.setBoolValue(0);
  annunciatorApp.setBoolValue(0);
  annunciatorAppArm.setBoolValue(0);
  annunciatorRol.setBoolValue(0);
  annunciatorHdg.getNode("state").setBoolValue(0);
  annunciatorVs.setBoolValue(0);
  annunciatorVsNumber.setBoolValue(0);
  annunciatorFpm.setBoolValue(0);
  annunciatorAltNumber.setBoolValue(0);
  annunciatorAltAlert.setBoolValue(0);
  annunciatorApr.setBoolValue(0);
  annunciatorAprArm.setBoolValue(0);
  annunciatorGs.setBoolValue(0);
  annunciatorGsArm.setBoolValue(0);
  annunciatorPtUp.setBoolValue(0);
  annunciatorPtDn.setBoolValue(0);
  annunciatorBsHpaNumber.setBoolValue(0);
  annunciatorBsInhgNumber.setBoolValue(0);
  annunciatorBeep.setBoolValue(0);
  
#  settimer(altAlert, 5.0);
}

var apPower = func {

## Monitor autopilot power
## Call apInit if the power is too low

  if (getprop(power) < minVoltageLimit) {
    newValue = 0;
  } else {
    newValue = 1;
  }

  valueTest = newValue - lastValue;
#  print("v_test = ", v_test);
  if (valueTest > 0.5) {
    # autopilot just powered up
    logprint(3, "SAU power up");
    apInit();
    # altAlert();
  } elsif (valueTest < -0.5) {
    # autopilot just lost power
    logprint(3, "SAU power lost");
    apInit();
    # annunciatorAltAlert.getNode("state").setBoolValue(0);
    # annunciatorBeep.getNode("state").setBoolValue(0);
    # note: all button and knobs disabled in functions below
  }
  lastValue = newValue;
  settimer(apPower, 0.5);
}

#######################################################################
# BUTTONS
####################################################################### 

var apBtn = func()
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorApArm.getValue() == 0){
##screen.log.write("autopilot ATT ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(1);
annunciatorAttArm.setBoolValue(0);
annunciatorAltArm.setBoolValue(0);
annunciatorTfrArm.setBoolValue(0);
annunciatorNavArm.setBoolValue(0);
annunciatorAprArm.setBoolValue(0);

annunciatorAlt.setBoolValue(0);
annunciatorAltNumber.setBoolValue(0);
annunciatorVs.setBoolValue(0);
annunciatorVsNumber.setBoolValue(0);

setprop("autopilot/locks/heading", "wing-leveler");
setprop("autopilot/locks/altitude", "vertical-speed-hold");
}
else{
##screen.log.write("autopilot ATT OFF! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
setprop("autopilot/locks/heading", "");
setprop("autopilot/locks/altitude", "");
}
}

var attBtn = func
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorAttArm.getValue() == 0){
##screen.log.write("autopilot ATT ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
annunciatorAttArm.setBoolValue(1);
annunciatorAltArm.setBoolValue(0);
annunciatorTfrArm.setBoolValue(0);
annunciatorNavArm.setBoolValue(0);
annunciatorAprArm.setBoolValue(0);

annunciatorAlt.setBoolValue(0);
annunciatorAltNumber.setBoolValue(0);
annunciatorVs.setBoolValue(1);
annunciatorVsNumber.setBoolValue(1);

setprop("autopilot/locks/altitude", "pitch-hold");
setprop("autopilot/locks/heading", "");
setprop("/autopilot/settings/target-pitch-deg", getprop("/orientation/pitch-deg"));
}
else{
##screen.log.write("autopilot ATT OFF! ", 1, 0.6, 0.1);
annunciatorAttArm.setBoolValue(0);
setprop("autopilot/locks/altitude", "");
setprop("/autopilot/settings/target-pitch-deg", 0);

annunciatorVs.setBoolValue(0);
annunciatorVsNumber.setBoolValue(0);
}
}

var altBtn = func
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorAltArm.getValue() == 0){
##screen.log.write("autopilot ALT ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
annunciatorAttArm.setBoolValue(0);
annunciatorAltArm.setBoolValue(1);
annunciatorTfrArm.setBoolValue(0);
annunciatorNavArm.setBoolValue(0);
annunciatorAprArm.setBoolValue(0);

annunciatorAlt.setBoolValue(1);
annunciatorAltNumber.setBoolValue(1);
annunciatorVs.setBoolValue(0);
annunciatorVsNumber.setBoolValue(0);
setprop("autopilot/locks/altitude", "altitude-hold");
setprop("autopilot/locks/heading", "");
var altPreselect = getprop("/position/altitude-ft");
setprop("autopilot/settings/target-altitude-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);

annunciatorAlt.setBoolValue(1);
annunciatorAltNumber.setBoolValue(1);
}
else{
##screen.log.write("autopilot ALT OFF! ", 1, 0.6, 0.1);
annunciatorAltArm.setBoolValue(0);
setprop("autopilot/locks/altitude", "");
setprop("autopilot/settings/target-altitude-ft", 0);


annunciatorAlt.setBoolValue(0);
annunciatorAltNumber.setBoolValue(0);
	
}
}

var tfrBtn = func
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorTfrArm.getValue() == 0){
##screen.log.write("autopilot TFR ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
annunciatorAttArm.setBoolValue(0);
annunciatorAltArm.setBoolValue(0);
annunciatorTfrArm.setBoolValue(1);
annunciatorNavArm.setBoolValue(0);
annunciatorAprArm.setBoolValue(0);
setprop("autopilot/locks/altitude", "agl-hold");
setprop("autopilot/locks/heading", "");
var altPreselect = getprop("/position/altitude-ft");
setprop("autopilot/settings/target-agl-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);

annunciatorAlt.setBoolValue(1);
annunciatorAltNumber.setBoolValue(1);

}
else{
##screen.log.write("autopilot TFR OFF! ", 1, 0.6, 0.1);
annunciatorTfrArm.setBoolValue(0);
setprop("autopilot/locks/altitude", "");
setprop("autopilot/settings/target-agl-ft", 0);

annunciatorAlt.setBoolValue(0);
annunciatorAltNumber.setBoolValue(0);

}
}

var navBtn = func
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorNavArm.getValue() == 0){
##screen.log.write("autopilot NAV ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
annunciatorAttArm.setBoolValue(0);
annunciatorAltArm.setBoolValue(0);
annunciatorTfrArm.setBoolValue(0);
annunciatorNavArm.setBoolValue(1);
annunciatorAprArm.setBoolValue(0);
}
else{
##screen.log.write("autopilot NAV OFF! ", 1, 0.6, 0.1);
annunciatorNavArm.setBoolValue(0);
}
}

var aprBtn = func
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorAprArm.getValue() == 0){
##screen.log.write("autopilot APP ON! ", 1, 0.6, 0.1);
annunciatorApArm.setBoolValue(0);
annunciatorAttArm.setBoolValue(0);
annunciatorAltArm.setBoolValue(0);
annunciatorTfrArm.setBoolValue(0);
annunciatorNavArm.setBoolValue(0);
annunciatorAprArm.setBoolValue(1);
}
else{
##screen.log.write("autopilot APP OFF! ", 1, 0.6, 0.1);
annunciatorAprArm.setBoolValue(0);
}
}

var knobSmallDown = func()
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorAltArm.getValue() == 1){
#screen.log.write("utopilot tgt alt -20", 1, 0.6, 0.1);
altCaptured = 0;
var altPreselect = getprop("autopilot/settings/target-altitude-ft") - 20;
setprop("autopilot/settings/target-altitude-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);
}
if (annunciatorTfrArm.getValue() == 1){
#screen.log.write("utopilot tgt alt -20", 1, 0.6, 0.1);
altCaptured = 0;
var altPreselect = getprop("autopilot/settings/target-agl-ft") - 20;
setprop("autopilot/settings/target-agl-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);
}
else {return;
}
}

var knobLargeDown = func()
{
screen.log.write("autopilot test8! ", 1, 0.6, 0.1);
}

var knobSmallUp = func()
{
if (getprop(power) < minVoltageLimit or getprop("controls/power/ap") == 0) { 
return; }
if (annunciatorAltArm.getValue() == 1){
#screen.log.write("utopilot tgt alt +20", 1, 0.6, 0.1);
altCaptured = 0;
var altPreselect = getprop("autopilot/settings/target-altitude-ft") + 20;
setprop("autopilot/settings/target-altitude-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);
}
if (annunciatorTfrArm.getValue() == 1){
#screen.log.write("utopilot tgt alt +20", 1, 0.6, 0.1);
altCaptured = 0;
var altPreselect = getprop("autopilot/settings/target-agl-ft") + 20;
setprop("autopilot/settings/target-agl-ft", altPreselect);
settingTargetAltFt.setDoubleValue(altPreselect);
}
else {return;
}
}

var knobLargeUp = func()
{
screen.log.write("autopilot test10! ", 1, 0.6, 0.1);
}

var L = setlistener(power, func {
  apPower();
  removelistener(L);
});