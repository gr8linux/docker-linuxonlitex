
`timescale 1 ns / 100 ps
`include "sdio_spi_name.v"

module `module_name
(
            input       I_clk,
            input       I_rst_n,

            input       I_sdio_2M_clk,
            input       I_sdio_cpu_clk,
            //SDIO slaver interface
            input       I_sdio_clk,
            inout       IO_sdio_cmd,
            inout       IO_sdio_dat0,
            inout       IO_sdio_dat1_irq,
            inout       IO_sdio_dat2_rw,
            inout       IO_sdio_dat3_cd,
			//SPI master interface
			`ifdef SPI4_CHAN_SEL
				output 		O_spi4_cs_n,
			`endif
			`ifdef SPI3_CHAN_SEL
				output 		O_spi3_cs_n,
			`endif
			`ifdef SPI2_CHAN_SEL
				output 		O_spi2_cs_n,
			`endif
			`ifdef SPI1_CHAN_SEL
				output 		O_spi1_cs_n,
			`endif

			output 		O_spi_sclk,       
			output      O_spi_mosi,
			input      	I_spi_miso
);
/*************************************************/
//--------------------------------------------------------------------
//--SDIO Slaver <-> SPI Master
//--------------------------------------------------------------------
`getname(sdio_spi,`module_name) sdio_spi_inst(
    .I_rst_n             (I_rst_n         ),
    .I_clk               (I_clk           ),
    `ifdef SPI4_CHAN_SEL
       .O_spi4_cs_n      (O_spi4_cs_n     ),
    `endif
    `ifdef SPI3_CHAN_SEL
       .O_spi3_cs_n      (O_spi3_cs_n     ),
    `endif
    `ifdef SPI2_CHAN_SEL
       .O_spi2_cs_n      (O_spi2_cs_n     ),
    `endif
    `ifdef SPI1_CHAN_SEL
       .O_spi1_cs_n      (O_spi1_cs_n     ),
    `endif

    .O_spi_sclk          (O_spi_sclk      ),
    .O_spi_mosi          (O_spi_mosi      ),
    .I_spi_miso          (I_spi_miso      ),

    .I_sdio_clk          (I_sdio_clk),
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
