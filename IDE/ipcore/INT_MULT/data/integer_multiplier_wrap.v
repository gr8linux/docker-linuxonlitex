`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
`ifdef PIPELINE
	clk,
	rstn,
`endif
	mul_a,
`ifdef DATA_B
	mul_b,
`endif
	product
    );
	
//**********************************************************************
// --- Parameter
//**********************************************************************
`include "parameter.vh"
localparam   WIDTH_P = WIDTH_A+WIDTH_B;
//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
`ifdef PIPELINE
	input wire 						  clk;
	input wire 					 	  rstn;
`endif
	input wire  [WIDTH_A-1:0]         mul_a;
`ifdef DATA_B
	input wire  [WIDTH_B-1:0]         mul_b;
`endif
// --- output ---
	output wire [WIDTH_P-1:0]  		  product;

//**********************************************************************
// --- Module:	 integer_multiplier
// --- Description:	
//**********************************************************************
`ifdef LUT
	`ifdef NON_PIPELINE
		`getname(integer_multiplier,`MODULE_NAME)	integer_multiplier_inst(
			.mul_a				( mul_a			),
		`ifdef DATA_B
			.mul_b				( mul_b			),
		`endif
			.product			( product		)
		);
		defparam integer_multiplier_inst.WIDTH_A = WIDTH_A;
		defparam integer_multiplier_inst.WIDTH_B = WIDTH_B;
		`ifdef CONSTANT_B
		defparam integer_multiplier_inst.CONSTANT_B = CONSTANT_B;
		`endif
	`endif

	`ifdef PIPELINE
		`getname(integer_multiplier,`MODULE_NAME)	integer_multiplier_inst(
			.clk				( clk		    ),
			.rstn				( rstn			),					
			.mul_a				( mul_a			),
		`ifdef DATA_B
			.mul_b				( mul_b			),
		`endif
			.product			( product		)
		);
		defparam integer_multiplier_inst.WIDTH_A = WIDTH_A;
		defparam integer_multiplier_inst.WIDTH_B = WIDTH_B;
		`ifdef CONSTANT_B
		defparam integer_multiplier_inst.CONSTANT_B = CONSTANT_B;
		`endif
		defparam integer_multiplier_inst.DELAY = DELAY;
	`endif
`endif

`ifdef DSP
	`getname(integer_multiplier,`MODULE_NAME)	integer_multiplier_inst(						
		.mul_a				( mul_a			),
	`ifdef DATA_B
		.mul_b				( mul_b			),
	`endif
		.product			( product		)
	);
	defparam integer_multiplier_inst.WIDTH_A = WIDTH_A;
	defparam integer_multiplier_inst.WIDTH_B = WIDTH_B;
	`ifdef CONSTANT_B
	defparam integer_multiplier_inst.CONSTANT_B = CONSTANT_B;
	`endif
`endif
endmodule