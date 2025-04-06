//**********************************************************************
// 	Project: 
//	File: ccm_top_wrap.v
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
R_din,
G_din,
B_din,
wr,
waddr,
wdata,
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
parameter DIN_WIDTH=`IMAGE_BITS;
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input inpvalid;
input line_sync;
input frame_sync;
input [DIN_WIDTH-1:0] R_din;
input [DIN_WIDTH-1:0] G_din;
input [DIN_WIDTH-1:0] B_din;
input wr;
input [15:0] waddr;
input [31:0] wdata;

output line_sync_o;
output frame_sync_o;
output outvalid;
output signed [DOUT_WIDTH-1:0] R_dout;
output signed [DOUT_WIDTH-1:0] G_dout;
output signed [DOUT_WIDTH-1:0] B_dout;

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname(ccm_top,`MODULE_NAME) ccm_top(
//ccm_top ccm_top(
    .clk(clk), 
    .rstn(rstn),
    .frame_sync (frame_sync),
    .line_sync (line_sync),
    .inpvalid (inpvalid),
    .R_din (R_din),
    .G_din (G_din),
    .B_din (B_din),
    .wr     (wr),
    .waddr  (waddr),
    .wdata  (wdata),
    .frame_sync_o (frame_sync_o),
    .line_sync_o (line_sync_o),
    .outvalid (outvalid),
    .R_dout     (R_dout),
    .G_dout     (G_dout),
    .B_dout     (B_dout)
);

endmodule
