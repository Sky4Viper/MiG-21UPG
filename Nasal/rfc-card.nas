##########################################
# Radio chanels card
##########################################

var placement_left = "RFCleft";
var placement_right = "RFCright";
var numChannels = 8;

# Channel. -Name     - ICAO   - TWR    - VOR    - NDB    - ILS
# 1. Bassel Al Assad - OSLK   - 121.90 - 114.80 -    314 - 171:109.1
# 2. Aleppo          - OSAP   - 118.10 - 114.50 -    365 - 272:110.1
# 3. Adana           - LTAF   - 118.50 - 112.70 - --//-- - 048:108.7
# 4. Incirlick       - LTAG   - 122.10 - 112.70 - --//-- - 047:109.3
# 5. Incirlick       - LTAG   - 122.10 - 112.70 - --//-- - 227:111.7
# 6. Palmyra         - OSPR   - 109.25 - --//-- -    337 - --//--
# 7. Damascus        - OSDI   - 121.90 - 116.00 - --//-- - --//--
# 8. --//--          - --//-- - --//-- - --//-- - --//-- - --//--
# 9. --//--          - --//-- - --//-- - --//-- - --//-- - --//--
# 10. --//--         - --//-- - --//-- - --//-- - --//-- - --//--

var pos = airportinfo("EINN");
var apts = findAirportsWithinRange(pos, 40);
foreach(var apt; apts){
    print(apt.name, " (", apt.id, ")");
}

var rfc_vector_name = ['Bassel Al Assad','Aleppo','Adana','Incirlick','Incirlick','Palmyra','Damascus','--//--','--//--','--//--'];
var rfc_vector_icao = ['(OSLK)','(OSAP)','(LTAF)','(LTAG)','(LTAG)','(OSPR)','(OSDI)','--//--','--//--','--//--'];
var rfc_vector_twr = ['121.90','118.10','118.50','122.10','122.10','109.25','121.90','--//--','--//--','--//--'];
var rfc_vector_vor = ['114.80','114.50','112.70','112.70','112.70','--//--','116.00','--//--','--//--','--//--'];
var rfc_vector_ndb = ['414','365','--//--','--//--','--//--','337','--//--','--//--','--//--','--//--'];
var rfc_vector_ils = ['171:109.1','272:110.1','048:108.7','047:109.3','227:111.7','--//--','--//--','--//--','--//--','--//--'];

#var my_variable = getprop("/sim/systems/my_variable");
#my_canvas_element.setText(my_variable);

var channel_card = canvas.new({
  "name": "RFC-card",   # The name is optional but allow for easier identification
  "size": [1024, 1024], # Size of the underlying texture (should be a power of 2, required) [Resolution]
  "view": [1024, 1024],  # Virtual resolution (Defines the coordinate system of the canvas [Dimensions]
                        # which will be stretched the size of the texture, required)
  "mipmapping": 1       # Enable mipmapping (optional)
});

channel_card.addPlacement({"node": placement_left});
channel_card.addPlacement({"node": placement_right});

var group = channel_card.createGroup();

# Clip 24 pixels off each side
var bgimage = group.createChild("image")
     .setFile("Aircraft/MiG-21UPG/Models/RFcard1.png")
	 #.setTranslation(100, 10)
     .setSize(1024, 1024);
     #.set("clip", "rect(24, 1000, 1000, 24)");

#NAME
var textnam1 = group.createChild("text")
                .setTranslation(150, 200)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam2 = group.createChild("text")
                .setTranslation(150, 280)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");
				
var textnam3 = group.createChild("text")
                .setTranslation(150, 360)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam4 = group.createChild("text")
                .setTranslation(150, 440)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam5 = group.createChild("text")
                .setTranslation(150, 520)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam6 = group.createChild("text")
                .setTranslation(150, 600)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam7 = group.createChild("text")
                .setTranslation(150, 680)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam8 = group.createChild("text")
                .setTranslation(150, 760)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam9 = group.createChild("text")
                .setTranslation(150, 840)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textnam10 = group.createChild("text")
                .setTranslation(150, 920)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");					
				
