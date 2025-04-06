//**********************************************************************
// 	Project: 
//	File: FP_Exponential_wrap.v
// 	Description: 
//	Author: Vito
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Vito		| 25/11/2024	| Initial version
//**********************************************************************
`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME(
    clk, 
    rstn,      
	ce,         
	data,  
    result,     
	nan,    // NaN标志
	zero,    // 零标志
	overflow, // 溢出标志
	underflow // 下溢标志
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
	output overflow;
	output underflow;

//**********************************************************************
// --- Module:	 FP_Natural_Logarithm
// --- Description:	
//**********************************************************************
	`getname(FP_Exponential,`MODULE_NAME) FP_Exponential_inst(
		.clk  		(clk    	),
		.rstn		(rstn		),
		.ce			(ce			),
		.data		(data		),
		.result		(result		),
		.nan		(nan		),
		.zero		(zero		),
		.overflow	(overflow	),
		.underflow	(underflow	)              
    );
endmodule