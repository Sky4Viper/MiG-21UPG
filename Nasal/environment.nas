###########################################################
#               Aircondition, frost, fog and rain         #
###########################################################
var clamp = func(v, min, max) { v < min ? min : v > max ? max : v }
var FALSE = 0;
var TRUE = 1;
var acPrev = 0;
var acTimer = 0;
var LOOP_STANDARD_RATE = 0.25;
var LOOP_FAST_RATE     = 0.05;
var LOOP_SLOW_RATE     = 1.50;
var tempInsideDewTarget = 0.0;
var slope = 0.0;
#var tempInside  = 0.0;
#var tempOutside  = 0.0;
#var tempOutsideDew = 0.0;
#var tempInsideDew = 0.0;
#var tempIndex = 0.0;
#var tempGlass = 0.0;
#var frostNormOutside = 0.0;
#var frostNormInside = 0.0;
#var frostNormOutside = 0.0;
#var frostNormInside = 0.0;
#var fogmask = 0;
#var fogNorm = 0;

var splash_vec_loop = func
{
    var airspeed = getprop("/velocities/airspeed-kt");
	var airspeed_max = 120;
	var tempInside  = getprop("/environment/aircraft-effects/temperature-inside-degC");
	var tempOutside = getprop("environment/temperature-degc");
    var tempOutsideDew = getprop("environment/dewpoint-degc");
    var tempInsideDew = getprop("/environment/aircraft-effects/dewpoint-inside-degC");
    var tempIndex = getprop("/environment/aircraft-effects/glass-temperature-index"); # 0.80 = good window   0.45 = bad window
    var tempGlass = getprop("/environment/aircraft-effects/temperature-glass-degC");
	var fogNormOutside = getprop("/environment/aircraft-effects/fog-outside");
    var fogNormInside = getprop("/environment/aircraft-effects/fog-inside");
	var frostNormOutside = getprop("/environment/aircraft-effects/frost-outside");
    var frostNormInside = getprop("/environment/aircraft-effects/frost-inside");
	var fogmask = getprop("/environment/aircraft-effects/use-mask");
	var fogNorm = getprop("/environment/aircraft-effects/fog-level");
	var IsRain = getprop("/environment/rain-norm");
	var AntiIce = getprop("controls/ventilation/windshield-antiice-lever");
	var elapsed = getprop("sim/time/elapsed-sec");
	var speedTrueKt = getprop("/velocities/airspeed-kt");
	#var elapsedInit = getprop("sim/time/elapsed-at-init-sec");
	var acSetting = getprop("controls/ventilation/airconditioning-type");

	
    if (acSetting != 0) {
      # 12 second of cold or hot air has been selected.
      if (acPrev != acSetting) {
        acTimer = elapsed;
      } elsif (acTimer+12 < elapsed) {
        setprop("controls/ventilation/airconditioning-type", 0);
        acSetting = 0;
      }
    }
    acPrev = acSetting;
    tempAC = getprop("controls/ventilation/airconditioning-temperature");
    if (acSetting == -1) {
      tempAC = -200;
    } elsif (acSetting == 1) {
      tempAC = 200;
    }
	
	# Here is calculated how raindrop move over the surface of the glass

    if (airspeed > airspeed_max) {
        airspeed = airspeed_max;
    }

    airspeed = math.sqrt(airspeed / airspeed_max);
	
	var splash_x = -(-0.1 - 2 * airspeed);
	#var splash_x = -0.1 - 2 * airspeed;
    var splash_y = 0.0;
    var splash_z = -(1.0 - 1.35 * airspeed);
	#var splash_z = 1.0 - 1.35 * airspeed;
	

	
	# If the AC is turned on and on auto setting, it will slowly move the cockpit temperature toward its temperature setting.
    # The dewpoint inside the cockpit depends on the outside dewpoint and how the AC is working.
    ramRise  = (speedTrueKt * speedTrueKt)/(87*87);
    tempOutside = tempOutside + ramRise;
    tempACDew = 5;# aircondition dew point target. 5 = dry
	
	setprop("/environment/aircraft-effects/splash-vector-x", splash_x);
    setprop("/environment/aircraft-effects/splash-vector-y", splash_y);
    setprop("/environment/aircraft-effects/splash-vector-z", splash_z);
	
    ACRunning = getprop("controls/power/dcgen") == TRUE and getprop("controls/ventilation/airconditioning-enabled") == TRUE;
	

	
	# calc inside temp
    hotAir_deg_min = 2.0;# how fast does the sources heat up cockpit.
    AC_deg_min     = 6.0;
    pilot_deg_min  = 0.2;
	hotAirOnWindshield = 0.0;
    AntiIce = getprop("controls/ventilation/windshield-antiice-lever");
	
	
	
    hotAirOnWindshield = getprop("controls/power/dcgen")== TRUE?AntiIce:0;
	
	#if (AntiIce > 0 and getprop("controls/power/dcgen")== TRUE) {
    #  hotAirOnWindshield = 1.0;
    #}
	
	
	
	canopyPos = getprop("sim/model/door-positions/canopy/position-norm");
	
    if (canopyPos > 0) {
     tempInside = tempOutside;
    } else {
      tempInside = tempInside + hotAirOnWindshield * (hotAir_deg_min/(60/LOOP_SLOW_RATE)); # having hot air on windshield will also heat cockpit (10 degs/5 mins).
      if (tempInside < 37) {
        tempInside = tempInside + (pilot_deg_min/(60/LOOP_SLOW_RATE)); # pilot will also heat cockpit with 1 deg per 5 mins
      }
      # outside temp will influence inside temp:
      coolingFactor = clamp(abs(tempInside - tempOutside)*0.005, 0, 0.10);# 20 degrees difference will cool/warm with 0.10 Deg C every 1.5 second
      if (tempInside < tempOutside) {
        tempInside = clamp(tempInside+coolingFactor, -1000, tempOutside);
      } elsif (tempInside > tempOutside) {
        tempInside = clamp(tempInside-coolingFactor, tempOutside, 1000);
      }
      if (ACRunning == TRUE) {
        # AC is running and will work to adjust to influence the inside temperature
        if (tempInside < tempAC) {
          tempInside = clamp(tempInside+(AC_deg_min/(60/LOOP_SLOW_RATE)), -1000, tempAC);
        } elsif (tempInside > tempAC) {
          tempInside = clamp(tempInside-(AC_deg_min/(60/LOOP_SLOW_RATE)), tempAC, 1000);
        }
      }
    }
	
	# calc temp of glass itself
	tempGlass = tempIndex * (tempInside - tempOutside) + tempOutside;
	
	# calc dewpoint inside
    if (canopyPos > 0) {
      # canopy is open, inside dewpoint aligns to outside dewpoint instead
      tempInsideDew = tempOutsideDew;
    } else {
      tempInsideDewTarget = 0;
      if (ACRunning == TRUE) {
        # calculate dew point for inside air. When full airconditioning is achieved at tempAC dewpoint will be tempACdew.
        # slope = (outsideDew - desiredInsideDew)/(outside-desiredInside)
        # insideDew = slope*(inside-desiredInside)+desiredInsideDew
        slope = (tempOutsideDew - tempACDew)/(tempOutside-tempAC);
        tempInsideDewTarget = slope*(tempInside-tempAC)+tempACDew;
      } else {
        tempInsideDewTarget = tempOutsideDew;
      }
      if (tempInsideDewTarget > tempInsideDew) {
        tempInsideDew = clamp(tempInsideDew + 0.15, -1000, tempInsideDewTarget);
      } else {
        tempInsideDew = clamp(tempInsideDew - 0.15, tempInsideDewTarget, 1000);
      }
    }
	
	# calc fogging outside and inside on glass
    fogNormOutside = clamp((tempOutsideDew-tempGlass)*0.05, 0, 1);
    fogNormInside = clamp((tempInsideDew-tempGlass)*0.05, 0, 1);
	
	# calc frost
    if (IsRain == nil) {
      IsRain = 0;
    }
	frostSpeedInside = clamp(-tempGlass, -60, 60)/600 + (tempGlass<0?fogNormInside/50:0);
    frostSpeedOutside = clamp(-tempGlass, -60, 60)/600 + (tempGlass<0?(fogNormOutside/50 + IsRain/50):0);
    maxFrost = clamp(1 + ((tempGlass + 5) / (0 + 5)) * (0 - 1), 0, 1);# -5 is full frost, 0 is no frost
    maxFrostInside = clamp(maxFrost - clamp(tempInside/30,0,1), 0, 1);# frost having harder time to form while being constantly thawed.
    frostNormOutside = clamp(frostNormOutside + frostSpeedOutside, 0, maxFrost);
    frostNormInside = clamp(frostNormInside + frostSpeedInside, 0, maxFrostInside);
	frostNorm = frostNormOutside>frostNormInside?frostNormOutside:frostNormInside;
	#frostNorm = clamp((tempGlass-0)*-0.05, 0, 1);# will freeze below 0
	
	# recalc fogging from frost levels, frost will lower the fogging
    fogNormOutside = clamp(fogNormOutside - frostNormOutside / 4, 0, 1);
    fogNormInside = clamp(fogNormInside - frostNormInside / 4, 0, 1);
    fogNorm = fogNormOutside>fogNormInside?fogNormOutside:fogNormInside;
	
	fogmask = FALSE;
    #if (AntiIce != 0) {
    #  fogmask = TRUE;
    #}
	
	if (frostNorm <= hotAirOnWindshield and hotAirOnWindshield != 0) {
      fogmask = TRUE;
    }
	
	# internal environment
    setprop("/environment/aircraft-effects/fog-inside", fogNormInside);
    setprop("/environment/aircraft-effects/fog-outside", fogNormOutside);
    setprop("/environment/aircraft-effects/frost-inside", frostNormInside);
    setprop("/environment/aircraft-effects/frost-outside", frostNormOutside);
    setprop("/environment/aircraft-effects/temperature-glass-degC", tempGlass);
    setprop("/environment/aircraft-effects/dewpoint-inside-degC", tempInsideDew);
    setprop("/environment/aircraft-effects/temperature-inside-degC", tempInside);
    # effects
    setprop("/environment/aircraft-effects/frost-level", frostNorm);
    setprop("/environment/aircraft-effects/fog-level", fogNorm);
    setprop("/environment/aircraft-effects/use-mask", fogmask);

    settimer( func {splash_vec_loop() },0.5);
}
splash_vec_loop();