#ICAO
var texticao1 = group.createChild("text")
                .setTranslation(380, 200)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao2 = group.createChild("text")
                .setTranslation(380, 280)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");
				
var texticao3 = group.createChild("text")
                .setTranslation(380, 360)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao4 = group.createChild("text")
                .setTranslation(380, 440)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao5 = group.createChild("text")
                .setTranslation(380, 520)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao6 = group.createChild("text")
                .setTranslation(380, 600)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao7 = group.createChild("text")
                .setTranslation(380, 680)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao8 = group.createChild("text")
                .setTranslation(380, 760)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao9 = group.createChild("text")
                .setTranslation(380, 840)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texticao10 = group.createChild("text")
                .setTranslation(380, 920)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

#TWR
var texttwr1 = group.createChild("text")
                .setTranslation(495, 200)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr2 = group.createChild("text")
                .setTranslation(495, 280)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");
				
var texttwr3 = group.createChild("text")
                .setTranslation(495, 360)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr4 = group.createChild("text")
                .setTranslation(495, 440)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr5 = group.createChild("text")
                .setTranslation(495, 520)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr6 = group.createChild("text")
                .setTranslation(495, 600)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr7 = group.createChild("text")
                .setTranslation(495, 680)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr8 = group.createChild("text")
                .setTranslation(495, 760)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr9 = group.createChild("text")
                .setTranslation(495, 840)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var texttwr10 = group.createChild("text")
                .setTranslation(495, 920)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

#VOR
var textvor1 = group.createChild("text")
                .setTranslation(605, 200)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor2 = group.createChild("text")
                .setTranslation(605, 280)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");
				
var textvor3 = group.createChild("text")
                .setTranslation(605, 360)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor4 = group.createChild("text")
                .setTranslation(605, 440)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor5 = group.createChild("text")
                .setTranslation(605, 520)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor6 = group.createChild("text")
                .setTranslation(605, 600)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor7 = group.createChild("text")
                .setTranslation(605, 680)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor8 = group.createChild("text")
                .setTranslation(605, 760)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor9 = group.createChild("text")
                .setTranslation(605, 840)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textvor10 = group.createChild("text")
                .setTranslation(605, 920)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

#NDB
var textndb1 = group.createChild("text")
                .setTranslation(720, 200)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textndb2 = group.createChild("text")
                .setTranslation(720, 280)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");
				
var textndb3 = group.createChild("text")
                .setTranslation(720, 360)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textndb4 = group.createChild("text")
                .setTranslation(720, 440)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textndb5 = group.createChild("text")
                .setTranslation(720, 520)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textndb6 = group.createChild("text")
                .setTranslation(720, 600)       
                .setAlignment("left-center")  
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")  
                .setFontSize(30, 1.2)         
                .setColor(0.1,0.1,0.6,1)            
                .setText("This is a text element");

var textndb7 = group.createChild("text")
                .setTranslation(720, 680)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textndb8 = group.createChild("text")
                .setTranslation(720, 760)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textndb9 = group.createChild("text")
                .setTranslation(720, 840)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textndb10 = group.createChild("text")
                .setTranslation(720, 920)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

#ILS
var textils1 = group.createChild("text")
                .setTranslation(820, 200)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils2 = group.createChild("text")
                .setTranslation(820, 280)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");
				
var textils3 = group.createChild("text")
                .setTranslation(820, 360)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils4 = group.createChild("text")
                .setTranslation(820, 440)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils5 = group.createChild("text")
                .setTranslation(820, 520)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils6 = group.createChild("text")
                .setTranslation(820, 600)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils7 = group.createChild("text")
                .setTranslation(820, 680)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils8 = group.createChild("text")
                .setTranslation(820, 760)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils9 = group.createChild("text")
                .setTranslation(820, 840)
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2) 
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

