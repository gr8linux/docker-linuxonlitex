//**********************************************************************
// 	Project: 
//	File: BCH_Encoder_top_wrap.v
// 	Description: 
//	Author: Wenxuan
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Wenxuan	| xx/02/2022	| Initial version
//**********************************************************************
`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME (
//module BCH_Encoder_Top_wrap(
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
    ready
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
input [`DIN_WIDTH-1:0] data_in;
output ready;
output sop_out;
output eop_out;
output outvalid;
output [`DOUT_WIDTH-1:0] data_out;

//**********************************************************************
// --- Main Core
//**********************************************************************
`getname(BCH_Encoder,`MODULE_NAME) BCH_Encoder(
//BCH_Encoder BCH_Encoder(
    .clk        (clk), 
    .rstn       (rstn),
    .sop_in     (sop_in),
    .eop_in     (eop_in),
    .inpvalid   (inpvalid),
    .data_in    (data_in),
    .sop_out    (sop_out),
    .eop_out    (eop_out),
    .outvalid   (outvalid),
    .data_out   (data_out),
    .ready      (ready)
);

endmodule
