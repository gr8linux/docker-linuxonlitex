// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] sdi_decoder_top.v
//   \ \  / /\ \  / /    [Description ] SDI_Decoder_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday June 1 14:00:30 2021
//     \  /    \  /      [version     ] 1.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     |  6/11/21     | Initial version 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"


module `module_name 
( 	
	input			I_rst_n         	,//low active
	input			I_drp_clk        	,//<=50MHz 
	input			I_fix_rate_en       ,
	input   [2:0]	I_fix_rate         	,//only for fix rate //0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	input			I_fix_mfactor      	,//only for fix rate //0:M=1£¬1:M=1.001
	input    		I_clk      			,
	input   [87:0]	I_data				,
	

	output  [15:0]	O_hres              ,//horizontal resolution
	output  [15:0]	O_vres              ,//vertical resolution
	output			O_interlace         ,//0:interlaced, 1:progressive
	output  [2:0]	O_rate              ,//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	output  [2:0]	O_mod               ,//0:148.5M,  1:74.25M,  2:148.5M/1.001, 3:74.25M/1.001 
	output  [15:0]  O_hcnt       		,
	output  [15:0]  O_vcnt       		,
	output			O_clk				,	
	output    		O_f         		,
	output    		O_v         		,
	output    		O_h         		,
	output    		O_de        		,
	output  [19:0]  O_data    		 	 //{C,Y}
);

`getname(sdi_decoder_wrapper,`module_name) sdi_decoder_wrapper_inst
( 		
    .I_rst_n      (I_rst_n      					),//low active
    .I_drp_clk    (I_drp_clk    					),//<=50MHz 
    .I_drp_done   (1'b1   	            			),
    .O_drp_start  (                     			),//DRP start signal
    .I_fix_rate_en(I_fix_rate_en					),
    .I_fix_rate   (I_fix_rate   					),//only for fix rate //0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .I_fix_mfactor(I_fix_mfactor					),//only for fix rate //0:M=1£¬1:M=1.001
    .I_clk   	  (I_clk      						),
    .I_rxpll_lock (1'b1 							),//1,pll lock
    .I_rx_los     (1'b0     						),//1,rx lost
    .I_data       (I_data    						),//
    .O_hres       (O_hres       					),//horizontal resolution
    .O_vres       (O_vres       					),//vertical resolution
    .O_interlace  (O_interlace  					),//0:interlaced, 1:progressive
    .O_rate       (O_rate       					),//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .O_mod        (O_mod        					),//0:148.5M,  1:74.25M,  2:148.5M/1.001, 3:74.25M/1.001 
    .O_hcnt       (O_hcnt       					),
    .O_vcnt       (O_vcnt       					),
    .O_clk        (O_clk        					),		
    .O_f          (O_f          					),
    .O_v          (O_v          					),
    .O_h          (O_h          					),
    .O_de         (O_de         					),
    .O_data       (O_data     						) //{C,Y}
);










    
endmodule

