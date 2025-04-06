
`include "define.vh"

//WRITE_MODE: 00:normal; 01:write through; 10:read before write
//READ_MODE: 0:bypass;  1:pipeline


module `MODULE_NAME(
    input clka,
    input [`DEPTH_A-1:0] ada,
    input [`WIDTH_A-1:0] din,
    input cea,
    
    input clkb,
    input [`DEPTH_B-1:0] adb,
    input ceb,
    input oce,
    input reset,
    output [`WIDTH_B-1:0] dout
    
);

`getname(sdp,`MODULE_NAME) u_sdp(
    .clka(clka),
    .ada(ada),
    .dina(din),
    .cea(cea),
    .wrea(1'b1),
    .clkb(clkb),
    .adb(adb),
    .ceb(ceb),
    .oceb(oce),
    .resetb(reset),
    .doutb(dout)
    
);


endmodule




    





