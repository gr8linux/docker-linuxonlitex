`include "top_define.vh"
`include "RoraLink_8B10B_defines.vh"
`include "static_macro_define.vh"

`ifndef  MODELSIM_EN 
module `module_name
`else
module RoraLink_8B10B_Top
`endif
(
    // --------- Clock & Reset
    user_clk_i,
    init_clk_i,
    reset_i,
    user_pll_locked_i,

`ifdef RX_EN    
    link_reset_o,
`endif

    sys_reset_o,
    
    // --------- user interface TX Data interface  
`ifdef TX_EN
    user_tx_data_i,
`ifdef FRAMING_EN
    user_tx_strb_i,
`endif
    user_tx_valid_i,
`ifdef FRAMING_EN
    user_tx_last_i,
`endif
    user_tx_ready_o,
`endif

    // --------- user interface RX Data interface  
`ifdef RX_EN
    user_rx_data_o,
`ifdef FRAMING_EN
    user_rx_strb_o,
`endif
    user_rx_valid_o,
`ifdef FRAMING_EN
    user_rx_last_o,
`endif
`endif

`ifdef NFC_EN
`ifdef TX_EN
    // --------- Native Flow Control TX Interface  
    user_tx_nfc_req_i,
    user_tx_nfc_nb_i,
    user_tx_nfc_ack_o,
`endif

`ifdef RX_EN
    // --------- Native Flow Control RX Interface  
    user_rx_nfc_snf_o,
    user_rx_nfc_fc_nb_o,
`endif
`endif

`ifdef UFC_EN
`ifdef TX_EN
    // --------- User Flow Control TX Interface
    user_ufc_tx_req_i,
    user_ufc_tx_ms_i,
    user_ufc_tx_ack_o,
`endif

`ifdef RX_EN
    // --------- User Flow Control RX Inteface
    user_ufc_rx_data_o,
    user_ufc_rx_strb_o,
    user_ufc_rx_valid_o,
    user_ufc_rx_last_o,
`endif
`endif

`ifdef RX_EN
`ifdef CRC_EN
    crc_pass_fail_n_o,
    crc_valid_o,
`endif  
`endif

    // --------- Status Inteface
    hard_err_o,
`ifdef RX_EN
    soft_err_o,
`ifdef FRAMING_EN
    frame_err_o,
`endif
`endif

    channel_up_o,
    lane_up_o,
`ifdef SIMPLEX_RX_EN
`ifdef SIDEBANDS_EN    
    rx_aligned_o,
    rx_bonded_o,
    rx_verify_o,
    rx_reset_o,
`endif
`endif

`ifdef SIMPLEX_TX_EN
`ifdef SIDEBANDS_EN    
    tx_aligned_i,
    tx_bonded_i,
    tx_verify_i,
    tx_reset_i,
`endif
`endif

    // --------- SerDes
    gt_reset_i,
`ifdef TX_EN
    gt_pcs_tx_reset_i,
    gt_pcs_tx_clk_o, 
`endif
`ifdef RX_EN
    gt_pcs_rx_reset_i,
    gt_pcs_rx_clk_o, 
`endif
    gt_pll_lock_o,
`ifdef RX_EN    
    gt_rx_align_link_o,
    gt_rx_pma_lock_o, 
    gt_rx_k_lock_o,
`endif

`ifdef DRP_PORT_EN
    //-------- User DRP interface   
    user_drp_clk_o,   
    user_drp_addr_i,  
    user_drp_wren_i,  
    user_drp_wrdata_i,
    user_drp_strb_i,  
    user_drp_rden_i,  
    user_drp_ready_o, 
    user_drp_rdvld_o, 
    user_drp_rddata_o,
    user_drp_resp_o,     
`endif
    
`ifdef DRP_PORT_EN
    //-------- Upar interface    
    upar_arbiter_drp_addr_o,  
    upar_arbiter_drp_wren_o,  
    upar_arbiter_drp_wrdata_o,
    upar_arbiter_drp_strb_o,  
    upar_arbiter_drp_rden_o,  
    upar_arbiter_drp_clk_i,   
    upar_arbiter_drp_ready_i, 
    upar_arbiter_drp_rdvld_i, 
    upar_arbiter_drp_rddata_i,
    upar_arbiter_drp_resp_i,  
