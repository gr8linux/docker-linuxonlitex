
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
`include "spi_uart_name.v"

module `module_name (
			input		I_clk,
			input		I_rst_n,
			//spi
			input 		I_spi_cs_n,
			input 		I_spi_clk,
			output		O_spi_so,
			input		I_spi_si,
			output		O_spi_irq_n,
			//uart
			input 		I_uart_rxd,
			output 		O_uart_txd, 
			output		O_uart_rts_n,
			input		I_uart_cts_n
);

//--------------------------------------------------------------------
//-- SPI slaver
//--------------------------------------------------------------------
 `getname(spi_to_uart_top,`module_name) u_spi_to_uart_top(
.I_rst_n             (I_rst_n         ),
.I_clk               (I_clk           ),
.I_spi_cs_n          (I_spi_cs_n      ),
.I_spi_clk           (I_spi_clk       ),
.O_spi_so            (O_spi_so        ),
.I_spi_si            (I_spi_si        ),
.O_spi_irq_n         (O_spi_irq_n     ),

.I_uart_rxd          (I_uart_rxd      ),
.O_uart_txd          (O_uart_txd      ),
.O_uart_rts_n        (O_uart_rts_n    ),
.I_uart_cts_n        (I_uart_cts_n    )
);
//--------------------------------------------------------------------
//--------------------------------------------------------------------

endmodule
