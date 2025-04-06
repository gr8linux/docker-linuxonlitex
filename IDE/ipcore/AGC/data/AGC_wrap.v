
`include "define.v"
`include "static_macro_define.v"

module `module_name (
//module input
    input clk,
    input rstn,
    input ce,
    input sync,
    input [24-1:0]pdata,
    input [8-1:0]scale_ratio,    
    input require_valid,
    input respond_ready,
//module output
    output require_ready,
    output tVAD,
    output respond_valid,
    output sync_out,
    output [24-1:0]pdata_out
);

  `getname(AGC_top,`module_name) #( 
	.RSR(`RSR),
	.RSR_R(`RSR_R),
	.RSF(`RSF),
	.RSF_R(`RSF_R),
	.RFR(`RFR),
	.RFR_R(`RFR_R),
	.RFF(`RFF),
	.RFF_R(`RFF_R),
	.RPR(`RPR),
	.RPR_R(`RPR_R),
	.RPF(`RPF),
	.RPF_R(`RPF_R),
	.GINC_SHIFT(`GINC_SHIFT),
	.GDEC_SHIFT(`GDEC_SHIFT),
	.KN(`KN),
	.KP(`KP)
  )
  AGC_top_inst (
    .clk            ( clk),
    .rstn           ( rstn),
    .ce             ( ce),
    .pdata          ( pdata),
    .sync           ( sync),
    .require_valid  ( require_valid),
    .respond_ready  ( respond_ready),
    .scale_ratio    ( scale_ratio),
    .pdata_out      ( pdata_out),
    .sync_out       ( sync_out),
    .respond_valid  ( respond_valid),
    .require_ready  ( require_ready),
    .tVAD           ( tVAD)
  );
  
endmodule