`endif

    //-------- Serdes interface    
`ifdef TX_EN
    serdes_pcs_tx_rst_o,///LANE#_PCS_TX_RST
    serdes_lanex_fabric_tx_clk_o,///LANE#_FABRIC_TX_CLK
    serdes_lanex_tx_if_fifo_afull_i,///LANE#_TX_IF_FIFO_FULL
    serdes_lnx_tx_vld_o,///FABRIC_LN#_TX_VLD_IN
    serdes_lnx_txdata_o,///FABRIC_LN#_TXDATA_I   
    serdes_tx_if_fifo_wrusewd_i,///LANE#_TX_IF_FIFO_WRUSEWD 
`endif

`ifdef RX_EN
    serdes_pcs_rx_rst_o,///LANE#_PCS_RX_RST
    serdes_lanex_fabric_rx_clk_o,///LANE#_FABRIC_RX_CLK  
    serdes_lanex_rx_if_fifo_aempty_i,///LANE#_RX_IF_FIFO_AEMPTY
    serdes_lanex_rx_if_fifo_rden_o,///LANE#_RX_IF_FIFO_RDEN
    serdes_lnx_rx_vld_i,///FABRIC_LN#_RX_VLD_OUT
    serdes_lnx_rxdata_i,///FABRIC_LN#_RXDATA_O
    serdes_rx_if_fifo_rdusewd_i,///LANE#_RX_IF_FIFO_RDUSEWD    
    serdes_lnx_pma_rx_lock_i,///FABRIC_LN#_PMA_RX_LOCK_O
    serdes_lanex_align_link_i,///LANE#_ALIGN_LINK
    serdes_lanex_k_lock_i,///LANE#_K_LOCK
    serdes_lanex_fabric_c2i_clk_o,///LANE#_FABRIC_C2I_CLK
    serdes_lanex_chbond_start_o,///LANE#_CHBOND_START
    serdes_lanex_align_trigger_o,///LANE#_ALIGN_TRIGGER
`endif
    serdes_lnx_rstn_o,///FABRIC_LN#_RSTN_I
    serdes_lanex_pcs_tx_fabric_clk_i,///LANE#_PCS_TX_O_FABRIC_CLK
    serdes_lanex_pcs_rx_fabric_clk_i,///LANE#_PCS_RX_O_FABRIC_CLK
    serdes_q0_cmu1_ok_i,///QUAD0 FABRIC_CMU1_OK_O
    serdes_q0_cmu0_ok_i,///QUAD0 FABRIC_CMU_OK_O
    serdes_q1_cmu1_ok_i,///QUAD1 FABRIC_CMU1_OK_O
    serdes_q1_cmu0_ok_i,///QUAD1 FABRIC_CMU_OK_O
    serdes_lanex_cmu_ok_i///FABRIC_LANE#_CMU_OK_O

 )/*synthesis syn_srlstyle="registers"*/;
//----------------------------------------------------------------------
//parameter
//----------------------------------------------------------------------
parameter  LANE_WIDTH          = `LANE_WIDTH;
parameter  DATA_WIDTH          = `LANE_DATA_WIDTH * `LANE_WIDTH;
parameter  STRB_WIDTH          = DATA_WIDTH/8;
parameter  REM_WIDTH           = ((DATA_WIDTH/8-1) > 1) ? $clog2(DATA_WIDTH/8-1) : 1;
parameter  UFC_DATA_WIDTH      = (DATA_WIDTH <= 128) ? DATA_WIDTH : 128;
parameter  UFC_STRB_WIDTH      = UFC_DATA_WIDTH/8;

//----------------------------------------------------------------------
//port
//----------------------------------------------------------------------
    // --------- Clocks & Resets
input                                   user_clk_i;
input                                   init_clk_i;
input                                   reset_i;
input                                   user_pll_locked_i;

`ifdef RX_EN
output                                  link_reset_o;
`endif
output                                  sys_reset_o;

