//**********************************************************************
// 	Project: 
//	File: RS_Decoder_top.v
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

module `MODULE_NAME(
//module RS_Decoder_Top(
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
    error_number
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

output sop_out;
output eop_out;
output outvalid;
output [`DATA_WIDTH-1:0] data_out;
output [7:0]  error_number;
//**********************************************************************
// --- Main Core
//**********************************************************************
`getname( RS_Decoder,`MODULE_NAME) RS_Decoder(
//RS_Decoder RS_Decoder(
    .clk        (clk),
    .rstn       (rstn),
    .inpvalid   (inpvalid),
    .sop_in     (sop_in),
    .eop_in     (eop_in),
    .data_in    (data_in),
    .data_out   (data_out),
    .sop_out    (sop_out),
    .eop_out    (eop_out),
    .outvalid   (outvalid),
    .error_number(error_number)
);

endmodule
