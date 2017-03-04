# to fire selected weapon
fire_Selected = func {
                      setprop("/controls/armament/trigger", 1);
			 }

stop_Selected = func {
			    setprop("/controls/armament/trigger", 0); 
			 }

var flash_trigger = props.globals.getNode("controls/armament/trigger", 0);

# for Rockets
fire_Rocket = func {
                      setprop("/controls/armament/trigger1", 1);
			 }

stop_Rocket = func {
			    setprop("/controls/armament/trigger1", 0); 
			 }

var flash_trigger1 = props.globals.getNode("controls/armament/trigger1", 0);



# for Gun
fire_MG = func {
	            setprop("/controls/armament/trigger0", 1);
		   }

stop_MG = func {
			setprop("/controls/armament/trigger0", 0); 
		   }

var flash_trigger0 = props.globals.getNode("controls/armament/trigger0", 0);



# for Flares 
fire_FL = func {
	            setprop("/controls/armament/trigger2", 1);
		   }

stop_FL = func {
			setprop("/controls/armament/trigger2", 0); 
		   }
		   
ECM_interval = func {
	            setprop("/controls/armament/ecm/interval", 5);
		   }

ECM_P2 = func {
	            setprop("/controls/armament/ecm/burst", 1);
		   }

var flash_trigger2 = props.globals.getNode("controls/armament/trigger2", 0);



# for Bombs

drop_Bomb = func {
	            setprop("/controls/armament/trigger3", 1);
		   }

stop_Bomb = func {
			setprop("/controls/armament/trigger3", 0); 
		   }

var flash_trigger3 = props.globals.getNode("controls/armament/trigger3", 0);

#ammo left reporting
props.globals.initNode("/controls/armament/report-ammo", 0, "BOOL");


