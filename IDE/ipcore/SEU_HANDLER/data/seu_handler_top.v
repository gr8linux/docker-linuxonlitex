`include "define.vh"
`include "static_macro_define.vh"

module `module_name
(input 			seu_sclk_i
,input 			seu_rst_n_i
,input 			seu_start_i
,input 			seu_stop_i
,input 			seu_errinj_i
,input	[7:0]	seu_dt_errinjloc_i	
,input	[15:0]	seu_frm_errinjloc_i	
,input	[6:0]	seu_ecc_errinjloc_i	

`ifdef dev_gw5a_138k
,output [7:0]	seu_dt_errloc_o		//bit address
,output [15:0]	seu_frm_errloc_o	//frame address
,output [7:0]	seu_ecc_syndrome_o	//frame address
`elsif dev_gw5a_25k
,output [7:0]	seu_dt_errloc0_o		//bit address
,output [15:0]	seu_frm_errloc0_o	//frame address
,output [7:0]	seu_ecc_syndrome0_o	//frame address
,output [7:0]	seu_dt_errloc1_o		//bit address
,output [15:0]	seu_frm_errloc1_o	//frame address
,output [7:0]	seu_ecc_syndrome1_o	//frame address
`endif
,output			seu_refclk_o   
,output			seu_running_o   
,output			seu_crcerr_o   
,output			seu_ecccorr_o   
,output			seu_eccuncorr_o   
,output			seu_busy_o    
);


`getname(seu_handler,`module_name)	u_seu_handler
(.seu_sclk_i				(seu_sclk_i				)
,.seu_rst_n_i				(seu_rst_n_i			)
,.seu_start_i				(seu_start_i			)
,.seu_stop_i				(seu_stop_i				)
,.seu_errinj_i				(seu_errinj_i			)	
,.seu_dt_errinjloc_i 		(seu_dt_errinjloc_i 	)			
,.seu_frm_errinjloc_i		(seu_frm_errinjloc_i	)			
,.seu_ecc_errinjloc_i	 	(seu_ecc_errinjloc_i	)	
`ifdef dev_gw5a_138k		
,.seu_dt_errloc_o			(seu_dt_errloc_o		)		
,.seu_frm_errloc_o			(seu_frm_errloc_o		)		
,.seu_ecc_syndrome_o		(seu_ecc_syndrome_o		)		
`elsif dev_gw5a_25k
,.seu_dt_errloc0_o			(seu_dt_errloc0_o		)		
,.seu_frm_errloc0_o			(seu_frm_errloc0_o		)		
,.seu_ecc_syndrome0_o		(seu_ecc_syndrome0_o	)	
,.seu_dt_errloc1_o			(seu_dt_errloc1_o		)		
,.seu_frm_errloc1_o			(seu_frm_errloc1_o		)		
,.seu_ecc_syndrome1_o		(seu_ecc_syndrome1_o	)	
`endif
,.seu_refclk_o   			(seu_refclk_o   		)	
,.seu_running_o   			(seu_running_o   		)	
,.seu_crcerr_o   			(seu_crcerr_o   		)		
,.seu_ecccorr_o   			(seu_ecccorr_o   		)	
,.seu_eccuncorr_o   		(seu_eccuncorr_o   		)			
,.seu_busy_o   				(seu_busy_o   			)
);

endmodule

