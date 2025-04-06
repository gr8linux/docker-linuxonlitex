//**********************************************************************
// 	Project: 
//	File: RS_Encoder_top.v
// 	Description: 
//	Author: Wx
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Wx	    | xx/06/2023	| Initial version
//**********************************************************************
`include "static_macro_define.v"
`include "define.v" 
module `MODULE_NAME (
//module RS_Encoder_Top(
    clk,
    rstn,
    sop_in,
    eop_in,
    inpvalid,
    data_in,
    sop_out,
    eop_out,
    outvalid,
    data_out,
    ready_in
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
input sop_in;
input eop_in;
input inpvalid;
input [`DATA_WIDTH-1:0] data_in;

output ready_in;
output sop_out;
output eop_out;
output outvalid;
output [`DATA_WIDTH-1:0] data_out;

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname( RS_Encoder,`MODULE_NAME) RS_Encoder(
//RS_Encoder RS_Encoder(
    .clk        (clk), 
    .rstn       (rstn),
    .sop_in     (sop_in),
    .eop_in     (eop_in),
    .inpvalid   (inpvalid),
    .data_in    (data_in),
    .sop_out     (sop_out),
    .eop_out     (eop_out),
    .outvalid   (outvalid),
    .data_out   (data_out),
    .ready_in  (ready_in)
);

endmodule
