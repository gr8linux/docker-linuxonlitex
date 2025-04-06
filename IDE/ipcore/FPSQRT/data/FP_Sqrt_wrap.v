`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
	clk,       // 时钟信号
    rstn,      // 复位信号（低电平有效）
	`ifdef CE
	ce,        // 时钟使能信号
	`endif
    data_a,    // 输入数据A
	`ifdef NAN
	nan,       // NaN标志
	`endif
	`ifdef ZERO
	zero,      // 零标志
	`endif
    `ifdef OVERFLOW
    overflow, //除零
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
    `ifdef CE
        input ce;
    `endif

// --- output ---
    output wire [31:0] result;

	`ifdef OVERFLOW
	output wire overflow;  // 溢出标志
	`endif
	`ifdef NAN
	output wire nan;       // NaN标志
	`endif
	`ifdef ZERO
	output wire zero;      // 零标志
	`endif
//*************************************************************
//*************-- Float2Fix
//************************************************************
	`getname(FP_Sqrt,`MODULE_NAME) FP_Sqrt_inst(
		.clk		(clk),       // 时钟信号
		.rstn		(rstn),      // 复位信号（低电平有效）
		`ifdef CE
		.ce			(ce),        // 时钟使能信号
		`endif
		.data_a		(data_a),    // 输入数据A
		`ifdef NAN
		.nan		(nan),       // NaN标志
		`endif
		`ifdef ZERO
		.zero		(zero),      // 零标志
		`endif
		`ifdef OVERFLOW
		.overflow	(overflow), //除零
		`endif 
		.result		(result)     // 计算结果
    );
endmodule


