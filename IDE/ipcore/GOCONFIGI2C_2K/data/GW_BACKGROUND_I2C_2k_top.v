`timescale 1ns/100ps

`include "GW_BACKGROUND_I2C_name.v"
`include "static_macro_define.v"
`include    "GW_BACKGROUND_I2C_define.v"

module `module_name    
(
`ifdef JTAG_TEST
        output     TDO_EN                   ,
        output     TDO                      ,
        output     TCK                      ,
        output     TMS                      ,
        output     TDI                      ,
        output     TEST                     ,
`endif
        input      GW_BACKGROUND_SCL_INR    ,
        inout      GW_BACKGROUND_SDA_INR    ,
        input      GW_BACKGROUND_SEL_INR    ,
        output     GW_BACKGROUND_CLK        ,
        output     GW_BACKGROUND_DATA_OUT   ,
        output     GW_BACKGROUND_MODEL      ,
        input      GW_BACKGROUND_DATA_IN    ,
        input      GW_BACKGROUND_DATA_IN_EN ,
        output     GW_BACKGROUND_SEL_EXR    ,
        output     GW_BACKGROUND_RECONFIG_N ,
        output     GW_OSC_CLK  
);

`getname(GW_BACKGROUND_I2C,`module_name)  u_GW_BACKGROUND_I2C(
`ifdef JTAG_TEST
         . TDO_EN(TDO_EN),
         . TDO(TDO),
         . TCK(TCK),
         . TMS(TMS),
         . TDI(TDI),
         . TEST(TEST),
`endif

		 .GW_BACKGROUND_SCL_INR   (GW_BACKGROUND_SCL_INR)   ,
         .GW_BACKGROUND_SDA_INR   (GW_BACKGROUND_SDA_INR)   ,
         .GW_BACKGROUND_SEL_INR   (GW_BACKGROUND_SEL_INR)   ,
         .GW_BACKGROUND_CLK       (GW_BACKGROUND_CLK)       ,
         .GW_BACKGROUND_DATA_OUT  (GW_BACKGROUND_DATA_OUT)  ,
         .GW_BACKGROUND_MODEL     (GW_BACKGROUND_MODEL)     ,
         .GW_BACKGROUND_DATA_IN   (GW_BACKGROUND_DATA_IN)   ,
         .GW_BACKGROUND_DATA_IN_EN(GW_BACKGROUND_DATA_IN_EN),
         .GW_BACKGROUND_SEL_EXR   (GW_BACKGROUND_SEL_EXR)   ,
         .GW_BACKGROUND_RECONFIG_N(GW_BACKGROUND_RECONFIG_N),
         .GW_OSC_CLK              (GW_OSC_CLK) 

	);
	
endmodule
