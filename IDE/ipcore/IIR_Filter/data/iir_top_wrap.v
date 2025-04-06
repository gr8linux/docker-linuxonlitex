//**********************************************************************
// 	Project: 
//	File: IIR.v
// 	Description: 
//	Author: Wenxuan
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	    | Mod. Date		| Changes Made:
// v1.0.0	| Wenxuan		| xx/06/2020	| Initial version
//**********************************************************************
`include "define.v"
`include "static_macro_define.v"

module `MODULE_NAME(
clk,
rstn,
ce,
coeff_we,
coeff_a,
coeff_b,
input_ready,
inpvalid,
`ifdef NOT_1_CHN	
ibstart,
`endif
din,
outvalid,
`ifdef NOT_1_CHN	
obstart,
`endif
dout
);

`include "parameter.v"


input clk;
input rstn; 
input ce;
input							coeff_we;
input signed [COEFF_WIDTH-1:0]	coeff_a; 
input signed [COEFF_WIDTH-1:0]	coeff_b; 
input signed [DIN_WIDTH-1:0]	din; 
output							input_ready;
input							inpvalid;
output                          outvalid;
output signed [DOUT_WIDTH-1:0]	dout;
`ifdef NOT_1_CHN
input                           ibstart;
output                          obstart;
`endif


`getname(IIR,`MODULE_NAME) IIR(
//IIR IIR(
.clk(clk),
.rstn (rstn),
.ce (ce),

.coeff_we(coeff_we),
.coeff_a(coeff_a),
.coeff_b(coeff_b),
.inpvalid(inpvalid),
`ifdef NOT_1_CHN
.ibstart(ibstart),
`endif
.din(din),
.input_ready(input_ready),
.outvalid(outvalid),
`ifdef NOT_1_CHN
.obstart(obstart),
`endif
.dout(dout)
);



endmodule
