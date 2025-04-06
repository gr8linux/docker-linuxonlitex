`include "top_define.vh"
`include "cpri_defines.vh"
`include "static_macro_define.vh"


`ifndef  MODELSIM_EN 
module `module_name
`else
module CPRI_Top
`endif
(
    //-------- reset && clock
    tx_arst_i,
    rx_arst_i,
    cfg_arst_i,
    tx_rst_i,
    rx_rst_i,
    cfg_rst_i,
    tx_clk_i,
    rx_clk_i,
    cfg_clk_i,

    //-------- AUX inteface
    //o_aux_tx_frame_en,    
    aux_tx_slot_last_o,
    aux_tx_slot_num_o,
    aux_tx_bf_num_o,
    aux_tx_hf_num_o,
    aux_tx_node_bfn_o,

    aux_rx_bf_first_w_o,     
    aux_rx_slot_last_o,
    aux_rx_slot_num_o,
    aux_rx_bf_num_o,
    aux_rx_hf_num_o,    
    
    //-------- 10ms frame
    tx_bfn_strobe_i,        
    tx_bfn_i, 
    
    rx_bfn_strobe_o,        
    rx_bfn_o,

    //-------- IQ interface
    iq_tx_req_o,            
    iq_tx_data_i,
    
    iq_rx_valid_o,    
    iq_rx_mask_o,    
    iq_rx_data_o,    
    rx_data_o,     
    
    //-------- HDLC serial interface
    hdlc_tx_req_o,    
    hdlc_tx_data_i,
    
    hdlc_rx_data_valid_o,           
    hdlc_rx_data_o,   

`ifdef  ETH_MII 
    //-------- ETH mii interface           
    mii_tx_clk_i,    
    mii_tx_arst_i,
    mii_tx_rst_i,
    mii_tx_en_i,
    mii_tx_er_i,
    mii_tx_data_i,
    tx_buffer_full_o,
    
    mii_rx_clk_i,    
    mii_rx_arst_i,
    mii_rx_rst_i,
    mii_rx_en_o,
    mii_rx_data_o,
    mii_rx_er_o,
`endif

`ifdef  ETH_GMII 
    //-------- ETH gmii interface           
    gmii_tx_clk_i,    
    gmii_tx_arst_i,
    gmii_tx_rst_i,
    gmii_tx_en_i,
    gmii_tx_er_i,
    gmii_tx_data_i,
    gmii_tx_buffer_full_o,

    gmii_rx_clk_i,    
    gmii_rx_arst_i,
    gmii_rx_rst_i,
    gmii_rx_en_o,
    gmii_rx_data_o,
    gmii_rx_er_o,
`endif

    //-------- Vendor interface
    vendor_tx_req_o,
    vendor_tx_data_i,
    
    vendor_rx_data_valid_o,
    vendor_rx_data_mask_o,
    vendor_rx_data_o,   

`ifdef  REAL_TIME_VENDOR_UP10G 
    //-------- up10G real-time vendor-specific 
    up10g_rt_tx_req_o,
    up10g_rt_tx_data_i,

    up10g_rt_rx_data_o,
    up10g_rt_rx_mask_o,
    up10g_rt_rx_valid_o,
`endif
    
    //-------- L1 Control Words      
    z130_0_tx_reset_i,
    z130_0_tx_rai_i,   
    z130_0_tx_sdi_i,   
    z130_0_tx_los_i,   
    z130_0_tx_lof_i,   
    
    z130_0_rx_reset_o, 
    z130_0_rx_rai_o,   
    z130_0_rx_sdi_o,   
    z130_0_rx_los_o,   
    z130_0_rx_lof_o,   
    
    //-------- Status  
    local_los_o,       
    local_lof_o,   
    hfnsync_o,    
    
    speed_sel_o,

    //-------- delay value
    tx_delay_o,
    rx_delay_o,

    //-------- SFP interface 
    los_i,  
  
    //-------- cfg bus 
    cfg_sel_i,
    cfg_wr_i,
    cfg_ena_i,
    cfg_addr_i,///byte address
    cfg_wdata_i,
    cfg_rdy_o,
    cfg_rdata_o,

    //-------- User define serdes control
    gtr12_rstn_i,
    gtr12_pcs_tx_rst_i,
    gtr12_pcs_rx_rst_i,
    gtr12_user_rx_clk_i,
    gtr12_user_tx_clk_i,
    gtr12_align_link_o,
    gtr12_k_lock_o,
    gtr12_pma_rx_lock_o,
    gtr12_pll_ok_o,     
    gtr12_pll_ck_ref_o, 
    gtr12_rx_pcs_clk_o,
    gtr12_tx_pcs_clk_o,
    gtr12_rx_fifo_rdusewd_o,
    gtr12_tx_fifo_wrusewd_o,

`ifdef LOOPBACK_PORT_EN
    //-------- Loopback interface   
    loopback_en_i, 
    loopback_mode_i,
