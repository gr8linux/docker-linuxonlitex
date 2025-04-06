`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME(
    clk, 
    rstn,      
	ce,         
	data,  
    result,     
	nan,    // NaN标志
	zero    // 零标志
);
	
//**********************************************************************
// --- Parameter
//**********************************************************************


//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input clk, rstn, ce;
	input [31:0] data;
	output [31:0] result;
	output nan;
	output zero;

//**********************************************************************
// --- Module:	 FP_Natural_Logarithm
// --- Description:	
//**********************************************************************
	`getname(FP_Natural_Logarithm,`MODULE_NAME) FP_Natural_Logarithm_inst(
		.clk  		(clk    	),
		.rstn		(rstn		),
		.ce			(ce			),
		.data		(data		),
		.result		(result		),
		.nan		(nan		),
		.zero		(zero		)               
    );
endmodule