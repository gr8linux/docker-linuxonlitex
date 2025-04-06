//**********************************************************************
// 	Project: 
//	File: CIC_Filter_wrap.v
// 	Description: 
//	Author: Jacky
//  Timestamp: 
//----------------------------------------------------------------------
// Code Revision History:
// Ver:		| Author 	| Mod. Date		| Changes Made:
// v1.0.0	| Jacky		| 03/05/2022	| Initial version
//**********************************************************************
`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME (
	clk, 
    rstn,
		
	in_valid,
	in_data,
	
	out_valid,
	out_data
);

`include "parameter.vh"
// --- input ---
	input                           	clk; 
    input                           	rstn;
	
	input  			 	                in_valid;
	input signed [DIN_WIDTH-1:0] 	    in_data;
	
// --- output ---	
	output 					            out_valid;
	output signed [DOUT_WIDTH-1:0]		out_data;

	`getname(CIC_Filter,`MODULE_NAME) CIC_Filter(
		.clk					( clk				), 
       	.rstn					( rstn				),
		.in_valid        		( in_valid 		    ),
		.in_data        	    ( in_data 			),
		.out_valid        	    ( out_valid 		),
		.out_data        	    ( out_data			)
);
    defparam CIC_Filter.R = R;
	defparam CIC_Filter.M = M;
	defparam CIC_Filter.N = N;
	defparam CIC_Filter.DIN_WIDTH = DIN_WIDTH;

	`ifdef DECIMATOR
		defparam CIC_Filter.DOUT_WIDTH = DIN_WIDTH+N*$clog2(R*M);
		defparam CIC_Filter.MODE = 0;
	`elsif INTERPOLATOR
		defparam CIC_Filter.DOUT_WIDTH = DIN_WIDTH+N*$clog2(R*M)-$clog2(R);
		defparam CIC_Filter.MODE = 1;
	`endif


endmodule
