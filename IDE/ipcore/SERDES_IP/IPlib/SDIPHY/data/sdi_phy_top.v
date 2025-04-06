// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] sdi_phy_top.v
//   \ \  / /\ \  / /    [Description ] SDI_PHY_Top
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
    output			serdes_pma_rst_n_o      	,//pma_rst
	
	input			serdes_pcs_tx_clk_i   		,//serdes output  clock
	output			serdes_fabric_tx_clk_o		,
	output [79:0]	serdes_txdata_o     		,//tx_data
	output    		serdes_tx_fifo_wren_o  		,//tx_fifo_wren
	output    		serdes_pcs_tx_rst_o    		,//pcs_tx_rst 
 	
	input 			serdes_pcs_rx_clk_i   		,//serdes output  clock
	output			serdes_fabric_rx_clk_o		,
	input  [87:0] 	serdes_rxdata_i       		,//rx_data
	output			serdes_rx_fifo_rden_o   	,//
    output			serdes_pcs_rx_rst_o     	,//

	input			pma_rst_n_i  				,
	input			pcs_tx_rst_i				,		
	input			tx_fifo_wren_i				,		
	input  [79:0]  	tx_data_i        			,
	output			tx_clk_o					,//serdes output  clock
		
	input			pcs_rx_rst_i				,
	input			rx_fifo_rden_i				,	
	output    		rx_clk_o      				,
	output [87:0]   rx_data_o    					 
);

`getname(sdi_phy_wrapper,`module_name) sdi_phy_wrapper_inst
( 	
	.I_serdes_pcs_tx_clk   		(serdes_pcs_tx_clk_i		), 
										
	.I_serdes_pcs_rx_clk   		(serdes_pcs_rx_clk_i		),
	.I_serdes_rxdata       		(serdes_rxdata_i			),
									
	.I_sdi_phy_pma_rst_n  		(pma_rst_n_i				),
			
	.I_sdi_phy_pcs_tx_rst		(pcs_tx_rst_i				),		
	.I_sdi_phy_tx_fifo_wren		(tx_fifo_wren_i				),									
	.I_sdi_phy_tx_data        	(tx_data_i					),	
		
	.I_sdi_phy_pcs_rx_rst		(pcs_rx_rst_i				),
	.I_sdi_phy_rx_fifo_rden		(rx_fifo_rden_i				),	
	
	.O_serdes_pma_rst_n      	(serdes_pma_rst_n_o			),
		
	.O_serdes_fabric_tx_clk		(serdes_fabric_tx_clk_o		),
	.O_serdes_txdata     		(serdes_txdata_o			),
	.O_serdes_tx_fifo_wren  	(serdes_tx_fifo_wren_o		),
	.O_serdes_pcs_tx_rst    	(serdes_pcs_tx_rst_o		),	
		
	.O_serdes_fabric_rx_clk		(serdes_fabric_rx_clk_o		),	
	.O_serdes_rx_fifo_rden   	(serdes_rx_fifo_rden_o		),
	.O_serdes_pcs_rx_rst     	(serdes_pcs_rx_rst_o		),
		
	.O_sdi_phy_tx_clk			(tx_clk_o					),
			
	.O_sdi_phy_rx_clk      		(rx_clk_o					),
	.O_sdi_phy_rx_data    		(rx_data_o					)	
	

);


	
    
endmodule

