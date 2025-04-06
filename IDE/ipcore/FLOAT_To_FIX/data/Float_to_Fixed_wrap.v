`include "define.vh"
`include "static_macro_define.v"


module `MODULE_NAME(
    clk,       // 时钟信号
    `ifdef CE
    ce,        // 时钟使能信号
    `endif
    `ifdef OVERFLOW 
    overflow,        //Out of range
    `endif
    `ifdef UNDERFLOW
    underflow,      //Not enough precision
    `endif
    `ifdef NaN
    nan,        //Undefine
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

    `ifdef OVERFLOW 
    output wire overflow;        //Out of range
    `endif
    `ifdef UNDERFLOW
    output wire underflow;      //Not enough precision
    `endif
    `ifdef NaN
    output wire nan;        //Undefine
    `endif
//*************************************************************
//*************-- Float_to_Fixed_inst
//************************************************************
    `getname(Float_to_Fixed, `MODULE_NAME) Float_to_Fixed_inst(
        .clk(clk),
        
        `ifdef CE
        .ce(ce),
        `endif

        `ifdef OVERFLOW 
        .overflow(overflow),        //Out of range
        `endif

        `ifdef UNDERFLOW
        .underflow(underflow),      //Not enough precision
        `endif

        `ifdef NaN
        .nan(nan),        //Undefine
        `endif
        .rstn(rstn),
        .data_a(data_a),
        .result(result)
    );
defparam Float_to_Fixed_inst.INTEGER_WIDTH = INTEGER_WIDTH;


endmodule