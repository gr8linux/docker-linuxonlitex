`include "define.vh"
`include "static_macro_define.v"
//**********************************************************************
// --- Module:	 FP_Add_Sub_Top
//**********************************************************************
module `MODULE_NAME(
    clk,
    rstn,
	`ifdef CE
	ce,
	`endif
	`ifdef ADD_SUB
	op,
	`endif
    data_a,
    data_b,
	`ifdef OVERFLOW
	overflow,
	`endif
	`ifdef UNDERFLOW
	underflow,
	`endif
	`ifdef NAN
	nan,
	`endif
	`ifdef ZERO
	zero,
	`endif
    result
    );
	
//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input 						  clk;
	input 					 	  rstn;
	input  [31:0]    		      data_a;
	input  [31:0]       		  data_b;
`ifdef CE
    input ce;
`endif
`ifdef ADD_SUB
	input op; //0做加法，1做减法
`endif
// --- output ---
`ifdef OVERFLOW
	output overflow;
`endif
`ifdef UNDERFLOW
	output underflow;
`endif
`ifdef NAN
	output nan;
`endif
`ifdef ZERO
	output zero;
`endif
	output reg [31:0] result;

//**********************************************************************
// --- Module:	 FP_Add_Sub
//**********************************************************************
	`getname(FP_Add_Sub,`MODULE_NAME) FP_Add_Sub_inst(
        .clk(clk),
        .rstn(rstn),
		`ifdef CE
        .ce(ce),
		`endif
		`ifdef ADD_SUB
		.op(op),
		`endif
        .data_a(data_a),
        .data_b(data_b),
		`ifdef OVERFLOW
        .overflow(overflow),
		`endif
		`ifdef UNDERFLOW
        .underflow(underflow),
		`endif
		`ifdef NAN
        .nan(nan),
		`endif
		`ifdef ZERO
        .zero(zero),
		`endif
        .result(result)
    );
endmodule