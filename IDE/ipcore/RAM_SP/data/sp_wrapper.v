
`include "define.vh"

module `MODULE_NAME (
    input clk,
    input [`DEPTH_A-1:0] ad,
    input [`WIDTH_A-1:0] din,
    input ce,
    input oce,
    input wre,
    input reset,
    output [`WIDTH_A-1:0] dout
    
    
);

`getname(sp,`MODULE_NAME) u_sp (
    .clka(clk),
    .ada(ad),
    .dina(din),
    .cea(ce),
    .ocea(oce),
    .wrea(wre),
    .reseta(reset),
    .douta(dout)
    
);



endmodule




    