`endif

`ifdef TX_DIFF_PORT_EN
    tx_diff_en_i,  
    tx_diff_swing_i,
`endif

`ifdef TX_FFE_PORT_EN 
    tx_ffe_manual_en_i,
    tx_ffe_cm_i,        
    tx_ffe_c1_i,        
`endif

`ifdef RX_EQ_PORT_EN
    rx_eq_manual_en_i,
    rx_eq_att_i,       
    rx_eq_boost_i,     
`endif

`ifdef RX_BIAS_PORT_EN
    rx_quad_bias_en_i,
    rx_quad_bias_i,    
`endif

`ifdef TX_PRBS_PORT_EN
    tx_prbs_test_en_i,  
    tx_prbs_sel_i,       
    tx_prbs_insert_err_i,
`endif

`ifdef RX_PRBS_PORT_EN
    rx_prbs_test_en_i,
    rx_prbs_sel_i,     
    rx_prbs_err_clr_i, 
    rx_prbs_err_cnt_o, 
`endif

`ifdef EXT_PORT_EN
    user_drp_clk_o,   
`endif

`ifdef DRP_PORT_EN
    //-------- User DRP interface   
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
    
`ifdef EXT_PORT_EN
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
    serdes_lnx_rstn_o,///FABRIC_LN#_RSTN_I
    serdes_pcs_tx_rst_o,///LANE#_PCS_TX_RST
    serdes_pcs_rx_rst_o,///LANE#_PCS_RX_RST
    serdes_lanex_align_link_i,///LANE#_ALIGN_LINK
    serdes_lanex_k_lock_i,///LANE#_K_LOCK
    serdes_lnx_pma_rx_lock_i,///FABRIC_LN#_PMA_RX_LOCK_O
    serdes_cmu1_ok_i,///FABRIC_CMU1_OK_O
    serdes_cmu1_ck_ref_i,///FABRIC_CMU1_CK_REF_O
    serdes_cmu0_ok_i,///FABRIC_CMU_OK_O
    serdes_cmu0_ck_ref_i,///FABRIC_CMU_CK_REF_O
    serdes_lanex_cmu_ok_i,///FABRIC_LANE#_CMU_OK_O
    serdes_lanex_cmu_ck_ref_i,///FABRIC_LANE#_CMU_CK_REF_O
    serdes_lanex_pcs_rx_fabric_clk_i,///LANE#_PCS_RX_O_FABRIC_CLK
    serdes_lanex_pcs_tx_fabric_clk_i,///LANE#_PCS_TX_O_FABRIC_CLK
    serdes_lanex_fabric_rx_clk_o,///LANE#_FABRIC_RX_CLK  &&  LANE#_FABRIC_C2I_CLK
    serdes_lanex_fabric_tx_clk_o,///LANE#_FABRIC_TX_CLK
    serdes_lanex_rx_if_fifo_aempty_i,///LANE#_RX_IF_FIFO_AEMPTY
    serdes_lanex_tx_if_fifo_full_i,///LANE#_TX_IF_FIFO_FULL
    serdes_lanex_rx_if_fifo_rden_o,///LANE#_RX_IF_FIFO_RDEN
    serdes_lnx_tx_vld_o,///FABRIC_LN#_TX_VLD_IN
    serdes_lnx_rx_vld_i,///FABRIC_LN#_RX_VLD_OUT
    serdes_lnx_rxdata_i,///FABRIC_LN#_RXDATA_O
    serdes_lnx_txdata_o,///FABRIC_LN#_TXDATA_I    
    serdes_rx_if_fifo_rdusewd_i,///LANE#_RX_IF_FIFO_RDUSEWD    
    serdes_tx_if_fifo_wrusewd_i ///LANE#_TX_IF_FIFO_WRUSEWD 

/////-------- upar config
///    upar_wr_en_o,
///    upar_addr_o, 
///    upar_wdata_o,
///    upar_rd_en_o,
///    upar_rdata_i,
///    upar_rdvld_i,
///    upar_ready_i
   
);
//----------------------------------------------------------------------
//parameter
//----------------------------------------------------------------------
///3.072Gbps and under (VENDOR_CW_WIDTH == 40) ,DATA_PATH_WIDTH == 16
///6.144Gbps and under (VENDOR_CW_WIDTH == 80) ,DATA_PATH_WIDTH == 32
///9.8304Gbps and under (VENDOR_CW_WIDTH == 128) ,DATA_PATH_WIDTH == 64
///10.1376Gbps and under (VENDOR_CW_WIDTH == 128) ,DATA_PATH_WIDTH == 64
parameter                               DATA_PATH_WIDTH   = `DATA_PATH_WIDTH;//16bit,32bit,64bit
parameter                               DATA_CTL_WIDTH    = DATA_PATH_WIDTH/8;
parameter                               VENDOR_CW_WIDTH   = `VENDOR_CW_WIDTH;//40bit,80bit,128bit
parameter                               VENDOR_CTL_WIDTH  = VENDOR_CW_WIDTH/8;
parameter                               SLOT_NUM_WIDTH    = `SLOT_NUM_WIDTH;//5、6、7

