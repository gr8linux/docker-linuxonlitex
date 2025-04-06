`include"top_define.vh"
`include"static_macro_define.vh"
`include"dds_ii_top_defines.vh"

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 16:09:20
// Design Name: 
// Module Name: gowin_dds_ip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





module `module_name (
	
	clk_i,	
	rst_n_i,	
	
`ifdef 	PHASE_EN
	phase_valid_i,	
    `ifdef PHASEIN_EN 
    phase_i,
    `endif
	`ifdef PHASERESYNC
		phase_resync_i,
	`endif
	`ifdef PHASEINC_EN	
		phase_inc_i,	
	`endif
	`ifdef PHASEOFF_EN	
		phase_off_i,	
	`endif
	`ifdef MULTI_CHANNEL
		phase_tlast_i,		
		phase_tlast_missing_o,	
		phase_tlast_unexpected_o,
	`endif	
`endif

`ifdef 	CONFIG_EN
		config_valid_i,	
	`ifdef CONFIGINC_EN		
		config_inc_i,
	`endif
	`ifdef CONFIGOFF_EN		
		config_off_i,	
	`endif
	`ifdef MULTI_CHANNEL
		config_tlast_i,	
		config_tlast_missing_o,	
		config_tlast_unexpected_o,  
	`endif	
`endif

	
`ifdef PHASE_OUT		
	phase_out_o,
`endif
`ifdef COSSINE_OUT	
	cosine_o,	
`endif		
`ifdef SINE_OUT	
	sine_o,  
`endif	
`ifdef CHANID_OUT	
	chan_id_o,
`endif	
	data_valid_o
    
);
    parameter FPGA_TYPE = `DEFINE_FPGA_TYPE;
    parameter WORKMODE = `DEFINE_WORKMODE;
    parameter CH_NUM = `DEFINE_CH_NUM;
    parameter CH_WID = CH_NUM == 1 ? 1 : $clog2(CH_NUM);
	
    parameter DELAY        = `DEFINE_DELAY;
    parameter FILENAME     = `DEFINE_FILENAME;
    parameter OUTPUT_WIDTH = `DEFINE_OUTPUT_WIDTH;     
    parameter TRUNC_WIDTH  = `DEFINE_TRUNC_WIDTH;     
    parameter PHASE_WIDTH  = `DEFINE_PHASE_WIDTH;     
    parameter PHASE_DITHER = `DEFINE_PHASE_DITHER;   
    parameter TAYLOR_CORR  = `DEFINE_TAYLOR_CORR;   	
	
	
    parameter PINC_TYPE = `DEFINE_PINC_TYPE; 
    parameter POFF_TYPE = `DEFINE_POFF_TYPE; 
    
	parameter PINC0_INIT = `DEFINE_PINC0_INIT;
	parameter POFF0_INIT = `DEFINE_POFF0_INIT;
	parameter PINC1_INIT = `DEFINE_PINC1_INIT;
	parameter POFF1_INIT = `DEFINE_POFF1_INIT;
	parameter PINC2_INIT = `DEFINE_PINC2_INIT;
	parameter POFF2_INIT = `DEFINE_POFF2_INIT;
	parameter PINC3_INIT = `DEFINE_PINC3_INIT;
    parameter POFF3_INIT = `DEFINE_POFF3_INIT;
	parameter PINC4_INIT = `DEFINE_PINC4_INIT;
	parameter POFF4_INIT = `DEFINE_POFF4_INIT;
	parameter PINC5_INIT = `DEFINE_PINC5_INIT;
	parameter POFF5_INIT = `DEFINE_POFF5_INIT;
	parameter PINC6_INIT = `DEFINE_PINC6_INIT;
	parameter POFF6_INIT = `DEFINE_POFF6_INIT;
	parameter PINC7_INIT = `DEFINE_PINC7_INIT;
    parameter POFF7_INIT = `DEFINE_POFF7_INIT;
	parameter PINC8_INIT = `DEFINE_PINC8_INIT;
	parameter POFF8_INIT = `DEFINE_POFF8_INIT;
	parameter PINC9_INIT = `DEFINE_PINC9_INIT;
	parameter POFF9_INIT = `DEFINE_POFF9_INIT;
	parameter PINCA_INIT = `DEFINE_PINCA_INIT;
	parameter POFFA_INIT = `DEFINE_POFFA_INIT;
	parameter PINCB_INIT = `DEFINE_PINCB_INIT;
    parameter POFFB_INIT = `DEFINE_POFFB_INIT;
    parameter PINCC_INIT = `DEFINE_PINCC_INIT;
	parameter POFFC_INIT = `DEFINE_POFFC_INIT;
	parameter PINCD_INIT = `DEFINE_PINCD_INIT;
	parameter POFFD_INIT = `DEFINE_POFFD_INIT;
	parameter PINCE_INIT = `DEFINE_PINCE_INIT;
	parameter POFFE_INIT = `DEFINE_POFFE_INIT;
	parameter PINCF_INIT = `DEFINE_PINCF_INIT;
    parameter POFFF_INIT = `DEFINE_POFFF_INIT;
	

    input                       clk_i;
    input                       rst_n_i;
	
