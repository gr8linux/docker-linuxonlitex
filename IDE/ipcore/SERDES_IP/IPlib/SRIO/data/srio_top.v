`include "top_define.vh"
`include "static_macro_define.vh"
`include "srio_defines.vh"

`ifndef  MODELSIM_EN 
module `module_name
`else
module SRIO_Top
`endif
(
    // --------- Clock & Reset
    sys_rst_i,    
    srio_clk_i,
    clk_lock_i,
    user_pcs_clk_i,
`ifdef CTC_EN
    user_c2i_clk_i,
`endif
    srio_ui_clk_o,
    srio_ui_rst_o,
    
    // --------- user interface TX
    tx_req_trac_valid_i,
    tx_req_trac_ready_o,
    tx_req_trac_last_i,
    tx_req_trac_data_i,
    tx_req_trac_id_info_i,
    
    tx_resp_trac_valid_i,
    tx_resp_trac_ready_o,
    tx_resp_trac_last_i,
    tx_resp_trac_data_i,
    tx_resp_trac_id_info_i,
        
    // --------- user interface RX 
    rx_req_trac_ready_i,
    rx_req_trac_valid_o,
    rx_req_trac_last_o,
    rx_req_trac_data_o,
    rx_req_trac_id_info_o,
    
    rx_resp_trac_ready_i,
    rx_resp_trac_valid_o,
    rx_resp_trac_last_o,
    rx_resp_trac_data_o,
    rx_resp_trac_id_info_o,

    // --------- PHY control signals  
    force_reinit_i,
    phy_tx_mce_i,
    phy_tx_link_reset_i,
        
    // --------- PHY Informational signals
    port_initialized_o,
    link_initialized_o,

    // --------- core debug signals  
    phy_rx_mce_o,
    phy_rx_link_reset_o,
    port_error_o,
    port_timeout_o,
    srio_host_o,
    master_enable_o,
    port_decode_error_o,
    device_id_o,
    debug_info_o,
    rxbuf_rewind_o, 
    txbuf_rewind_o, 

    // --------- Maintenance Bus   
    cfg_clk_i,
    cfg_rst_i,
    cfg_sel_i,
    cfg_wr_i,
    cfg_ena_i,
    cfg_addr_i,///byte address
    cfg_wdata_i,
    cfg_strb_i,
    cfg_rdy_o,
    cfg_rdata_o,
    cfg_slverr_o,
    
    maintenance_interrupt_o,///reserve
    maintenance_timeout_o,

    //-------- User define serdes control
    gtr12_rstn_i,
    gtr12_pcs_tx_rst_i,
    gtr12_pcs_rx_rst_i,
    gtr12_align_link_o,
    gtr12_k_lock_o,
    gtr12_pma_rx_lock_o,
    gtr12_pll_ok_o,     
    gtr12_pll_ck_ref_o, 
    gtr12_rx_fifo_rdusewd_o,
    gtr12_tx_fifo_wrusewd_o,
    gtr12_tx_pcs_clk_o,
    gtr12_rx_pcs_clk_o,

`ifdef DRP_EN
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
        
    //-------- Serdes interface    
`ifdef DRP_EN
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
    serdes_lanex_pcs_tx_fabric_clk_i,///LANE#_PCS_TX_O_FABRIC_CLK
    serdes_lanex_pcs_rx_fabric_clk_i,///LANE#_PCS_RX_O_FABRIC_CLK
    serdes_lanex_chbond_start_o,///LANE#_CHBOND_START
    serdes_lanex_align_trigger_o,///LANE#_ALIGN_TRIGGER
    serdes_lanex_fabric_rx_clk_o,///LANE#_FABRIC_RX_CLK  
    serdes_lanex_fabric_c2i_clk_o,///LANE#_FABRIC_C2I_CLK
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
    
);

//----------------------------------------------------------------------
//parameter
//----------------------------------------------------------------------
localparam                              DEVICE_ID_W     = `DEVICE_ID_W;
localparam                              TX_BUFFER_DEPTH = `TX_BUFFER_DEPTH;
localparam                              RX_BUFFER_DEPTH = `RX_BUFFER_DEPTH;
localparam                              ARB_MODE        = `ARB_MODE;
`ifdef C_SIM
localparam                              C_SIM           = 1;
`else 
localparam                              C_SIM           = 0;
`endif
//----------------------------------------------------------------------
//port
//----------------------------------------------------------------------
// --------- Clocks and Resets
input                                   sys_rst_i;
input                                   srio_clk_i;
input                                   clk_lock_i;
input                                   user_pcs_clk_i;
`ifdef CTC_EN
input                                   user_c2i_clk_i;
`endif
output                                  srio_ui_clk_o;
output                                  srio_ui_rst_o;

