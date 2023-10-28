// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] EDID_PROM_Top.v
//   \ \  / /\ \  / /    [Description ] EDID_PROM_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday April 3 14:00:30 2020
//     \  /    \  /      [version     ] 2.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 05/28/20     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 02/15/23     | add mem-bus interface 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`timescale 1ns/1ps

`include "top_define.v"
`include "static_macro_define.v"
`include "edid_prom_defines.v"

module `module_name 
(
	input        I_clk      , //>= 5MHz, <=200MHz 
	input        I_rst_n    ,
`ifdef  RAM  
	input        I_mema_clk ,
    input        I_mema_rd  ,
    input        I_mema_we  ,
    input  [7:0] I_mema_addr,
    input  [7:0] I_mema_di  ,
    output [7:0] O_mema_do  ,
`endif
	input        I_scl      ,
	inout        IO_sda    
);
  
`getname(i2c_slave_wrapper,`module_name)  i2c_slave_wrapper_inst 
( 
	.clk      (I_clk      ),
	.rstn     (I_rst_n    ),
`ifdef  RAM  
	.mema_clk (I_mema_clk ),
    .mema_rd  (I_mema_rd  ),
    .mema_we  (I_mema_we  ),
    .mema_addr(I_mema_addr),
    .mema_di  (I_mema_di  ),
    .mema_do  (O_mema_do  ),
`endif     
	.scl      (I_scl      ),
	.sda      (IO_sda     ),
	.int_o    (           ) 
);

endmodule