var textils10 = group.createChild("text")
                .setTranslation(820, 920) 
                .setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSerif-Italic.ttf")
                .setFontSize(30, 1.2)
                .setColor(0.1,0.1,0.6,1)
                .setText("This is a text element");

# ...
textnam1.hide();
textnam2.hide();
textnam3.hide();
textnam4.hide();
textnam5.hide();
textnam6.hide();
textnam7.hide();
textnam8.hide();
textnam9.hide();
textnam10.hide();
# ...
texticao1.hide();
texticao2.hide();
texticao3.hide();
texticao4.hide();
texticao5.hide();
texticao6.hide();
texticao7.hide();
texticao8.hide();
texticao9.hide();
texticao10.hide();
# ...
texttwr1.hide();
texttwr2.hide();
texttwr3.hide();
texttwr4.hide();
texttwr5.hide();
texttwr6.hide();
texttwr7.hide();
texttwr8.hide();
texttwr9.hide();
texttwr10.hide();
# ...
textvor1.hide();
textvor2.hide();
textvor3.hide();
textvor4.hide();
textvor5.hide();
textvor6.hide();
textvor7.hide();
textvor8.hide();
textvor9.hide();
textvor10.hide();
# ...
textndb1.hide();
textndb2.hide();
textndb3.hide();
textndb4.hide();
textndb5.hide();
textndb6.hide();
textndb7.hide();
textndb8.hide();
textndb9.hide();
textndb10.hide();
# ...
textils1.hide();
textils2.hide();
textils3.hide();
textils4.hide();
textils5.hide();
textils6.hide();
textils7.hide();
textils8.hide();
textils9.hide();
textils10.hide();
# ...
#textnam1.setText(rfc_vector_name[0]).show();
#textnam2.setText(rfc_vector_name[1]).show();
#textnam3.setText(rfc_vector_name[2]).show();
#textnam4.setText(rfc_vector_name[3]).show();
#textnam5.setText(rfc_vector_name[4]).show();
#textnam6.setText(rfc_vector_name[5]).show();
#textnam7.setText(rfc_vector_name[6]).show();
#textnam8.setText(rfc_vector_name[7]).show();
#textnam9.setText(rfc_vector_name[8]).show();
#textnam10.setText(rfc_vector_name[9]).show();

var text_names = [textnam1, textnam2, textnam3, textnam4, textnam5, textnam6, textnam7, textnam8, textnam9, textnam10];
var text_icaos = [texticao1, texticao2, texticao3, texticao4, texticao5, texticao6, texticao7, texticao8, texticao9, texticao10];
var text_twrs = [texttwr1, texttwr2, texttwr3, texttwr4, texttwr5, texttwr6, texttwr7, texttwr8, texttwr9, texttwr10];
var text_vors = [textvor1, textvor2, textvor3, textvor4, textvor5, textvor6, textvor7, textvor8, textvor9, textvor10];
var text_ndbs = [textndb1, textndb2, textndb3, textndb4, textndb5, textndb6, textndb7, textndb8, textndb9, textndb10];
var text_ilss = [textils1, textils2, textils3, textils4, textils5, textils6, textils7, textils8, textils9, textils10];

#var ch_vectors = [rfc_vector_name, rfc_vector_icao, rfc_vector_twr, rfc_vector_vor, rfc_vector_ndb, rfc_vector_ils];

