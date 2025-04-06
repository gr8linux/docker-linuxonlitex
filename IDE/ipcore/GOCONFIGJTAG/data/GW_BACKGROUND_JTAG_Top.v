`include "GW_BACKGROUND_JTAG_define.v"
`include "static_macro_define.v"

module `module_name(
//input JTAG(Low) IO
        input 		GW_BACKGROUND_EXT_TCK	,
		input 		GW_BACKGROUND_EXT_TDI	,
		input 		GW_BACKGROUND_EXT_TMS	,
		output 		GW_BACKGROUND_EXT_TDO	,
		
//Output Flash(High) IO
        output      GW_BACKGROUND_INT_CLK	,	//TCK
        output      GW_BACKGROUND_INT_DO	,	//TDI
        output      GW_BACKGROUND_INT_MODEL	,	//TMS
        input       GW_BACKGROUND_INT_DI	,	//TDO
        input       GW_BACKGROUND_INT_DI_EN	,	//TDO_EN
// Others
        input       GW_BACKGROUND_EXT_SEL	,
        output      GW_BACKGROUND_INT_SEL 	,
        output      GW_OSC_CLK				,
        input       GW_RSTN
);

`getname(goConfig_JTAG,`module_name) inst_goConfig_JTAG(
	.GW_BACKGROUND_EXT_TCK	    (GW_BACKGROUND_EXT_TCK),
	.GW_BACKGROUND_EXT_TDI	    (GW_BACKGROUND_EXT_TDI),
	.GW_BACKGROUND_EXT_TMS	    (GW_BACKGROUND_EXT_TMS),
	.GW_BACKGROUND_EXT_TDO	    (GW_BACKGROUND_EXT_TDO),
	.GW_BACKGROUND_INT_CLK	    (GW_BACKGROUND_INT_CLK),	//TCK
	.GW_BACKGROUND_INT_DO	    (GW_BACKGROUND_INT_DO),	    //TDI
	.GW_BACKGROUND_INT_MODEL	(GW_BACKGROUND_INT_MODEL),	//TMS
	.GW_BACKGROUND_INT_DI	    (GW_BACKGROUND_INT_DI),	    //TDO
	.GW_BACKGROUND_INT_DI_EN	(GW_BACKGROUND_INT_DI_EN),	//TDO_EN
	.GW_BACKGROUND_INT_SEL	    (GW_BACKGROUND_INT_SEL),
	.GW_BACKGROUND_EXT_SEL	    (GW_BACKGROUND_EXT_SEL),
	.GW_OSC_CLK				    (GW_OSC_CLK),
	.GW_RSTN                    (GW_RSTN)
);
endmodule