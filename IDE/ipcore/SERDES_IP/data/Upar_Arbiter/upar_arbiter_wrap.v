`include "define.vh"
`include "static_macro_define.v"

module `getname(upar_arbiter_wrap,`MODULE_NAME) (
	//User Side IO
		drp_clk_o,
		drp_addr_i,
		drp_wren_i,
		drp_wrdata_i,
		drp_strb_i,
		drp_ready_o,

		drp_rden_i,
		drp_rdvld_o,
		drp_rddata_o,
		
		drp_resp_o,
	//Serdes side IO
		upar_clk_i,
		upar_rst_o,
		upar_addr_o,
		upar_wren_o,
		upar_wrdata_o,
		upar_strb_o,
		upar_ready_i,
		
		upar_rden_o,
		upar_bus_width_o,
		upar_rdvld_i,
		upar_rddata_i
	);

	`include "parameter.vh"
//User Side IO
	output		[(DRP_NUM-1):0]		drp_clk_o;
	input		[(DRP_NUM*24-1):0]	drp_addr_i;
	input		[(DRP_NUM-1):0]		drp_wren_i;
	input		[(DRP_NUM*32-1):0]	drp_wrdata_i;
	input		[(DRP_NUM*8-1):0]	drp_strb_i;
	output		[(DRP_NUM-1):0]		drp_ready_o;

	input		[(DRP_NUM-1):0]		drp_rden_i;
	output		[(DRP_NUM-1):0]		drp_rdvld_o;
	output		[(DRP_NUM*32-1):0]	drp_rddata_o;
	
	output		[(DRP_NUM-1):0]		drp_resp_o;
//Serdes side IO
	input							upar_clk_i;
	output							upar_rst_o;
	output		[23:0]				upar_addr_o;
	output							upar_wren_o;
	output		[31:0]				upar_wrdata_o;
	output		[ 7:0]				upar_strb_o;
	input							upar_ready_i;
	
	output							upar_rden_o;
	output							upar_bus_width_o;
	input							upar_rdvld_i;
	input		[31:0]				upar_rddata_i;

	`getname(upar_arbiter,`MODULE_NAME) #(
		.DRP_NUM 			(DRP_NUM			)
	)u_upar_arbiter(

		.drp_clk_o 			(drp_clk_o			),
		.drp_addr_i 		(drp_addr_i 		),
		.drp_wren_i 		(drp_wren_i 		),
		.drp_wrdata_i 		(drp_wrdata_i 		),
		.drp_strb_i 		(drp_strb_i 		),
		.drp_ready_o 		(drp_ready_o 		),
		.drp_rden_i 		(drp_rden_i 		),
		.drp_rdvld_o 		(drp_rdvld_o 		),
		.drp_rddata_o 		(drp_rddata_o 		),

		.drp_resp_o 		(drp_resp_o 		),

		.upar_clk_i 		(upar_clk_i 		),
		.upar_rst_o 		(upar_rst_o 		),
		.upar_addr_o 		(upar_addr_o 		),
		.upar_wren_o 		(upar_wren_o 		),
		.upar_wrdata_o 		(upar_wrdata_o 		),
		.upar_strb_o 		(upar_strb_o 		),
		.upar_ready_i 		(upar_ready_i 		),

		.upar_rden_o 		(upar_rden_o 		),
		.upar_bus_width_o 	(upar_bus_width_o	),
		.upar_rdvld_i 		(upar_rdvld_i 		),
		.upar_rddata_i		(upar_rddata_i		)
	);

endmodule