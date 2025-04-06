//**********************************************************************
// 	Project: 
//	File: BLC_top_wrap.v
// 	Description: 
//	Author: 
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	|       	| xx/08/2024	| Initial version
//**********************************************************************
`include "define.v"
`include "static_macro_define.v"
module  `MODULE_NAME (
//module BLC_top_wrap(
clk,
rstn,
ce,
waddr,
wdata,
wr,
frame_sync,
line_sync,
inpvalid,
din,
frame_sync_o,
line_sync_o,
outvalid,
dout

);
//**********************************************************************
// --- paramter
//**********************************************************************
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input ce;
input [15:0] waddr;
input [15:0] wdata;
input wr;

input frame_sync;
input line_sync;
input inpvalid;
input [`IMAGE_BITS-1:0] din;

output frame_sync_o;
output line_sync_o;
output outvalid;
output [`IMAGE_BITS-1:0] dout;

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname(BLC_top,`MODULE_NAME) BLC_top(
//BLC_top BLC_top(
    .clk        (clk), 
    .rstn       (rstn),
    .ce         (ce),
    .frame_sync (frame_sync),
    .line_sync  (line_sync),
    .inpvalid   (inpvalid),
    .din        (din),
    .waddr      (waddr),
    .wdata      (wdata),
    .wr         (wr),
    .frame_sync_o   (frame_sync_o),
    .line_sync_o    (line_sync_o),
    .outvalid       (outvalid),
    .dout           (dout)

);

endmodule