// --------- user interface TX Data interface  
`ifdef TX_EN
`ifdef LITTLE_ENDIAN_EN
input   [DATA_WIDTH-1:0]                user_tx_data_i;
`ifdef FRAMING_EN                       
input   [STRB_WIDTH-1:0]                user_tx_strb_i;
`endif                                  
`else                                   
input   [0:DATA_WIDTH-1]                user_tx_data_i;
`ifdef FRAMING_EN                       
input   [0:STRB_WIDTH-1]                user_tx_strb_i;
`endif                                  
`endif                                  
input                                   user_tx_valid_i;
`ifdef FRAMING_EN                       
input                                   user_tx_last_i;
`endif                                  
output                                  user_tx_ready_o;
`endif

// --------- user interface RX Data interface  
`ifdef RX_EN
`ifdef LITTLE_ENDIAN_EN                 
output  [DATA_WIDTH-1:0]                user_rx_data_o;
`ifdef FRAMING_EN                       
output  [STRB_WIDTH-1:0]                user_rx_strb_o;
`endif                                  
`else                                   
output  [0:DATA_WIDTH-1]                user_rx_data_o;
`ifdef FRAMING_EN                       
output  [0:STRB_WIDTH-1]                user_rx_strb_o;
`endif                                  
`endif                                  
output                                  user_rx_valid_o;
`ifdef FRAMING_EN                       
output                                  user_rx_last_o;
`endif
`endif

// --------- Native Flow Control interface  
`ifdef NFC_EN
`ifdef TX_EN
input                                   user_tx_nfc_req_i;
`ifdef LITTLE_ENDIAN_EN                 
input   [3:0]                           user_tx_nfc_nb_i;
`else                                   
input   [0:3]                           user_tx_nfc_nb_i;
`endif                                  
output                                  user_tx_nfc_ack_o;
`endif

`ifdef RX_EN
// Native Flow Control RX Interface
output                                  user_rx_nfc_snf_o;
`ifdef LITTLE_ENDIAN_EN                
output  [3:0]                           user_rx_nfc_fc_nb_o;
`else                                   
output  [0:3]                           user_rx_nfc_fc_nb_o;
`endif
`endif
`endif

// --------- User Flow Control interface  
`ifdef UFC_EN
`ifdef TX_EN
input                                   user_ufc_tx_req_i;
`ifdef LITTLE_ENDIAN_EN                
input   [2:0]                           user_ufc_tx_ms_i;
`else                                   
input   [0:2]                           user_ufc_tx_ms_i;
`endif                                  
output                                  user_ufc_tx_ack_o;
`endif

`ifdef RX_EN
`ifdef LITTLE_ENDIAN_EN
output  [UFC_DATA_WIDTH-1:0]            user_ufc_rx_data_o;
output  [UFC_STRB_WIDTH-1:0]            user_ufc_rx_strb_o;
`else                                   
output  [0:UFC_DATA_WIDTH-1]            user_ufc_rx_data_o;
output  [0:UFC_STRB_WIDTH-1]            user_ufc_rx_strb_o;
`endif                                  
output                                  user_ufc_rx_valid_o;
output                                  user_ufc_rx_last_o;
`endif
`endif

`ifdef RX_EN
`ifdef CRC_EN
output                                  crc_pass_fail_n_o;
output                                  crc_valid_o;
`endif
`endif

// --------- Status 
output                                  hard_err_o;
`ifdef RX_EN
output                                  soft_err_o;
`ifdef FRAMING_EN
output                                  frame_err_o;
`endif
`endif

output                                  channel_up_o;
output  [LANE_WIDTH-1:0]                lane_up_o;

`ifdef SIMPLEX_RX_EN                    
`ifdef SIDEBANDS_EN
output                                  rx_aligned_o;
output                                  rx_bonded_o;
output                                  rx_verify_o;
output                                  rx_reset_o;
`endif   
`endif                    

`ifdef SIMPLEX_TX_EN                    
`ifdef SIDEBANDS_EN
input                                   tx_aligned_i;
input                                   tx_bonded_i;
input                                   tx_verify_i;
input                                   tx_reset_i;
`endif
`endif                                  

// --------- SerDes 
input                                   gt_reset_i;
`ifdef TX_EN
input                                   gt_pcs_tx_reset_i;
output  [LANE_WIDTH-1:0]                gt_pcs_tx_clk_o; 
`endif
`ifdef RX_EN
input                                   gt_pcs_rx_reset_i;
output  [LANE_WIDTH-1:0]                gt_pcs_rx_clk_o; 
`endif
output                                  gt_pll_lock_o;

`ifdef RX_EN    
output  [LANE_WIDTH-1:0]                gt_rx_align_link_o;
output  [LANE_WIDTH-1:0]                gt_rx_pma_lock_o; 
output  [LANE_WIDTH-1:0]                gt_rx_k_lock_o;
`endif

