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

var RSBN_channel = 0;
var RSBN_channel_1 = 0;
var RSBN_channel_2 = 0;
var RSBN_channel_3 = 0;
var RSBN_channel_4 = 0;
var RSBN_channel_5 = 0;
var RSBN_channel_6 = 0;
var RSBN_channel_7 = 0;
var RSBN_channel_8 = 0;

var PRMG_channel = 0;
var PRMG_channel_1 = 0;
var PRMG_channel_2 = 0;
var PRMG_channel_3 = 0;
var PRMG_channel_4 = 0;
var PRMG_channel_5 = 0;
var PRMG_channel_6 = 0;
var PRMG_channel_7 = 0;
var PRMG_channel_8 = 0;


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

var RSBN_channel_handler = func{
  var RSBN_channel = getprop("/mig21upg/instrumentation/RSBN/channel");
  var RSBN_channel_1 = getprop("/mig21upg/instrumentation/RSBN/channel-1");
  var RSBN_channel_2 = getprop("/mig21upg/instrumentation/RSBN/channel-2");
  var RSBN_channel_3 = getprop("/mig21upg/instrumentation/RSBN/channel-3");
  var RSBN_channel_4 = getprop("/mig21upg/instrumentation/RSBN/channel-4");
  var RSBN_channel_5 = getprop("/mig21upg/instrumentation/RSBN/channel-5");
  var RSBN_channel_6 = getprop("/mig21upg/instrumentation/RSBN/channel-6");
  var RSBN_channel_7 = getprop("/mig21upg/instrumentation/RSBN/channel-7");
  var RSBN_channel_8 = getprop("/mig21upg/instrumentation/RSBN/channel-8");

  if (RSBN_channel == 1) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_1); }
  if (RSBN_channel == 2) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_2); }
  if (RSBN_channel == 3) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_3); }
  if (RSBN_channel == 4) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_4); }
  if (RSBN_channel == 5) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_5); }
  if (RSBN_channel == 6) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_6); }
  if (RSBN_channel == 7) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_7); }
  if (RSBN_channel == 8) { setprop("/instrumentation/nav/frequencies/selected-mhz", RSBN_channel_8); }
  if (RSBN_channel == 9) { print("P :)"); }
}

var PRMG_channel_handler = func{
  var PRMG_channel = getprop("/mig21upg/instrumentation/PRMG/channel");
  var PRMG_channel_1 = getprop("/mig21upg/instrumentation/PRMG/channel-1");
  var PRMG_channel_2 = getprop("/mig21upg/instrumentation/PRMG/channel-2");
  var PRMG_channel_3 = getprop("/mig21upg/instrumentation/PRMG/channel-3");
  var PRMG_channel_4 = getprop("/mig21upg/instrumentation/PRMG/channel-4");
  var PRMG_channel_5 = getprop("/mig21upg/instrumentation/PRMG/channel-5");
  var PRMG_channel_6 = getprop("/mig21upg/instrumentation/PRMG/channel-6");
  var PRMG_channel_7 = getprop("/mig21upg/instrumentation/PRMG/channel-7");
  var PRMG_channel_8 = getprop("/mig21upg/instrumentation/PRMG/channel-8");

  # if (PRMG_channel == 1) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_1); }
  # if (PRMG_channel == 2) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_2); }
  # if (PRMG_channel == 3) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_3); }
  # if (PRMG_channel == 4) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_4); }
  # if (PRMG_channel == 5) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_5); }
  # if (PRMG_channel == 6) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_6); }
  # if (PRMG_channel == 7) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_7); }
  # if (PRMG_channel == 8) { setprop("/instrumentation/nav[1]/frequencies/selected-mhz", PRMG_channel_8); }
  if (PRMG_channel == 1) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_1); }
  if (PRMG_channel == 2) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_2); }
  if (PRMG_channel == 3) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_3); }
  if (PRMG_channel == 4) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_4); }
  if (PRMG_channel == 5) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_5); }
  if (PRMG_channel == 6) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_6); }
  if (PRMG_channel == 7) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_7); }
  if (PRMG_channel == 8) { setprop("/instrumentation/nav[0]/frequencies/standby-mhz", PRMG_channel_8); }
  if (PRMG_channel == 9) { print("P :)"); }
}

var ARK_init = func{
  setprop("/mig21upg/instrumentation/ARK-19/channel", 1);
  setprop("/mig21upg/instrumentation/ARK-19/channel-1", 390);
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

var PRMG_init = func{
  setprop("/mig21upg/instrumentation/PRMG/channel", 1);
  setprop("/mig21upg/instrumentation/PRMG/channel-1", 108.1);
  setprop("/mig21upg/instrumentation/PRMG/channel-2", 108.3);
  setprop("/mig21upg/instrumentation/PRMG/channel-3", 108.5);
  setprop("/mig21upg/instrumentation/PRMG/channel-4", 108.7);
  setprop("/mig21upg/instrumentation/PRMG/channel-5", 108.9);
  setprop("/mig21upg/instrumentation/PRMG/channel-6", 109.1);
  setprop("/mig21upg/instrumentation/PRMG/channel-7", 109.3);
  setprop("/mig21upg/instrumentation/PRMG/channel-8", 109.5);

  setlistener("/mig21upg/instrumentation/PRMG/channel", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-1", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-2", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-3", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-4", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-5", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-6", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-7", PRMG_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/PRMG/channel-8", PRMG_channel_handler,0,0 );
#  screen.log.write("PRMG set", 1, 0.6, 0.1);
}

var RSBN_init = func{
  setprop("/mig21upg/instrumentation/RSBN/channel", 1);
  setprop("/mig21upg/instrumentation/RSBN/channel-1", 108.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-2", 109.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-3", 110.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-4", 111.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-5", 112.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-6", 113.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-7", 114.0);
  setprop("/mig21upg/instrumentation/RSBN/channel-8", 115.0);

  setlistener("/mig21upg/instrumentation/RSBN/channel", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-1", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-2", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-3", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-4", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-5", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-6", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-7", RSBN_channel_handler,0,0 );
  setlistener("/mig21upg/instrumentation/RSBN/channel-8", RSBN_channel_handler,0,0 );
#  screen.log.write("RSBN set", 1, 0.6, 0.1);
}
