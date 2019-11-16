##########################################
# Match heading bug to current heading
##########################################

var setheadingbug = func{
    var currentmagheading= getprop("orientation/heading-magnetic-deg");
    setprop("autopilot/settings/heading-bug-deg",currentmagheading);
}