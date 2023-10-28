
//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    tflite_img_buf your_instance_name(
        .dout(dout_o), //output [31:0] dout
        .clka(clka_i), //input clka
        .cea(cea_i), //input cea
        .reseta(reseta_i), //input reseta
        .clkb(clkb_i), //input clkb
        .ceb(ceb_i), //input ceb
        .resetb(resetb_i), //input resetb
        .oce(oce_i), //input oce
        .ada(ada_i), //input [13:0] ada
        .din(din_i), //input [7:0] din
        .adb(adb_i) //input [11:0] adb
    );

//--------Copy end-------------------
