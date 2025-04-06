`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME(
clk,
rstn,
frame_sync,
line_sync,
inpvalid,
din,
frame_sync_o,
line_sync_o,
outvalid,
R_dout,
G_dout,
B_dout

);
//**********************************************************************
// --- paramter
//**********************************************************************
`include "parameter.v"
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input signed [`IMAGE_BITS-1:0] din;
input inpvalid;
input line_sync;
input frame_sync;
output line_sync_o;
output frame_sync_o;
output outvalid;
output signed [DOUT_WIDTH-1:0] R_dout;
output signed [DOUT_WIDTH-1:0] G_dout;
output signed [DOUT_WIDTH-1:0] B_dout;

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname(cfa_top,`MODULE_NAME) cfa_top(
    .clk(clk), 
    .rstn(rstn),
    .inpvalid (inpvalid),
    .din (din),
    .frame_sync (frame_sync),
    .line_sync (line_sync),
    .outvalid (outvalid),
    .frame_sync_o (frame_sync_o),
    .line_sync_o (line_sync_o),
    .R_dout     (R_dout),
    .G_dout     (G_dout),
    .B_dout     (B_dout)
);

endmodule