`ifdef DRP_PORT_EN
///User DRP Interface
output                                  user_drp_clk_o;   
input [23:0]                            user_drp_addr_i;  
input                                   user_drp_wren_i;  
input [31:0]                            user_drp_wrdata_i;
input [7:0]                             user_drp_strb_i;  
input                                   user_drp_rden_i;  
output                                  user_drp_ready_o; 
output                                  user_drp_rdvld_o; 
output[31:0]                            user_drp_rddata_o;
output                                  user_drp_resp_o;  
`endif

`ifdef DRP_PORT_EN
//-------- Upar interface    
output[23:0]                            upar_arbiter_drp_addr_o;  
output                                  upar_arbiter_drp_wren_o;  
output[31:0]                            upar_arbiter_drp_wrdata_o;
output[7:0]                             upar_arbiter_drp_strb_o;  
output                                  upar_arbiter_drp_rden_o;  
input                                   upar_arbiter_drp_clk_i;   
input                                   upar_arbiter_drp_ready_i; 
input                                   upar_arbiter_drp_rdvld_i; 
input [31:0]                            upar_arbiter_drp_rddata_i;
input                                   upar_arbiter_drp_resp_i;  
`endif

//-------- Serdes interface
`ifdef TX_EN
output  [`LANE_WIDTH-1:0]               serdes_pcs_tx_rst_o;///LANE#_PCS_TX_RST
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_tx_clk_o;///LANE#_FABRIC_TX_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_tx_if_fifo_afull_i;///LANE#_TX_IF_FIFO_FULL
output  [`LANE_WIDTH-1:0]               serdes_lnx_tx_vld_o;///FABRIC_LN#_TX_VLD_IN
output  [80*`LANE_WIDTH-1:0]            serdes_lnx_txdata_o;///FABRIC_LN#_TXDATA_I 
input   [5*`LANE_WIDTH-1:0]             serdes_tx_if_fifo_wrusewd_i;///LANE#_TX_IF_FIFO_WRUSEWD   
`endif

`ifdef RX_EN
output  [`LANE_WIDTH-1:0]               serdes_pcs_rx_rst_o;///LANE#_PCS_RX_RST
input   [`LANE_WIDTH-1:0]               serdes_lanex_align_link_i;///LANE#_ALIGN_LINK
input   [`LANE_WIDTH-1:0]               serdes_lanex_k_lock_i;///LANE#_K_LOCK
input   [`LANE_WIDTH-1:0]               serdes_lnx_pma_rx_lock_i;///FABRIC_LN#_PMA_RX_LOCK_O
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_rx_clk_o;///LANE#_FABRIC_RX_CLK  
input   [`LANE_WIDTH-1:0]               serdes_lanex_rx_if_fifo_aempty_i;///LANE#_RX_IF_FIFO_AEMPTY
output  [`LANE_WIDTH-1:0]               serdes_lanex_rx_if_fifo_rden_o;///LANE#_RX_IF_FIFO_RDEN
input   [`LANE_WIDTH-1:0]               serdes_lnx_rx_vld_i;///FABRIC_LN#_RX_VLD_OUT
input   [88*`LANE_WIDTH-1:0]            serdes_lnx_rxdata_i;///FABRIC_LN#_RXDATA_O
input   [5*`LANE_WIDTH-1:0]             serdes_rx_if_fifo_rdusewd_i;///LANE#_RX_IF_FIFO_RDUSEWD   
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_c2i_clk_o;///LANE#_FABRIC_C2I_CLK
output  [`LANE_WIDTH-1:0]               serdes_lanex_chbond_start_o;///LANE#_CHBOND_START
output  [`LANE_WIDTH-1:0]               serdes_lanex_align_trigger_o;///LANE#_ALIGN_TRIGGER
`endif

output  [`LANE_WIDTH-1:0]               serdes_lnx_rstn_o;///FABRIC_LN#_RSTN_I
input                                   serdes_q0_cmu1_ok_i;///QUAD0  FABRIC_CMU1_OK_O
input                                   serdes_q0_cmu0_ok_i;///QUAD0  FABRIC_CMU_OK_O
input                                   serdes_q1_cmu1_ok_i;///QUAD1  FABRIC_CMU1_OK_O
input                                   serdes_q1_cmu0_ok_i;///QUAD1  FABRIC_CMU_OK_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_cmu_ok_i;///FABRIC_LANE#_CMU_OK_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_tx_fabric_clk_i;///LANE#_PCS_TX_O_FABRIC_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_rx_fabric_clk_i;///LANE#_PCS_RX_O_FABRIC_CLK