// --------- user interface TX  
input                                   tx_req_trac_valid_i;
output                                  tx_req_trac_ready_o;
input                                   tx_req_trac_last_i;
input[63:0]                             tx_req_trac_data_i;
input[2*DEVICE_ID_W-1:0]                tx_req_trac_id_info_i;

input                                   tx_resp_trac_valid_i;
output                                  tx_resp_trac_ready_o;
input                                   tx_resp_trac_last_i;
input[63:0]                             tx_resp_trac_data_i;
input[2*DEVICE_ID_W-1:0]                tx_resp_trac_id_info_i;

// --------- user interface RX 
input                                   rx_req_trac_ready_i;    
output                                  rx_req_trac_valid_o;
output                                  rx_req_trac_last_o;
output[63:0]                            rx_req_trac_data_o;
output[2*DEVICE_ID_W-1:0]               rx_req_trac_id_info_o;
 
input                                   rx_resp_trac_ready_i;  
output                                  rx_resp_trac_valid_o;
output                                  rx_resp_trac_last_o;
output[63:0]                            rx_resp_trac_data_o;
output[2*DEVICE_ID_W-1:0]               rx_resp_trac_id_info_o;

// --------- PHY control signals  
input                                   force_reinit_i;
input                                   phy_tx_mce_i;
input                                   phy_tx_link_reset_i;

// --------- PHY Informational signals
output                                  port_initialized_o;
output                                  link_initialized_o;

// --------- core debug signals  
output                                  phy_rx_mce_o;
output                                  phy_rx_link_reset_o;
output                                  port_error_o;
output[23:0]                            port_timeout_o;
output                                  srio_host_o;
output                                  master_enable_o;
output                                  port_decode_error_o;
output[15:0]                            device_id_o;
output[31:0]                            debug_info_o;
output                                  rxbuf_rewind_o; 
output                                  txbuf_rewind_o; 

// --------- Maintenance Bus   
input                                   cfg_clk_i;
input                                   cfg_rst_i;
input                                   cfg_sel_i;
input                                   cfg_wr_i;
input                                   cfg_ena_i;
input [21:0]                            cfg_addr_i;///byte address
input [31:0]                            cfg_wdata_i;
input [3:0]                             cfg_strb_i;
output                                  cfg_rdy_o;
output [31:0]                           cfg_rdata_o;
output                                  cfg_slverr_o;

output                                  maintenance_interrupt_o;///reserve
output                                  maintenance_timeout_o;

