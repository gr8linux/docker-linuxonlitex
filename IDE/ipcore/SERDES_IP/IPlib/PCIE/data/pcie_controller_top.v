`include "define.vh"
`include "static_macro_define.vh"

module `module_name
(pcie_rstn_i
,pcie_tl_clk_i
//rq
,pcie_tl_rx_sop_o
,pcie_tl_rx_eop_o
,pcie_tl_rx_data_o
,pcie_tl_rx_valid_o
,pcie_tl_rx_bardec_o
,pcie_tl_rx_err_o
,pcie_tl_rx_wait_i
,pcie_tl_rx_masknp_i
//rc
,pcie_tl_tx_sop_i
,pcie_tl_tx_eop_i
,pcie_tl_tx_data_i
,pcie_tl_tx_valid_i
,pcie_tl_tx_wait_o
//msi
`ifdef msi_int
,pcie_tl_int_status_i
,pcie_tl_int_req_i
,pcie_tl_int_msinum_i
,pcie_tl_int_ack_o
`endif
//drp											
,pcie_tl_drp_clk_o		
,pcie_tl_drp_addr_i		
,pcie_tl_drp_wrdata_i	
,pcie_tl_drp_rddata_o	
,pcie_tl_drp_wr_i		
,pcie_tl_drp_rd_i		
,pcie_tl_drp_rd_valid_o	
,pcie_tl_drp_ready_o	
,pcie_tl_drp_strb_i
,pcie_tl_drp_resp_o
//status
,pcie_ltssm_o
,pcie_tl_tx_creditsp_o
,pcie_tl_tx_creditsnp_o
,pcie_tl_tx_creditscpl_o
,pcie_tl_cfg_busdev_o
//
,pcie_linkup_o
// to/from primitive
,pcie_tl_rx_sop_i
,pcie_tl_rx_eop_i
,pcie_tl_rx_data_i
,pcie_tl_rx_valid_i
,pcie_tl_rx_bardec_i
,pcie_tl_rx_err_i
,pcie_tl_rx_wait_o
,pcie_tl_rx_masknp_o
,pcie_tl_tx_sop_o
,pcie_tl_tx_eop_o
,pcie_tl_tx_data_o
,pcie_tl_tx_valid_o
,pcie_tl_tx_wait_i
,pcie_tl_int_status_o
,pcie_tl_int_req_o
,pcie_tl_int_msinum_o
,pcie_tl_int_ack_i
//drp
,pcie_tl_drp_clk_i		
,pcie_tl_drp_addr_o	
,pcie_tl_drp_wrdata_o	
,pcie_tl_drp_rddata_i	
,pcie_tl_drp_wr_o		
,pcie_tl_drp_rd_o		
,pcie_tl_drp_rd_valid_i
,pcie_tl_drp_ready_i	
,pcie_tl_drp_strb_o	
,pcie_tl_drp_resp_i
//from primitive
,pcie_tl_tx_credits_i
,pcie_pl_test_out_i
,pcie_tl_cfg_busdev_i
//from primitive
,fabric_pl_rx_det
,fabric_ln0_pma_rx_lock
,fabric_ln0_astat
,fabric_pl_txdata
,fabric_pl_txdata_h       
,fabric_pl_txdatak      
,fabric_pl_txdatak_h     
,fabric_pl_txdatavalid   
,fabric_pl_txdatavalid_h 
,fabric_ln0_rxdata                 
,fabric_ln0_rxdatavalid   
,fabric_ln1_rxdata        
,fabric_ln2_rxdata        
,fabric_ln3_rxdata        
,fabric_pl_rate
,fabric_pl_rate_h
,pcie_half_clk_i
//to primitive
,pcie_pmac_rstn_o
,pcie_tl_clk_freq_o
,pcie_tl_tx_prot_o
,pcie_tl_brsw_in_o
,pcie_tl_pm_obffcontrol_o
,pcie_VCC
,pcie_GND
,pcie_tl_clk_o
);
//
input				pcie_rstn_i;
input				pcie_tl_clk_i;
//rq		
output				pcie_tl_rx_sop_o;
output				pcie_tl_rx_eop_o;
output	[255:0]		pcie_tl_rx_data_o;
output	[7:0]		pcie_tl_rx_valid_o;
output	[5:0]		pcie_tl_rx_bardec_o;
output	[7:0]		pcie_tl_rx_err_o;
input				pcie_tl_rx_wait_i;
input				pcie_tl_rx_masknp_i;
//rc
input				pcie_tl_tx_sop_i;
input				pcie_tl_tx_eop_i;
input	[255:0]		pcie_tl_tx_data_i;
input	[7:0]		pcie_tl_tx_valid_i;
output				pcie_tl_tx_wait_o;
//msi
`ifdef msi_int
input				pcie_tl_int_status_i;
input				pcie_tl_int_req_i;
input	[4:0]		pcie_tl_int_msinum_i;
output				pcie_tl_int_ack_o;
`endif
//status
output	[4:0]		pcie_ltssm_o;
output	[31:0]		pcie_tl_tx_creditsp_o;
output	[31:0]		pcie_tl_tx_creditsnp_o;
output	[31:0]		pcie_tl_tx_creditscpl_o;
output	[12:0]		pcie_tl_cfg_busdev_o;
output				pcie_linkup_o;
//
//rq		
input				pcie_tl_rx_sop_i;
input				pcie_tl_rx_eop_i;
input	[255:0]		pcie_tl_rx_data_i;
input	[7:0]		pcie_tl_rx_valid_i;
input	[5:0]		pcie_tl_rx_bardec_i;
input	[7:0]		pcie_tl_rx_err_i;
output				pcie_tl_rx_wait_o;
output				pcie_tl_rx_masknp_o;
//rc
output				pcie_tl_tx_sop_o;
output				pcie_tl_tx_eop_o;
output	[255:0]		pcie_tl_tx_data_o;
output	[7:0]		pcie_tl_tx_valid_o;
input				pcie_tl_tx_wait_i;
//msi
output				pcie_tl_int_status_o;
output				pcie_tl_int_req_o;
output	[4:0]		pcie_tl_int_msinum_o;
input				pcie_tl_int_ack_i;
//drp											
output				pcie_tl_drp_clk_o		;
input	[23:0]		pcie_tl_drp_addr_i		;
input	[31:0]		pcie_tl_drp_wrdata_i	;
output	[31:0]		pcie_tl_drp_rddata_o	;
input	[7:0]		pcie_tl_drp_strb_i		;
output				pcie_tl_drp_resp_o		;
input				pcie_tl_drp_wr_i		;
input				pcie_tl_drp_rd_i		;
output				pcie_tl_drp_rd_valid_o	;
output				pcie_tl_drp_ready_o		;
//status
input	[95:0]		pcie_tl_tx_credits_i;
input	[31:0]		pcie_pl_test_out_i;
input	[12:0]		pcie_tl_cfg_busdev_i;
//

input				fabric_pl_rx_det;
input				fabric_ln0_pma_rx_lock;
input	[5  :0] 	fabric_ln0_astat;
input	[127:0]		fabric_pl_txdata        ;
input	[127:0]		fabric_pl_txdata_h       ;
input	[15 :0]		fabric_pl_txdatak      ;
input	[15 :0]		fabric_pl_txdatak_h     ;
input	[7  :0]		fabric_pl_txdatavalid   ;
input	[7  :0]		fabric_pl_txdatavalid_h ;
input	[87 :0] 	fabric_ln0_rxdata        ;
input	[0  :0]		fabric_ln0_rxdatavalid   ;
input	[87 :0] 	fabric_ln1_rxdata        ;
input	[87 :0] 	fabric_ln2_rxdata        ;
input	[87 :0] 	fabric_ln3_rxdata        ;
input	[1 :0]		fabric_pl_rate;
input	[1 :0]		fabric_pl_rate_h;
input				pcie_half_clk_i;
//
output				pcie_pmac_rstn_o;
output	[21:0]		pcie_tl_clk_freq_o;
output	[31:0]		pcie_tl_tx_prot_o;
output	[7:0]		pcie_tl_brsw_in_o;
output	[3:0]		pcie_tl_pm_obffcontrol_o;
output				pcie_VCC;
output				pcie_GND;
output				pcie_tl_clk_o;

input				pcie_tl_drp_clk_i		;
output	[23:0]		pcie_tl_drp_addr_o		;
output	[31:0]		pcie_tl_drp_wrdata_o	;
input	[31:0]		pcie_tl_drp_rddata_i	;
output				pcie_tl_drp_wr_o		;
output				pcie_tl_drp_rd_o		;
input				pcie_tl_drp_rd_valid_i	;
input				pcie_tl_drp_ready_i		;
output	[7:0]		pcie_tl_drp_strb_o		;
input				pcie_tl_drp_resp_i		;

//
//inst
`getname(pcie_top,`module_name)	u_pcie_controller
(.pcie_rstn_i					(pcie_rstn_i				)	
,.pcie_tl_clk_i					(pcie_tl_clk_i				)
//rq													
,.pcie_tl_rx_sop_o				(pcie_tl_rx_sop_o			)
,.pcie_tl_rx_eop_o				(pcie_tl_rx_eop_o			)
,.pcie_tl_rx_data_o				(pcie_tl_rx_data_o			)
,.pcie_tl_rx_valid_o			(pcie_tl_rx_valid_o			)
,.pcie_tl_rx_bardec_o			(pcie_tl_rx_bardec_o		)
,.pcie_tl_rx_err_o				(pcie_tl_rx_err_o			)
,.pcie_tl_rx_wait_i				(pcie_tl_rx_wait_i			)
,.pcie_tl_rx_masknp_i			(pcie_tl_rx_masknp_i		)
//rc													
,.pcie_tl_tx_sop_i				(pcie_tl_tx_sop_i			)
,.pcie_tl_tx_eop_i				(pcie_tl_tx_eop_i			)
,.pcie_tl_tx_data_i				(pcie_tl_tx_data_i			)
,.pcie_tl_tx_valid_i			(pcie_tl_tx_valid_i		    )
,.pcie_tl_tx_wait_o				(pcie_tl_tx_wait_o			)
//msi
`ifdef msi_int													
,.pcie_tl_int_status_i			(pcie_tl_int_status_i		)
,.pcie_tl_int_req_i				(pcie_tl_int_req_i			)
,.pcie_tl_int_msinum_i			(pcie_tl_int_msinum_i		)
,.pcie_tl_int_ack_o				(pcie_tl_int_ack_o			)
`endif
//drp
,.pcie_tl_drp_clk_i				(pcie_tl_drp_clk_i			)
,.pcie_tl_drp_addr_i			(pcie_tl_drp_addr_i			)	
,.pcie_tl_drp_wrdata_i			(pcie_tl_drp_wrdata_i		)
,.pcie_tl_drp_rddata_o			(pcie_tl_drp_rddata_o		)
,.pcie_tl_drp_wr_i				(pcie_tl_drp_wr_i			)
,.pcie_tl_drp_rd_i				(pcie_tl_drp_rd_i			)
,.pcie_tl_drp_rd_valid_o		(pcie_tl_drp_rd_valid_o		)	
,.pcie_tl_drp_ready_o			(pcie_tl_drp_ready_o		)	
,.pcie_tl_drp_strb_i			(pcie_tl_drp_strb_i			)
,.pcie_tl_drp_resp_o			(pcie_tl_drp_resp_o			)	
//status											
,.pcie_ltssm_o					(pcie_ltssm_o				)
,.pcie_tl_tx_creditsp_o			(pcie_tl_tx_creditsp_o		)
,.pcie_tl_tx_creditsnp_o		(pcie_tl_tx_creditsnp_o		)
,.pcie_tl_tx_creditscpl_o		(pcie_tl_tx_creditscpl_o	)
,.pcie_tl_cfg_busdev_o			(pcie_tl_cfg_busdev_o		)												
,.pcie_linkup_o					(pcie_linkup_o				)
//
,.pcie_tl_rx_sop_i				(pcie_tl_rx_sop_i			)							
,.pcie_tl_rx_eop_i				(pcie_tl_rx_eop_i			)							
,.pcie_tl_rx_data_i				(pcie_tl_rx_data_i			)							
,.pcie_tl_rx_valid_i			(pcie_tl_rx_valid_i			)							
,.pcie_tl_rx_bardec_i			(pcie_tl_rx_bardec_i		)								
,.pcie_tl_rx_err_i				(pcie_tl_rx_err_i			)							
,.pcie_tl_rx_wait_o				(pcie_tl_rx_wait_o			)							
,.pcie_tl_rx_masknp_o			(pcie_tl_rx_masknp_o		)								
,.pcie_tl_tx_sop_o				(pcie_tl_tx_sop_o			)							
,.pcie_tl_tx_eop_o				(pcie_tl_tx_eop_o			)							
,.pcie_tl_tx_data_o				(pcie_tl_tx_data_o			)							
,.pcie_tl_tx_valid_o			(pcie_tl_tx_valid_o			)							
,.pcie_tl_tx_wait_i				(pcie_tl_tx_wait_i			)							
,.pcie_tl_int_status_o			(pcie_tl_int_status_o		)								
,.pcie_tl_int_req_o				(pcie_tl_int_req_o			)							
,.pcie_tl_int_msinum_o			(pcie_tl_int_msinum_o		)								
,.pcie_tl_int_ack_i				(pcie_tl_int_ack_i			)							
//																					
,.pcie_tl_cfg_busdev_i			(pcie_tl_cfg_busdev_i		)	
//drp
,.pcie_tl_drp_clk_o				(pcie_tl_drp_clk_o			)
,.pcie_tl_drp_addr_o			(pcie_tl_drp_addr_o			)	
,.pcie_tl_drp_wrdata_o			(pcie_tl_drp_wrdata_o		)
,.pcie_tl_drp_rddata_i			(pcie_tl_drp_rddata_i		)
,.pcie_tl_drp_wr_o				(pcie_tl_drp_wr_o			)
,.pcie_tl_drp_rd_o				(pcie_tl_drp_rd_o			)
,.pcie_tl_drp_rd_valid_i		(pcie_tl_drp_rd_valid_i		)	
,.pcie_tl_drp_ready_i			(pcie_tl_drp_ready_i		)	
,.pcie_tl_drp_strb_o			(pcie_tl_drp_strb_o			)
,.pcie_tl_drp_resp_i			(pcie_tl_drp_resp_i			)							
//from primitive												
,.pcie_tl_tx_credits_i			(pcie_tl_tx_credits_i		)								
,.pcie_pl_test_out_i			(pcie_pl_test_out_i			)							
//from primitive											
,.fabric_pl_rx_det				(fabric_pl_rx_det			)							
,.fabric_ln0_pma_rx_lock		(fabric_ln0_pma_rx_lock		)								
,.fabric_ln0_astat				(fabric_ln0_astat			)							
,.fabric_pl_txdata				(fabric_pl_txdata			)							
,.fabric_pl_txdata_h       		(fabric_pl_txdata_h      	)									
,.fabric_pl_txdatak      		(fabric_pl_txdatak      	)									
,.fabric_pl_txdatak_h     		(fabric_pl_txdatak_h     	)									
,.fabric_pl_txdatavalid   		(fabric_pl_txdatavalid   	)									
,.fabric_pl_txdatavalid_h 		(fabric_pl_txdatavalid_h 	)									
,.fabric_ln0_rxdata        		(fabric_ln0_rxdata       	)																								
,.fabric_ln0_rxdatavalid   		(fabric_ln0_rxdatavalid  	)																		
,.fabric_ln1_rxdata        		(fabric_ln1_rxdata       	)																
,.fabric_ln2_rxdata        		(fabric_ln2_rxdata       	)								
,.fabric_ln3_rxdata        		(fabric_ln3_rxdata       	)																	
,.fabric_pl_rate				(fabric_pl_rate				)						
,.fabric_pl_rate_h				(fabric_pl_rate_h			)														
,.pcie_half_clk_i				(pcie_half_clk_i			)							
//to primitive										
,.pcie_pmac_rstn_o				(pcie_pmac_rstn_o			)													
,.pcie_tl_clk_freq_o			(pcie_tl_clk_freq_o			)		
,.pcie_tl_tx_prot_o				(pcie_tl_tx_prot_o			)			
,.pcie_tl_brsw_in_o				(pcie_tl_brsw_in_o			)			
,.pcie_tl_pm_obffcontrol_o		(pcie_tl_pm_obffcontrol_o	)							
,.pcie_VCC						(pcie_VCC					)	
,.pcie_GND						(pcie_GND					)						
,.pcie_tl_clk_o					(pcie_tl_clk_o				)						
);
endmodule