`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME (
	clk, 
	rstn, 
	ce,
	in_pdm_data,
	in_pdm_sclk,
	out_pcm_valid,
	out_pcm_sync,
	out_pcm_data
);

`include "parameter.vh"	

	input clk; 
	input rstn; 
	input ce;
	input [NUM_CHN-1:0] in_pdm_data;
	input in_pdm_sclk;
	output out_pcm_valid;
	output out_pcm_sync;
	output signed [DATA_WIDTH-1:0] out_pcm_data;


	`getname(pdm2pcm,`MODULE_NAME) u_pdm2pcm(
		.clk(clk), 
		.rstn(rstn),
		.ce(ce),
	
		.in_pdm_sclk(in_pdm_sclk),
		.in_pdm_data(in_pdm_data),
	
		.out_pcm_valid(out_pcm_valid),
		.out_pcm_sync(out_pcm_sync),
		.out_pcm_data(out_pcm_data)
	);
	defparam u_pdm2pcm.EDGE_MODE = EDGE_MODE;
	defparam u_pdm2pcm.TAP_SIZES = TAP_SIZES;
	defparam u_pdm2pcm.NUM_CHN = NUM_CHN;
	defparam u_pdm2pcm.DATA_WIDTH = DATA_WIDTH;
	defparam u_pdm2pcm.R = R;
	defparam u_pdm2pcm.M = M;
	defparam u_pdm2pcm.N = N;
	
endmodule