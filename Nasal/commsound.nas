##########################################
# Click Sounds
##########################################

var comms = func (name, timeout=3.8) {
    var sound_comms = "/controls/sound/comms/gc-" ~ name;

    # Play the sound
    setprop(sound_comms, 1);

    # Reset the property after 4 seconds so that the sound can be
    # played again.
    settimer(func {
        setprop(sound_comms, 0);
    }, timeout);
};