`include "define.vh"
`include "static_macro_define.v"
//**********************************************************************
// --- Module:	Fixed_to_Float_Top
//**********************************************************************

module `MODULE_NAME(
    clk,       // 时钟信号
	`ifdef CE
	ce,        // 时钟使能信号
	`endif
    rstn,
    data_a,    // 输入数据A
    result     // 计算结果
);

`include "parameter.vh"
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


//    **********************************************************************
// --- Module:	 Fixed_to_Float
//**********************************************************************

	`getname(Fixed_to_Float,`MODULE_NAME) Fixed_to_Float_inst(
        .clk(clk),
        .rstn(rstn),
		`ifdef CE
        .ce(ce),
		`endif
        .data_a(data_a),
        .result(result)
    );
    defparam Fixed_to_Float_inst.INTEGER_WIDTH = INTEGER_WIDTH;

endmodule