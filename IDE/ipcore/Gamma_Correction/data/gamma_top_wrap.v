//**********************************************************************
// 	Project: 
//	File: gamma_top.v
// 	Description: 
//	Author: Wenxuan
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Wenxuan	| xx/10/2020	| Initial version
//**********************************************************************
`include "define.v"
`include "static_macro_define.v"

//module `getname(gamma_core,`module_name) (
module `MODULE_NAME(
clk,
rstn,
frame_sync,
line_sync,
inpvalid,
wr,
waddr,
wdata,
frame_sync_o,
line_sync_o,
outvalid,
`ifdef RGB
R_din,
G_din,
B_din,
R_dout,
G_dout,
B_dout
`else
Y_din,
U_din,
V_din,
Y_dout,
U_dout,
V_dout
`endif
);
//**********************************************************************
// --- paramter
//**********************************************************************
`include "parameter.v"
parameter DIN_WIDTH=`IMAGE_BITS;
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input inpvalid;
input line_sync;
input frame_sync;
input wr;
input [15:0] waddr;
input [31:0] wdata;

output line_sync_o;
output frame_sync_o;
output outvalid;
`ifdef RGB
input [DIN_WIDTH-1:0] R_din;
input [DIN_WIDTH-1:0] G_din;
input [DIN_WIDTH-1:0] B_din;
output signed [DOUT_WIDTH-1:0] R_dout;
output signed [DOUT_WIDTH-1:0] G_dout;
output signed [DOUT_WIDTH-1:0] B_dout;
`else

input [DIN_WIDTH-1:0] Y_din;
input [DIN_WIDTH-1:0] U_din;
input [DIN_WIDTH-1:0] V_din;
output signed [DOUT_WIDTH-1:0] Y_dout;
output signed [DOUT_WIDTH-1:0] U_dout;
output signed [DOUT_WIDTH-1:0] V_dout;
`endif

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname(gamma_top,`MODULE_NAME) gamma_top(
//gamma_top gamma_top(
    .clk(clk), 
    .rstn(rstn),
    .frame_sync (frame_sync),
    .line_sync (line_sync),
    .inpvalid (inpvalid),
    .wr     (wr),
    .waddr  (waddr),
    .wdata  (wdata),
    .frame_sync_o (frame_sync_o),
    .line_sync_o (line_sync_o),
    .outvalid (outvalid),
`ifdef RGB
    .R_din (R_din),
    .G_din (G_din),
    .B_din (B_din),
    .R_dout     (R_dout),
    .G_dout     (G_dout),
    .B_dout     (B_dout)
 `else
    .Y_din (Y_din),
    .U_din (U_din),
    .V_din (V_din),
    .Y_dout     (Y_dout),
    .U_dout     (U_dout),
    .V_dout     (V_dout)
`endif
);

endmodule
