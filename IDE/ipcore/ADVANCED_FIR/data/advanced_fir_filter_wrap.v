`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
		clk,
		rstn,
		
		fir_rfi_o,
		fir_valid_i,
		fir_sync_i,
		fir_data_i,
	
		
		fir_valid_o,
		fir_sync_o,
`ifdef HILBERT_I
        fir_dataI_o,
`endif
		fir_data_o
    );
	
//**********************************************************************
// --- Parameter
//**********************************************************************
`include "parameter.vh"

//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input wire 						clk;
	input wire 					 	rstn;
	
	input wire 					 	fir_valid_i;
	input wire 					 	fir_sync_i;
	input wire 	[DIN_WIDTH-1:0] 	fir_data_i;
	
// --- output ---
	output wire						fir_rfi_o;

	output wire 					fir_valid_o;
	output wire					 	fir_sync_o;
	output wire [DOUT_WIDTH-1:0]	fir_data_o;
`ifdef HILBERT_I
	output  	[DIN_WIDTH-1:0]		fir_dataI_o;
`endif
//**********************************************************************
// --- Internal Signal Declaration
//**********************************************************************



//**********************************************************************
// --- Module:	 advanced_fir_filter
// --- Description:	
//**********************************************************************

	`getname(advanced_fir_filter,`MODULE_NAME)  advanced_fir_filter_inst(
		.clk				( clk		    ),
		.rstn				( rstn			),
							
		.fir_rfi_o			( fir_rfi_o		),
		.fir_valid_i		( fir_valid_i	),
		.fir_sync_i			( fir_sync_i	),
		.fir_data_i			( fir_data_i	),
		
		.fir_valid_o		( fir_valid_o	),
		.fir_sync_o			( fir_sync_o	),
    `ifdef HILBERT_I
		.fir_dataI_o		( fir_dataI_o	),
	`endif
		.fir_data_o			( fir_data_o	)
	);
	defparam advanced_fir_filter_inst.DIN_WIDTH = DIN_WIDTH;
	defparam advanced_fir_filter_inst.COEFF_WIDTH = COEFF_WIDTH;
	defparam advanced_fir_filter_inst.DOUT_WIDTH = DOUT_WIDTH;
	defparam advanced_fir_filter_inst.TAPS_SIZE = TAPS_SIZE;
	defparam advanced_fir_filter_inst.NUM_TDM = NUM_TDM;
	defparam advanced_fir_filter_inst.NUM_CHN = NUM_CHN;
	defparam advanced_fir_filter_inst.NUM_FACTOR = NUM_FACTOR;
`ifdef fir_type_fractional	
	defparam advanced_fir_filter_inst.NUM_FACTOR_P = NUM_FACTOR_P;
`endif
	defparam advanced_fir_filter_inst.COEFF_PATH = COEFF_PATH;
	
endmodule