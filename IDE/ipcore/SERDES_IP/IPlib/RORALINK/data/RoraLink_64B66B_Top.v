`include "top_define.vh"
`include "RoraLink_defines.vh"
`include "static_macro_define.vh"

`ifndef  MODELSIM_EN 
module `module_name
`else
module RoraLink_64B66B_Top
`endif
(
    // --------- Clock & Reset
    sys_rst_i,    
    sys_clk_i,
    init_clk_i,

`ifdef TX_EN
    // --------- user interface TX Data interface  
    user_tx_data_i,
    user_tx_valid_i,
    user_tx_ready_o,
`ifdef FRAMING_EN	 
    user_tx_strb_i,
    user_tx_last_i,
`endif
`endif

`ifdef RX_EN
    // --------- user interface RX Data interface  
    user_rx_data_o,
    user_rx_valid_o,
`ifdef FRAMING_EN	 
    user_rx_strb_o,
    user_rx_last_o,
`endif
`endif

`ifdef NFC_EN
    // --------- Native Flow Control interface  
    nfc_valid_i,
    nfc_data_i,
    nfc_ready_o,
`endif

`ifdef UFC_EN
    // --------- User Flow Control interface  
`ifdef TX_EN
    ufc_tx_req_i,
    ufc_tx_ms_i,
    ufc_tx_data_i,
    ufc_tx_valid_i,
    ufc_tx_ready_o,
`endif
    
`ifdef RX_EN
    ufc_rx_data_o,
    ufc_rx_strb_o,
    ufc_rx_last_o,
    ufc_rx_valid_o,
    ufc_in_progress_o,
`endif    
`endif

`ifdef USERK_EN

`ifdef TX_EN
    // --------- user interface TX K-Core interface 
    user_tx_k_data_i,
    user_tx_k_valid_i,
    user_tx_k_ready_o,
`endif

`ifdef RX_EN
    // --------- user interface RX K-Core interface 
    user_rx_k_data_o,
    user_rx_k_valid_o,
`endif
`endif

    // --------- Status interface  
`ifdef DUPLEX_EN
    hard_err_o,
    soft_err_o,
    channel_up_o,
    lane_up_o,
`endif

`ifdef SIMPLEX_TX_EN
    tx_hard_err_o,
    tx_soft_err_o,
    tx_channel_up_o,
    tx_lane_up_o,
`endif

`ifdef SIMPLEX_RX_EN
    rx_hard_err_o,
    rx_soft_err_o,
    rx_channel_up_o,
    rx_lane_up_o,
`endif

`ifdef CRC_EN
    crc_pass_fail_n_o,
    crc_valid_o,
`endif

///    // --------- Config Bus   
///    cfg_clk_i,
///    cfg_rst_i,
///    cfg_sel_i,
///    cfg_wr_i,
///    cfg_ena_i,
///    cfg_addr_i,///byte address
///    cfg_wdata_i,
///    cfg_rdy_o,
///    cfg_rdata_o,
    
    //-------- User define serdes control
    gt_pma_rstn_i,
    gt_pll_ok_o,    
    gt_pcs_tx_clk_o,

`ifdef TX_EN
    gt_pcs_tx_rst_i,
    gt_tx_fifo_wrusewd_o,
`endif

`ifdef RX_EN
    gt_rx_block_sync_o,
    gt_rx_charerr_o,  
    gt_rx_align_link_o,
    gt_rx_pma_lock_o,
    gt_pcs_rx_clk_o,
    gt_pcs_rx_rst_i,   
    gt_rx_fifo_rdusewd_o,
`endif

`ifdef SIMPLEX_RX_EN
    reset2fc_o,
`endif
`ifdef SIMPLEX_TX_EN
    reset2fg_o,
    cfg_tx_init_counter_i,
`endif  

`ifdef TX_EN
    tx_sys_reset_o,
