# ARK-19 scripts support

var komp_ant = 0;
var ramka = 0;
var tlg_tlf = 0;

#var ARK_volume = 0;

# var ARK_volume_handler = func{
#  var ARK_volume = getprop("/mig29/instrumentation/ARK-19/volume");
#  if ( getprop("/mig29/instrumentation/electrical/v27") > 24 and getprop("/mig29/instrumentation/electrical/v36") > 34 )
#   {
#    if ( getprop("/mig29/switches/bortsyst") == 1 ) { setprop("/instrumentation/adf/volume-norm", ARK_volume); }
#    else { setprop("/instrumentation/adf/volume-norm", ARK_volume); }
#   }
#  else { setprop("/instrumentation/adf/volume-norm", ARK_volume); }
#}

var ARK_channel = 0;
var ARK_channel_1 = 0;
var ARK_channel_2 = 0;
var ARK_channel_3 = 0;
var ARK_channel_4 = 0;
var ARK_channel_5 = 0;
var ARK_channel_6 = 0;
var ARK_channel_7 = 0;
var ARK_channel_8 = 0;
var ARK_channel_9 = 0;

 var ARK_channel_handler = func{
  var ARK_channel = getprop("/mig21upg/instrumentation/ARK-19/channel");
  var ARK_channel_1 = getprop("/mig21upg/instrumentation/ARK-19/channel-1");
  var ARK_channel_2 = getprop("/mig21upg/instrumentation/ARK-19/channel-2");
  var ARK_channel_3 = getprop("/mig21upg/instrumentation/ARK-19/channel-3");
  var ARK_channel_4 = getprop("/mig21upg/instrumentation/ARK-19/channel-4");
  var ARK_channel_5 = getprop("/mig21upg/instrumentation/ARK-19/channel-5");
  var ARK_channel_6 = getprop("/mig21upg/instrumentation/ARK-19/channel-6");
  var ARK_channel_7 = getprop("/mig21upg/instrumentation/ARK-19/channel-7");
  var ARK_channel_8 = getprop("/mig21upg/instrumentation/ARK-19/channel-8");
  var ARK_channel_9 = getprop("/mig21upg/instrumentation/ARK-19/channel-9");
  if (ARK_channel == 1) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_1); }
  if (ARK_channel == 2) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_2); }
  if (ARK_channel == 3) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_3); }
  if (ARK_channel == 4) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_4); }
  if (ARK_channel == 5) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_5); }
  if (ARK_channel == 6) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_6); }
  if (ARK_channel == 7) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_7); }
  if (ARK_channel == 8) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_8); }
  if (ARK_channel == 9) { setprop("/instrumentation/adf/frequencies/selected-khz", ARK_channel_9); }
  if (ARK_channel == 10) { print("P :)"); }
}

var ARK_init = func{
  setprop("/mig21upg/instrumentation/ARK-19/channel", 1);
  setprop("/mig21upg/instrumentation/ARK-19/channel-1", 379);
  setprop("/mig21upg/instrumentation/ARK-19/channel-2", 341);
  setprop("/mig21upg/instrumentation/ARK-19/channel-3", 360);
  setprop("/mig21upg/instrumentation/ARK-19/channel-4", 350);
  setprop("/mig21upg/instrumentation/ARK-19/channel-5", 352);
  setprop("/mig21upg/instrumentation/ARK-19/channel-6", 387);
  setprop("/mig21upg/instrumentation/ARK-19/channel-7", 316);
  setprop("/mig21upg/instrumentation/ARK-19/channel-8", 350);
  setprop("/mig21upg/instrumentation/ARK-19/channel-9", 350);
#  setprop("/mig21upg/instrumentation/ARK-19/komp-ant", 1);
#  setprop("/mig21upg/instrumentation/ARK-19/tlg-tlf", 1);
#  setprop("/mig21upg/instrumentation/ARK-19/ramka", 0);
#  setprop("/mig21upg/instrumentation/ARK-19/volume", 0.6);
  setlistener("/mig21upg/instrumentation/ARK-19/channel", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-1", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-2", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-3", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-4", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-5", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-6", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-7", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-8", ARK_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/ARK-19/channel-9", ARK_channel_handler,0,0 );
#  setlistener("/mig21upg/instrumentation/ARK-19/volume", ARK_volume_handler,0,0 );
#  setlistener("/mig21upg/instrumentation/electrical/v27", ARK_volume_handler,0,0 );
}
