
`timescale 1 ns / 100 ps
`include "sdio_uart_name.v"

module `module_name
(
			input       I_clk,
			input       I_rst_n,

			//uart  interface
			`ifdef UART4_CHAN_SEL
				`ifdef UART4_4WIRE_SEL
					input 		I_uart4_rxd,
					output 		O_uart4_txd, 
					output		O_uart4_rts_n,
					input		I_uart4_cts_n,
				`else
					input 		I_uart4_rxd,
					output 		O_uart4_txd,
				`endif
			`endif

			`ifdef UART3_CHAN_SEL
				`ifdef UART3_4WIRE_SEL
					input 		I_uart3_rxd,
					output 		O_uart3_txd, 
					output		O_uart3_rts_n,
					input		I_uart3_cts_n,
				`else
					input 		I_uart3_rxd,
					output 		O_uart3_txd,
				`endif
			`endif

			`ifdef UART2_CHAN_SEL
				`ifdef UART2_4WIRE_SEL
					input 		I_uart2_rxd,
					output 		O_uart2_txd, 
					output		O_uart2_rts_n,
					input		I_uart2_cts_n,
				`else
					input 		I_uart2_rxd,
					output 		O_uart2_txd,
				`endif
			`endif

			`ifdef UART1_CHAN_SEL
				`ifdef UART1_4WIRE_SEL
					input 		I_uart1_rxd,
					output 		O_uart1_txd, 
					output		O_uart1_rts_n,
					input		I_uart1_cts_n,
				`else
					input 		I_uart1_rxd,
					output 		O_uart1_txd,
				`endif
			`endif

			//SDIO slaver interface
			input       I_sdio_clk,
			input       I_sdio_2M_clk,
			input       I_sdio_cpu_clk,
			inout       IO_sdio_cmd,
			inout       IO_sdio_dat0,
			inout       IO_sdio_dat1_irq,
			inout       IO_sdio_dat2_rw,
			inout       IO_sdio_dat3_cd
);

/*************************************************/

//--------------------------------------------------------------------
//--SDIO Slaver <-> SPI Master
//--------------------------------------------------------------------
 `getname(sdio_uart,`module_name) sdio_uart_inst(
     .I_rst_n             (I_rst_n         ),
     .I_clk               (I_clk           ),

     `ifdef UART4_CHAN_SEL
        `ifdef UART4_4WIRE_SEL
            .I_uart4_rxd(I_uart4_rxd),
            .O_uart4_txd(O_uart4_txd),
            .O_uart4_rts_n(O_uart4_rts_n),
            .I_uart4_cts_n(I_uart4_cts_n),
         `else
            .I_uart4_rxd(I_uart4_rxd),
            .O_uart4_txd(O_uart4_txd),
          `endif
     `endif

     `ifdef UART3_CHAN_SEL
        `ifdef UART3_4WIRE_SEL
            .I_uart3_rxd(I_uart3_rxd),
            .O_uart3_txd(O_uart3_txd),
            .O_uart3_rts_n(O_uart3_rts_n),
            .I_uart3_cts_n(I_uart3_cts_n),
         `else
            .I_uart3_rxd(I_uart3_rxd),
            .O_uart3_txd(O_uart3_txd),
          `endif
     `endif

     `ifdef UART2_CHAN_SEL
        `ifdef UART2_4WIRE_SEL
            .I_uart2_rxd(I_uart2_rxd),
            .O_uart2_txd(O_uart2_txd),
            .O_uart2_rts_n(O_uart2_rts_n),
            .I_uart2_cts_n(I_uart2_cts_n),
         `else
            .I_uart2_rxd(I_uart2_rxd),
            .O_uart2_txd(O_uart2_txd),
          `endif
     `endif

     `ifdef UART1_CHAN_SEL
        `ifdef UART1_4WIRE_SEL
            .I_uart1_rxd(I_uart1_rxd),
            .O_uart1_txd(O_uart1_txd),
            .O_uart1_rts_n(O_uart1_rts_n),
            .I_uart1_cts_n(I_uart1_cts_n),
         `else
            .I_uart1_rxd(I_uart1_rxd),
            .O_uart1_txd(O_uart1_txd),
          `endif
     `endif

     .I_sdio_clk          (I_sdio_clk      ),
     .I_sdio_2M_clk       (I_sdio_2M_clk   ),
     .I_sdio_cpu_clk      (I_sdio_cpu_clk  ),

     .IO_sdio_cmd         (IO_sdio_cmd     ),
     .IO_sdio_dat0        (IO_sdio_dat0    ),
     .IO_sdio_dat1_irq    (IO_sdio_dat1_irq),
     .IO_sdio_dat2_rw     (IO_sdio_dat2_rw ),
     .IO_sdio_dat3_cd     (IO_sdio_dat3_cd )

);
//--------------------------------------------------------------------
//--------------------------------------------------------------------

endmodule
