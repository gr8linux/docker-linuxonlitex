// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] sdi_top.v
//   \ \  / /\ \  / /    [Description ] SDI TX RX top
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
	output			serdes_pma_rst_n_o      ,//pma_rst	
	input			serdes_pcs_tx_clk_i   	,//serdes output half clock
	output			serdes_fabric_tx_clk_o	,
	output [79:0]	serdes_txdata_o     	,//{Y,C} 
	output    		serdes_tx_fifo_wren_o  	,//tx_fifo_wren
	output    		serdes_pcs_tx_rst_o    	,//pcs_tx_rst  	
	input 			serdes_pcs_rx_clk_i   	,//serdes output half clock
	output			serdes_fabric_rx_clk_o	,
	input [87:0] 	serdes_rxdata_i       	,//{Y,C} //rx_data
	output			serdes_rx_fifo_rden_o   ,//
    output			serdes_pcs_rx_rst_o     ,//

	input			sdi_pma_rst_n_i  		 	,
	input  			sdi_tx_rst_n_i         		,//low active
	input  [2:0]  	sdi_tx_rate_i         		,//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	input  [15:0]  	sdi_tx_hres_i         		,
	input  [15:0]  	sdi_tx_vres_i         		,
	input  [2:0]  	sdi_tx_ver_fre_i      		,//0:60Hz, 1:50Hz, 2:30Hz, 3:25Hz, 4:24Hz
	input  			sdi_tx_interlace_i    		,//0:interlaced£¬1:progressive
	input  			sdi_tx_color_i        		,//0:YC, 1:RGB
	input  			sdi_tx_mfactor_i      		,//0:M=1, 1:M=1.001
	input  			sdi_tx_pixbit_i       		,//0:10bit, 1:12bit
	input  [1:0]  	sdi_tx_pixstruc_i     		,//2'b00:4:2:2, 2'b10:4:4:4, 2'b11:4:4:4:4
	input  			sdi_tx_fld_i         		,
	input  			sdi_tx_vs_i          		,//positive polarity
	input  			sdi_tx_hs_i          		,//positive polarity
	input  			sdi_tx_de_i          		,
	input  [19:0]  	sdi_tx_data_i        		,//data in, BT656:{10'd0,10bit}, YC422_10b:{C,Y}, other maps:{10bit,10bit}
	output			sdi_tx_half_clk_o			,//serdes output half clock, except BT656
	input			sdi_rx_rst_n_i         		,//low active
	input			sdi_rx_drp_clk_i        	,//<=50MHz 
	input			sdi_rx_fix_rate_en_i        ,
	input  [2:0]	sdi_rx_fix_rate_i         	,//only for fix rate //0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	input			sdi_rx_fix_mfactor_i      	,//only for fix rate //0:M=1£¬1:M=1.001
	output  [15:0]	sdi_rx_hres_o               ,//horizontal resolution
	output  [15:0]	sdi_rx_vres_o               ,//vertical resolution
	output			sdi_rx_interlace_o          ,//0:interlaced, 1:progressive
	output  [2:0]	sdi_rx_rate_o               ,//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
	output  [2:0]	sdi_rx_mod_o               	,//0:148.5M,  1:74.25M,  2:148.5M/1.001, 3:74.25M/1.001 
	output  [15:0]  sdi_rx_hcnt_o       		,
	output  [15:0]  sdi_rx_vcnt_o       		,
	output    		sdi_rx_clk_o      			,
	output    		sdi_rx_f_o         			,
	output    		sdi_rx_v_o         			,
	output    		sdi_rx_h_o         			,
	output    		sdi_rx_de_o        			,
	output  [19:0]  sdi_rx_data20_o    			 //{C,Y}		
);

