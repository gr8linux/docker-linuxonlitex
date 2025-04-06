
`include "define.vh"

module `MODULE_NAME (
    input clka,
    input [`DEPTH_A-1:0] ada,
    input [`WIDTH_A-1:0] dina,
    input cea,
    input ocea,
    input wrea,
    input reseta,
    output [`WIDTH_A-1:0] douta,
    
    input clkb,
    input [`DEPTH_B-1:0] adb,
    input [`WIDTH_B-1:0] dinb,
    input ceb,
    input oceb,
    input wreb,
    input resetb,
    output [`WIDTH_B-1:0] doutb
    
);

`getname(dp,`MODULE_NAME) u_dp (
    .clka(clka),
    .ada(ada),
    .dina(dina),
    .cea(cea),
    .ocea(ocea),
    .wrea(wrea),
    .reseta(reseta),
    .douta(douta),
    
    .clkb(clkb),
    .adb(adb),
    .dinb(dinb),
    .ceb(ceb),
    .oceb(oceb),
    .wreb(wreb),
    .resetb(resetb),
    .doutb(doutb)
    
);



endmodule




    





