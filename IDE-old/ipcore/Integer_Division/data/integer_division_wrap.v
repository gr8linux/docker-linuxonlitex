`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME (
    clk,
    rstn,
    dividend,
    divisor,
	`ifdef HAS_REMAINDER
    remainder,
	`endif
	`ifdef FRACTIONAL
    remainder,
	`endif
	quotient
);
//**********************************************************************
// --- Parameter
//**********************************************************************
`include "parameter.vh"
// --- input ---
    input clk;
    input rstn;
	input [N-1:0] dividend;
    input [M-1:0] divisor;
// --- output ---	
	output reg [N-1:0] quotient;
`ifdef HAS_REMAINDER
	output reg [M-1:0] remainder;
	`getname(integer_division,`MODULE_NAME) integer_division_inst(
		.clk					( clk				), 
       	.rstn					( rstn				),
		.dividend				( dividend			), 
       	.divisor				( divisor			),
		.quotient        	    ( quotient 			),
		.remainder        	    ( remainder 		)
		);
    defparam integer_division_inst.N = N;
	defparam integer_division_inst.M = M;
	defparam integer_division_inst.LATENCY = LATENCY;
`endif

`ifdef NO_REMAINDER
	`getname(integer_division,`MODULE_NAME) integer_division_inst(
		.clk					( clk				), 
       	.rstn					( rstn				),
		.dividend				( dividend			), 
       	.divisor				( divisor			),
		.quotient        	    ( quotient 			)
		);
    defparam integer_division_inst.N = N;
	defparam integer_division_inst.M = M;
	defparam integer_division_inst.LATENCY = LATENCY;
`endif

`ifdef FRACTIONAL
	output reg [Q-1:0] remainder;
	`getname(integer_division,`MODULE_NAME) integer_division_inst(
		.clk					( clk				), 
       	.rstn					( rstn				),
		.dividend				( dividend			), 
       	.divisor				( divisor			),
		.quotient        	    ( quotient 			),
		.remainder        	    ( remainder 		)
		);
    defparam integer_division_inst.N = N;
	defparam integer_division_inst.M = M;
	defparam integer_division_inst.Q = Q;
	defparam integer_division_inst.LATENCY = LATENCY;
`endif
endmodule