for(var i=0; i < numChannels; ) {
 foreach(var ch_name; text_names) {
   (ch_name).setText(rfc_vector_name[i]).show();
   i = i+1;
 }
}
# ...
#texticao1.setText(rfc_vector_icao[0]).show();
#texticao2.setText(rfc_vector_icao[1]).show();
#texticao3.setText(rfc_vector_icao[2]).show();
#texticao4.setText(rfc_vector_icao[3]).show();
#texticao5.setText(rfc_vector_icao[4]).show();
#texticao6.setText(rfc_vector_icao[5]).show();
#texticao7.setText(rfc_vector_icao[6]).show();
#texticao8.setText(rfc_vector_icao[7]).show();
#texticao9.setText(rfc_vector_icao[8]).show();
#texticao10.setText(rfc_vector_icao[9]).show();
 for(var i=0; i < numChannels; ) {
 foreach(var ch_icao; text_icaos) {
   (ch_icao).setText(rfc_vector_icao[i]).show();
   i = i+1;
 }
}
# ...
#texttwr1.setText(rfc_vector_twr[0]).show();
#texttwr2.setText(rfc_vector_twr[1]).show();
#texttwr3.setText(rfc_vector_twr[2]).show();
#texttwr4.setText(rfc_vector_twr[3]).show();
#texttwr5.setText(rfc_vector_twr[4]).show();
#texttwr6.setText(rfc_vector_twr[5]).show();
#texttwr7.setText(rfc_vector_twr[6]).show();
#texttwr8.setText(rfc_vector_twr[7]).show();
#texttwr9.setText(rfc_vector_twr[8]).show();
#texttwr10.setText(rfc_vector_twr[9]).show();
 for(var i=0; i < numChannels; ) {
 foreach(var ch_twr; text_twrs) {
   (ch_twr).setText(rfc_vector_twr[i]).show();
   i = i+1;
 }
}
# ...
#textvor1.setText(rfc_vector_vor[0]).show();
#textvor2.setText(rfc_vector_vor[1]).show();
#textvor3.setText(rfc_vector_vor[2]).show();
#textvor4.setText(rfc_vector_vor[3]).show();
#textvor5.setText(rfc_vector_vor[4]).show();
#textvor6.setText(rfc_vector_vor[5]).show();
#textvor7.setText(rfc_vector_vor[6]).show();
#textvor8.setText(rfc_vector_vor[7]).show();
#textvor9.setText(rfc_vector_vor[8]).show();
#textvor10.setText(rfc_vector_vor[9]).show();
 for(var i=0; i < numChannels; ) {
 foreach(var ch_vor; text_vors) {
   (ch_vor).setText(rfc_vector_vor[i]).show();
   i = i+1;
 }
}
# ...
#textndb1.setText(rfc_vector_ndb[0]).show();
#textndb2.setText(rfc_vector_ndb[1]).show();
#textndb3.setText(rfc_vector_ndb[2]).show();
#textndb4.setText(rfc_vector_ndb[3]).show();
#textndb5.setText(rfc_vector_ndb[4]).show();
#textndb6.setText(rfc_vector_ndb[5]).show();
#textndb7.setText(rfc_vector_ndb[6]).show();
#textndb8.setText(rfc_vector_ndb[7]).show();
#textndb9.setText(rfc_vector_ndb[8]).show();
#textndb10.setText(rfc_vector_ndb[9]).show();
 for(var i=0; i < numChannels; ) {
 foreach(var ch_ndb; text_ndbs) {
   (ch_ndb).setText(rfc_vector_ndb[i]).show();
   i = i+1;
 }
}
# ...
#textils1.setText(rfc_vector_ils[0]).show();
#textils2.setText(rfc_vector_ils[1]).show();
#textils3.setText(rfc_vector_ils[2]).show();
#textils4.setText(rfc_vector_ils[3]).show();
#textils5.setText(rfc_vector_ils[4]).show();
#textils6.setText(rfc_vector_ils[5]).show();
#textils7.setText(rfc_vector_ils[6]).show();
#textils8.setText(rfc_vector_ils[7]).show();
#textils9.setText(rfc_vector_ils[8]).show();
#textils10.setText(rfc_vector_ils[9]).show();
 for(var i=0; i < numChannels; ) {
 foreach(var ch_ils; text_ilss) {
   (ch_ils).setText(rfc_vector_ils[i]).show();
   i = i+1;
 }
}
