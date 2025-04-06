
`include "define.vh"

module `MODULE_NAME (
    input clk,
    input [`DEPTH_A-1:0] ad,
    input ce,
    input oce,
    input reset,
    output [`WIDTH_A-1:0] dout
    
    
);

`getname(rom,`MODULE_NAME) u_rom (
    .clka(clk),
    .ada(ad),
    .cea(ce),
    .ocea(oce),
    .reseta(reset),
    .douta(dout)
    
);



endmodule




    





