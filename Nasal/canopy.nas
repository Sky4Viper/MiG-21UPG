print("*** LOADING canopy.nas ... ***");
################################################################################
#
#                    from m2005-5's DOORS SETTINGS
#
################################################################################

canopy     = aircraft.door.new("/sim/model/door-positions/canopy",      2, 1);


# this function manages 3 positions of canopy : close, open and half-opened
# it uses the function interpolate(property, target value, speed of animation)
# witch allows to create an animation between different positions.
# we have to use 4 different values to obtain a cycle :
#
#          d ----> half-opened (0.095) ----> d
#          ^                                 |
#          |                                 V
#        opened (1)                       closed (0)
#          ^                                 |
#          |                                 V
#          d <-- half-opened (0.1000) <----- d
#
var move_canopy = func()
{
    var position = getprop("/sim/model/door-positions/canopy/position-norm");
    #print("DEBUG position : " ~ position) ;
    
    # let's check current position :
    if(position <= 0.000)
    {
        # it's closed let's half open :
        interpolate("/sim/model/door-positions/canopy/position-norm", 0.100, 0.2);
    }
    elsif(position > 0.098 and position <= 0.102)
    {
        # it's half-opened let's open :
        interpolate("/sim/model/door-positions/canopy/position-norm", 1.000, 1);
    }
    elsif(position >= 1)
    {
        # it's opened let's half open :
        interpolate("/sim/model/door-positions/canopy/position-norm", 0.095, 1);
    }
    else
    {
        # let's close :
        interpolate("/sim/model/door-positions/canopy/position-norm", 0.000, 0.2);
    }

}

var canopy_move = func()
{
setprop("/sim/model/door-positions/canopy/position-norm", );
}