`endif

`ifdef RX_EN
    rx_sys_reset_o,
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
`endif
    serdes_lnx_rstn_o,///FABRIC_LN#_RSTN_I
    serdes_lanex_pcs_tx_fabric_clk_i,///LANE#_PCS_TX_O_FABRIC_CLK
    serdes_lanex_pcs_rx_fabric_clk_i,///LANE#_PCS_RX_O_FABRIC_CLK
    serdes_q0_cmu1_ok_i,///QUAD0 FABRIC_CMU1_OK_O
    serdes_q0_cmu0_ok_i,///QUAD0 FABRIC_CMU_OK_O
    serdes_q1_cmu1_ok_i,///QUAD1 FABRIC_CMU1_OK_O
    serdes_q1_cmu0_ok_i,///QUAD1 FABRIC_CMU_OK_O
    serdes_lanex_cmu_ok_i///FABRIC_LANE#_CMU_OK_O
    
);

//----------------------------------------------------------------------
//parameter
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//port
//----------------------------------------------------------------------
// --------- Clocks and Resets
input                                   sys_rst_i;
input                                   sys_clk_i;
input                                   init_clk_i;

`ifdef TX_EN
// --------- user interface TX Data interface  
`ifdef LITTLE_ENDIAN_EN
input  [64*`LANE_WIDTH-1:0]             user_tx_data_i;
`else
input  [0:64*`LANE_WIDTH-1]             user_tx_data_i;
`endif
input                                   user_tx_valid_i;
output                                  user_tx_ready_o;
`ifdef FRAMING_EN	 
`ifdef LITTLE_ENDIAN_EN
input  [8*`LANE_WIDTH-1:0]              user_tx_strb_i;
`else
input  [0:8*`LANE_WIDTH-1]              user_tx_strb_i;
`endif
input                                   user_tx_last_i;
`endif
`endif

`ifdef RX_EN
// --------- user interface RX Data interface  
`ifdef LITTLE_ENDIAN_EN
output [64*`LANE_WIDTH-1:0]             user_rx_data_o;
`else
output [0:64*`LANE_WIDTH-1]             user_rx_data_o;
`endif
output                                  user_rx_valid_o;
`ifdef FRAMING_EN	 
`ifdef LITTLE_ENDIAN_EN
output [8*`LANE_WIDTH-1:0]              user_rx_strb_o;
`else
output [0:8*`LANE_WIDTH-1]              user_rx_strb_o;
`endif
output                                  user_rx_last_o;
`endif
`endif

`ifdef NFC_EN
// --------- Native Flow Control interface  
input                                   nfc_valid_i;
`ifdef LITTLE_ENDIAN_EN
input  [15:0]                           nfc_data_i;
`else
input  [0:15]                           nfc_data_i;
`endif
output                                  nfc_ready_o;
`endif

`ifdef UFC_EN
// --------- User Flow Control interface  
`ifdef TX_EN
input                                   ufc_tx_req_i;
`ifdef LITTLE_ENDIAN_EN
input  [7:0]                            ufc_tx_ms_i;
input  [64*`LANE_WIDTH-1:0]             ufc_tx_data_i;
`else
input  [0:7]                            ufc_tx_ms_i;
input  [0:64*`LANE_WIDTH-1]             ufc_tx_data_i;
`endif
input                                   ufc_tx_valid_i;
output                                  ufc_tx_ready_o;
`endif

`ifdef RX_EN
`ifdef LITTLE_ENDIAN_EN
output [64*`LANE_WIDTH-1:0]             ufc_rx_data_o;
output [8*`LANE_WIDTH-1:0]              ufc_rx_strb_o;
`else
output [0:64*`LANE_WIDTH-1]             ufc_rx_data_o; 
output [0:8*`LANE_WIDTH-1]              ufc_rx_strb_o;
`endif
output                                  ufc_rx_last_o;
output                                  ufc_rx_valid_o;
output                                  ufc_in_progress_o;
`endif
`endif

`ifdef USERK_EN
`ifdef TX_EN
// --------- user interface TX K-Core interface 
`ifdef LITTLE_ENDIAN_EN
input  [64*`LANE_WIDTH-1:0]             user_tx_k_data_i;
`else
input  [0:64*`LANE_WIDTH-1]             user_tx_k_data_i;
`endif
input                                   user_tx_k_valid_i;
output                                  user_tx_k_ready_o;
`endif