//-------- User define serdes control
input                                   gtr12_rstn_i;
input                                   gtr12_pcs_tx_rst_i;
input                                   gtr12_pcs_rx_rst_i;
output  [`LANE_WIDTH-1:0]               gtr12_align_link_o;
output  [`LANE_WIDTH-1:0]               gtr12_k_lock_o;
output  [`LANE_WIDTH-1:0]               gtr12_pma_rx_lock_o;
`ifdef CPLL_SEL
output  [`LANE_WIDTH-1:0]               gtr12_pll_ok_o;    
`else
output                                  gtr12_pll_ok_o;    
`endif 
output                                  gtr12_pll_ck_ref_o;  
output  [5*`LANE_WIDTH-1:0]             gtr12_rx_fifo_rdusewd_o;
output  [5*`LANE_WIDTH-1:0]             gtr12_tx_fifo_wrusewd_o;
output                                  gtr12_tx_pcs_clk_o;
output                                  gtr12_rx_pcs_clk_o;

`ifdef DRP_EN
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

`ifdef DRP_EN
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
output  [`LANE_WIDTH-1:0]               serdes_lnx_rstn_o;///FABRIC_LN#_RSTN_I
output  [`LANE_WIDTH-1:0]               serdes_pcs_tx_rst_o;///LANE#_PCS_TX_RST
output  [`LANE_WIDTH-1:0]               serdes_pcs_rx_rst_o;///LANE#_PCS_RX_RST
input   [`LANE_WIDTH-1:0]               serdes_lanex_align_link_i;///LANE#_ALIGN_LINK
input   [`LANE_WIDTH-1:0]               serdes_lanex_k_lock_i;///LANE#_K_LOCK
input   [`LANE_WIDTH-1:0]               serdes_lnx_pma_rx_lock_i;///FABRIC_LN#_PMA_RX_LOCK_O
input                                   serdes_cmu1_ok_i;///FABRIC_CMU1_OK_O
input                                   serdes_cmu1_ck_ref_i;///FABRIC_CMU1_CK_REF_O
input                                   serdes_cmu0_ok_i;///FABRIC_CMU_OK_O
input                                   serdes_cmu0_ck_ref_i;///FABRIC_CMU_CK_REF_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_cmu_ok_i;///FABRIC_LANE#_CMU_OK_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_cmu_ck_ref_i;///FABRIC_LANE#_CMU_CK_REF_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_tx_fabric_clk_i;///LANE#_PCS_TX_O_FABRIC_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_rx_fabric_clk_i;///LANE#_PCS_RX_O_FABRIC_CLK
output  [`LANE_WIDTH-1:0]               serdes_lanex_chbond_start_o;///LANE#_CHBOND_START
output  [`LANE_WIDTH-1:0]               serdes_lanex_align_trigger_o;///LANE#_ALIGN_TRIGGER
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_rx_clk_o;///LANE#_FABRIC_RX_CLK  
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_c2i_clk_o;///LANE#_FABRIC_C2I_CLK
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_tx_clk_o;///LANE#_FABRIC_TX_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_rx_if_fifo_aempty_i;///LANE#_RX_IF_FIFO_AEMPTY
input   [`LANE_WIDTH-1:0]               serdes_lanex_tx_if_fifo_full_i;///LANE#_TX_IF_FIFO_FULL
output  [`LANE_WIDTH-1:0]               serdes_lanex_rx_if_fifo_rden_o;///LANE#_RX_IF_FIFO_RDEN
output  [`LANE_WIDTH-1:0]               serdes_lnx_tx_vld_o;///FABRIC_LN#_TX_VLD_IN
input   [`LANE_WIDTH-1:0]               serdes_lnx_rx_vld_i;///FABRIC_LN#_RX_VLD_OUT
input   [88*`LANE_WIDTH-1:0]            serdes_lnx_rxdata_i;///FABRIC_LN#_RXDATA_O
output  [80*`LANE_WIDTH-1:0]            serdes_lnx_txdata_o;///FABRIC_LN#_TXDATA_I 
input   [5*`LANE_WIDTH-1:0]             serdes_rx_if_fifo_rdusewd_i;///LANE#_RX_IF_FIFO_RDUSEWD   
input   [5*`LANE_WIDTH-1:0]             serdes_tx_if_fifo_wrusewd_i;///LANE#_TX_IF_FIFO_WRUSEWD   

//----------------------------------------------------------------------
//signal
//----------------------------------------------------------------------                  
// clock 
wire                                    srio_clk;
wire                                    gt_pcs_clk;
wire                                    clk_lock;
                    
// rst  
wire                                    async_rst_n;           
reg [2:0]                               srio_rst_srl;
reg [2:0]                               gt_pcs_rst_srl;
wire                                    srio_rst;
wire                                    gt_pcs_rst;

// RapidIO IP interface 
wire[4*`LANE_WIDTH-1:0]                 serdes_tx_isk/* synthesis syn_keep=1 */;
wire[32*`LANE_WIDTH-1:0]                serdes_tx_dat/* synthesis syn_keep=1 */;
wire                                    serdes_tx_inhibit/* synthesis syn_keep=1 */;
                        
wire[4*`LANE_WIDTH-1:0]                 serdes_rx_notintable/* synthesis syn_keep=1 */;
wire[4*`LANE_WIDTH-1:0]                 serdes_rx_disperr/* synthesis syn_keep=1 */;
wire[4*`LANE_WIDTH-1:0]                 serdes_rx_isk/* synthesis syn_keep=1 */;
wire[32*`LANE_WIDTH-1:0]                serdes_rx_dat/* synthesis syn_keep=1 */;

///reg [`LANE_WIDTH-1:0]                   rcvr_trained_1d=0/* synthesis preserve = 1 */;
///reg [`LANE_WIDTH-1:0]                   lane_ready_1d=0/* synthesis preserve = 1 */;           
///reg [`LANE_WIDTH-1:0]                   rcvr_trained_2d=0/* synthesis preserve = 1 */;         
///reg [`LANE_WIDTH-1:0]                   lane_ready_2d=0/* synthesis preserve = 1 */;           
///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_notintable_1d=0/* synthesis preserve = 1 */; 
///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_disperr_1d=0/* synthesis preserve = 1 */;    
///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_isk_1d=0/* synthesis preserve = 1 */;        
///reg [32*`LANE_WIDTH-1:0]                serdes_rx_dat_1d=0/* synthesis preserve = 1 */;        

wire                                    core_gt_rstn/* synthesis preserve = 1 */;
///wire [2:0]                              loop_en;
///reg [2:0]                               loop_en_1d;
///reg [2:0]                               loop_en_2d;
///reg [2:0]                               loop_en_3d;

///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_notintable_r=0/* synthesis preserve = 1 */; 
///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_disperr_r=0/* synthesis preserve = 1 */;    
///reg [4*`LANE_WIDTH-1:0]                 serdes_rx_isk_r=0/* synthesis preserve = 1 */;        
///reg [32*`LANE_WIDTH-1:0]                serdes_rx_dat_r=0/* synthesis preserve = 1 */;        

//----------------------------------------------------------------------
//process
//----------------------------------------------------------------------                  
assign   async_rst_n                                  = clk_lock & ~sys_rst_i;
assign   srio_rst                                     = srio_rst_srl[2];
assign   gt_pcs_rst                                   = gt_pcs_rst_srl[2];
                                                 
assign   srio_ui_clk_o                                = srio_clk;
assign   srio_ui_rst_o                                = srio_rst;
                                                      
assign   gt_pcs_clk                                   = user_pcs_clk_i;///serdes_lanex_pcs_tx_fabric_clk_i[0]; 
assign   srio_clk                                     = srio_clk_i;
assign   clk_lock                                     = clk_lock_i;

`ifdef QPLL0_SEL
assign   gtr12_pll_ok_o                               = serdes_cmu0_ok_i; 
assign   gtr12_pll_ck_ref_o                           = serdes_cmu0_ck_ref_i; 
`elsif QPLL1_SEL                                       
assign   gtr12_pll_ok_o                               = serdes_cmu1_ok_i; 
assign   gtr12_pll_ck_ref_o                           = serdes_cmu1_ck_ref_i; 
`else                                                 
assign   gtr12_pll_ok_o                               = serdes_lanex_cmu_ok_i; 
assign   gtr12_pll_ck_ref_o                           = serdes_lanex_cmu_ck_ref_i[0]; 
`endif

assign   gtr12_align_link_o                           = serdes_lanex_align_link_i;
assign   gtr12_k_lock_o                               = serdes_lanex_k_lock_i;
assign   gtr12_pma_rx_lock_o                          = serdes_lnx_pma_rx_lock_i;
assign   gtr12_rx_fifo_rdusewd_o                      = serdes_rx_if_fifo_rdusewd_i;
assign   gtr12_tx_fifo_wrusewd_o                      = serdes_tx_if_fifo_wrusewd_i;
assign   gtr12_tx_pcs_clk_o                           = serdes_lanex_pcs_tx_fabric_clk_i[0];
assign   gtr12_rx_pcs_clk_o                           = serdes_lanex_pcs_rx_fabric_clk_i[0];
assign   serdes_lanex_fabric_rx_clk_o                 = {`LANE_WIDTH{user_pcs_clk_i}};///{`LANE_WIDTH{serdes_lanex_pcs_tx_fabric_clk_i[0]}};
`ifdef CTC_EN
assign   serdes_lanex_fabric_c2i_clk_o                = {`LANE_WIDTH{user_c2i_clk_i}};///{`LANE_WIDTH{serdes_lanex_pcs_tx_fabric_clk_i[0]}};
`else
assign   serdes_lanex_fabric_c2i_clk_o                = {`LANE_WIDTH{1'b0}};///{`LANE_WIDTH{serdes_lanex_pcs_tx_fabric_clk_i[0]}};
`endif
assign   serdes_lanex_fabric_tx_clk_o                 = {`LANE_WIDTH{user_pcs_clk_i}};///{`LANE_WIDTH{serdes_lanex_pcs_tx_fabric_clk_i[0]}};
assign   serdes_lnx_rstn_o                            = {`LANE_WIDTH{(gtr12_rstn_i & core_gt_rstn)}};
assign   serdes_pcs_tx_rst_o                          = {`LANE_WIDTH{gtr12_pcs_tx_rst_i | (~core_gt_rstn)}};
assign   serdes_pcs_rx_rst_o                          = {`LANE_WIDTH{gtr12_pcs_rx_rst_i | (~core_gt_rstn)}};
assign   serdes_lanex_rx_if_fifo_rden_o               = {`LANE_WIDTH{(&(~serdes_lanex_rx_if_fifo_aempty_i))}};
assign   serdes_lnx_tx_vld_o                          = {`LANE_WIDTH{(&(~serdes_lanex_tx_if_fifo_full_i)) & (~serdes_tx_inhibit)}};   
assign   serdes_lanex_align_trigger_o                 = {`LANE_WIDTH{1'b0}};                                 

assign   serdes_lanex_chbond_start_o                  = {`LANE_WIDTH{(&serdes_lanex_align_link_i)}};   
///generate
///if(`LANE_WIDTH == 1) begin
///assign   serdes_lanex_chbond_start_o                  = {`LANE_WIDTH{1'b0}};   
///end
///else begin
///assign   serdes_lanex_chbond_start_o                  = {`LANE_WIDTH{(&serdes_lanex_align_link_i)}};   
///end
///endgenerate

genvar i;
generate
    for (i=0; i<`LANE_WIDTH; i=i+1) begin : group0 
        assign   serdes_rx_dat[31+i*32:0+i*32]        = {serdes_lnx_rxdata_i[7+i*88:0+i*88],serdes_lnx_rxdata_i[17+i*88:10+i*88],serdes_lnx_rxdata_i[27+i*88:20+i*88],serdes_lnx_rxdata_i[37+i*88:30+i*88]};
        assign   serdes_rx_isk[3+i*4:i*4]             = {serdes_lnx_rxdata_i[8+i*88],serdes_lnx_rxdata_i[18+i*88],serdes_lnx_rxdata_i[28+i*88],serdes_lnx_rxdata_i[38+i*88]};
        assign   serdes_rx_disperr[3+i*4:i*4]         = {serdes_lnx_rxdata_i[9+i*88],serdes_lnx_rxdata_i[19+i*88],serdes_lnx_rxdata_i[29+i*88],serdes_lnx_rxdata_i[39+i*88]};
        assign   serdes_rx_notintable[3+i*4:i*4]      = {serdes_lnx_rxdata_i[80+i*88],serdes_lnx_rxdata_i[81+i*88],serdes_lnx_rxdata_i[82+i*88],serdes_lnx_rxdata_i[83+i*88]};
        
        assign   serdes_lnx_txdata_o[7+i*80:0+i*80]   = serdes_tx_dat[31+i*32:24+i*32];
        assign   serdes_lnx_txdata_o[8+i*80]          = serdes_tx_isk[3+i*4];
        assign   serdes_lnx_txdata_o[9+i*80]          = 1'b0;
        assign   serdes_lnx_txdata_o[17+i*80:10+i*80] = serdes_tx_dat[23+i*32:16+i*32];
        assign   serdes_lnx_txdata_o[18+i*80]         = serdes_tx_isk[2+i*4];
        assign   serdes_lnx_txdata_o[19+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[27+i*80:20+i*80] = serdes_tx_dat[15+i*32:8+i*32];
        assign   serdes_lnx_txdata_o[28+i*80]         = serdes_tx_isk[1+i*4];
        assign   serdes_lnx_txdata_o[29+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[37+i*80:30+i*80] = serdes_tx_dat[7+i*32:0+i*32];
        assign   serdes_lnx_txdata_o[38+i*80]         = serdes_tx_isk[0+i*4];
        assign   serdes_lnx_txdata_o[39+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[79+i*80:40+i*80] = 40'b0;
    end
endgenerate

always@(posedge srio_clk or negedge async_rst_n) begin
    if(!async_rst_n)
        srio_rst_srl[2:0] <= 3'b111;
    else 
        srio_rst_srl[2:0] <= {srio_rst_srl[1:0],1'b0};
end

always@(posedge gt_pcs_clk or negedge async_rst_n) begin
    if(!async_rst_n)
        gt_pcs_rst_srl[2:0] <= 3'b111;
    else 
        gt_pcs_rst_srl[2:0] <= {gt_pcs_rst_srl[1:0],1'b0};
end

`ifdef DRP_EN
assign user_drp_clk_o            = upar_arbiter_drp_clk_i;
assign upar_arbiter_drp_addr_o   = user_drp_addr_i;
assign upar_arbiter_drp_wren_o   = user_drp_wren_i;
assign upar_arbiter_drp_wrdata_o = user_drp_wrdata_i;
assign upar_arbiter_drp_strb_o   = user_drp_strb_i;
assign upar_arbiter_drp_rden_o   = user_drp_rden_i;
assign user_drp_ready_o          = upar_arbiter_drp_ready_i;
assign user_drp_rdvld_o          = upar_arbiter_drp_rdvld_i;
assign user_drp_rddata_o         = upar_arbiter_drp_rddata_i;
assign user_drp_resp_o           = upar_arbiter_drp_resp_i;
`endif

//----------------------------------------
//--------------------  Serial RapidIO IP 
//----------------------------------------

`ifndef  MODELSIM_EN 
`getname(srio_core,`module_name)#
`else
srio_core#
`endif
(   .ARB_MODE        ( ARB_MODE        ),
    .C_SIM           ( C_SIM           ),
    .TX_BUFFER_DEPTH ( TX_BUFFER_DEPTH ),
    .RX_BUFFER_DEPTH ( RX_BUFFER_DEPTH ),
    .DEVICE_ID_W     ( DEVICE_ID_W     )
)
u_srio_core
(
    // --------- user interface  
    .srio_rst_i                     ( srio_rst                      ),
    .srio_clk_i                     ( srio_clk                      ),
    
    // --------- user interface TX
    .tx_req_trac_valid_i            ( tx_req_trac_valid_i           ),
    .tx_req_trac_ready_o            ( tx_req_trac_ready_o           ),
    .tx_req_trac_last_i             ( tx_req_trac_last_i            ),
    .tx_req_trac_data_i             ( tx_req_trac_data_i            ),
    .tx_req_trac_id_info_i          ( tx_req_trac_id_info_i         ),
    
    .tx_resp_trac_valid_i           ( tx_resp_trac_valid_i          ),
    .tx_resp_trac_ready_o           ( tx_resp_trac_ready_o          ),
    .tx_resp_trac_last_i            ( tx_resp_trac_last_i           ),
    .tx_resp_trac_data_i            ( tx_resp_trac_data_i           ),
    .tx_resp_trac_id_info_i         ( tx_resp_trac_id_info_i        ),
    
    // --------- user interface RX 
    .rx_req_trac_ready_i            ( rx_req_trac_ready_i           ),
    .rx_req_trac_valid_o            ( rx_req_trac_valid_o           ),
    .rx_req_trac_last_o             ( rx_req_trac_last_o            ),
    .rx_req_trac_data_o             ( rx_req_trac_data_o            ),
    .rx_req_trac_id_info_o          ( rx_req_trac_id_info_o         ),
    
    .rx_resp_trac_ready_i           ( rx_resp_trac_ready_i          ),
    .rx_resp_trac_valid_o           ( rx_resp_trac_valid_o          ),
    .rx_resp_trac_last_o            ( rx_resp_trac_last_o           ),
    .rx_resp_trac_data_o            ( rx_resp_trac_data_o           ),
    .rx_resp_trac_id_info_o         ( rx_resp_trac_id_info_o        ),

    // --------- PHY control signals  
    .force_reinit_i                 ( force_reinit_i                ), 
    .phy_tx_mce_i                   ( phy_tx_mce_i                  ),
    .phy_tx_link_reset_i            ( phy_tx_link_reset_i           ),

    // --------- PHY Informational signals
    .port_initialized_o             ( port_initialized_o            ),
    .link_initialized_o             ( link_initialized_o            ),

    // --------- core debug signals  
    .phy_rx_mce_o                   ( phy_rx_mce_o                  ),
    .phy_rx_link_reset_o            ( phy_rx_link_reset_o           ),
    .port_error_o                   ( port_error_o                  ),
    .port_timeout_o                 ( port_timeout_o                ),
    .srio_host_o                    ( srio_host_o                   ),
    .master_enable_o                ( master_enable_o               ),
    .port_decode_error_o            ( port_decode_error_o           ),
    .device_id_o                    ( device_id_o                   ),
    .debug_info_o                   ( debug_info_o                  ),
    .rxbuf_rewind_o                 ( rxbuf_rewind_o                ),
    .txbuf_rewind_o                 ( txbuf_rewind_o                ),
    .gt_rstn_o                      ( core_gt_rstn                  ),
    
    .loop_en_o                      ( loop_en                       ),

    // --------- Maintenance Bus   
    .cfg_clk_i                      ( cfg_clk_i                     ),
    .cfg_rst_i                      ( cfg_rst_i                     ),
    .cfg_sel_i                      ( cfg_sel_i                     ),
    .cfg_wr_i                       ( cfg_wr_i                      ),
    .cfg_ena_i                      ( cfg_ena_i                     ),
    .cfg_addr_i                     ( cfg_addr_i                    ),///byte address
    .cfg_wdata_i                    ( cfg_wdata_i                   ),
    .cfg_strb_i                     ( cfg_strb_i                    ),
    .cfg_rdy_o                      ( cfg_rdy_o                     ),
    .cfg_rdata_o                    ( cfg_rdata_o                   ),
    .cfg_slverr_o                   ( cfg_slverr_o                  ),
    
    .maintenance_interrupt_o        ( maintenance_interrupt_o       ),
    .maintenance_timeout_o          ( maintenance_timeout_o         ),
    
    // gt 
    .gt_pcs_rst_i                   ( gt_pcs_rst                    ),
    .gt_pcs_clk_i                   ( gt_pcs_clk                    ),
    
    .rcvr_trained_i                 ( serdes_lnx_pma_rx_lock_i      ),///rcvr_trained_2d               ),  
    .lane_ready_i                   ( serdes_lanex_align_link_i     ),///lane_ready_2d                 ),

    .serdes_tx_isk_o                ( serdes_tx_isk                 ),
    .serdes_tx_dat_o                ( serdes_tx_dat                 ),
    .serdes_tx_inhibit_o            ( serdes_tx_inhibit             ),

    .serdes_rx_notintable_i         ( serdes_rx_notintable          ),///serdes_rx_notintable_1d       ),///serdes_rx_notintable_r        ),
    .serdes_rx_disperr_i            ( serdes_rx_disperr             ),///serdes_rx_disperr_1d          ),///serdes_rx_disperr_r           ),
    .serdes_rx_isk_i                ( serdes_rx_isk                 ),///serdes_rx_isk_1d              ),///serdes_rx_isk_r               ),
    .serdes_rx_dat_i                ( serdes_rx_dat                 ) ///serdes_rx_dat_1d              ) ///serdes_rx_dat_r               )
);


endmodule
