`timescale 1ns/100ps

`include "i2c_to_elvds_name.v"
`include "static_macro_define.v"

module `module_name    
(
		input	I_clk,
		input	I_rst_n,
		
		inout	IO_i2c_sda,
		inout	IO_i2c_scl,
		inout	IO_dsda_p,
		inout	IO_dsda_n,
		inout	IO_dscl_p,
		inout	IO_dscl_n
);

`getname(i2c_di2c_bridge,`module_name)  u_i2c_di2c_bridge(
		.I_rst_n         (I_rst_n ),
		.I_clk           (I_clk   ),
		
		.IO_sda          (IO_i2c_sda ),
		.IO_scl          (IO_i2c_scl ),
		
		.IO_dsda_p       (IO_dsda_p),
		.IO_dsda_n       (IO_dsda_n),
		.IO_dscl_p       (IO_dscl_p),
		.IO_dscl_n       (IO_dscl_n)

	);
	
endmodule