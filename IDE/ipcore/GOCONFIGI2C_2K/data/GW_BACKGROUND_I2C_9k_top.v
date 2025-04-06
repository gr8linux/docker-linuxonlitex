`timescale 1ns/100ps

`include "GW_BACKGROUND_I2C_name.v"
`include "static_macro_define.v"

module `module_name    
(
input      GW_BACKGROUND_SCL_INR    ,
inout      GW_BACKGROUND_SDA_INR    ,		
output     GW_BACKGROUND_SCLK_INR   ,
output     GW_BACKGROUND_CS_INR     ,
output     GW_BACKGROUND_MOSI_INR   ,
input      GW_BACKGROUND_MISO_INR   ,
output     GW_OSC_CLK 
);

`getname(GW_BACKGROUND_I2C,`module_name)  u_GW_BACKGROUND_I2C(
		 .GW_BACKGROUND_SCL_INR  (GW_BACKGROUND_SCL_INR)     ,
         .GW_BACKGROUND_SDA_INR  (GW_BACKGROUND_SDA_INR)     ,
         .GW_BACKGROUND_SCLK_INR (GW_BACKGROUND_SCLK_INR)    ,
         .GW_BACKGROUND_CS_INR   (GW_BACKGROUND_CS_INR)      ,		 
         .GW_BACKGROUND_MOSI_INR (GW_BACKGROUND_MOSI_INR)    ,
         .GW_BACKGROUND_MISO_INR (GW_BACKGROUND_MISO_INR)    ,
         .GW_OSC_CLK             (GW_OSC_CLK) 

	);
	
endmodule
