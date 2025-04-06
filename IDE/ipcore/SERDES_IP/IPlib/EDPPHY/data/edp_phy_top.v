// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] edp_phy_top.v
//   \ \  / /\ \  / /    [Description ] EDP PHY top module
//    \ \/ /  \ \/ /     [Timestamp   ] Friday January 8 14:00:30 2021
//     \  /    \  /      [version     ] 1.2
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 05/04/23     | Initial version 
// ----------------------------------------------------------------------------------
// V1.1    | Caojie     | 08/30/23     | add AFE page 
// ----------------------------------------------------------------------------------
// V1.2    | Caojie     | 11/08/23     | Port modify 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 28/03/24     | Add TX Line Rate and RX Line Rate
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "edp_phy_defines.v"

module `module_name  
( 
`ifdef LINE0_EN 
    input         serdes_ln0_cpll_ok_i       ,
    output        serdes_ln0_fabric_rstn_o   ,
    output        serdes_ln0_rx_rst_o        ,
    input         serdes_ln0_pma_rx_lock_i   ,
    output        serdes_ln0_chbond_start_o  ,
    input         serdes_ln0_align_link_i    ,
    input         serdes_ln0_k_lock_i        ,
    input         serdes_ln0_pcs_rx_clk_i    ,
    output        serdes_ln0_fabric_rx_clk_o ,
    input  [87:0] serdes_ln0_rxdata_i        ,
    input  [4:0]  serdes_ln0_rxfifo_rdusewd_i,
    input         serdes_ln0_rxfifo_aempty_i ,
    input         serdes_ln0_rxfifo_empty_i  ,
    output        serdes_ln0_rxfifo_rden_o   ,
    output        serdes_ln0_tx_rst_o        ,
    input         serdes_ln0_pcs_tx_clk_i    ,
    output        serdes_ln0_fabric_tx_clk_o ,
    output [79:0] serdes_ln0_txdata_o        ,
    input  [4:0]  serdes_ln0_txfifo_wrusewd_i,
    input         serdes_ln0_txfifo_afull_i  ,
    input         serdes_ln0_txfifo_full_i   ,
    output        serdes_ln0_tx_vld_o        ,
    output        ln0_cpll_ok_o              ,
    input         ln0_fabric_rstn_i          ,
    input         ln0_rx_rst_i               ,
    output        ln0_pma_rx_lock_o          ,
    input         ln0_chbond_start_i         ,
    output        ln0_align_link_o           ,
    output        ln0_k_lock_o               ,
    output        ln0_pcs_rx_clk_o           ,
    input         ln0_fabric_rx_clk_i        ,
    output [4:0]  ln0_rxfifo_rdusewd_o       ,
    output        ln0_rxfifo_aempty_o        ,
    output        ln0_rxfifo_empty_o         ,
    input         ln0_rxfifo_rden_i          ,
    input         ln0_tx_rst_i               ,
    output        ln0_pcs_tx_clk_o           ,
    input         ln0_fabric_tx_clk_i        ,
    output [4:0]  ln0_txfifo_wrusewd_o       ,
    output        ln0_txfifo_afull_o         ,
    output        ln0_txfifo_full_o          ,
    input         ln0_tx_vld_i               ,
    `ifdef RX_X20_MODE                          
    output [15:0] ln0_rxdata_o               ,
    output [1:0]  ln0_rxk_o                  ,
    `endif 
    `ifdef TX_X20_MODE                         
    input  [15:0] ln0_txdata_i               ,
    input  [1:0]  ln0_txk_i                  ,
    `endif    
    `ifdef RX_X40_MODE                          
    output [31:0] ln0_rxdata_o               ,
    output [3:0]  ln0_rxk_o                  ,
    `endif 
    `ifdef TX_X40_MODE                       
    input  [31:0] ln0_txdata_i               ,
    input  [3:0]  ln0_txk_i                  ,
    `endif     
