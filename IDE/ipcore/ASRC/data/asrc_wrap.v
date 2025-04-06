`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
	input 					clk, 
	input					rstn,
	input					ce,
	
	input					in_clkin,
	input					in_clkout,
	input signed [24-1:0]	in_data0,
	input signed [24-1:0]	in_data1,
`ifdef CHN_4
	input signed [24-1:0]	in_data2,
	input signed [24-1:0]	in_data3,
`endif	
	input					manual_ratio_en,
	input [26-1:0]			manual_ratio,

	output					fifo_overflow,
	output					out_locked,
	output	[26-1:0]		out_ratio,
	
	output					out_valid,
`ifdef CHN_4
	output signed [24-1:0]	out_data2,
	output signed [24-1:0]	out_data3,
`endif	
	output signed [24-1:0]	out_data0,
	output signed [24-1:0]	out_data1

);
	`include "parameter.vh"
	localparam RATIO_WIDTH = 26;
	localparam DATA_WIDTH = 24;

	`getname(asrc, `MODULE_NAME) #(
		.RATIO_WIDTH(RATIO_WIDTH),
		.DATA_WIDTH(DATA_WIDTH),
        .FIFO_SET_POINT(FIFO_SET_POINT)
	)asrc(
		.clk(clk), 
		.rstn(rstn),
		.ce(ce),
	
	
		.in_clkin(in_clkin),
		.in_clkout(in_clkout),
		.in_data0(in_data0),
		.in_data1(in_data1),
`ifdef CHN_4
		.in_data2(in_data2),
		.in_data3(in_data3),
`endif		
		.manual_ratio_en(manual_ratio_en),
		.manual_ratio(manual_ratio),
	
		.fifo_overflow(fifo_overflow),
		.out_locked(out_locked),
		.out_ratio(out_ratio),
		
		.out_valid(out_valid),
`ifdef CHN_4
		.out_data2(out_data2),
		.out_data3(out_data3),
`endif
		.out_data0(out_data0),
		.out_data1(out_data1)

	);
	

endmodule