`ifdef RX_EN
// --------- user interface RX K-Core interface 
`ifdef LITTLE_ENDIAN_EN
output [64*`LANE_WIDTH-1:0]             user_rx_k_data_o;
`else
output [0:64*`LANE_WIDTH-1]             user_rx_k_data_o;
`endif
output                                  user_rx_k_valid_o;
`endif
`endif

// --------- Status interface  
`ifdef DUPLEX_EN
output                                  hard_err_o;
output                                  soft_err_o;
output                                  channel_up_o;
output [`LANE_WIDTH-1:0]                lane_up_o;
`endif

`ifdef SIMPLEX_TX_EN
output                                  tx_hard_err_o;
output                                  tx_soft_err_o;
output                                  tx_channel_up_o;
output [`LANE_WIDTH-1:0]                tx_lane_up_o;
`endif

`ifdef SIMPLEX_RX_EN
output                                  rx_hard_err_o;
output                                  rx_soft_err_o;
output                                  rx_channel_up_o;
output [`LANE_WIDTH-1:0]                rx_lane_up_o;
`endif

`ifdef CRC_EN
output                                  crc_pass_fail_n_o;
output                                  crc_valid_o;
`endif

///// --------- Config Bus   
///input                                   cfg_clk_i;
///input                                   cfg_rst_i;
///input                                   cfg_sel_i;
///input                                   cfg_wr_i;
///input                                   cfg_ena_i;
///input  [21:0]                           cfg_addr_i;///byte address
///input  [31:0]                           cfg_wdata_i;
///output                                  cfg_rdy_o;
///output [31:0]                           cfg_rdata_o;

//-------- User define serdes control
input                                   gt_pma_rstn_i;                             
output reg                              gt_pll_ok_o;  

output  [`LANE_WIDTH-1:0]               gt_pcs_tx_clk_o;

