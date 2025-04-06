`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
		clk,
		rstn,
		
		param_valid_i,
		param_chn_i,
		param_a1_i,
		param_a2_i,
		param_a3_i,
		param_b0_i,
		param_b1_i,
		param_b2_i,
		param_max_i,
		param_min_i,
		
		data_valid_i,
		data_chn_i,
		data_fdb_i,
		data_ref_i,
		tready_o,
		
		u_valid_o,
		u_chn_o,
		u_data_o
);

//**********************************************************************
// --- Parameter
//**********************************************************************
	`include "parameter.vh"

	localparam CHN_WIDTH = (NUM_CHN>1)? $clog2(NUM_CHN):1;

//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input wire 						clk;
	input wire 					 	rstn;
	
	input wire 					 	param_valid_i;
	input wire 	[CHN_WIDTH-1:0] 	param_chn_i;
	input wire 	[DATA_WIDTH-1:0] 	param_a1_i;
	input wire 	[DATA_WIDTH-1:0] 	param_a2_i;
	input wire 	[DATA_WIDTH-1:0] 	param_a3_i;
	input wire 	[DATA_WIDTH-1:0] 	param_b0_i;
	input wire 	[DATA_WIDTH-1:0] 	param_b1_i;
	input wire 	[DATA_WIDTH-1:0] 	param_b2_i;
	input wire 	[DATA_WIDTH-1:0] 	param_max_i;
	input wire 	[DATA_WIDTH-1:0] 	param_min_i;
	
	input wire 					 	data_valid_i;
	input wire 	[CHN_WIDTH-1:0] 	data_chn_i;
	input wire 	[DATA_WIDTH-1:0] 	data_fdb_i;
	input wire 	[DATA_WIDTH-1:0] 	data_ref_i;
	
// --- output ---	
	output wire					 	tready_o;
	output wire					 	u_valid_o;
	output wire [CHN_WIDTH-1:0]		u_chn_o;
	output wire [DATA_WIDTH-1:0]	u_data_o;
	
//**********************************************************************
// --- Main core
//**********************************************************************	
	`getname(controller_3p3z,`MODULE_NAME) controller_3p3z_inst(
		.clk			( clk 			),
		.rstn			( rstn			),
		
		.param_valid_i	( param_valid_i	),
		.param_chn_i	( param_chn_i	),
		.param_a1_i		( param_a1_i	),
		.param_a2_i		( param_a2_i	),
		.param_a3_i		( param_a3_i	),				
		.param_b0_i		( param_b0_i	),
		.param_b1_i		( param_b1_i	),
		.param_b2_i		( param_b2_i	),
		.param_max_i	( param_max_i	),
		.param_min_i	( param_min_i	),
						  
		.data_valid_i	( data_valid_i	),
		.data_chn_i		( data_chn_i	),
		.data_fdb_i		( data_fdb_i	),
		.data_ref_i		( data_ref_i	),
		.tready_o		( tready_o		),
						  
		.u_valid_o		( u_valid_o		),
		.u_chn_o		( u_chn_o		),
		.u_data_o		( u_data_o		)
	);
	defparam controller_3p3z_inst.DATA_WIDTH = DATA_WIDTH;
	defparam controller_3p3z_inst.NUM_CHN = NUM_CHN;
	defparam controller_3p3z_inst.PARAM_FRACTION_WIDTH = PARAM_FRACTION_WIDTH;


endmodule