//----------------------------------------------------------------------
//port
//----------------------------------------------------------------------
//-------- reset && clock
input                                   tx_arst_i;              // asynchronous tx reset 
input                                   rx_arst_i;              // asynchronous rx reset 
input                                   cfg_arst_i;               
input                                   tx_rst_i;              // synchronous tx reset 
input                                   rx_rst_i;              // synchronous rx reset 
input                                   cfg_rst_i;               
input                                   tx_clk_i;               
input                                   rx_clk_i;                
input                                   cfg_clk_i;  

//-------- AUX inteface
output                                  aux_tx_slot_last_o;
output[SLOT_NUM_WIDTH-1:0]              aux_tx_slot_num_o;
output[7:0]                             aux_tx_bf_num_o;
output[7:0]                             aux_tx_hf_num_o;
output[11:0]                            aux_tx_node_bfn_o;

output                                  aux_rx_bf_first_w_o;    // Rx
output                                  aux_rx_slot_last_o;
output[SLOT_NUM_WIDTH-1:0]              aux_rx_slot_num_o;
output[7:0]                             aux_rx_bf_num_o;
output[7:0]                             aux_rx_hf_num_o;

//-------- 10ms frame 
input                                   tx_bfn_strobe_i;        
input[11:0]                             tx_bfn_i; 

output                                  rx_bfn_strobe_o;        
output[11:0]                            rx_bfn_o;

//-------- IQ interface
output[DATA_CTL_WIDTH-1:0]              iq_tx_req_o;            
input[DATA_PATH_WIDTH-1:0]              iq_tx_data_i;

output                                  iq_rx_valid_o;  // 
output[DATA_CTL_WIDTH-1:0]              iq_rx_mask_o;   // iq data byte 
output[DATA_PATH_WIDTH-1:0]             iq_rx_data_o;
output[DATA_PATH_WIDTH-1:0]             rx_data_o;

//-------- HDLC serial interface 
output                                  hdlc_tx_req_o;               
input                                   hdlc_tx_data_i;

output                                  hdlc_rx_data_valid_o;           
output                                  hdlc_rx_data_o;

`ifdef  ETH_MII 
//-------- ETH mii interface           
input                                   mii_tx_clk_i; // clock
input                                   mii_tx_arst_i; // mii asynchronous tx reset 
input                                   mii_tx_rst_i; // mii synchronous tx reset 
input                                   mii_tx_en_i;
input                                   mii_tx_er_i;
input[3:0]                              mii_tx_data_i;
output                                  tx_buffer_full_o;

input                                   mii_rx_clk_i; // clock
input                                   mii_rx_arst_i; // mii asynchronous rx reset 
input                                   mii_rx_rst_i; // mii synchronous rx reset 
output                                  mii_rx_en_o;
output[3:0]                             mii_rx_data_o;
output                                  mii_rx_er_o;
`endif

`ifdef  ETH_GMII 
//-------- ETH gmii interface           
input                                   gmii_tx_clk_i; // clock
input                                   gmii_tx_arst_i; // gmii asynchronous tx reset 
input                                   gmii_tx_rst_i; // gmii asynchronous tx reset 
input                                   gmii_tx_en_i;
input                                   gmii_tx_er_i;
input[7:0]                              gmii_tx_data_i;
output                                  gmii_tx_buffer_full_o;

input                                   gmii_rx_clk_i; // clock
input                                   gmii_rx_arst_i; // mii asynchronous rx reset 
input                                   gmii_rx_rst_i; // mii asynchronous rx reset 
output                                  gmii_rx_en_o;
output[7:0]                             gmii_rx_data_o;
output                                  gmii_rx_er_o;
`endif

