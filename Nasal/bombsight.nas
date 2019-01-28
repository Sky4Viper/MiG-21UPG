##########################################
# Click Sounds
##########################################

var click = func (name, timeout=0.1) {
    var sound_prop = "/controls/power/sound/click-" ~ name;

    # Play the sound
    setprop(sound_prop, 1);

    # Reset the property after 0.2 seconds so that the sound can be
    # played again.
    settimer(func {
        setprop(sound_prop, 0);
    }, timeout);
};