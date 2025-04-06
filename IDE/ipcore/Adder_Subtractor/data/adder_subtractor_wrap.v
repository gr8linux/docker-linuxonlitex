`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
	`ifdef PIPELINE
		clk,
		rstn,
	`endif
		data_a,
	`ifdef DATA_B
		data_b,
	`endif
	`ifdef CIN
		cin,
	`endif
	`ifdef ADD_SUB
		add_sub,
	`endif
	`ifdef COUT
		cout,
	`endif
		result
    );
	
//**********************************************************************
// --- Parameter
//**********************************************************************
`include "parameter.vh"
`ifdef DATA_B
	localparam K = (A_WIDTH>=B_WIDTH)?A_WIDTH:B_WIDTH;
`endif
`ifdef CONSTANT_B
	localparam K = A_WIDTH;
`endif
//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
`ifdef PIPELINE
	input wire 				    clk;
	input wire 					rstn;
`endif

`ifdef CIN
	input wire 					cin;
`endif

	input wire  [A_WIDTH-1:0]   data_a;
	
`ifdef DATA_B
	input wire  [B_WIDTH-1:0]   data_b;
`endif

`ifdef CONSTANT_B
	reg [A_WIDTH-1:0] 			data_b;
`endif

`ifdef ADD_SUB
	input wire                  add_sub;
`endif
	
// --- output ---
`ifdef OVERFLOW
	output wire [K:0]  			result;
`else
	output wire [K-1:0]  		result;
`endif

`ifdef COUT
    output wire   		        cout;
`else
    wire   		        cout;
`endif

//**********************************************************************
// --- Module:	 add_sub
// --- Description:	
//**********************************************************************

`ifdef NON_PIPELINE
	`getname(adder_subtractor,`MODULE_NAME)	adder_subtractor_inst(
    .data_a (   data_a   ),
	`ifdef DATA_B
    .data_b (   data_b   ),
	`endif
	`ifdef CIN
    .cin    (   cin     ),
	`endif
	`ifdef ADD_SUB
	.add_sub(   add_sub  ),
	`endif
	`ifdef COUT
	.cout   (   cout     ),
	`endif
    .result (   result   )
);
	defparam adder_subtractor_inst.A_WIDTH = A_WIDTH;
	`ifdef DATA_B
		defparam adder_subtractor_inst.B_WIDTH = B_WIDTH;
	`endif
	`ifdef CONSTANT_B
		defparam adder_subtractor_inst.CONSTANT_B = CONSTANT_B;
	`endif

`endif

`ifdef PIPELINE
	`getname(adder_subtractor,`MODULE_NAME)	adder_subtractor_inst(
    .clk    (   clk      ),
    .rstn   (   rstn     ),
    .data_a (   data_a   ),
	`ifdef DATA_B
    .data_b (   data_b   ),
	`endif
	`ifdef CIN
    .cin    (   cin     ),
	`endif
	`ifdef ADD_SUB
	.add_sub(   add_sub  ),
	`endif
	`ifdef COUT
	.cout   (   cout     ),
	`endif
    .result (   result   )
);
	defparam adder_subtractor_inst.A_WIDTH = A_WIDTH;
	`ifdef DATA_B
		defparam adder_subtractor_inst.B_WIDTH = B_WIDTH;
	`endif
	`ifdef CONSTANT_B
		defparam adder_subtractor_inst.CONSTANT_B = CONSTANT_B;
	`endif
	defparam adder_subtractor_inst.DELAY = DELAY;
`endif
endmodule