`getname(sdi_wrapper,`module_name) sdi_wrapper_inst
( 
    .I_tx_rst_n      (sdi_tx_rst_n_i     		),//low active
    .I_tx_rate       (sdi_tx_rate_i      		),//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .I_tx_hres       (sdi_tx_hres_i      		),
    .I_tx_vres       (sdi_tx_vres_i      		),
    .I_tx_ver_fre    (sdi_tx_ver_fre_i   		),//0:60Hz, 1:50Hz, 2:30Hz, 3:25Hz, 4:24Hz
    .I_tx_interlace  (sdi_tx_interlace_i 		),//0:interlaced£¬1:progressive
    .I_tx_color      (sdi_tx_color_i     		),//0:YC, 1:RGB
    .I_tx_mfactor    (sdi_tx_mfactor_i   		),//0:M=1, 1:M=1.001
    .I_tx_pixbit     (sdi_tx_pixbit_i    		),//0:10bit, 1:12bit
    .I_tx_pixstruc   (sdi_tx_pixstruc_i  		),//2'b00:4:2:2, 2'b10:4:4:4, 2'b11:4:4:4:4
    .I_tx_clk27m     (1'b0     		            ),
    .I_tx_half_clk   (serdes_pcs_tx_clk_i       ),//serdes output half clock, except BT656
    .I_tx_fld        (sdi_tx_fld_i        		),
    .I_tx_vs         (sdi_tx_vs_i         		),//positive polarity
    .I_tx_hs         (sdi_tx_hs_i         		),//positive polarity
    .I_tx_de         (sdi_tx_de_i         		),
    .I_tx_data       (sdi_tx_data_i       		),//data in, BT656:{10'd0,10bit}, YC422_10b:{C,Y}, other maps:{10bit,10bit}
    .O_tx_data20     (serdes_txdata_o[19:0]     ),//{Y,C} 
		
    .I_rx_rst_n      (sdi_rx_rst_n_i      		),//low active
    .I_rx_drp_clk    (sdi_rx_drp_clk_i    		),//<=50MHz 
    .I_rx_drp_done   (1'b1   	                ),
    .O_rx_drp_start  (                          ),//DRP start signal
    .I_rx_fix_rate_en(sdi_rx_fix_rate_en_i		),
    .I_rx_fix_rate   (sdi_rx_fix_rate_i   		),//only for fix rate //0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .I_rx_fix_mfactor(sdi_rx_fix_mfactor_i		),//only for fix rate //0:M=1£¬1:M=1.001
    .I_rx_clk27m     (1'b0     		            ),//can set by defines
    .I_rx_half_clk   (serdes_pcs_rx_clk_i       ),//serdes output half clock
    .I_rx_rxpll_lock (1'b1 						),//1,pll lock
    .I_rx_rx_los     (1'b0     					),//1,rx lost
    .I_rx_data       (serdes_rxdata_i[19:0]     ),//{Y,C}
    .O_rx_hres       (sdi_rx_hres_o       		),//horizontal resolution
    .O_rx_vres       (sdi_rx_vres_o       		),//vertical resolution
    .O_rx_interlace  (sdi_rx_interlace_o  		),//0:interlaced, 1:progressive
    .O_rx_rate       (sdi_rx_rate_o       		),//0:SD-SDI, 1:HD-SDI, 2:3G-SDI
    .O_rx_mod        (sdi_rx_mod_o        		),//0:148.5M,  1:74.25M,  2:148.5M/1.001, 3:74.25M/1.001 
    .O_rx_hcnt       (sdi_rx_hcnt_o       		),
    .O_rx_vcnt       (sdi_rx_vcnt_o       		),
    .O_rx_clk        (sdi_rx_clk_o        		),
    .O_rx_f          (sdi_rx_f_o          		),
    .O_rx_v          (sdi_rx_v_o          		),
    .O_rx_h          (sdi_rx_h_o          		),
    .O_rx_de         (sdi_rx_de_o         		),
    .O_rx_data20     (sdi_rx_data20_o     		) //{C,Y}
);

assign serdes_pma_rst_n_o		= sdi_pma_rst_n_i			;

assign serdes_fabric_tx_clk_o 	= serdes_pcs_tx_clk_i	    ;
assign serdes_txdata_o[79:20]	= 60'd0						;
assign serdes_tx_fifo_wren_o	= 1'b1              		;//tx_fifo_wren
assign serdes_pcs_tx_rst_o  	= 1'b0              		;//pcs_tx_rst  

assign serdes_fabric_rx_clk_o	= serdes_pcs_rx_clk_i	    ;
assign serdes_rx_fifo_rden_o	= 1'b1						;
assign serdes_pcs_rx_rst_o		= 1'b0						;

assign sdi_tx_half_clk_o        = serdes_pcs_tx_clk_i       ;
    
endmodule

