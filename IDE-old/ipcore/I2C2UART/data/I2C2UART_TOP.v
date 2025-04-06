
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] i2c4_to_uart8_top.v
//   \ \  / /\ \  / /    [Description ] i2c2uart 
//    \ \/ /  \ \/ /     [Timestamp   ] Thursday Jan 24 10:00:30 2019
//     \  /    \  /      [version     ] 1.0.0
//      \/      \/       
//
// ===========Oooo==========================================Oooo========
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author |Mod. Date |Changes Made:
// V1.0 | ***    |12/24/19  |Initial version
// ===========Oooo==========================================Oooo========


`timescale 1 ns / 100 ps
`include "i2c_uart_name.v"

module `module_name (
			input  I_clk,
			input  I_rst_n,
			//i2c
			inout  IO_i2c_sda,
			input  I_i2c_scl,
			output O_i2c_irq_n,
			//uart
			input  I_uart_rxd, 
			output O_uart_txd, 
			output O_uart_rts_n,
			input  I_uart_cts_n
);

//--------------------------------------------------------------------
//-- i2c slaver
//--------------------------------------------------------------------
`getname(i2c_to_uart_top,`module_name) u_i2c_to_uart_top(
.I_rst_n             (I_rst_n         ),
.I_clk               (I_clk           ),

.IO_i2c_sda          (IO_i2c_sda      ),
.I_i2c_scl           (I_i2c_scl       ),
.O_i2c_irq_n         (O_i2c_irq_n     ),

.I_uart_rxd          (I_uart_rxd      ),
.O_uart_txd          (O_uart_txd      ),
.O_uart_rts_n        (O_uart_rts_n    ),
.I_uart_cts_n        (I_uart_cts_n    )

);
//--------------------------------------------------------------------
//--------------------------------------------------------------------

endmodule
