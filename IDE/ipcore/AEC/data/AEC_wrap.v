
`include "define.vh"
`include "static_macro_define.v"

module `module_name (
//module input
    input clk,
    input rstn,
    input aec_ce,
    input aec_outRequire,
    input [`DATA_WIDTH-1:0]din_far,
    input [`DATA_WIDTH-1:0]din_mic,    
    input input_valid_far,
    input input_valid_mic,
//module output
    output out_valid,
    output aec_ini_done,
    output input_ready_far,
    output input_ready_mic,
    output [`DATA_WIDTH-1:0]dout
);

  `getname(AEC,`module_name) #( 
	.data_width(`DATA_WIDTH),
	.xcorr_num(`XCORR_NUM),
	.threshold_shift_norm(`THRESHOLD_SHIFT_NORM),
	.threshold_shift(`THRESHOLD_SHIFT),
	.lag(`LAG),
	.tapsize(`TAPSIZE),
	.STEP(`STEP)
  )
  AEC_inst (
    .clk                ( clk),              	//in
    .rstn               ( rstn),             	//in
    .aec_ce             ( aec_ce),     			//in  
    .aec_outRequire     ( aec_outRequire),    	//in
    .din_far            ( din_far),  			//in
    .din_mic            ( din_mic), 			//in
    .input_valid_far    ( input_valid_far), 	//in
    .input_valid_mic    ( input_valid_mic),		//in
    .out_valid          ( out_valid),    		//out
    .aec_ini_done       ( aec_ini_done),    	//out
    .input_ready_far    ( input_ready_far), 	//out
    .input_ready_mic    ( input_ready_mic),		//out
    .dout               ( dout)      			//out
  );
  
endmodule
