
//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    frame_buffer your_instance_name(
        .douta(douta_o), //output [7:0] douta
        .doutb(doutb_o), //output [7:0] doutb
        .clka(clka_i), //input clka
        .ocea(ocea_i), //input ocea
        .cea(cea_i), //input cea
        .reseta(reseta_i), //input reseta
        .wrea(wrea_i), //input wrea
        .clkb(clkb_i), //input clkb
        .oceb(oceb_i), //input oceb
        .ceb(ceb_i), //input ceb
        .resetb(resetb_i), //input resetb
        .wreb(wreb_i), //input wreb
        .ada(ada_i), //input [14:0] ada
        .dina(dina_i), //input [7:0] dina
        .adb(adb_i), //input [14:0] adb
        .dinb(dinb_i) //input [7:0] dinb
    );

//--------Copy end-------------------
