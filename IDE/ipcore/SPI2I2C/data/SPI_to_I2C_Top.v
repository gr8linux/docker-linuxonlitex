
`timescale 1ns / 1ns
`include "spi_to_i2c_name.v"
`include "static_macro_define.v"

module `module_name (
			input  I_clk,
			input  I_rst_n,
			//i2c
			inout  IO_i2c_sda,
			output  O_i2c_scl,
			//spi 
			output O_spi_irq_n,
			input  I_spi_cs_n,
			input  I_spi_clk,
			input  I_spi_mosi,
			output O_spi_miso
);

//--------------------------------------------------------------------
//-- spi(S)_i2c(M)
//--------------------------------------------------------------------
 `getname(spi_i2c,`module_name) u_spi_i2c(
.I_rst_n             (I_rst_n         ),
.I_clk               (I_clk           ),

.IO_i2c_sda          (IO_i2c_sda      ),
.O_i2c_scl           (O_i2c_scl       ),

.O_spi_irq_n         (O_spi_irq_n     ),
.I_spi_cs_n          (I_spi_cs_n      ),
.I_spi_clk           (I_spi_clk       ),
.I_spi_mosi          (I_spi_mosi      ),
.O_spi_miso          (O_spi_miso      )
);
//--------------------------------------------------------------------
//--------------------------------------------------------------------

endmodule