`ifdef TX_EN
input                                   gt_pcs_tx_rst_i;
output reg [5*`LANE_WIDTH-1:0]          gt_tx_fifo_wrusewd_o;
`endif

`ifdef RX_EN
output  [`LANE_WIDTH-1:0]               gt_rx_block_sync_o;
output  [`LANE_WIDTH-1:0]               gt_rx_charerr_o;     
output reg [`LANE_WIDTH-1:0]            gt_rx_align_link_o;
output reg [`LANE_WIDTH-1:0]            gt_rx_pma_lock_o;
output  [`LANE_WIDTH-1:0]               gt_pcs_rx_clk_o;
input                                   gt_pcs_rx_rst_i;
output reg [5*`LANE_WIDTH-1:0]          gt_rx_fifo_rdusewd_o;
`endif

`ifdef SIMPLEX_RX_EN
output                                  reset2fc_o;
`endif
`ifdef SIMPLEX_TX_EN
output                                  reset2fg_o;
input  [23:0]                           cfg_tx_init_counter_i;
`endif

`ifdef TX_EN
output                                  tx_sys_reset_o;
`endif
`ifdef RX_EN
output                                  rx_sys_reset_o;
`endif

//-------- Serdes interface
`ifdef TX_EN
output reg [`LANE_WIDTH-1:0]            serdes_pcs_tx_rst_o = {`LANE_WIDTH{1'b1}};///LANE#_PCS_TX_RST
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_tx_clk_o;///LANE#_FABRIC_TX_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_tx_if_fifo_afull_i;///LANE#_TX_IF_FIFO_FULL
output reg [`LANE_WIDTH-1:0]            serdes_lnx_tx_vld_o = {`LANE_WIDTH{1'b0}};///FABRIC_LN#_TX_VLD_IN
output  [80*`LANE_WIDTH-1:0]            serdes_lnx_txdata_o;///FABRIC_LN#_TXDATA_I 
input   [5*`LANE_WIDTH-1:0]             serdes_tx_if_fifo_wrusewd_i;///LANE#_TX_IF_FIFO_WRUSEWD   
`endif

`ifdef RX_EN
output reg [`LANE_WIDTH-1:0]            serdes_pcs_rx_rst_o = {`LANE_WIDTH{1'b1}};///LANE#_PCS_RX_RST
input   [`LANE_WIDTH-1:0]               serdes_lanex_align_link_i;///LANE#_ALIGN_LINK
input   [`LANE_WIDTH-1:0]               serdes_lanex_k_lock_i;///LANE#_K_LOCK
input   [`LANE_WIDTH-1:0]               serdes_lnx_pma_rx_lock_i;///FABRIC_LN#_PMA_RX_LOCK_O
output  [`LANE_WIDTH-1:0]               serdes_lanex_fabric_rx_clk_o;///LANE#_FABRIC_RX_CLK  
input   [`LANE_WIDTH-1:0]               serdes_lanex_rx_if_fifo_aempty_i;///LANE#_RX_IF_FIFO_AEMPTY
output reg [`LANE_WIDTH-1:0]            serdes_lanex_rx_if_fifo_rden_o = {`LANE_WIDTH{1'b0}};///LANE#_RX_IF_FIFO_RDEN
input   [`LANE_WIDTH-1:0]               serdes_lnx_rx_vld_i;///FABRIC_LN#_RX_VLD_OUT
input   [88*`LANE_WIDTH-1:0]            serdes_lnx_rxdata_i;///FABRIC_LN#_RXDATA_O
input   [5*`LANE_WIDTH-1:0]             serdes_rx_if_fifo_rdusewd_i;///LANE#_RX_IF_FIFO_RDUSEWD   
`endif

output  reg[`LANE_WIDTH-1:0]            serdes_lnx_rstn_o = {`LANE_WIDTH{1'b0}};///FABRIC_LN#_RSTN_I
input                                   serdes_q0_cmu1_ok_i;///QUAD0  FABRIC_CMU1_OK_O
input                                   serdes_q0_cmu0_ok_i;///QUAD0  FABRIC_CMU_OK_O
input                                   serdes_q1_cmu1_ok_i;///QUAD1  FABRIC_CMU1_OK_O
input                                   serdes_q1_cmu0_ok_i;///QUAD1  FABRIC_CMU_OK_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_cmu_ok_i;///FABRIC_LANE#_CMU_OK_O
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_tx_fabric_clk_i;///LANE#_PCS_TX_O_FABRIC_CLK
input   [`LANE_WIDTH-1:0]               serdes_lanex_pcs_rx_fabric_clk_i;///LANE#_PCS_RX_O_FABRIC_CLK

//----------------------------------------------------------------------
//signal
//----------------------------------------------------------------------                  
// Serdes interface 
wire                                    serdes_tx_valid;
wire[64*`LANE_WIDTH-1:0]                serdes_tx_dat;                       
wire[64*`LANE_WIDTH-1:0]                serdes_rx_dat;

wire                                    core_gt_rstn;

wire                                    tx_pcs_rst;
wire                                    rx_pcs_rst;

wire                                    pma_rstn;
wire                                    pcs_tx_rst;
wire                                    pcs_rx_rst;

//----------------------------------------------------------------------
//process
//----------------------------------------------------------------------     
assign   gt_pcs_tx_clk_o                              = serdes_lanex_pcs_tx_fabric_clk_i;

`ifdef RX_EN
always @(posedge sys_clk_i) begin
    gt_rx_align_link_o                               <=  serdes_lanex_align_link_i;
    gt_rx_pma_lock_o                                 <=  serdes_lnx_pma_rx_lock_i;
end
`endif

always @(posedge sys_clk_i) begin
    gt_pll_ok_o                                      <= `ifdef QPLL0_SEL
                                                        ((`QUAD0_SEL == 1) ? serdes_q0_cmu0_ok_i : 1'b1) & 
                                                        ((`QUAD1_SEL == 1) ? serdes_q1_cmu0_ok_i : 1'b1);
                                                        `elsif QPLL1_SEL
                                                        ((`QUAD0_SEL == 1) ? serdes_q0_cmu1_ok_i : 1'b1) & 
                                                        ((`QUAD1_SEL == 1) ? serdes_q1_cmu1_ok_i : 1'b1);
                                                        `elsif CPLL_SEL
                                                        &serdes_lanex_cmu_ok_i;                                                                     
                                                        `endif
    serdes_lnx_rstn_o                                <= {`LANE_WIDTH{pma_rstn}};
end 

`ifdef TX_EN
always @(posedge sys_clk_i) begin
    gt_tx_fifo_wrusewd_o                             <= serdes_tx_if_fifo_wrusewd_i;
    serdes_pcs_tx_rst_o                              <= {`LANE_WIDTH{pcs_tx_rst}};
    serdes_lnx_tx_vld_o                              <= {`LANE_WIDTH{(&(~serdes_lanex_tx_if_fifo_afull_i))}};   
end

assign   serdes_lanex_fabric_tx_clk_o                 = {`LANE_WIDTH{sys_clk_i}};
`endif

`ifdef RX_EN
always @(posedge sys_clk_i) begin
    gt_rx_fifo_rdusewd_o                             <= serdes_rx_if_fifo_rdusewd_i;
    serdes_pcs_rx_rst_o                              <= {`LANE_WIDTH{pcs_rx_rst}};
    serdes_lanex_rx_if_fifo_rden_o                   <= {`LANE_WIDTH{(&(~serdes_lanex_rx_if_fifo_aempty_i))}};
end

assign   gt_pcs_rx_clk_o                              = serdes_lanex_pcs_rx_fabric_clk_i;
assign   serdes_lanex_fabric_rx_clk_o                 = serdes_lanex_pcs_rx_fabric_clk_i;///{`LANE_WIDTH{serdes_lanex_pcs_rx_fabric_clk_i[0]}};
`endif

genvar i;
generate
    for (i=0; i<`LANE_WIDTH; i=i+1) begin : group0 
`ifdef RX_EN
        assign   serdes_rx_dat[63+i*64:0+i*64]        = {serdes_lnx_rxdata_i[77+i*88:70+i*88],serdes_lnx_rxdata_i[67+i*88:60+i*88],serdes_lnx_rxdata_i[57+i*88:50+i*88],serdes_lnx_rxdata_i[47+i*88:40+i*88],
                                                         serdes_lnx_rxdata_i[37+i*88:30+i*88],serdes_lnx_rxdata_i[27+i*88:20+i*88],serdes_lnx_rxdata_i[17+i*88:10+i*88],serdes_lnx_rxdata_i[07+i*88:00+i*88]};
`endif
        
`ifdef TX_EN
        assign   serdes_lnx_txdata_o[7+i*80:0+i*80]   = serdes_tx_dat[07+i*64:00+i*64];
        assign   serdes_lnx_txdata_o[8+i*80]          = 1'b0;
        assign   serdes_lnx_txdata_o[9+i*80]          = 1'b0;
        assign   serdes_lnx_txdata_o[17+i*80:10+i*80] = serdes_tx_dat[15+i*64:08+i*64];
        assign   serdes_lnx_txdata_o[18+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[19+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[27+i*80:20+i*80] = serdes_tx_dat[23+i*64:16+i*64];
        assign   serdes_lnx_txdata_o[28+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[29+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[37+i*80:30+i*80] = serdes_tx_dat[31+i*64:24+i*64];
        assign   serdes_lnx_txdata_o[38+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[39+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[47+i*80:40+i*80] = serdes_tx_dat[39+i*64:32+i*64];
        assign   serdes_lnx_txdata_o[48+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[49+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[57+i*80:50+i*80] = serdes_tx_dat[47+i*64:40+i*64];
        assign   serdes_lnx_txdata_o[58+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[59+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[67+i*80:60+i*80] = serdes_tx_dat[55+i*64:48+i*64];
        assign   serdes_lnx_txdata_o[68+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[69+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[77+i*80:70+i*80] = serdes_tx_dat[63+i*64:56+i*64];
        assign   serdes_lnx_txdata_o[78+i*80]         = 1'b0;
        assign   serdes_lnx_txdata_o[79+i*80]         = 1'b0;
`endif
    end
endgenerate

//----------------------------------------
//--------------------  RoraLink 64B66B IP 
//----------------------------------------
`ifndef  MODELSIM_EN 
`getname(RoraLink_64B66B_Core,`module_name)
`else
RoraLink_64B66B_Core
`endif
u_RoraLink_64B66B_Core
(
    // --------- Clock & Reset
    .sys_rst_i                      ( sys_rst_i                     ),
    .sys_clk_i                      ( sys_clk_i                     ),
    .init_clk_i                     ( init_clk_i                    ),

`ifdef TX_EN
    // --------- user interface TX Data interface  
    .user_tx_data_i                 ( user_tx_data_i                ),
    .user_tx_valid_i                ( user_tx_valid_i               ),
    .user_tx_ready_o                ( user_tx_ready_o               ),
`ifdef FRAMING_EN	 
    .user_tx_strb_i                 ( user_tx_strb_i                ),
    .user_tx_last_i                 ( user_tx_last_i                ),
`endif
`endif
    
`ifdef RX_EN
    // --------- user interface RX Data interface  
    .user_rx_data_o                 ( user_rx_data_o                ),
    .user_rx_valid_o                ( user_rx_valid_o               ),
`ifdef FRAMING_EN	 
    .user_rx_strb_o                 ( user_rx_strb_o                ),
    .user_rx_last_o                 ( user_rx_last_o                ),
`endif
`endif

`ifdef NFC_EN
    // --------- Native Flow Control interface  
    .nfc_valid_i                    ( nfc_valid_i                   ),
    .nfc_data_i                     ( nfc_data_i                    ),
    .nfc_ready_o                    ( nfc_ready_o                   ),
`endif

`ifdef UFC_EN
    // --------- User Flow Control interface  
`ifdef TX_EN
    .ufc_tx_req_i                   ( ufc_tx_req_i                  ),
    .ufc_tx_ms_i                    ( ufc_tx_ms_i                   ),
    .ufc_tx_data_i                  ( ufc_tx_data_i                 ),
    .ufc_tx_valid_i                 ( ufc_tx_valid_i                ),
    .ufc_tx_ready_o                 ( ufc_tx_ready_o                ),
`endif

`ifdef RX_EN
    .ufc_rx_data_o                  ( ufc_rx_data_o                 ), 
    .ufc_rx_strb_o                  ( ufc_rx_strb_o                 ),
    .ufc_rx_last_o                  ( ufc_rx_last_o                 ),
    .ufc_rx_valid_o                 ( ufc_rx_valid_o                ),
    .ufc_in_progress_o              ( ufc_in_progress_o             ),
`endif
`endif

`ifdef USERK_EN
`ifdef TX_EN
    // --------- user interface TX K-Core interface 
    .user_tx_k_data_i               ( user_tx_k_data_i              ),
    .user_tx_k_valid_i              ( user_tx_k_valid_i             ),
    .user_tx_k_ready_o              ( user_tx_k_ready_o             ),
`endif

`ifdef RX_EN
    // --------- user interface RX K-Core interface 
    .user_rx_k_data_o               ( user_rx_k_data_o              ),
    .user_rx_k_valid_o              ( user_rx_k_valid_o             ),
`endif
`endif

    // --------- Status interface  
`ifdef DUPLEX_EN	 
    .hard_err_o                     ( hard_err_o                    ),
    .soft_err_o                     ( soft_err_o                    ),
    .channel_up_o                   ( channel_up_o                  ),
    .lane_up_o                      ( lane_up_o                     ),
`endif

`ifdef SIMPLEX_TX_EN	 
    .tx_hard_err_o                  ( tx_hard_err_o                 ),
    .tx_soft_err_o                  ( tx_soft_err_o                 ),
    .tx_channel_up_o                ( tx_channel_up_o               ),
    .tx_lane_up_o                   ( tx_lane_up_o                  ),
`endif

`ifdef SIMPLEX_RX_EN	 
    .rx_hard_err_o                  ( rx_hard_err_o                 ),
    .rx_soft_err_o                  ( rx_soft_err_o                 ),
    .rx_channel_up_o                ( rx_channel_up_o               ),
    .rx_lane_up_o                   ( rx_lane_up_o                  ),
`endif

`ifdef CRC_EN    
    .crc_pass_fail_n_o              ( crc_pass_fail_n_o             ),
    .crc_valid_o                    ( crc_valid_o                   ),
`endif

`ifdef SIMPLEX_TX_EN
    .cfg_tx_init_counter_i          ( {8'd0,cfg_tx_init_counter_i}  ),
`else
    .cfg_tx_init_counter_i          ( 32'd0                         ),
`endif
    
    // --------- Config Bus   
    .cfg_clk_i                      ( 1'b0                          ),///cfg_clk_i                     ),
    .cfg_rst_i                      ( 1'b0                          ),///cfg_rst_i                     ),
    .cfg_sel_i                      ( 1'b0                          ),///cfg_sel_i                     ),
    .cfg_wr_i                       ( 1'b0                          ),///cfg_wr_i                      ),
    .cfg_ena_i                      ( 1'b0                          ),///cfg_ena_i                     ),
    .cfg_addr_i                     ( 24'b0                         ),///cfg_addr_i                    ),///byte address
    .cfg_wdata_i                    ( 32'b0                         ),///cfg_wdata_i                   ),
    .cfg_rdy_o                      (                               ),///cfg_rdy_o                     ),
    .cfg_rdata_o                    (                               ),///cfg_rdata_o                   ),
   
    // --------- gt 
`ifdef TX_EN
    .serdes_tx_valid_o              ( serdes_tx_valid               ),
    .serdes_tx_dat_o                ( serdes_tx_dat                 ),
///    .serdes_pcs_tx_rst_i            ( serdes_pcs_tx_rst_o[0]        ),
`endif

`ifdef RX_EN
    .rx_pcs_rst_i                   ( sys_rst_i                     ),
    .rx_pcs_clk_i                   ( gt_pcs_rx_clk_o               ),
    .gt_rcvr_trained_i              ( serdes_lnx_pma_rx_lock_i      ), 
    .gt_lane_ready_i                ( serdes_lanex_align_link_i     ),
    .serdes_rx_valid_i              ( &serdes_lnx_rx_vld_i          ),
    .serdes_rx_dat_i                ( serdes_rx_dat                 ), 
///    .serdes_pcs_rx_rst_i            ( serdes_pcs_rx_rst_o[0]        ),
`endif

`ifdef SIMPLEX_RX_EN	 
    .reset2fc_o                     ( reset2fc_o                    ),
`endif
`ifdef SIMPLEX_TX_EN	 
    .reset2fg_o                     ( reset2fg_o                    ),
`endif

    .tx_sys_reset_o                 ( tx_sys_reset_o                ),
    .rx_sys_reset_o                 ( rx_sys_reset_o                ),

`ifdef RX_EN
    .gt_block_sync_o                ( gt_rx_block_sync_o            ),
    .gt_rx_charerr_o                ( gt_rx_charerr_o               ),
`else
    .gt_block_sync_o                (                               ),
    .gt_rx_charerr_o                (                               ),
`endif    
    .gt_pll_ok_i                    ( gt_pll_ok_o                   ),
    .gt_pma_rstn_i                  ( gt_pma_rstn_i                 ),            
    .gt_pcs_tx_rst_i                ( gt_pcs_tx_rst_i               ),
    .gt_pcs_rx_rst_i                ( gt_pcs_rx_rst_i               ),
    .pma_rstn_o                     ( pma_rstn                      ),
    .pcs_tx_rst_o                   ( pcs_tx_rst                    ),
    .pcs_rx_rst_o                   ( pcs_rx_rst                    )

);


endmodule