`endif                                       
`ifdef LINE1_EN                              
    input         serdes_ln1_cpll_ok_i       ,
    output        serdes_ln1_fabric_rstn_o   ,
    output        serdes_ln1_rx_rst_o        ,
    input         serdes_ln1_pma_rx_lock_i   ,
    output        serdes_ln1_chbond_start_o  ,
    input         serdes_ln1_align_link_i    ,
    input         serdes_ln1_k_lock_i        ,
    input         serdes_ln1_pcs_rx_clk_i    ,
    output        serdes_ln1_fabric_rx_clk_o ,
    input  [87:0] serdes_ln1_rxdata_i        ,
    input  [4:0]  serdes_ln1_rxfifo_rdusewd_i,
    input         serdes_ln1_rxfifo_aempty_i ,
    input         serdes_ln1_rxfifo_empty_i  ,
    output        serdes_ln1_rxfifo_rden_o   ,
    output        serdes_ln1_tx_rst_o        ,
    input         serdes_ln1_pcs_tx_clk_i    ,
    output        serdes_ln1_fabric_tx_clk_o ,
    output [79:0] serdes_ln1_txdata_o        ,
    input  [4:0]  serdes_ln1_txfifo_wrusewd_i,
    input         serdes_ln1_txfifo_afull_i  ,
    input         serdes_ln1_txfifo_full_i   ,
    output        serdes_ln1_tx_vld_o        ,
    output        ln1_cpll_ok_o              ,
    input         ln1_fabric_rstn_i          ,
    input         ln1_rx_rst_i               ,
    output        ln1_pma_rx_lock_o          ,
    input         ln1_chbond_start_i         ,
    output        ln1_align_link_o           ,
    output        ln1_k_lock_o               ,
    output        ln1_pcs_rx_clk_o           ,
    input         ln1_fabric_rx_clk_i        ,
    output [4:0]  ln1_rxfifo_rdusewd_o       ,
    output        ln1_rxfifo_aempty_o        ,
    output        ln1_rxfifo_empty_o         ,
    input         ln1_rxfifo_rden_i          ,
    input         ln1_tx_rst_i               ,
    output        ln1_pcs_tx_clk_o           ,
    input         ln1_fabric_tx_clk_i        ,
    output [4:0]  ln1_txfifo_wrusewd_o       ,
    output        ln1_txfifo_afull_o         ,
    output        ln1_txfifo_full_o          ,
    input         ln1_tx_vld_i               ,
    `ifdef RX_X20_MODE                          
    output [15:0] ln1_rxdata_o               ,
    output [1:0]  ln1_rxk_o                  ,
    `endif  
    `ifdef TX_X20_MODE                        
    input  [15:0] ln1_txdata_i               ,
    input  [1:0]  ln1_txk_i                  ,
    `endif 
    `ifdef RX_X40_MODE                          
    output [31:0] ln1_rxdata_o               ,
    output [3:0]  ln1_rxk_o                  ,
    `endif   
    `ifdef TX_X40_MODE                        
    input  [31:0] ln1_txdata_i               ,
    input  [3:0]  ln1_txk_i                  ,
    `endif