//-------- Vendor interface
output[VENDOR_CTL_WIDTH-1:0]            vendor_tx_req_o;
input[VENDOR_CW_WIDTH-1:0]              vendor_tx_data_i;

output                                  vendor_rx_data_valid_o;
output[VENDOR_CTL_WIDTH-1:0]            vendor_rx_data_mask_o;
output[VENDOR_CW_WIDTH-1:0]             vendor_rx_data_o;

`ifdef  REAL_TIME_VENDOR_UP10G 
//-------- up10G real-time vendor-specific 
output [7:0]                            up10g_rt_tx_req_o;
input [63:0]                            up10g_rt_tx_data_i;

output [63:0]                           up10g_rt_rx_data_o;
output [7:0]                            up10g_rt_rx_mask_o;
output                                  up10g_rt_rx_valid_o;
`endif
    
//-------- CONTROL AND STATUS 
input                                   z130_0_tx_reset_i;
input                                   z130_0_tx_rai_i;   
input                                   z130_0_tx_sdi_i;   
input                                   z130_0_tx_los_i;   
input                                   z130_0_tx_lof_i;   
    
output                                  z130_0_rx_reset_o; 
output                                  z130_0_rx_rai_o;   
output                                  z130_0_rx_sdi_o;   
output                                  z130_0_rx_los_o;   
output                                  z130_0_rx_lof_o;   

//-------- Status   
output                                  local_los_o;       
output                                  local_lof_o;    
output                                  hfnsync_o;   

output [3:0]                            speed_sel_o;   

//-------- delay value
output[7:0]                             tx_delay_o;
output[7:0]                             rx_delay_o;

//-------- SFP interface 
input                                   los_i;          // 光电模块

//-------- cfg bus    
input                                   cfg_sel_i;
input                                   cfg_wr_i;
input                                   cfg_ena_i;
input [11:0]                            cfg_addr_i;///byte address
input [31:0]                            cfg_wdata_i;
output                                  cfg_rdy_o;
output[31:0]                            cfg_rdata_o;

//-------- User define serdes control
input                                   gtr12_rstn_i;
input                                   gtr12_pcs_tx_rst_i;
input                                   gtr12_pcs_rx_rst_i;
input                                   gtr12_user_rx_clk_i;
input                                   gtr12_user_tx_clk_i;
output                                  gtr12_align_link_o;
output                                  gtr12_k_lock_o;
output                                  gtr12_pma_rx_lock_o;
output                                  gtr12_pll_ok_o;    
output                                  gtr12_pll_ck_ref_o;  
output                                  gtr12_rx_pcs_clk_o;
output                                  gtr12_tx_pcs_clk_o;
output  [4:0]                           gtr12_rx_fifo_rdusewd_o;
output  [4:0]                           gtr12_tx_fifo_wrusewd_o;

`ifdef LOOPBACK_PORT_EN
//-------- Loopback interface   
input                                   loopback_en_i; 
input [1:0]                             loopback_mode_i;
`endif

`ifdef TX_DIFF_PORT_EN
input                                   tx_diff_en_i;  
input [3:0]                             tx_diff_swing_i;
`endif

`ifdef TX_FFE_PORT_EN 
input                                   tx_ffe_manual_en_i;
input [4:0]                             tx_ffe_cm_i;        
input [4:0]                             tx_ffe_c1_i;        
`endif

`ifdef RX_EQ_PORT_EN
input                                   rx_eq_manual_en_i;
input [3:0]                             rx_eq_att_i;       
input [3:0]                             rx_eq_boost_i;     
`endif

`ifdef RX_BIAS_PORT_EN
input                                   rx_quad_bias_en_i;
input [3:0]                             rx_quad_bias_i;    
`endif

`ifdef TX_PRBS_PORT_EN
input                                   tx_prbs_test_en_i;  
input [2:0]                             tx_prbs_sel_i;       
input                                   tx_prbs_insert_err_i;
`endif

`ifdef RX_PRBS_PORT_EN
input                                   rx_prbs_test_en_i;
input [2:0]                             rx_prbs_sel_i;     
input                                   rx_prbs_err_clr_i; 
output[7:0]                             rx_prbs_err_cnt_o; 
`endif

`ifdef EXT_PORT_EN
output                                  user_drp_clk_o;   
`endif

