// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] sdi_encoder_top.v
//   \ \  / /\ \  / /    [Description ] SDI_Encoder_Top
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

	input  			I_rst_n         	,//low active
	input  [2:0]  	I_rate         		,//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	input  [15:0]  	I_hres         		,
	input  [15:0]  	I_vres         		,
	input  [2:0]  	I_ver_fre      		,//0:60Hz, 1:50Hz, 2:30Hz, 3:25Hz, 4:24Hz
	input  			I_interlace    		,//0:interlaced£¬1:progressive
	input  			I_color        		,//0:YC, 1:RGB
	input  			I_mfactor      		,//0:M=1, 1:M=1.001
	input  			I_pixbit       		,//0:10bit, 1:12bit
	input  [1:0]  	I_pixstruc     		,//2'b00:4:2:2, 2'b10:4:4:4, 2'b11:4:4:4:4
	input			I_clk				,
	input  			I_fld         		,
	input  			I_vs          		,//positive polarity
	input  			I_hs          		,//positive polarity
	input  			I_de          		,
	input  [19:0]  	I_data        		,//data in, BT656:{10'd0,10bit}, YC422_10b:{C,Y}, other maps:{10bit,10bit}
	
	output [79:0]	O_data				//{Y,C}
	

);




`getname(sdi_encoder_wrapper,`module_name) sdi_encoder_wrapper_inst
( 
    .I_rst_n      	 (I_rst_n     		),//low active
    .I_rate       	 (I_rate      		),//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .I_hres       	 (I_hres      		),
    .I_vres       	 (I_vres      		),
    .I_ver_fre    	 (I_ver_fre   		),//0:60Hz, 1:50Hz, 2:30Hz, 3:25Hz, 4:24Hz
    .I_interlace  	 (I_interlace 		),//0:interlaced£¬1:progressive
    .I_color      	 (I_color     		),//0:YC, 1:RGB
    .I_mfactor    	 (I_mfactor   		),//0:M=1, 1:M=1.001
    .I_pixbit     	 (I_pixbit    		),//0:10bit, 1:12bit
    .I_pixstruc   	 (I_pixstruc  		),//2'b00:4:2:2, 2'b10:4:4:4, 2'b11:4:4:4:4
    .I_clk   	  	 (I_clk       		),//
    .I_fld        	 (I_fld        		),
    .I_vs         	 (I_vs         		),//positive polarity
    .I_hs         	 (I_hs         		),//positive polarity
    .I_de         	 (I_de         		),
    .I_data       	 (I_data       		),//data in, BT656:{10'd0,10bit}, YC422_10b:{C,Y}, other maps:{10bit,10bit}
					  
    .O_phy_tx_data   (O_data   			) //{Y,C} 
		

);











endmodule

