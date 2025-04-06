// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] DVI_RX_Top.v
//   \ \  / /\ \  / /    [Description ] DVI RX
//    \ \/ /  \ \/ /     [Timestamp   ] Friday April 3 14:00:30 2020
//     \  /    \  /      [version     ] 4.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 04/03/20     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 09/07/20     | 1. Add PLLVR and rPLL 
// ----------------------------------------------------------------------------------
// V2.1    | Caojie     | 02/19/21     | 1. Add PLLO 
// ----------------------------------------------------------------------------------
// V3.0    | Caojie     | 07/06/21     | 1. Add auto phase 
// ----------------------------------------------------------------------------------
// V3.1    | Caojie     | 11/29/21     | 1. Add signal lost detect 
// ----------------------------------------------------------------------------------
// V3.2    | Caojie     | 12/15/22     | 1. Fix using external clk bug
// ----------------------------------------------------------------------------------
// V3.3    | Caojie     | 09/06/23     | 1. Add 5A serial device
// ----------------------------------------------------------------------------------
// V3.4    | Caojie     | 26/04/24     | 1. Align module modify
// ----------------------------------------------------------------------------------
// V3.5    | Caojie     | 06/06/24     | 1. Auto Align module modify
// ----------------------------------------------------------------------------------
// V4.0    | Caojie     | 11/15/24     | 1. Auto Align module modify
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "dvi_rx_defines.v"

module `module_name
(
	input         I_rst_n       , // active low 
	input         I_tmds_clk_p  , 
	input         I_tmds_clk_n  , 
	input  [2:0]  I_tmds_data_p , //{r,g,b}
	input  [2:0]  I_tmds_data_n , 
`ifdef RX_USE_EXTERNAL_CLK
    output        O_tmds_clk    ,
    input         I_serial_clk  ,
`else
	output		  O_pll_lock	  ,
`endif 
`ifdef AUTO_PHASE
    output [3:0]  O_pll_phase     ,  
    output        O_pll_phase_lock,
`endif  
`ifdef DATA_BEFORE_ALIGN        
    output [9:0]  O_datar_bf      ,  
    output [9:0]  O_datag_bf      ,  
    output [9:0]  O_datab_bf      ,  
`endif 
	output        O_rgb_clk     , //pixel clock
	output        O_rgb_vs      ,
	output        O_rgb_hs      ,
	output        O_rgb_de      ,
	output [7:0]  O_rgb_r       ,  
	output [7:0]  O_rgb_g       , 
	output [7:0]  O_rgb_b       
);

`getname(dvi2rgb,`module_name) dvi2rgb_inst
(
	.I_rst_n      (I_rst_n      ),// active low 
	.I_tmds_clk_p (I_tmds_clk_p ),  
	.I_tmds_clk_n (I_tmds_clk_n ),  
	.I_tmds_data_p(I_tmds_data_p),//{r,g,b}
	.I_tmds_data_n(I_tmds_data_n), 
`ifdef RX_USE_EXTERNAL_CLK
    .O_tmds_clk   (O_tmds_clk   ),
    .I_serial_clk (I_serial_clk ),
`else                             
	.O_pll_lock	  (O_pll_lock	),
`endif 
`ifdef AUTO_PHASE
    .O_pll_phase     (O_pll_phase     ),  
    .O_pll_phase_lock(O_pll_phase_lock),
`endif 
`ifdef DATA_BEFORE_ALIGN        
    .O_datar_bf   (O_datar_bf   ),  
    .O_datag_bf   (O_datag_bf   ),  
    .O_datab_bf   (O_datab_bf   ),  
`endif      
	.O_rgb_clk    (O_rgb_clk    ),
	.O_rgb_vs     (O_rgb_vs     ),
	.O_rgb_hs     (O_rgb_hs     ),
	.O_rgb_de     (O_rgb_de     ),
	.O_rgb_r      (O_rgb_r      ),
	.O_rgb_g      (O_rgb_g      ),
	.O_rgb_b      (O_rgb_b      )
);
	
endmodule