`ifdef DRP_PORT_EN
///User DRP Interface
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

`ifdef EXT_PORT_EN
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
output                                  serdes_lnx_rstn_o;///FABRIC_LN#_RSTN_I
output                                  serdes_pcs_tx_rst_o;///LANE#_PCS_TX_RST
output                                  serdes_pcs_rx_rst_o;///LANE#_PCS_RX_RST
input                                   serdes_lanex_align_link_i;///LANE#_ALIGN_LINK
input                                   serdes_lanex_k_lock_i;///LANE#_K_LOCK
input                                   serdes_lnx_pma_rx_lock_i;///FABRIC_LN#_PMA_RX_LOCK_O
input                                   serdes_cmu1_ok_i;///FABRIC_CMU1_OK_O
input                                   serdes_cmu1_ck_ref_i;///FABRIC_CMU1_CK_REF_O
input                                   serdes_cmu0_ok_i;///FABRIC_CMU_OK_O
input                                   serdes_cmu0_ck_ref_i;///FABRIC_CMU_CK_REF_O
input                                   serdes_lanex_cmu_ok_i;///FABRIC_LANE#_CMU_OK_O
input                                   serdes_lanex_cmu_ck_ref_i;///FABRIC_LANE#_CMU_CK_REF_O
input                                   serdes_lanex_pcs_rx_fabric_clk_i;///LANE#_PCS_RX_O_FABRIC_CLK
input                                   serdes_lanex_pcs_tx_fabric_clk_i;///LANE#_PCS_TX_O_FABRIC_CLK
output                                  serdes_lanex_fabric_rx_clk_o;///LANE#_FABRIC_RX_CLK  &&  LANE#_FABRIC_C2I_CLK
output                                  serdes_lanex_fabric_tx_clk_o;///LANE#_FABRIC_TX_CLK
input                                   serdes_lanex_rx_if_fifo_aempty_i;///LANE#_RX_IF_FIFO_AEMPTY
input                                   serdes_lanex_tx_if_fifo_full_i;///LANE#_TX_IF_FIFO_FULL
output                                  serdes_lanex_rx_if_fifo_rden_o;///LANE#_RX_IF_FIFO_RDEN
output                                  serdes_lnx_tx_vld_o;///FABRIC_LN#_TX_VLD_IN
input                                   serdes_lnx_rx_vld_i;///FABRIC_LN#_RX_VLD_OUT
input  [87:0]                           serdes_lnx_rxdata_i;///FABRIC_LN#_RXDATA_O
output [79:0]                           serdes_lnx_txdata_o;///FABRIC_LN#_TXDATA_I    
input  [4:0]                            serdes_rx_if_fifo_rdusewd_i;///LANE#_RX_IF_FIFO_RDUSEWD   
input  [4:0]                            serdes_tx_if_fifo_wrusewd_i;///LANE#_TX_IF_FIFO_WRUSEWD   

//////upar config
///output                                  upar_wr_en_o;
///output [23:0]                           upar_addr_o;
///output [31:0]                           upar_wdata_o;
///output                                  upar_rd_en_o;
///input  [31:0]                           upar_rdata_i;
///input                                   upar_rdvld_i;
///input                                   upar_ready_i;

//----------------------------------------------------------------------
//signal
//----------------------------------------------------------------------
wire                                  gtr12_rx_valid;
wire                                  gtr12_tx_valid;
wire [87:0]                           gtr12_rx_dat;
wire [79:0]                           gtr12_tx_dat;

//----------------------------------------------------------------------
//process
//----------------------------------------------------------------------
assign gtr12_align_link_o             = serdes_lanex_align_link_i;
assign gtr12_k_lock_o                 = serdes_lanex_k_lock_i;
assign gtr12_pma_rx_lock_o            = serdes_lnx_pma_rx_lock_i;
assign gtr12_rx_pcs_clk_o             = serdes_lanex_pcs_rx_fabric_clk_i;
assign gtr12_tx_pcs_clk_o             = serdes_lanex_pcs_tx_fabric_clk_i;
assign gtr12_rx_fifo_rdusewd_o        = serdes_rx_if_fifo_rdusewd_i;
assign gtr12_tx_fifo_wrusewd_o        = serdes_tx_if_fifo_wrusewd_i;
assign serdes_lanex_fabric_rx_clk_o   = gtr12_user_rx_clk_i;
assign serdes_lanex_fabric_tx_clk_o   = gtr12_user_tx_clk_i;
assign serdes_lnx_rstn_o              = gtr12_rstn_i;
assign serdes_pcs_tx_rst_o            = gtr12_pcs_tx_rst_i;
assign serdes_pcs_rx_rst_o            = gtr12_pcs_rx_rst_i;
assign serdes_lanex_rx_if_fifo_rden_o = ~serdes_lanex_rx_if_fifo_aempty_i;
assign serdes_lnx_tx_vld_o            = (~serdes_lanex_tx_if_fifo_full_i) ;///& (gtr12_tx_valid);

