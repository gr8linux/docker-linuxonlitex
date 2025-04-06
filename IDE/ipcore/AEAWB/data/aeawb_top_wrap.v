//**********************************************************************
// 	Project: 
//	File: AEAWB_top_wrap.v
// 	Description: 
//	Author: Wx
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Wx	    | xx/03/2021	| Initial version
//**********************************************************************
`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME (
clk,
rstn,
ce,
waddr,
wdata,
wr,
rdata,
rd,
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
`include "parameter.v"
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input ce;
input [15:0] waddr;
input [31:0] wdata;
input wr;
input rd;
output [31:0] rdata;

input frame_sync;
input line_sync;
input inpvalid;
input [`IMAGE_BITS-1:0] din;
output frame_sync_o;
output line_sync_o;
output outvalid;
output [DOUT_WIDTH-1:0] dout;
//**********************************************************************
// --- Main
//**********************************************************************
 `getname(aeawb_top,`MODULE_NAME)  AEAWB_top(
    .clk(clk), 
    .rstn(rstn),
    .ce     (ce),    
    .wr     (wr),
    .wdata  (wdata),
    .waddr  (waddr),
    .rd     (rd),
    .rdata  (rdata),
    .frame_sync(frame_sync),
    .line_sync (line_sync),
    .inpvalid(inpvalid),
    .din (din),
    .frame_sync_o (frame_sync_o),
    .line_sync_o (line_sync_o),
    .outvalid   (outvalid),
    .dout       (dout)

);

endmodule
