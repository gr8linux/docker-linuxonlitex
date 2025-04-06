`include "define.vh"
`include "static_macro_define.v"


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
    `ifdef DIV_BY_ZERO
    division_by_zero, //除零
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
    input  [31:0]                 data_b;
    `ifdef CE
        input ce;
    `endif

// --- output ---
    output wire [31:0] result;

	`ifdef OVERFLOW
	output wire overflow;  // 溢出标志
	`endif
	`ifdef UNDERFLOW
	output wire underflow; // 低于有效数值范围标志
	`endif
	`ifdef NAN
	output wire nan;       // NaN标志
	`endif
	`ifdef ZERO
	output wire zero;      // 零标志
	`endif
    `ifdef DIV_BY_ZERO
    output wire division_by_zero; //除零
    `endif 
//*************************************************************
//*************-- Float2Fix
//************************************************************
	`getname(FP_Div,`MODULE_NAME) FP_Div_inst(
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
        `ifdef DIV_BY_ZERO
        .division_by_zero(division_by_zero), //除零
        `endif 
        .result(result)
    );
endmodule