`ifdef QPLL0_SEL
assign   gtr12_pll_ok_o               = serdes_cmu0_ok_i; 
assign   gtr12_pll_ck_ref_o           = serdes_cmu0_ck_ref_i; 
`elsif QPLL1_SEL                       
assign   gtr12_pll_ok_o               = serdes_cmu1_ok_i; 
assign   gtr12_pll_ck_ref_o           = serdes_cmu1_ck_ref_i; 
`else                                 
assign   gtr12_pll_ok_o               = serdes_lanex_cmu_ok_i; 
assign   gtr12_pll_ck_ref_o           = serdes_lanex_cmu_ck_ref_i; 
`endif

assign gtr12_rx_valid                 = serdes_lnx_rx_vld_i;
assign gtr12_rx_dat                   = serdes_lnx_rxdata_i;
assign serdes_lnx_txdata_o            = gtr12_tx_dat;

`ifndef  MODELSIM_EN 
`getname(cpri_core,`module_name) u_cpri_core
`else
cpri_core u_cpri_core
`endif
(                   
    //-------- reset && clock   
    .tx_arst_i                  ( tx_arst_i                ),
    .rx_arst_i                  ( rx_arst_i                ),
    .cfg_arst_i                 ( cfg_arst_i               ),
    .tx_rst_i                   ( tx_rst_i                 ),
    .rx_rst_i                   ( rx_rst_i                 ),
    .cfg_rst_i                  ( cfg_rst_i                ),
    .tx_clk_i                   ( tx_clk_i                 ),
    .rx_clk_i                   ( rx_clk_i                 ), 
    .cfg_clk_i                  ( cfg_clk_i                ),
    .tx_gtr_clk_i               ( gtr12_user_tx_clk_i      ),
    .rx_gtr_clk_i               ( gtr12_user_rx_clk_i      ),

    //-------- AUX inteface                                
    .aux_tx_slot_last_o         ( aux_tx_slot_last_o       ),
    .aux_tx_slot_num_o          ( aux_tx_slot_num_o        ),
    .aux_tx_bf_num_o            ( aux_tx_bf_num_o          ),
    .aux_tx_hf_num_o            ( aux_tx_hf_num_o          ),
    .aux_tx_node_bfn_o          ( aux_tx_node_bfn_o        ),

    .aux_rx_bf_first_w_o        ( aux_rx_bf_first_w_o      ),     
    .aux_rx_slot_last_o         ( aux_rx_slot_last_o       ),
    .aux_rx_slot_num_o          ( aux_rx_slot_num_o        ),
    .aux_rx_bf_num_o            ( aux_rx_bf_num_o          ),
    .aux_rx_hf_num_o            ( aux_rx_hf_num_o          ),    

    //-------- 10ms frame                                  
    .tx_bfn_strobe_i            ( tx_bfn_strobe_i          ),        
    .tx_bfn_i                   ( tx_bfn_i                 ), 

    .rx_bfn_strobe_o            ( rx_bfn_strobe_o          ),        
    .rx_bfn_o                   ( rx_bfn_o                 ),

    //-------- IQ interface                                
    .iq_tx_req_o                ( iq_tx_req_o              ),            
    .iq_tx_data_i               ( iq_tx_data_i             ),

    .iq_rx_valid_o              ( iq_rx_valid_o            ),    
    .iq_rx_mask_o               ( iq_rx_mask_o             ),    
    .cpri_rx_data_o             ( rx_data_o                ),  
    .iq_rx_data_o               ( iq_rx_data_o             ),    

    //-------- HDLC serial interface                       
    .hdlc_tx_req_o              ( hdlc_tx_req_o            ),
    .hdlc_tx_data_i             ( hdlc_tx_data_i           ),
 
    .hdlc_rx_data_valid_o       ( hdlc_rx_data_valid_o     ),           
    .hdlc_rx_data_o             ( hdlc_rx_data_o           ),   

`ifdef  ETH_MII                                            
    //-------- ETH mii interface                           
    .mii_tx_clk_i               ( mii_tx_clk_i             ),    
    .mii_tx_arst_i              ( mii_tx_arst_i            ),    
    .mii_tx_rst_i               ( mii_tx_rst_i             ),    
    .mii_tx_en_i                ( mii_tx_en_i              ),
    .mii_tx_er_i                ( mii_tx_er_i              ),
    .mii_tx_data_i              ( mii_tx_data_i            ),
    .tx_buffer_full_o           ( tx_buffer_full_o         ),

    .mii_rx_clk_i               ( mii_rx_clk_i             ),    
    .mii_rx_arst_i              ( mii_rx_arst_i            ),    
    .mii_rx_rst_i               ( mii_rx_rst_i             ),    
    .mii_rx_en_o                ( mii_rx_en_o              ),
    .mii_rx_data_o              ( mii_rx_data_o            ),
    .mii_rx_er_o                ( mii_rx_er_o              ),
    
`endif

`ifdef  ETH_GMII 
    //-------- ETH gmii interface           
    .gmii_tx_clk_i              ( gmii_tx_clk_i            ),// clock
    .gmii_tx_arst_i             ( gmii_tx_arst_i           ),// gmii asynchronous tx reset 
    .gmii_tx_rst_i              ( gmii_tx_rst_i            ),// gmii asynchronous tx reset 
    .gmii_tx_en_i               ( gmii_tx_en_i             ),
    .gmii_tx_er_i               ( gmii_tx_er_i             ),
    .gmii_tx_data_i             ( gmii_tx_data_i           ),
    .gmii_tx_buffer_full_o      ( gmii_tx_buffer_full_o    ),

    .gmii_rx_clk_i              ( gmii_rx_clk_i            ),// clock
    .gmii_rx_arst_i             ( gmii_rx_arst_i           ),// mii asynchronous rx reset 
    .gmii_rx_rst_i              ( gmii_rx_rst_i            ),// mii asynchronous rx reset 
    .gmii_rx_en_o               ( gmii_rx_en_o             ),
    .gmii_rx_data_o             ( gmii_rx_data_o           ),
    .gmii_rx_er_o               ( gmii_rx_er_o             ),
`endif                                                     

    //-------- Vendor interface                            
    .vendor_tx_req_o            ( vendor_tx_req_o          ),
    .vendor_tx_data_i           ( vendor_tx_data_i         ),

    .vendor_rx_data_valid_o     ( vendor_rx_data_valid_o   ),
    .vendor_rx_data_mask_o      ( vendor_rx_data_mask_o    ),
    .vendor_rx_data_o           ( vendor_rx_data_o         ),  

`ifdef  REAL_TIME_VENDOR_UP10G                             
    //-------- up10G real-time vendor-specific             
    .up10g_rt_tx_req_o          ( up10g_rt_tx_req_o        ),
    .up10g_rt_tx_data_i         ( up10g_rt_tx_data_i       ),

    .up10g_rt_rx_data_o         ( up10g_rt_rx_data_o       ),
    .up10g_rt_rx_mask_o         ( up10g_rt_rx_mask_o       ),
    .up10g_rt_rx_valid_o        ( up10g_rt_rx_valid_o      ),
`endif                                                     

    //-------- SFP interface                               
    .los_i                      ( los_i                    ),   

    //-------- Serdes interface                            
    .gtr12_rx_valid_i           ( gtr12_rx_valid           ),   
    .gtr12_rx_dat_i             ( gtr12_rx_dat             ),     

    .gtr12_tx_valid_o           ( gtr12_tx_valid           ),   
    .gtr12_tx_dat_o             ( gtr12_tx_dat             ),          
 
    //-------- L1 Control Words                                                         
    .z130_0_tx_reset_i          ( z130_0_tx_reset_i        ),
    .z130_0_tx_rai_i            ( z130_0_tx_rai_i          ),   
    .z130_0_tx_sdi_i            ( z130_0_tx_sdi_i          ),   
    .z130_0_tx_los_i            ( z130_0_tx_los_i          ),   
    .z130_0_tx_lof_i            ( z130_0_tx_lof_i          ),   
 
    .z130_0_rx_reset_o          ( z130_0_rx_reset_o        ), 
    .z130_0_rx_rai_o            ( z130_0_rx_rai_o          ),   
    .z130_0_rx_sdi_o            ( z130_0_rx_sdi_o          ),   
    .z130_0_rx_los_o            ( z130_0_rx_los_o          ),   
    .z130_0_rx_lof_o            ( z130_0_rx_lof_o          ),   

    //-------- Status                                                         
    .local_los_o                ( local_los_o              ),       
    .local_lof_o                ( local_lof_o              ),    
    .hfnsync_o                  ( hfnsync_o                ),    

    .speed_sel_o                ( speed_sel_o              ),
 
    //-------- delay value                                 
    .tx_delay_o                 ( tx_delay_o               ),
    .rx_delay_o                 ( rx_delay_o               ),

`ifdef LOOPBACK_PORT_EN
    .i_loopback_req             ( loopback_en_i            ),
    .o_loopback_ack             (                          ),
    .i_loopback_mode            ( loopback_mode_i          ),
`endif

`ifdef TX_DIFF_PORT_EN
    .i_tx_diff_req              ( tx_diff_en_i             ),
    .o_tx_diff_ack              (                          ),
    .i_tx_diff_swing            ( tx_diff_swing_i          ),
`endif

`ifdef TX_FFE_PORT_EN 
    .i_tx_ffe_manual_req        ( tx_ffe_manual_en_i       ),
    .o_tx_ffe_manual_ack        (                          ),
    .i_tx_ffe_cm                ( tx_ffe_cm_i              ),
    .i_tx_ffe_c1                ( tx_ffe_c1_i              ),
`endif

`ifdef RX_EQ_PORT_EN
    .i_rx_eq_manual_req         ( rx_eq_manual_en_i        ),
    .o_rx_eq_manual_ack         (                          ),
    .i_rx_eq_att                ( rx_eq_att_i              ),
    .i_rx_eq_boost              ( rx_eq_boost_i            ),
`endif

`ifdef RX_BIAS_PORT_EN
    .i_rx_quad_bias_req         ( rx_quad_bias_en_i        ),
    .o_rx_quad_bias_ack         (                          ),
    .i_rx_quad_bias             ( rx_quad_bias_i           ),
`endif

`ifdef TX_PRBS_PORT_EN
    .i_tx_prbs_test_req         ( tx_prbs_test_en_i        ),
    .o_tx_prbs_test_ack         (                          ),
    .i_tx_prbs_sel              ( tx_prbs_sel_i            ),
    .i_tx_prbs_insert_err       ( tx_prbs_insert_err_i     ),
`endif

`ifdef RX_PRBS_PORT_EN
    .i_rx_prbs_test_req         ( rx_prbs_test_en_i        ),
    .o_rx_prbs_test_ack         (                          ),
    .i_rx_prbs_sel              ( rx_prbs_sel_i            ),
    .i_rx_prbs_err_clr          ( rx_prbs_err_clr_i        ),
    .o_rx_prbs_err_cnt          ( rx_prbs_err_cnt_o        ),
`endif

`ifdef EXT_PORT_EN
    .o_user_drp_clk             ( user_drp_clk_o           ),
`endif

`ifdef DRP_PORT_EN
    //-------- User DRP Interface
    .i_user_drp_addr            ( user_drp_addr_i          ),
    .i_user_drp_wren            ( user_drp_wren_i          ),
    .i_user_drp_wrdata          ( user_drp_wrdata_i        ),
    .i_user_drp_strb            ( user_drp_strb_i          ),
    .i_user_drp_rden            ( user_drp_rden_i          ),
    .o_user_drp_ready           ( user_drp_ready_o         ),
    .o_user_drp_rdvld           ( user_drp_rdvld_o         ),
    .o_user_drp_rddata          ( user_drp_rddata_o        ),
    .o_user_drp_resp            ( user_drp_resp_o          ),
`endif

`ifdef EXT_PORT_EN
    //-------- upar config                    
    .upar_arbiter_drp_addr_o    ( upar_arbiter_drp_addr_o  ),
    .upar_arbiter_drp_wren_o    ( upar_arbiter_drp_wren_o  ),
    .upar_arbiter_drp_wrdata_o  ( upar_arbiter_drp_wrdata_o),
    .upar_arbiter_drp_strb_o    ( upar_arbiter_drp_strb_o  ),
    .upar_arbiter_drp_rden_o    ( upar_arbiter_drp_rden_o  ),
    .upar_arbiter_drp_clk_i     ( upar_arbiter_drp_clk_i   ),
    .upar_arbiter_drp_ready_i   ( upar_arbiter_drp_ready_i ),
    .upar_arbiter_drp_rdvld_i   ( upar_arbiter_drp_rdvld_i ),
    .upar_arbiter_drp_rddata_i  ( upar_arbiter_drp_rddata_i),
    .upar_arbiter_drp_resp_i    ( upar_arbiter_drp_resp_i  ),
`endif

    //-------- cfg bus                                               
    .cfg_sel_i                  ( cfg_sel_i                ),
    .cfg_wr_i                   ( cfg_wr_i                 ),
    .cfg_ena_i                  ( cfg_ena_i                ),
    .cfg_addr_i                 ( cfg_addr_i               ),///byte address
    .cfg_wdata_i                ( cfg_wdata_i              ),
    .cfg_rdy_o                  ( cfg_rdy_o                ),
    .cfg_rdata_o                ( cfg_rdata_o              ) 

);


endmodule