`ifdef 	PHASE_EN
	input                       phase_valid_i;	
	`ifdef PHASEIN_EN
	input [PHASE_WIDTH-1 : 0]phase_i;
	`endif
	`ifdef PHASERESYNC
	input                       phase_resync_i;
	`endif
	`ifdef PHASEINC_EN	
	input [PHASE_WIDTH-1 : 0]   phase_inc_i;	
	`endif
	`ifdef PHASEOFF_EN	
	input [PHASE_WIDTH-1 : 0]   phase_off_i;	
	`endif
	`ifdef MULTI_CHANNEL
	input                       phase_tlast_i;		
	output                      phase_tlast_missing_o;	
	output                      phase_tlast_unexpected_o;
	`endif	
`endif

`ifdef 	CONFIG_EN
	input                       config_valid_i;	
	`ifdef CONFIGINC_EN		
	input [PHASE_WIDTH-1 : 0]   config_inc_i;
	`endif
	`ifdef CONFIGOFF_EN		
	input [PHASE_WIDTH-1 : 0]   config_off_i;	
	`endif
	`ifdef MULTI_CHANNEL
	input                       config_tlast_i;	
	output                      config_tlast_missing_o;	
	output                      config_tlast_unexpected_o;  
	`endif	
`endif

	
`ifdef PHASE_OUT		
	output [PHASE_WIDTH-1 : 0]  phase_out_o;
`endif
`ifdef COSSINE_OUT	
	output [OUTPUT_WIDTH-1 : 0] cosine_o;	
`endif		
`ifdef SINE_OUT	
	output [OUTPUT_WIDTH-1 : 0] sine_o;
`endif	
`ifdef CHANID_OUT	
	output [CH_WID-1 : 0]       chan_id_o;
`endif	
	output data_valid_o;	
	
	
	



	
`getname(dds_ii_core,`module_name)  #(
    .FPGA_TYPE   (FPGA_TYPE   ),
    .WORKMODE    (WORKMODE    ),
    .CH_NUM      (CH_NUM      ),
    .DELAY       (DELAY       ),
    .FILENAME    (FILENAME    ),
    .OUTPUT_WIDTH(OUTPUT_WIDTH),
    .TRUNC_WIDTH (TRUNC_WIDTH ),
    .PHASE_WIDTH (PHASE_WIDTH ),
    .PHASE_DITHER(PHASE_DITHER),
    .TAYLOR_CORR (TAYLOR_CORR ),
    .PINC_TYPE   (PINC_TYPE   ),
    .POFF_TYPE   (POFF_TYPE   ),
    
	.PINC0_INIT(PINC0_INIT),
	.POFF0_INIT(POFF0_INIT),
	.PINC1_INIT(PINC1_INIT),
	.POFF1_INIT(POFF1_INIT),
	.PINC2_INIT(PINC2_INIT),
	.POFF2_INIT(POFF2_INIT),
	.PINC3_INIT(PINC3_INIT),
    .POFF3_INIT(POFF3_INIT),
	.PINC4_INIT(PINC4_INIT),
	.POFF4_INIT(POFF4_INIT),
	.PINC5_INIT(PINC5_INIT),
	.POFF5_INIT(POFF5_INIT),
	.PINC6_INIT(PINC6_INIT),
	.POFF6_INIT(POFF6_INIT),
	.PINC7_INIT(PINC7_INIT),
    .POFF7_INIT(POFF7_INIT),
	.PINC8_INIT(PINC8_INIT),
	.POFF8_INIT(POFF8_INIT),
	.PINC9_INIT(PINC9_INIT),
	.POFF9_INIT(POFF9_INIT),
	.PINCA_INIT(PINCA_INIT),
	.POFFA_INIT(POFFA_INIT),
	.PINCB_INIT(PINCB_INIT),
    .POFFB_INIT(POFFB_INIT),
    .PINCC_INIT(PINCC_INIT),
	.POFFC_INIT(POFFC_INIT),
	.PINCD_INIT(PINCD_INIT),
	.POFFD_INIT(POFFD_INIT),
	.PINCE_INIT(PINCE_INIT),
	.POFFE_INIT(POFFE_INIT),
	.PINCF_INIT(PINCF_INIT),
    .POFFF_INIT(POFFF_INIT)
   
)u_dds_compiler_core
(
    .i_clk                    (clk_i                     ),
    .i_rst_n                  (rst_n_i                   ),
    .i_phase_valid            (phase_valid_i             ),
    .i_phase                  (phase_i),
    .i_phase_tlast            (phase_tlast_i             ),
    .i_phase_resync           (phase_resync_i            ),
    .i_phase_inc              (phase_inc_i               ),
    .i_phase_off              (phase_off_i               ),
    .o_phase_tlast_missing    (phase_tlast_missing_o     ),
    .o_phase_tlast_unexpected (phase_tlast_unexpected_o  ),
    .i_config_valid           (config_valid_i            ),
    .i_config_tlast           (config_tlast_i            ),
    .i_config_inc             (config_inc_i              ),
    .i_config_off             (config_off_i              ),
    .o_config_tlast_missing   (config_tlast_missing_o    ),
    .o_config_tlast_unexpected(config_tlast_unexpected_o ),    
    .o_data_valid             (data_valid_o              ),
    .o_phase_out              (phase_out_o               ),
    .o_cosine                 (cosine_o                  ),
    .o_sine                   (sine_o                    ),
    .o_chan_id                (chan_id_o                 )
    );

    
endmodule