//----------------------------------------------------------------------
//process
//----------------------------------------------------------------------     
//--- Instance of _core module --[
`ifndef  MODELSIM_EN 
`getname(RoraLink_8B10B_Core,`module_name) u_RoraLink_8B10B_Core
`else
RoraLink_8B10B_Core  u_RoraLink_8B10B_Core
`endif
(
    // --------- Clock & Reset
`ifdef RX_EN    
    .user_c2i_clk_i                     ( 1'b0                               ),
`endif
    .user_clk_i                         ( user_clk_i                         ),
    .init_clk_i                         ( init_clk_i                         ),
    .reset_i                            ( reset_i                            ),
    .user_pll_locked_i                  ( user_pll_locked_i                  ),

`ifdef RX_EN                                                                 
    .link_reset_o                       ( link_reset_o                       ),
`endif                                                                       

    .sys_reset_o                        ( sys_reset_o                        ),
    
    // --------- user interface TX Data interface  
`ifdef TX_EN
    .user_tx_data_i                     ( user_tx_data_i                     ),
`ifdef FRAMING_EN                                                             
    .user_tx_strb_i                     ( user_tx_strb_i                     ),
`endif                                                                        
    .user_tx_valid_i                    ( user_tx_valid_i                    ),
`ifdef FRAMING_EN                                                             
    .user_tx_last_i                     ( user_tx_last_i                     ),
`endif                                                                        
    .user_tx_ready_o                    ( user_tx_ready_o                    ),
`endif                                                                       

    // --------- user interface RX Data interface                            
`ifdef RX_EN                                                                 
    .user_rx_data_o                     ( user_rx_data_o                     ),
`ifdef FRAMING_EN                                                             
    .user_rx_strb_o                     ( user_rx_strb_o                     ),
`endif                                                                        
    .user_rx_valid_o                    ( user_rx_valid_o                    ),
`ifdef FRAMING_EN                                                             
    .user_rx_last_o                     ( user_rx_last_o                     ),
`endif
`endif

`ifdef NFC_EN
`ifdef TX_EN
    // --------- Native Flow Control TX Interface  
    .user_nfc_req_i                     ( user_tx_nfc_req_i                  ),
    .user_nfc_nb_i                      ( user_tx_nfc_nb_i                   ),
    .user_nfc_ack_o                     ( user_tx_nfc_ack_o                  ),
`endif

`ifdef RX_EN
    // --------- Native Flow Control RX Interface  
    .user_rx_snf_o                      ( user_rx_nfc_snf_o                  ),
    .user_rx_fc_nb_o                    ( user_rx_nfc_fc_nb_o                ),
`endif                                                                    
`endif

`ifdef UFC_EN
`ifdef TX_EN
    // --------- User Flow Control TX Interface
    .user_ufc_tx_req_i                  ( user_ufc_tx_req_i                  ),
    .user_ufc_tx_ms_i                   ( user_ufc_tx_ms_i                   ),
    .user_ufc_tx_ack_o                  ( user_ufc_tx_ack_o                  ),
`endif                                                                       

`ifdef RX_EN                                                                 
    // --------- User Flow Control RX Inteface                               
    .user_ufc_rx_data_o                 ( user_ufc_rx_data_o                 ),
    .user_ufc_rx_strb_o                 ( user_ufc_rx_strb_o                 ),
    .user_ufc_rx_valid_o                ( user_ufc_rx_valid_o                ),
    .user_ufc_rx_last_o                 ( user_ufc_rx_last_o                 ),
`endif
`endif

    // --------- Status Inteface
`ifdef DUPLEX_EN
    .hard_err_o                         ( hard_err_o                         ),
    .soft_err_o                         ( soft_err_o                         ),
`ifdef FRAMING_EN                                                            
    .frame_err_o                        ( frame_err_o                        ),
`endif                                                                       
`elsif SIMPLEX_RX_EN                                                         
    .rx_hard_err_o                      ( hard_err_o                         ),
    .soft_err_o                         ( soft_err_o                         ),
`ifdef FRAMING_EN                                                            
    .frame_err_o                        ( frame_err_o                        ),
`endif                                                                       
`else                                                                        
    .tx_hard_err_o                      ( hard_err_o                        ),
`endif

`ifdef RX_EN
`ifdef CRC_EN
    .crc_pass_fail_n_o                  ( crc_pass_fail_n_o                  ),
    .crc_valid_o                        ( crc_valid_o                        ),
`endif  
`endif

`ifdef DUPLEX_EN
    .channel_up_o                       ( channel_up_o                       ),
    .lane_up_o                          ( lane_up_o                          ),
`elsif SIMPLEX_RX_EN                                                         
    .rx_channel_up_o                    ( channel_up_o                       ),
    .rx_lane_up_o                       ( lane_up_o                          ),
`ifdef SIDEBANDS_EN                                                          
    .rx_aligned_o                       ( rx_aligned_o                       ),
    .rx_bonded_o                        ( rx_bonded_o                        ),
    .rx_verify_o                        ( rx_verify_o                        ),
    .rx_reset_o                         ( rx_reset_o                         ),
`endif                                                                  
`else
    .tx_lane_up_o                       ( lane_up_o                          ),
    .tx_channel_up_o                    ( channel_up_o                       ),
`ifdef SIDEBANDS_EN                                                          
    .tx_aligned_i                       ( tx_aligned_i                       ),
    .tx_bonded_i                        ( tx_bonded_i                        ),
    .tx_verify_i                        ( tx_verify_i                        ),
    .tx_reset_i                         ( tx_reset_i                         ),
`endif
`endif

    // --------- SerDes
    .gt_reset_i                         ( gt_reset_i                         ),
`ifdef TX_EN
    .gt_pcs_tx_reset_i                  ( gt_pcs_tx_reset_i                  ),
`endif
`ifdef RX_EN
    .gt_pcs_rx_reset_i                  ( gt_pcs_rx_reset_i                  ),
`endif
    .gt_tx_pcs_clk_o                    ( gt_pcs_tx_clk_o                    ), 
    .gt_rx_pcs_clk_o                    ( gt_pcs_rx_clk_o                    ), 
    .gt_pll_lock_o                      ( gt_pll_lock_o                      ),
`ifdef RX_EN                                                                 
    .gt_rx_align_link_o                 ( gt_rx_align_link_o                 ),
    .gt_rx_pma_lock_o                   ( gt_rx_pma_lock_o                   ), 
    .gt_rx_k_lock_o                     ( gt_rx_k_lock_o                     ),
`endif

`ifdef DRP_PORT_EN
    //-------- User DRP interface   
    .user_drp_clk_o                     ( user_drp_clk_o                     ),   
    .user_drp_addr_i                    ( user_drp_addr_i                    ),  
    .user_drp_wren_i                    ( user_drp_wren_i                    ),  
    .user_drp_wrdata_i                  ( user_drp_wrdata_i                  ),
    .user_drp_strb_i                    ( user_drp_strb_i                    ),  
    .user_drp_rden_i                    ( user_drp_rden_i                    ),  
    .user_drp_ready_o                   ( user_drp_ready_o                   ), 
    .user_drp_rdvld_o                   ( user_drp_rdvld_o                   ), 
    .user_drp_rddata_o                  ( user_drp_rddata_o                  ),
    .user_drp_resp_o                    ( user_drp_resp_o                    ),     
`endif
    
`ifdef DRP_PORT_EN
    //-------- Upar interface    
    .upar_arbiter_drp_addr_o            ( upar_arbiter_drp_addr_o            ),  
    .upar_arbiter_drp_wren_o            ( upar_arbiter_drp_wren_o            ),  
    .upar_arbiter_drp_wrdata_o          ( upar_arbiter_drp_wrdata_o          ),
    .upar_arbiter_drp_strb_o            ( upar_arbiter_drp_strb_o            ),  
    .upar_arbiter_drp_rden_o            ( upar_arbiter_drp_rden_o            ),  
    .upar_arbiter_drp_clk_i             ( upar_arbiter_drp_clk_i             ),   
    .upar_arbiter_drp_ready_i           ( upar_arbiter_drp_ready_i           ), 
    .upar_arbiter_drp_rdvld_i           ( upar_arbiter_drp_rdvld_i           ), 
    .upar_arbiter_drp_rddata_i          ( upar_arbiter_drp_rddata_i          ),
    .upar_arbiter_drp_resp_i            ( upar_arbiter_drp_resp_i            ),  
`endif

    //-------- Serdes interface    
`ifdef TX_EN
    .serdes_pcs_tx_rst_o                ( serdes_pcs_tx_rst_o                ),///LANE#_PCS_TX_RST
    .serdes_lanex_fabric_tx_clk_o       ( serdes_lanex_fabric_tx_clk_o       ),///LANE#_FABRIC_TX_CLK
    .serdes_lanex_tx_if_fifo_afull_i    ( serdes_lanex_tx_if_fifo_afull_i    ),///LANE#_TX_IF_FIFO_FULL
    .serdes_lnx_tx_vld_o                ( serdes_lnx_tx_vld_o                ),///FABRIC_LN#_TX_VLD_IN
    .serdes_lnx_txdata_o                ( serdes_lnx_txdata_o                ),///FABRIC_LN#_TXDATA_I   
    .serdes_tx_if_fifo_wrusewd_i        ( serdes_tx_if_fifo_wrusewd_i        ),///LANE#_TX_IF_FIFO_WRUSEWD 
`endif                                                                       

`ifdef RX_EN                                                                 
    .serdes_pcs_rx_rst_o                ( serdes_pcs_rx_rst_o                ),///LANE#_PCS_RX_RST
    .serdes_lanex_fabric_rx_clk_o       ( serdes_lanex_fabric_rx_clk_o       ),///LANE#_FABRIC_RX_CLK  
    .serdes_lanex_rx_if_fifo_aempty_i   ( serdes_lanex_rx_if_fifo_aempty_i   ),///LANE#_RX_IF_FIFO_AEMPTY
    .serdes_lanex_rx_if_fifo_rden_o     ( serdes_lanex_rx_if_fifo_rden_o     ),///LANE#_RX_IF_FIFO_RDEN
    .serdes_lnx_rx_vld_i                ( serdes_lnx_rx_vld_i                ),///FABRIC_LN#_RX_VLD_OUT
    .serdes_lnx_rxdata_i                ( serdes_lnx_rxdata_i                ),///FABRIC_LN#_RXDATA_O
    .serdes_rx_if_fifo_rdusewd_i        ( serdes_rx_if_fifo_rdusewd_i        ),///LANE#_RX_IF_FIFO_RDUSEWD    
    .serdes_lnx_pma_rx_lock_i           ( serdes_lnx_pma_rx_lock_i           ),///FABRIC_LN#_PMA_RX_LOCK_O
    .serdes_lanex_align_link_i          ( serdes_lanex_align_link_i          ),///LANE#_ALIGN_LINK
    .serdes_lanex_k_lock_i              ( serdes_lanex_k_lock_i              ),///LANE#_K_LOCK
    .serdes_lanex_fabric_c2i_clk_o      ( serdes_lanex_fabric_c2i_clk_o      ),///LANE#_FABRIC_C2I_CLK
    .serdes_lanex_chbond_start_o        ( serdes_lanex_chbond_start_o        ),///LANE#_CHBOND_START
    .serdes_lanex_align_trigger_o       ( serdes_lanex_align_trigger_o       ),///LANE#_ALIGN_TRIGGER
`endif                                                                       
    .serdes_lnx_rstn_o                  ( serdes_lnx_rstn_o                  ),///FABRIC_LN#_RSTN_I
    .serdes_lanex_pcs_tx_fabric_clk_i   ( serdes_lanex_pcs_tx_fabric_clk_i   ),///LANE#_PCS_TX_O_FABRIC_CLK
    .serdes_lanex_pcs_rx_fabric_clk_i   ( serdes_lanex_pcs_rx_fabric_clk_i   ),///LANE#_PCS_RX_O_FABRIC_CLK
    .serdes_q0_cmu1_ok_i                ( serdes_q0_cmu1_ok_i                ),///QUAD0 FABRIC_CMU1_OK_O
    .serdes_q0_cmu0_ok_i                ( serdes_q0_cmu0_ok_i                ),///QUAD0 FABRIC_CMU_OK_O
    .serdes_q1_cmu1_ok_i                ( serdes_q1_cmu1_ok_i                ),///QUAD1 FABRIC_CMU1_OK_O
    .serdes_q1_cmu0_ok_i                ( serdes_q1_cmu0_ok_i                ),///QUAD1 FABRIC_CMU_OK_O
    .serdes_lanex_cmu_ok_i              ( serdes_lanex_cmu_ok_i              ) ///FABRIC_LANE#_CMU_OK_O

);




endmodule
