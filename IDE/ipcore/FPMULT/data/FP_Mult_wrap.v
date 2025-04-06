`include "define.vh"
`include "static_macro_define.v"
//**********************************************************************
// --- Module:	 FP_Mult_Top
//**********************************************************************
module `MODULE_NAME(
    clk,       // 时钟信号
    rstn,      // 复位信号（低电平有效）
	`ifdef CE
	ce,        // 时钟使能信号
	`endif
    data_a,    // 输入数据A
    data_b,    // 输入数据B
	`ifdef OVERFLOW
	overflow,  // 溢出标志
	`endif
	`ifdef UNDERFLOW
	underflow, // 低于有效数值范围标志
	`endif
	`ifdef NAN
	nan,       // NaN标志
	`endif
	`ifdef ZERO
	zero,      // 零标志
	`endif
    result     // 计算结果
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
// --- Module:	 FP_Mult
//**********************************************************************
	`getname(FP_Mult,`MODULE_NAME) FP_Mult_inst(
        .clk(clk),
        .rstn(rstn),
		`ifdef CE
        .ce(ce),
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