`endif                                       
`ifdef LINE2_EN                              
    input         serdes_ln2_cpll_ok_i       ,
    output        serdes_ln2_fabric_rstn_o   ,
    output        serdes_ln2_rx_rst_o        ,
    input         serdes_ln2_pma_rx_lock_i   ,
    output        serdes_ln2_chbond_start_o  ,
    input         serdes_ln2_align_link_i    ,
    input         serdes_ln2_k_lock_i        ,
    input         serdes_ln2_pcs_rx_clk_i    ,
    output        serdes_ln2_fabric_rx_clk_o ,
    input  [87:0] serdes_ln2_rxdata_i        ,
    input  [4:0]  serdes_ln2_rxfifo_rdusewd_i,
    input         serdes_ln2_rxfifo_aempty_i ,
    input         serdes_ln2_rxfifo_empty_i  ,
    output        serdes_ln2_rxfifo_rden_o   ,
    output        serdes_ln2_tx_rst_o        ,
    input         serdes_ln2_pcs_tx_clk_i    ,
    output        serdes_ln2_fabric_tx_clk_o ,
    output [79:0] serdes_ln2_txdata_o        ,
    input  [4:0]  serdes_ln2_txfifo_wrusewd_i,
    input         serdes_ln2_txfifo_afull_i  ,
    input         serdes_ln2_txfifo_full_i   ,
    output        serdes_ln2_tx_vld_o        ,
    output        ln2_cpll_ok_o              ,
    input         ln2_fabric_rstn_i          ,
    input         ln2_rx_rst_i               ,
    output        ln2_pma_rx_lock_o          ,
    input         ln2_chbond_start_i         ,
    output        ln2_align_link_o           ,
    output        ln2_k_lock_o               ,
    output        ln2_pcs_rx_clk_o           ,
    input         ln2_fabric_rx_clk_i        ,
    output [4:0]  ln2_rxfifo_rdusewd_o       ,
    output        ln2_rxfifo_aempty_o        ,
    output        ln2_rxfifo_empty_o         ,
    input         ln2_rxfifo_rden_i          ,
    input         ln2_tx_rst_i               ,
    output        ln2_pcs_tx_clk_o           ,
    input         ln2_fabric_tx_clk_i        ,
    output [4:0]  ln2_txfifo_wrusewd_o       ,
    output        ln2_txfifo_afull_o         ,
    output        ln2_txfifo_full_o          ,
    input         ln2_tx_vld_i               ,
    `ifdef RX_X20_MODE                          
    output [15:0] ln2_rxdata_o               ,
    output [1:0]  ln2_rxk_o                  ,
    `endif  
    `ifdef TX_X20_MODE                        
    input  [15:0] ln2_txdata_i               ,
    input  [1:0]  ln2_txk_i                  ,
    `endif    
    `ifdef RX_X40_MODE                          
    output [31:0] ln2_rxdata_o               ,
    output [3:0]  ln2_rxk_o                  ,
    `endif  
    `ifdef TX_X40_MODE                        
    input  [31:0] ln2_txdata_i               ,
    input  [3:0]  ln2_txk_i                  ,
    `endif     
`endif                                       
`ifdef LINE3_EN                              
    input         serdes_ln3_cpll_ok_i       ,
    output        serdes_ln3_fabric_rstn_o   ,
    output        serdes_ln3_rx_rst_o        ,
    input         serdes_ln3_pma_rx_lock_i   ,
    output        serdes_ln3_chbond_start_o  ,
    input         serdes_ln3_align_link_i    ,
    input         serdes_ln3_k_lock_i        ,
    input         serdes_ln3_pcs_rx_clk_i    ,
    output        serdes_ln3_fabric_rx_clk_o ,
    input  [87:0] serdes_ln3_rxdata_i        ,
    input  [4:0]  serdes_ln3_rxfifo_rdusewd_i,
    input         serdes_ln3_rxfifo_aempty_i ,
    input         serdes_ln3_rxfifo_empty_i  ,
    output        serdes_ln3_rxfifo_rden_o   ,
    output        serdes_ln3_tx_rst_o        ,
    input         serdes_ln3_pcs_tx_clk_i    ,
    output        serdes_ln3_fabric_tx_clk_o ,
    output [79:0] serdes_ln3_txdata_o        ,
    input  [4:0]  serdes_ln3_txfifo_wrusewd_i,
    input         serdes_ln3_txfifo_afull_i  ,
    input         serdes_ln3_txfifo_full_i   ,
    output        serdes_ln3_tx_vld_o        ,
    output        ln3_cpll_ok_o              ,
    input         ln3_fabric_rstn_i          ,
    input         ln3_rx_rst_i               ,
    output        ln3_pma_rx_lock_o          ,
    input         ln3_chbond_start_i         ,
    output        ln3_align_link_o           ,
    output        ln3_k_lock_o               ,
    output        ln3_pcs_rx_clk_o           ,
    input         ln3_fabric_rx_clk_i        ,
    output [4:0]  ln3_rxfifo_rdusewd_o       ,
    output        ln3_rxfifo_aempty_o        ,
    output        ln3_rxfifo_empty_o         ,
    input         ln3_rxfifo_rden_i          ,
    input         ln3_tx_rst_i               ,
    output        ln3_pcs_tx_clk_o           ,
    input         ln3_fabric_tx_clk_i        ,
    output [4:0]  ln3_txfifo_wrusewd_o       ,
    output        ln3_txfifo_afull_o         ,
    output        ln3_txfifo_full_o          ,
    input         ln3_tx_vld_i               ,
    `ifdef RX_X20_MODE                          
    output [15:0] ln3_rxdata_o               ,
    output [1:0]  ln3_rxk_o                  ,
    `endif   
    `ifdef TX_X20_MODE                         
    input  [15:0] ln3_txdata_i               ,
    input  [1:0]  ln3_txk_i                  ,
    `endif    
    `ifdef RX_X40_MODE                          
    output [31:0] ln3_rxdata_o               ,
    output [3:0]  ln3_rxk_o                  ,
    `endif 
    `ifdef TX_X40_MODE                         
    input  [31:0] ln3_txdata_i               ,
    input  [3:0]  ln3_txk_i                  ,
    `endif     
