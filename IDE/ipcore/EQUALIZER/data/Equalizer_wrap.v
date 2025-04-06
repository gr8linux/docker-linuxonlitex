`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME(
// module Equalizer (
    clk, 
    rstn,      
	ce,         
	in_valid,  
    din,     
	gainwe,    
	gainset,    
	gain,       
	in_ready,   
	out_valid,  
    dout        
);
	
//**********************************************************************
// --- Parameter
//**********************************************************************
	`include "parameter.vh"
	localparam DOUT_WIDTH=DIN_WIDTH+3;
//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input clk, rstn, ce;
	input in_valid;
	input signed [DIN_WIDTH-1:0] din;
	input gainwe, gainset;
	input [2:0] gain;
	output reg in_ready;
	output reg out_valid;
	output [DOUT_WIDTH-1:0] dout;

//**********************************************************************
// --- Module:	 Equalizer
// --- Description:	
//**********************************************************************
	`getname(Equalizer,`MODULE_NAME) Equalizer_inst(
		.clk(clk),                 
        .rstn(rstn),               
		.ce(ce),                  
        .in_valid(in_valid),      
		.din(din),                
		.gainwe(gainwe),           
		.gainset(gainset),         
		.gain(gain),             
		.in_ready(in_ready), 	 
		.out_valid(out_valid),    
		.dout(dout)                
    );
	defparam Equalizer_inst.BAND_SIZES=BAND_SIZES;
    defparam Equalizer_inst.GAIN_NUM=GAIN_NUM;
	defparam Equalizer_inst.COEFF_WIDTH=COEFF_WIDTH;
	defparam Equalizer_inst.DIN_WIDTH=DIN_WIDTH;
	defparam Equalizer_inst.COEFFA_PATH=COEFFA_PATH;
	defparam Equalizer_inst.COEFFB_PATH=COEFFB_PATH;
endmodule