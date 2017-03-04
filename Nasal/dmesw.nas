#dmesw.nas
#12/01/2011  Ernest Teuscher

# choix de la freq. de l'indicateur DME
#appel par dme.xml
var dme_step = func(stp){
    var swtch= getprop("instrumentation/dme/switch-position");
    swtch += stp;
    if(swtch >3)swtch=3;
    if(swtch <0)swtch=0;
    setprop("instrumentation/dme/switch-position",swtch);

    if(swtch==0){
        setprop("instrumentation/dme/frequencies/source","instrumentation/dme/frequencies/selected-mhz");
    }elsif(swtch==1){
        setprop("instrumentation/dme/frequencies/source","instrumentation/nav[0]/frequencies/selected-mhz");
    }elsif(swtch==2){
        setprop("instrumentation/dme/frequencies/source","instrumentation/dme/frequencies/selected-mhz");
    }elsif(swtch==3){
        setprop("instrumentation/dme/frequencies/source","instrumentation/nav[1]/frequencies/selected-mhz");
    }
}