`endif                                       
    input         serdes_qpll0_ok_i          ,
    input         serdes_qpll1_ok_i          ,
    output        qpll0_ok_o                 ,
    output        qpll1_ok_o          
);

`getname(edp_phy_wrapper,`module_name) edp_phy_wrapper_inst 
( 
`ifdef LINE0_EN 
    .serdes_ln0_cpll_ok_i       (serdes_ln0_cpll_ok_i       ),
    .serdes_ln0_fabric_rstn_o   (serdes_ln0_fabric_rstn_o   ),
    .serdes_ln0_rx_rst_o        (serdes_ln0_rx_rst_o        ),
    .serdes_ln0_pma_rx_lock_i   (serdes_ln0_pma_rx_lock_i   ),
    .serdes_ln0_chbond_start_o  (serdes_ln0_chbond_start_o  ),
    .serdes_ln0_align_link_i    (serdes_ln0_align_link_i    ),
    .serdes_ln0_k_lock_i        (serdes_ln0_k_lock_i        ),
    .serdes_ln0_pcs_rx_clk_i    (serdes_ln0_pcs_rx_clk_i    ),
    .serdes_ln0_fabric_rx_clk_o (serdes_ln0_fabric_rx_clk_o ),
    .serdes_ln0_rxdata_i        (serdes_ln0_rxdata_i        ),
    .serdes_ln0_rxfifo_rdusewd_i(serdes_ln0_rxfifo_rdusewd_i),
    .serdes_ln0_rxfifo_aempty_i (serdes_ln0_rxfifo_aempty_i ),
    .serdes_ln0_rxfifo_empty_i  (serdes_ln0_rxfifo_empty_i  ),
    .serdes_ln0_rxfifo_rden_o   (serdes_ln0_rxfifo_rden_o   ),
    .serdes_ln0_tx_rst_o        (serdes_ln0_tx_rst_o        ),
    .serdes_ln0_pcs_tx_clk_i    (serdes_ln0_pcs_tx_clk_i    ),
    .serdes_ln0_fabric_tx_clk_o (serdes_ln0_fabric_tx_clk_o ),
    .serdes_ln0_txdata_o        (serdes_ln0_txdata_o        ),
    .serdes_ln0_txfifo_wrusewd_i(serdes_ln0_txfifo_wrusewd_i),
    .serdes_ln0_txfifo_afull_i  (serdes_ln0_txfifo_afull_i  ),
    .serdes_ln0_txfifo_full_i   (serdes_ln0_txfifo_full_i   ),
    .serdes_ln0_tx_vld_o        (serdes_ln0_tx_vld_o        ),
    .ln0_cpll_ok_o              (ln0_cpll_ok_o              ),
    .ln0_fabric_rstn_i          (ln0_fabric_rstn_i          ),
    .ln0_rx_rst_i               (ln0_rx_rst_i               ),
    .ln0_pma_rx_lock_o          (ln0_pma_rx_lock_o          ),
    .ln0_chbond_start_i         (ln0_chbond_start_i         ),
    .ln0_align_link_o           (ln0_align_link_o           ),
    .ln0_k_lock_o               (ln0_k_lock_o               ),
    .ln0_pcs_rx_clk_o           (ln0_pcs_rx_clk_o           ),
    .ln0_fabric_rx_clk_i        (ln0_fabric_rx_clk_i        ),
    .ln0_rxfifo_rdusewd_o       (ln0_rxfifo_rdusewd_o       ),
    .ln0_rxfifo_aempty_o        (ln0_rxfifo_aempty_o        ),
    .ln0_rxfifo_empty_o         (ln0_rxfifo_empty_o         ),
    .ln0_rxfifo_rden_i          (ln0_rxfifo_rden_i          ),
    .ln0_tx_rst_i               (ln0_tx_rst_i               ),
    .ln0_pcs_tx_clk_o           (ln0_pcs_tx_clk_o           ),
    .ln0_fabric_tx_clk_i        (ln0_fabric_tx_clk_i        ),
    .ln0_txfifo_wrusewd_o       (ln0_txfifo_wrusewd_o       ),
    .ln0_txfifo_afull_o         (ln0_txfifo_afull_o         ),
    .ln0_txfifo_full_o          (ln0_txfifo_full_o          ),
    .ln0_tx_vld_i               (ln0_tx_vld_i               ),
    `ifdef RX_X20_MODE                                         
    .ln0_rxdata_o               (ln0_rxdata_o               ),
    .ln0_rxk_o                  (ln0_rxk_o                  ),
    `endif    
    `ifdef TX_X20_MODE                                        
    .ln0_txdata_i               (ln0_txdata_i               ),
    .ln0_txk_i                  (ln0_txk_i                  ),
    `endif       
    `ifdef RX_X40_MODE                                         
    .ln0_rxdata_o               (ln0_rxdata_o               ),
    .ln0_rxk_o                  (ln0_rxk_o                  ),
    `endif  
    `ifdef TX_X40_MODE                                        
    .ln0_txdata_i               (ln0_txdata_i               ),
    .ln0_txk_i                  (ln0_txk_i                  ),
    `endif     
`endif                                                      
`ifdef LINE1_EN                                             
    .serdes_ln1_cpll_ok_i       (serdes_ln1_cpll_ok_i       ),
    .serdes_ln1_fabric_rstn_o   (serdes_ln1_fabric_rstn_o   ),
    .serdes_ln1_rx_rst_o        (serdes_ln1_rx_rst_o        ),
    .serdes_ln1_pma_rx_lock_i   (serdes_ln1_pma_rx_lock_i   ),
    .serdes_ln1_chbond_start_o  (serdes_ln1_chbond_start_o  ),
    .serdes_ln1_align_link_i    (serdes_ln1_align_link_i    ),
    .serdes_ln1_k_lock_i        (serdes_ln1_k_lock_i        ),
    .serdes_ln1_pcs_rx_clk_i    (serdes_ln1_pcs_rx_clk_i    ),
    .serdes_ln1_fabric_rx_clk_o (serdes_ln1_fabric_rx_clk_o ),
    .serdes_ln1_rxdata_i        (serdes_ln1_rxdata_i        ),
    .serdes_ln1_rxfifo_rdusewd_i(serdes_ln1_rxfifo_rdusewd_i),
    .serdes_ln1_rxfifo_aempty_i (serdes_ln1_rxfifo_aempty_i ),
    .serdes_ln1_rxfifo_empty_i  (serdes_ln1_rxfifo_empty_i  ),
    .serdes_ln1_rxfifo_rden_o   (serdes_ln1_rxfifo_rden_o   ),
    .serdes_ln1_tx_rst_o        (serdes_ln1_tx_rst_o        ),
    .serdes_ln1_pcs_tx_clk_i    (serdes_ln1_pcs_tx_clk_i    ),
    .serdes_ln1_fabric_tx_clk_o (serdes_ln1_fabric_tx_clk_o ),
    .serdes_ln1_txdata_o        (serdes_ln1_txdata_o        ),
    .serdes_ln1_txfifo_wrusewd_i(serdes_ln1_txfifo_wrusewd_i),
    .serdes_ln1_txfifo_afull_i  (serdes_ln1_txfifo_afull_i  ),
    .serdes_ln1_txfifo_full_i   (serdes_ln1_txfifo_full_i   ),
    .serdes_ln1_tx_vld_o        (serdes_ln1_tx_vld_o        ),
    .ln1_cpll_ok_o              (ln1_cpll_ok_o              ),
    .ln1_fabric_rstn_i          (ln1_fabric_rstn_i          ),
    .ln1_rx_rst_i               (ln1_rx_rst_i               ),
    .ln1_pma_rx_lock_o          (ln1_pma_rx_lock_o          ),
    .ln1_chbond_start_i         (ln1_chbond_start_i         ),
    .ln1_align_link_o           (ln1_align_link_o           ),
    .ln1_k_lock_o               (ln1_k_lock_o               ),
    .ln1_pcs_rx_clk_o           (ln1_pcs_rx_clk_o           ),
    .ln1_fabric_rx_clk_i        (ln1_fabric_rx_clk_i        ),
    .ln1_rxfifo_rdusewd_o       (ln1_rxfifo_rdusewd_o       ),
    .ln1_rxfifo_aempty_o        (ln1_rxfifo_aempty_o        ),
    .ln1_rxfifo_empty_o         (ln1_rxfifo_empty_o         ),
    .ln1_rxfifo_rden_i          (ln1_rxfifo_rden_i          ),
    .ln1_tx_rst_i               (ln1_tx_rst_i               ),
    .ln1_pcs_tx_clk_o           (ln1_pcs_tx_clk_o           ),
    .ln1_fabric_tx_clk_i        (ln1_fabric_tx_clk_i        ),
    .ln1_txfifo_wrusewd_o       (ln1_txfifo_wrusewd_o       ),
    .ln1_txfifo_afull_o         (ln1_txfifo_afull_o         ),
    .ln1_txfifo_full_o          (ln1_txfifo_full_o          ),
    .ln1_tx_vld_i               (ln1_tx_vld_i               ),
    `ifdef RX_X20_MODE                                         
    .ln1_rxdata_o               (ln1_rxdata_o               ),
    .ln1_rxk_o                  (ln1_rxk_o                  ),
    `endif 
    `ifdef TX_X20_MODE                                        
    .ln1_txdata_i               (ln1_txdata_i               ),
    .ln1_txk_i                  (ln1_txk_i                  ),
    `endif    
    `ifdef RX_X40_MODE                                         
    .ln1_rxdata_o               (ln1_rxdata_o               ),
    .ln1_rxk_o                  (ln1_rxk_o                  ),
    `endif   
    `ifdef TX_X40_MODE                                        
    .ln1_txdata_i               (ln1_txdata_i               ),
    .ln1_txk_i                  (ln1_txk_i                  ),
    `endif      
`endif                                                      
`ifdef LINE2_EN                                             
    .serdes_ln2_cpll_ok_i       (serdes_ln2_cpll_ok_i       ),
    .serdes_ln2_fabric_rstn_o   (serdes_ln2_fabric_rstn_o   ),
    .serdes_ln2_rx_rst_o        (serdes_ln2_rx_rst_o        ),
    .serdes_ln2_pma_rx_lock_i   (serdes_ln2_pma_rx_lock_i   ),
    .serdes_ln2_chbond_start_o  (serdes_ln2_chbond_start_o  ),
    .serdes_ln2_align_link_i    (serdes_ln2_align_link_i    ),
    .serdes_ln2_k_lock_i        (serdes_ln2_k_lock_i        ),
    .serdes_ln2_pcs_rx_clk_i    (serdes_ln2_pcs_rx_clk_i    ),
    .serdes_ln2_fabric_rx_clk_o (serdes_ln2_fabric_rx_clk_o ),
    .serdes_ln2_rxdata_i        (serdes_ln2_rxdata_i        ),
    .serdes_ln2_rxfifo_rdusewd_i(serdes_ln2_rxfifo_rdusewd_i),
    .serdes_ln2_rxfifo_aempty_i (serdes_ln2_rxfifo_aempty_i ),
    .serdes_ln2_rxfifo_empty_i  (serdes_ln2_rxfifo_empty_i  ),
    .serdes_ln2_rxfifo_rden_o   (serdes_ln2_rxfifo_rden_o   ),
    .serdes_ln2_tx_rst_o        (serdes_ln2_tx_rst_o        ),
    .serdes_ln2_pcs_tx_clk_i    (serdes_ln2_pcs_tx_clk_i    ),
    .serdes_ln2_fabric_tx_clk_o (serdes_ln2_fabric_tx_clk_o ),
    .serdes_ln2_txdata_o        (serdes_ln2_txdata_o        ),
    .serdes_ln2_txfifo_wrusewd_i(serdes_ln2_txfifo_wrusewd_i),
    .serdes_ln2_txfifo_afull_i  (serdes_ln2_txfifo_afull_i  ),
    .serdes_ln2_txfifo_full_i   (serdes_ln2_txfifo_full_i   ),
    .serdes_ln2_tx_vld_o        (serdes_ln2_tx_vld_o        ),
    .ln2_cpll_ok_o              (ln2_cpll_ok_o              ),
    .ln2_fabric_rstn_i          (ln2_fabric_rstn_i          ),
    .ln2_rx_rst_i               (ln2_rx_rst_i               ),
    .ln2_pma_rx_lock_o          (ln2_pma_rx_lock_o          ),
    .ln2_chbond_start_i         (ln2_chbond_start_i         ),
    .ln2_align_link_o           (ln2_align_link_o           ),
    .ln2_k_lock_o               (ln2_k_lock_o               ),
    .ln2_pcs_rx_clk_o           (ln2_pcs_rx_clk_o           ),
    .ln2_fabric_rx_clk_i        (ln2_fabric_rx_clk_i        ),
    .ln2_rxfifo_rdusewd_o       (ln2_rxfifo_rdusewd_o       ),
    .ln2_rxfifo_aempty_o        (ln2_rxfifo_aempty_o        ),
    .ln2_rxfifo_empty_o         (ln2_rxfifo_empty_o         ),
    .ln2_rxfifo_rden_i          (ln2_rxfifo_rden_i          ),
    .ln2_tx_rst_i               (ln2_tx_rst_i               ),
    .ln2_pcs_tx_clk_o           (ln2_pcs_tx_clk_o           ),
    .ln2_fabric_tx_clk_i        (ln2_fabric_tx_clk_i        ),
    .ln2_txfifo_wrusewd_o       (ln2_txfifo_wrusewd_o       ),
    .ln2_txfifo_afull_o         (ln2_txfifo_afull_o         ),
    .ln2_txfifo_full_o          (ln2_txfifo_full_o          ),
    .ln2_tx_vld_i               (ln2_tx_vld_i               ),
    `ifdef RX_X20_MODE                                         
    .ln2_rxdata_o               (ln2_rxdata_o               ),
    .ln2_rxk_o                  (ln2_rxk_o                  ),
    `endif  
    `ifdef TX_X20_MODE                                         
    .ln2_txdata_i               (ln2_txdata_i               ),
    .ln2_txk_i                  (ln2_txk_i                  ),
    `endif     
    `ifdef RX_X40_MODE                                         
    .ln2_rxdata_o               (ln2_rxdata_o               ),
    .ln2_rxk_o                  (ln2_rxk_o                  ),
    `endif   
    `ifdef TX_X40_MODE                                        
    .ln2_txdata_i               (ln2_txdata_i               ),
    .ln2_txk_i                  (ln2_txk_i                  ),
    `endif     
`endif                                                      
`ifdef LINE3_EN                                             
    .serdes_ln3_cpll_ok_i       (serdes_ln3_cpll_ok_i       ),
    .serdes_ln3_fabric_rstn_o   (serdes_ln3_fabric_rstn_o   ),
    .serdes_ln3_rx_rst_o        (serdes_ln3_rx_rst_o        ),
    .serdes_ln3_pma_rx_lock_i   (serdes_ln3_pma_rx_lock_i   ),
    .serdes_ln3_chbond_start_o  (serdes_ln3_chbond_start_o  ),
    .serdes_ln3_align_link_i    (serdes_ln3_align_link_i    ),
    .serdes_ln3_k_lock_i        (serdes_ln3_k_lock_i        ),
    .serdes_ln3_pcs_rx_clk_i    (serdes_ln3_pcs_rx_clk_i    ),
    .serdes_ln3_fabric_rx_clk_o (serdes_ln3_fabric_rx_clk_o ),
    .serdes_ln3_rxdata_i        (serdes_ln3_rxdata_i        ),
    .serdes_ln3_rxfifo_rdusewd_i(serdes_ln3_rxfifo_rdusewd_i),
    .serdes_ln3_rxfifo_aempty_i (serdes_ln3_rxfifo_aempty_i ),
    .serdes_ln3_rxfifo_empty_i  (serdes_ln3_rxfifo_empty_i  ),
    .serdes_ln3_rxfifo_rden_o   (serdes_ln3_rxfifo_rden_o   ),
    .serdes_ln3_tx_rst_o        (serdes_ln3_tx_rst_o        ),
    .serdes_ln3_pcs_tx_clk_i    (serdes_ln3_pcs_tx_clk_i    ),
    .serdes_ln3_fabric_tx_clk_o (serdes_ln3_fabric_tx_clk_o ),
    .serdes_ln3_txdata_o        (serdes_ln3_txdata_o        ),
    .serdes_ln3_txfifo_wrusewd_i(serdes_ln3_txfifo_wrusewd_i),
    .serdes_ln3_txfifo_afull_i  (serdes_ln3_txfifo_afull_i  ),
    .serdes_ln3_txfifo_full_i   (serdes_ln3_txfifo_full_i   ),
    .serdes_ln3_tx_vld_o        (serdes_ln3_tx_vld_o        ),
    .ln3_cpll_ok_o              (ln3_cpll_ok_o              ),
    .ln3_fabric_rstn_i          (ln3_fabric_rstn_i          ),
    .ln3_rx_rst_i               (ln3_rx_rst_i               ),
    .ln3_pma_rx_lock_o          (ln3_pma_rx_lock_o          ),
    .ln3_chbond_start_i         (ln3_chbond_start_i         ),
    .ln3_align_link_o           (ln3_align_link_o           ),
    .ln3_k_lock_o               (ln3_k_lock_o               ),
    .ln3_pcs_rx_clk_o           (ln3_pcs_rx_clk_o           ),
    .ln3_fabric_rx_clk_i        (ln3_fabric_rx_clk_i        ),
    .ln3_rxfifo_rdusewd_o       (ln3_rxfifo_rdusewd_o       ),
    .ln3_rxfifo_aempty_o        (ln3_rxfifo_aempty_o        ),
    .ln3_rxfifo_empty_o         (ln3_rxfifo_empty_o         ),
    .ln3_rxfifo_rden_i          (ln3_rxfifo_rden_i          ),
    .ln3_tx_rst_i               (ln3_tx_rst_i               ),
    .ln3_pcs_tx_clk_o           (ln3_pcs_tx_clk_o           ),
    .ln3_fabric_tx_clk_i        (ln3_fabric_tx_clk_i        ),
    .ln3_txfifo_wrusewd_o       (ln3_txfifo_wrusewd_o       ),
    .ln3_txfifo_afull_o         (ln3_txfifo_afull_o         ),
    .ln3_txfifo_full_o          (ln3_txfifo_full_o          ),
    .ln3_tx_vld_i               (ln3_tx_vld_i               ),
    `ifdef RX_X20_MODE                                         
    .ln3_rxdata_o               (ln3_rxdata_o               ),
    .ln3_rxk_o                  (ln3_rxk_o                  ),
    `endif  
    `ifdef TX_X20_MODE                                         
    .ln3_txdata_i               (ln3_txdata_i               ),
    .ln3_txk_i                  (ln3_txk_i                  ),
    `endif     
    `ifdef RX_X40_MODE                                         
    .ln3_rxdata_o               (ln3_rxdata_o               ),
    .ln3_rxk_o                  (ln3_rxk_o                  ),
    `endif 
    `ifdef TX_X40_MODE                                         
    .ln3_txdata_i               (ln3_txdata_i               ),
    .ln3_txk_i                  (ln3_txk_i                  ),
    `endif    
`endif                                                      
    .serdes_qpll0_ok_i          (serdes_qpll0_ok_i          ),
    .serdes_qpll1_ok_i          (serdes_qpll1_ok_i          ),
    .qpll0_ok_o                 (qpll0_ok_o                 ),
    .qpll1_ok_o                 (qpll1_ok_o                 ) 
);
    
endmodule

