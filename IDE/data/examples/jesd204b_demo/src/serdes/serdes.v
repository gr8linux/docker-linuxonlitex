//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.10.01
//Part Number: GW5AST-LV138FPG676AES
//Device: GW5AST-138
//Device Version: B
//Created Time: Wed Aug  7 10:01:44 2024

module Serdes_Top (JESD204B_Top_tx_cfg_rdata_o, JESD204B_Top_tx_cfg_rdy_o, JESD204B_Top_tx_data_ready_o, JESD204B_Top_tx_data_sof_o, JESD204B_Top_tx_data_eof_o, JESD204B_Top_tx_data_somf_o, JESD204B_Top_tx_data_eomf_o, JESD204B_Top_tx_debug_o, JESD204B_Top_rx_cfg_rdata_o, JESD204B_Top_rx_cfg_rdy_o, JESD204B_Top_rx_sync_o, JESD204B_Top_rx_data_valid_o, JESD204B_Top_rx_data_sof_o, JESD204B_Top_rx_data_eof_o, JESD204B_Top_rx_data_somf_o, JESD204B_Top_rx_data_eomf_o, JESD204B_Top_rx_data_o, JESD204B_Top_rx_data_err_o, JESD204B_Top_rx_debug_o, JESD204B_Top_gt_q1_qpll1_ok_o, JESD204B_Top_gt_cpll_ok_o, JESD204B_Top_gt_pcs_tx_clk_o, JESD204B_Top_gt_tx_fifo_wrusewd_o, JESD204B_Top_gt_pcs_rx_clk_o, JESD204B_Top_gt_pma_rx_lock_o, JESD204B_Top_gt_rx_k_lock_o, JESD204B_Top_gt_rx_align_link_o, JESD204B_Top_gt_rx_fifo_rdusewd_o, JESD204B_Top_tx_rst_i, JESD204B_Top_tx_core_clk_i, JESD204B_Top_tx_cfg_clk_i, JESD204B_Top_tx_cfg_rstn_i, JESD204B_Top_tx_cfg_addr_i, JESD204B_Top_tx_cfg_sel_i, JESD204B_Top_tx_cfg_ena_i, JESD204B_Top_tx_cfg_wr_i, JESD204B_Top_tx_cfg_wdata_i, JESD204B_Top_tx_cfg_strb_i, JESD204B_Top_tx_sysref_i, JESD204B_Top_tx_sync_i, JESD204B_Top_tx_data_i, JESD204B_Top_rx_rst_i, JESD204B_Top_rx_core_clk_i, JESD204B_Top_rx_cfg_clk_i, JESD204B_Top_rx_cfg_rstn_i, JESD204B_Top_rx_cfg_addr_i, JESD204B_Top_rx_cfg_sel_i, JESD204B_Top_rx_cfg_ena_i, JESD204B_Top_rx_cfg_wr_i, JESD204B_Top_rx_cfg_wdata_i, JESD204B_Top_rx_cfg_strb_i, JESD204B_Top_rx_sysref_i, JESD204B_Top_gt_fabric_rstn_i, JESD204B_Top_gt_pcs_tx_rst_i, JESD204B_Top_gt_pcs_rx_rst_i);

output [31:0] JESD204B_Top_tx_cfg_rdata_o;
output JESD204B_Top_tx_cfg_rdy_o;
output JESD204B_Top_tx_data_ready_o;
output [3:0] JESD204B_Top_tx_data_sof_o;
output [3:0] JESD204B_Top_tx_data_eof_o;
output [3:0] JESD204B_Top_tx_data_somf_o;
output [3:0] JESD204B_Top_tx_data_eomf_o;
output [71:0] JESD204B_Top_tx_debug_o;
output [31:0] JESD204B_Top_rx_cfg_rdata_o;
output JESD204B_Top_rx_cfg_rdy_o;
output JESD204B_Top_rx_sync_o;
output JESD204B_Top_rx_data_valid_o;
output [3:0] JESD204B_Top_rx_data_sof_o;
output [3:0] JESD204B_Top_rx_data_eof_o;
output [3:0] JESD204B_Top_rx_data_somf_o;
output [3:0] JESD204B_Top_rx_data_eomf_o;
output [63:0] JESD204B_Top_rx_data_o;
output [7:0] JESD204B_Top_rx_data_err_o;
output [87:0] JESD204B_Top_rx_debug_o;
output JESD204B_Top_gt_q1_qpll1_ok_o;
output [1:0] JESD204B_Top_gt_cpll_ok_o;
output JESD204B_Top_gt_pcs_tx_clk_o;
output [9:0] JESD204B_Top_gt_tx_fifo_wrusewd_o;
output JESD204B_Top_gt_pcs_rx_clk_o;
output [1:0] JESD204B_Top_gt_pma_rx_lock_o;
output [1:0] JESD204B_Top_gt_rx_k_lock_o;
output [1:0] JESD204B_Top_gt_rx_align_link_o;
output [9:0] JESD204B_Top_gt_rx_fifo_rdusewd_o;
input JESD204B_Top_tx_rst_i;
input JESD204B_Top_tx_core_clk_i;
input JESD204B_Top_tx_cfg_clk_i;
input JESD204B_Top_tx_cfg_rstn_i;
input [31:0] JESD204B_Top_tx_cfg_addr_i;
input JESD204B_Top_tx_cfg_sel_i;
input JESD204B_Top_tx_cfg_ena_i;
input JESD204B_Top_tx_cfg_wr_i;
input [31:0] JESD204B_Top_tx_cfg_wdata_i;
input [3:0] JESD204B_Top_tx_cfg_strb_i;
input JESD204B_Top_tx_sysref_i;
input JESD204B_Top_tx_sync_i;
input [63:0] JESD204B_Top_tx_data_i;
input JESD204B_Top_rx_rst_i;
input JESD204B_Top_rx_core_clk_i;
input JESD204B_Top_rx_cfg_clk_i;
input JESD204B_Top_rx_cfg_rstn_i;
input [31:0] JESD204B_Top_rx_cfg_addr_i;
input JESD204B_Top_rx_cfg_sel_i;
input JESD204B_Top_rx_cfg_ena_i;
input JESD204B_Top_rx_cfg_wr_i;
input [31:0] JESD204B_Top_rx_cfg_wdata_i;
input [3:0] JESD204B_Top_rx_cfg_strb_i;
input JESD204B_Top_rx_sysref_i;
input JESD204B_Top_gt_fabric_rstn_i;
input JESD204B_Top_gt_pcs_tx_rst_i;
input JESD204B_Top_gt_pcs_rx_rst_i;

wire q1_fabric_ln1_rstn_i;
wire [79:0] q1_fabric_ln0_txdata_i;
wire [79:0] q1_fabric_ln1_txdata_i;
wire q1_lane1_pcs_rx_rst;
wire q1_lane1_pcs_tx_rst;
wire q1_lane1_fabric_rx_clk;
wire q1_lane1_fabric_tx_clk;
wire q1_lane0_rx_if_fifo_rden;
wire q1_lane1_rx_if_fifo_rden;
wire q1_fabric_ln1_tx_vld_in;
wire [91:0] q1_inet_q0_q1;
wire [531:0] q1_inet_q_pmac;
wire [227:0] q1_inet_q_test;
wire [420:0] q1_inet_q_upar;
wire q1_ln0_txm_o;
wire q1_ln0_txp_o;
wire q1_ln1_txm_o;
wire q1_ln1_txp_o;
wire q1_ln2_txm_o;
wire q1_ln2_txp_o;
wire q1_ln3_txm_o;
wire q1_ln3_txp_o;
wire q1_fabric_ln0_rxdet_result;
wire q1_fabric_ln1_rxdet_result;
wire q1_fabric_ln2_rxdet_result;
wire q1_fabric_ln3_rxdet_result;
wire q1_fabric_pma_cm0_dr_refclk_det_o;
wire q1_fabric_pma_cm1_dr_refclk_det_o;
wire q1_fabric_cm1_life_clk_o;
wire q1_fabric_cm_life_clk_o;
wire q1_fabric_cmu1_ck_ref_o;
wire q1_fabric_cmu1_ok_o;
wire q1_fabric_cmu1_refclk_gate_ack_o;
wire q1_fabric_cmu_ck_ref_o;
wire q1_fabric_cmu_ok_o;
wire q1_fabric_cmu_refclk_gate_ack_o;
wire q1_fabric_lane0_cmu_ck_ref_o;
wire q1_fabric_lane1_cmu_ck_ref_o;
wire q1_fabric_lane2_cmu_ck_ref_o;
wire q1_fabric_lane3_cmu_ck_ref_o;
wire [5:0] q1_fabric_ln0_astat_o;
wire q1_fabric_ln0_burn_in_toggle_o;
wire q1_fabric_ln0_pma_rx_lock_o;
wire [87:0] q1_fabric_ln0_rxdata_o;
wire [12:0] q1_fabric_ln0_stat_o;
wire [5:0] q1_fabric_ln1_astat_o;
wire q1_fabric_ln1_burn_in_toggle_o;
wire q1_fabric_ln1_pma_rx_lock_o;
wire [87:0] q1_fabric_ln1_rxdata_o;
wire [12:0] q1_fabric_ln1_stat_o;
wire [5:0] q1_fabric_ln2_astat_o;
wire q1_fabric_ln2_burn_in_toggle_o;
wire q1_fabric_ln2_pma_rx_lock_o;
wire [87:0] q1_fabric_ln2_rxdata_o;
wire [12:0] q1_fabric_ln2_stat_o;
wire [5:0] q1_fabric_ln3_astat_o;
wire q1_fabric_ln3_burn_in_toggle_o;
wire q1_fabric_ln3_pma_rx_lock_o;
wire [87:0] q1_fabric_ln3_rxdata_o;
wire [12:0] q1_fabric_ln3_stat_o;
wire q1_fabric_refclk_gate_ack_o;
wire q1_lane0_align_link;
wire q1_lane0_k_lock;
wire [1:0] q1_lane0_disp_err_o;
wire [1:0] q1_lane0_dec_err_o;
wire [1:0] q1_lane0_cur_disp_o;
wire q1_lane1_align_link;
wire q1_lane1_k_lock;
wire [1:0] q1_lane1_disp_err_o;
wire [1:0] q1_lane1_dec_err_o;
wire [1:0] q1_lane1_cur_disp_o;
wire q1_lane2_align_link;
wire q1_lane2_k_lock;
wire [1:0] q1_lane2_disp_err_o;
wire [1:0] q1_lane2_dec_err_o;
wire [1:0] q1_lane2_cur_disp_o;
wire q1_lane3_align_link;
wire q1_lane3_k_lock;
wire [1:0] q1_lane3_disp_err_o;
wire [1:0] q1_lane3_dec_err_o;
wire [1:0] q1_lane3_cur_disp_o;
wire q1_lane0_pcs_rx_o_fabric_clk;
wire q1_lane1_pcs_rx_o_fabric_clk;
wire q1_lane2_pcs_rx_o_fabric_clk;
wire q1_lane3_pcs_rx_o_fabric_clk;
wire q1_lane0_pcs_tx_o_fabric_clk;
wire q1_lane1_pcs_tx_o_fabric_clk;
wire q1_lane2_pcs_tx_o_fabric_clk;
wire q1_lane3_pcs_tx_o_fabric_clk;
wire q1_fabric_cmu0_clk;
wire q1_fabric_cmu1_clk;
wire q1_fabric_quad_clk_rx;
wire [4:0] q1_lane0_rx_if_fifo_rdusewd;
wire q1_lane0_rx_if_fifo_aempty;
wire q1_lane0_rx_if_fifo_empty;
wire [4:0] q1_lane1_rx_if_fifo_rdusewd;
wire q1_lane1_rx_if_fifo_aempty;
wire q1_lane1_rx_if_fifo_empty;
wire [4:0] q1_lane2_rx_if_fifo_rdusewd;
wire q1_lane2_rx_if_fifo_aempty;
wire q1_lane2_rx_if_fifo_empty;
wire [4:0] q1_lane3_rx_if_fifo_rdusewd;
wire q1_lane3_rx_if_fifo_aempty;
wire q1_lane3_rx_if_fifo_empty;
wire [4:0] q1_lane0_tx_if_fifo_wrusewd;
wire q1_lane0_tx_if_fifo_afull;
wire q1_lane0_tx_if_fifo_full;
wire [4:0] q1_lane1_tx_if_fifo_wrusewd;
wire q1_lane1_tx_if_fifo_afull;
wire q1_lane1_tx_if_fifo_full;
wire [4:0] q1_lane2_tx_if_fifo_wrusewd;
wire q1_lane2_tx_if_fifo_afull;
wire q1_lane2_tx_if_fifo_full;
wire [4:0] q1_lane3_tx_if_fifo_wrusewd;
wire q1_lane3_tx_if_fifo_afull;
wire q1_lane3_tx_if_fifo_full;
wire q1_fabric_clk_mon_o;
wire q1_fabric_gearfifo_err_rpt;
wire q1_fabric_ln0_rx_vld_out;
wire q1_fabric_ln0_rxelecidle_o;
wire q1_fabric_ln0_rxelecidle_o_h;
wire [12:0] q1_fabric_ln0_stat_o_h;
wire q1_fabric_ln1_rx_vld_out;
wire q1_fabric_ln1_rxelecidle_o;
wire q1_fabric_ln1_rxelecidle_o_h;
wire [12:0] q1_fabric_ln1_stat_o_h;
wire q1_fabric_ln2_rx_vld_out;
wire q1_fabric_ln2_rxelecidle_o;
wire q1_fabric_ln2_rxelecidle_o_h;
wire [12:0] q1_fabric_ln2_stat_o_h;
wire q1_fabric_ln3_rx_vld_out;
wire q1_fabric_ln3_rxelecidle_o;
wire q1_fabric_ln3_rxelecidle_o_h;
wire [12:0] q1_fabric_ln3_stat_o_h;
wire q1_fabric_lane0_cmu_ok_o;
wire q1_fabric_lane1_cmu_ok_o;
wire q1_fabric_lane2_cmu_ok_o;
wire q1_fabric_lane3_cmu_ok_o;
wire q1_lane0_pcs_tx_rst;
wire q1_lane0_pcs_rx_rst;
wire q1_lane0_fabric_tx_clk;
wire q1_fabric_ln0_tx_vld_in;
wire q1_lane0_fabric_rx_clk;
wire q1_fabric_ln0_rstn_i;
wire gw_gnd;


assign gw_gnd = 1'b0;

GTR12_QUAD gtr12_quad_inst1 (
    .LN0_TXM_O(q1_ln0_txm_o),
    .LN0_TXP_O(q1_ln0_txp_o),
    .LN1_TXM_O(q1_ln1_txm_o),
    .LN1_TXP_O(q1_ln1_txp_o),
    .LN2_TXM_O(q1_ln2_txm_o),
    .LN2_TXP_O(q1_ln2_txp_o),
    .LN3_TXM_O(q1_ln3_txm_o),
    .LN3_TXP_O(q1_ln3_txp_o),
    .FABRIC_LN0_RXDET_RESULT(q1_fabric_ln0_rxdet_result),
    .FABRIC_LN1_RXDET_RESULT(q1_fabric_ln1_rxdet_result),
    .FABRIC_LN2_RXDET_RESULT(q1_fabric_ln2_rxdet_result),
    .FABRIC_LN3_RXDET_RESULT(q1_fabric_ln3_rxdet_result),
    .FABRIC_PMA_CM0_DR_REFCLK_DET_O(q1_fabric_pma_cm0_dr_refclk_det_o),
    .FABRIC_PMA_CM1_DR_REFCLK_DET_O(q1_fabric_pma_cm1_dr_refclk_det_o),
    .FABRIC_CM1_LIFE_CLK_O(q1_fabric_cm1_life_clk_o),
    .FABRIC_CM_LIFE_CLK_O(q1_fabric_cm_life_clk_o),
    .FABRIC_CMU1_CK_REF_O(q1_fabric_cmu1_ck_ref_o),
    .FABRIC_CMU1_OK_O(q1_fabric_cmu1_ok_o),
    .FABRIC_CMU1_REFCLK_GATE_ACK_O(q1_fabric_cmu1_refclk_gate_ack_o),
    .FABRIC_CMU_CK_REF_O(q1_fabric_cmu_ck_ref_o),
    .FABRIC_CMU_OK_O(q1_fabric_cmu_ok_o),
    .FABRIC_CMU_REFCLK_GATE_ACK_O(q1_fabric_cmu_refclk_gate_ack_o),
    .FABRIC_LANE0_CMU_CK_REF_O(q1_fabric_lane0_cmu_ck_ref_o),
    .FABRIC_LANE1_CMU_CK_REF_O(q1_fabric_lane1_cmu_ck_ref_o),
    .FABRIC_LANE2_CMU_CK_REF_O(q1_fabric_lane2_cmu_ck_ref_o),
    .FABRIC_LANE3_CMU_CK_REF_O(q1_fabric_lane3_cmu_ck_ref_o),
    .FABRIC_LN0_ASTAT_O(q1_fabric_ln0_astat_o),
    .FABRIC_LN0_BURN_IN_TOGGLE_O(q1_fabric_ln0_burn_in_toggle_o),
    .FABRIC_LN0_PMA_RX_LOCK_O(q1_fabric_ln0_pma_rx_lock_o),
    .FABRIC_LN0_RXDATA_O(q1_fabric_ln0_rxdata_o),
    .FABRIC_LN0_STAT_O(q1_fabric_ln0_stat_o),
    .FABRIC_LN1_ASTAT_O(q1_fabric_ln1_astat_o),
    .FABRIC_LN1_BURN_IN_TOGGLE_O(q1_fabric_ln1_burn_in_toggle_o),
    .FABRIC_LN1_PMA_RX_LOCK_O(q1_fabric_ln1_pma_rx_lock_o),
    .FABRIC_LN1_RXDATA_O(q1_fabric_ln1_rxdata_o),
    .FABRIC_LN1_STAT_O(q1_fabric_ln1_stat_o),
    .FABRIC_LN2_ASTAT_O(q1_fabric_ln2_astat_o),
    .FABRIC_LN2_BURN_IN_TOGGLE_O(q1_fabric_ln2_burn_in_toggle_o),
    .FABRIC_LN2_PMA_RX_LOCK_O(q1_fabric_ln2_pma_rx_lock_o),
    .FABRIC_LN2_RXDATA_O(q1_fabric_ln2_rxdata_o),
    .FABRIC_LN2_STAT_O(q1_fabric_ln2_stat_o),
    .FABRIC_LN3_ASTAT_O(q1_fabric_ln3_astat_o),
    .FABRIC_LN3_BURN_IN_TOGGLE_O(q1_fabric_ln3_burn_in_toggle_o),
    .FABRIC_LN3_PMA_RX_LOCK_O(q1_fabric_ln3_pma_rx_lock_o),
    .FABRIC_LN3_RXDATA_O(q1_fabric_ln3_rxdata_o),
    .FABRIC_LN3_STAT_O(q1_fabric_ln3_stat_o),
    .FABRIC_REFCLK_GATE_ACK_O(q1_fabric_refclk_gate_ack_o),
    .LANE0_ALIGN_LINK(q1_lane0_align_link),
    .LANE0_K_LOCK(q1_lane0_k_lock),
    .LANE0_DISP_ERR_O(q1_lane0_disp_err_o),
    .LANE0_DEC_ERR_O(q1_lane0_dec_err_o),
    .LANE0_CUR_DISP_O(q1_lane0_cur_disp_o),
    .LANE1_ALIGN_LINK(q1_lane1_align_link),
    .LANE1_K_LOCK(q1_lane1_k_lock),
    .LANE1_DISP_ERR_O(q1_lane1_disp_err_o),
    .LANE1_DEC_ERR_O(q1_lane1_dec_err_o),
    .LANE1_CUR_DISP_O(q1_lane1_cur_disp_o),
    .LANE2_ALIGN_LINK(q1_lane2_align_link),
    .LANE2_K_LOCK(q1_lane2_k_lock),
    .LANE2_DISP_ERR_O(q1_lane2_disp_err_o),
    .LANE2_DEC_ERR_O(q1_lane2_dec_err_o),
    .LANE2_CUR_DISP_O(q1_lane2_cur_disp_o),
    .LANE3_ALIGN_LINK(q1_lane3_align_link),
    .LANE3_K_LOCK(q1_lane3_k_lock),
    .LANE3_DISP_ERR_O(q1_lane3_disp_err_o),
    .LANE3_DEC_ERR_O(q1_lane3_dec_err_o),
    .LANE3_CUR_DISP_O(q1_lane3_cur_disp_o),
    .LANE0_PCS_RX_O_FABRIC_CLK(q1_lane0_pcs_rx_o_fabric_clk),
    .LANE1_PCS_RX_O_FABRIC_CLK(q1_lane1_pcs_rx_o_fabric_clk),
    .LANE2_PCS_RX_O_FABRIC_CLK(q1_lane2_pcs_rx_o_fabric_clk),
    .LANE3_PCS_RX_O_FABRIC_CLK(q1_lane3_pcs_rx_o_fabric_clk),
    .LANE0_PCS_TX_O_FABRIC_CLK(q1_lane0_pcs_tx_o_fabric_clk),
    .LANE1_PCS_TX_O_FABRIC_CLK(q1_lane1_pcs_tx_o_fabric_clk),
    .LANE2_PCS_TX_O_FABRIC_CLK(q1_lane2_pcs_tx_o_fabric_clk),
    .LANE3_PCS_TX_O_FABRIC_CLK(q1_lane3_pcs_tx_o_fabric_clk),
    .FABRIC_CMU0_CLK(q1_fabric_cmu0_clk),
    .FABRIC_CMU1_CLK(q1_fabric_cmu1_clk),
    .FABRIC_QUAD_CLK_RX(q1_fabric_quad_clk_rx),
    .LANE0_RX_IF_FIFO_RDUSEWD(q1_lane0_rx_if_fifo_rdusewd),
    .LANE0_RX_IF_FIFO_AEMPTY(q1_lane0_rx_if_fifo_aempty),
    .LANE0_RX_IF_FIFO_EMPTY(q1_lane0_rx_if_fifo_empty),
    .LANE1_RX_IF_FIFO_RDUSEWD(q1_lane1_rx_if_fifo_rdusewd),
    .LANE1_RX_IF_FIFO_AEMPTY(q1_lane1_rx_if_fifo_aempty),
    .LANE1_RX_IF_FIFO_EMPTY(q1_lane1_rx_if_fifo_empty),
    .LANE2_RX_IF_FIFO_RDUSEWD(q1_lane2_rx_if_fifo_rdusewd),
    .LANE2_RX_IF_FIFO_AEMPTY(q1_lane2_rx_if_fifo_aempty),
    .LANE2_RX_IF_FIFO_EMPTY(q1_lane2_rx_if_fifo_empty),
    .LANE3_RX_IF_FIFO_RDUSEWD(q1_lane3_rx_if_fifo_rdusewd),
    .LANE3_RX_IF_FIFO_AEMPTY(q1_lane3_rx_if_fifo_aempty),
    .LANE3_RX_IF_FIFO_EMPTY(q1_lane3_rx_if_fifo_empty),
    .LANE0_TX_IF_FIFO_WRUSEWD(q1_lane0_tx_if_fifo_wrusewd),
    .LANE0_TX_IF_FIFO_AFULL(q1_lane0_tx_if_fifo_afull),
    .LANE0_TX_IF_FIFO_FULL(q1_lane0_tx_if_fifo_full),
    .LANE1_TX_IF_FIFO_WRUSEWD(q1_lane1_tx_if_fifo_wrusewd),
    .LANE1_TX_IF_FIFO_AFULL(q1_lane1_tx_if_fifo_afull),
    .LANE1_TX_IF_FIFO_FULL(q1_lane1_tx_if_fifo_full),
    .LANE2_TX_IF_FIFO_WRUSEWD(q1_lane2_tx_if_fifo_wrusewd),
    .LANE2_TX_IF_FIFO_AFULL(q1_lane2_tx_if_fifo_afull),
    .LANE2_TX_IF_FIFO_FULL(q1_lane2_tx_if_fifo_full),
    .LANE3_TX_IF_FIFO_WRUSEWD(q1_lane3_tx_if_fifo_wrusewd),
    .LANE3_TX_IF_FIFO_AFULL(q1_lane3_tx_if_fifo_afull),
    .LANE3_TX_IF_FIFO_FULL(q1_lane3_tx_if_fifo_full),
    .FABRIC_CLK_MON_O(q1_fabric_clk_mon_o),
    .FABRIC_GEARFIFO_ERR_RPT(q1_fabric_gearfifo_err_rpt),
    .FABRIC_LN0_RX_VLD_OUT(q1_fabric_ln0_rx_vld_out),
    .FABRIC_LN0_RXELECIDLE_O(q1_fabric_ln0_rxelecidle_o),
    .FABRIC_LN0_RXELECIDLE_O_H(q1_fabric_ln0_rxelecidle_o_h),
    .FABRIC_LN0_STAT_O_H(q1_fabric_ln0_stat_o_h),
    .FABRIC_LN1_RX_VLD_OUT(q1_fabric_ln1_rx_vld_out),
    .FABRIC_LN1_RXELECIDLE_O(q1_fabric_ln1_rxelecidle_o),
    .FABRIC_LN1_RXELECIDLE_O_H(q1_fabric_ln1_rxelecidle_o_h),
    .FABRIC_LN1_STAT_O_H(q1_fabric_ln1_stat_o_h),
    .FABRIC_LN2_RX_VLD_OUT(q1_fabric_ln2_rx_vld_out),
    .FABRIC_LN2_RXELECIDLE_O(q1_fabric_ln2_rxelecidle_o),
    .FABRIC_LN2_RXELECIDLE_O_H(q1_fabric_ln2_rxelecidle_o_h),
    .FABRIC_LN2_STAT_O_H(q1_fabric_ln2_stat_o_h),
    .FABRIC_LN3_RX_VLD_OUT(q1_fabric_ln3_rx_vld_out),
    .FABRIC_LN3_RXELECIDLE_O(q1_fabric_ln3_rxelecidle_o),
    .FABRIC_LN3_RXELECIDLE_O_H(q1_fabric_ln3_rxelecidle_o_h),
    .FABRIC_LN3_STAT_O_H(q1_fabric_ln3_stat_o_h),
    .FABRIC_LANE0_CMU_OK_O(q1_fabric_lane0_cmu_ok_o),
    .FABRIC_LANE1_CMU_OK_O(q1_fabric_lane1_cmu_ok_o),
    .FABRIC_LANE2_CMU_OK_O(q1_fabric_lane2_cmu_ok_o),
    .FABRIC_LANE3_CMU_OK_O(q1_fabric_lane3_cmu_ok_o),
    .INET_Q0_Q1(q1_inet_q0_q1),
    .INET_Q_PMAC(q1_inet_q_pmac),
    .INET_Q_TEST(q1_inet_q_test),
    .INET_Q_UPAR(q1_inet_q_upar),
    .LN0_RXM_I(gw_gnd),
    .LN0_RXP_I(gw_gnd),
    .LN1_RXM_I(gw_gnd),
    .LN1_RXP_I(gw_gnd),
    .LN2_RXM_I(gw_gnd),
    .LN2_RXP_I(gw_gnd),
    .LN3_RXM_I(gw_gnd),
    .LN3_RXP_I(gw_gnd),
    .FABRIC_CLK_LIFE_DIV_I({gw_gnd,gw_gnd}),
    .FABRIC_CM0_RXCLK_OE_L_I(gw_gnd),
    .FABRIC_CM0_RXCLK_OE_R_I(gw_gnd),
    .FABRIC_PMA_PD_REFHCLK_I(gw_gnd),
    .FABRIC_REFCLK1_INPUT_SEL_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_REFCLK_INPUT_SEL_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_REFCLK_OE_L_I(gw_gnd),
    .FABRIC_REFCLK_OE_R_I(gw_gnd),
    .FABRIC_REFCLK_OUTPUT_SEL_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .REFCLKM0_I(gw_gnd),
    .REFCLKM1_I(gw_gnd),
    .REFCLKP0_I(gw_gnd),
    .REFCLKP1_I(gw_gnd),
    .FABRIC_BURN_IN_I(gw_gnd),
    .FABRIC_CK_SOC_DIV_I({gw_gnd,gw_gnd}),
    .FABRIC_CLK_REF_CORE_I(gw_gnd),
    .FABRIC_CMU1_REFCLK_GATE_I(gw_gnd),
    .FABRIC_CMU_REFCLK_GATE_I(gw_gnd),
    .FABRIC_GLUE_MAC_INIT_INFO_I(gw_gnd),
    .FABRIC_LN0_CTRL_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN0_IDDQ_I(gw_gnd),
    .FABRIC_LN0_PD_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN0_RATE_I({gw_gnd,gw_gnd}),
    .FABRIC_LN0_RSTN_I(q1_fabric_ln1_rstn_i),
    .FABRIC_LN0_TXDATA_I(q1_fabric_ln0_txdata_i),
    .FABRIC_LN1_CTRL_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN1_IDDQ_I(gw_gnd),
    .FABRIC_LN1_PD_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN1_RATE_I({gw_gnd,gw_gnd}),
    .FABRIC_LN1_RSTN_I(q1_fabric_ln1_rstn_i),
    .FABRIC_LN1_TXDATA_I(q1_fabric_ln1_txdata_i),
    .FABRIC_LN2_CTRL_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN2_IDDQ_I(gw_gnd),
    .FABRIC_LN2_PD_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN2_RATE_I({gw_gnd,gw_gnd}),
    .FABRIC_LN2_RSTN_I(gw_gnd),
    .FABRIC_LN2_TXDATA_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN3_CTRL_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN3_IDDQ_I(gw_gnd),
    .FABRIC_LN3_PD_I({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN3_RATE_I({gw_gnd,gw_gnd}),
    .FABRIC_LN3_RSTN_I(gw_gnd),
    .FABRIC_LN3_TXDATA_I({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_REFCLK_GATE_I(gw_gnd),
    .LANE0_PCS_RX_RST(q1_lane1_pcs_rx_rst),
    .LANE1_PCS_RX_RST(q1_lane1_pcs_rx_rst),
    .LANE2_PCS_RX_RST(gw_gnd),
    .LANE3_PCS_RX_RST(gw_gnd),
    .LANE0_ALIGN_TRIGGER(gw_gnd),
    .LANE1_ALIGN_TRIGGER(gw_gnd),
    .LANE2_ALIGN_TRIGGER(gw_gnd),
    .LANE3_ALIGN_TRIGGER(gw_gnd),
    .LANE0_CHBOND_START(gw_gnd),
    .LANE1_CHBOND_START(gw_gnd),
    .LANE2_CHBOND_START(gw_gnd),
    .LANE3_CHBOND_START(gw_gnd),
    .LANE0_PCS_TX_RST(q1_lane1_pcs_tx_rst),
    .LANE1_PCS_TX_RST(q1_lane1_pcs_tx_rst),
    .LANE2_PCS_TX_RST(gw_gnd),
    .LANE3_PCS_TX_RST(gw_gnd),
    .LANE0_FABRIC_RX_CLK(q1_lane1_fabric_rx_clk),
    .LANE1_FABRIC_RX_CLK(q1_lane1_fabric_rx_clk),
    .LANE2_FABRIC_RX_CLK(gw_gnd),
    .LANE3_FABRIC_RX_CLK(gw_gnd),
    .LANE0_FABRIC_C2I_CLK(gw_gnd),
    .LANE1_FABRIC_C2I_CLK(gw_gnd),
    .LANE2_FABRIC_C2I_CLK(gw_gnd),
    .LANE3_FABRIC_C2I_CLK(gw_gnd),
    .LANE0_FABRIC_TX_CLK(q1_lane1_fabric_tx_clk),
    .LANE1_FABRIC_TX_CLK(q1_lane1_fabric_tx_clk),
    .LANE2_FABRIC_TX_CLK(gw_gnd),
    .LANE3_FABRIC_TX_CLK(gw_gnd),
    .LANE0_RX_IF_FIFO_RDEN(q1_lane0_rx_if_fifo_rden),
    .LANE1_RX_IF_FIFO_RDEN(q1_lane1_rx_if_fifo_rden),
    .LANE2_RX_IF_FIFO_RDEN(gw_gnd),
    .LANE3_RX_IF_FIFO_RDEN(gw_gnd),
    .FABRIC_CMU0_RESETN_I(gw_gnd),
    .FABRIC_CMU0_PD_I(gw_gnd),
    .FABRIC_CMU0_IDDQ_I(gw_gnd),
    .FABRIC_CMU1_RESETN_I(gw_gnd),
    .FABRIC_CMU1_PD_I(gw_gnd),
    .FABRIC_CMU1_IDDQ_I(gw_gnd),
    .FABRIC_PLL_CDN_I(gw_gnd),
    .FABRIC_LN0_CPLL_RESETN_I(gw_gnd),
    .FABRIC_LN0_CPLL_PD_I(gw_gnd),
    .FABRIC_LN0_CPLL_IDDQ_I(gw_gnd),
    .FABRIC_LN1_CPLL_RESETN_I(gw_gnd),
    .FABRIC_LN1_CPLL_PD_I(gw_gnd),
    .FABRIC_LN1_CPLL_IDDQ_I(gw_gnd),
    .FABRIC_LN2_CPLL_RESETN_I(gw_gnd),
    .FABRIC_LN2_CPLL_PD_I(gw_gnd),
    .FABRIC_LN2_CPLL_IDDQ_I(gw_gnd),
    .FABRIC_LN3_CPLL_RESETN_I(gw_gnd),
    .FABRIC_LN3_CPLL_PD_I(gw_gnd),
    .FABRIC_LN3_CPLL_IDDQ_I(gw_gnd),
    .FABRIC_CM1_PD_REFCLK_DET_I(gw_gnd),
    .FABRIC_CM0_PD_REFCLK_DET_I(gw_gnd),
    .FABRIC_LN0_CTRL_I_H({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN0_PD_I_H({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN0_RATE_I_H({gw_gnd,gw_gnd}),
    .FABRIC_LN0_TX_VLD_IN(q1_fabric_ln1_tx_vld_in),
    .FABRIC_LN1_CTRL_I_H({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN1_PD_I_H({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN1_RATE_I_H({gw_gnd,gw_gnd}),
    .FABRIC_LN1_TX_VLD_IN(q1_fabric_ln1_tx_vld_in),
    .FABRIC_LN2_CTRL_I_H({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN2_PD_I_H({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN2_RATE_I_H({gw_gnd,gw_gnd}),
    .FABRIC_LN2_TX_VLD_IN(gw_gnd),
    .FABRIC_LN3_CTRL_I_H({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN3_PD_I_H({gw_gnd,gw_gnd,gw_gnd}),
    .FABRIC_LN3_RATE_I_H({gw_gnd,gw_gnd}),
    .FABRIC_LN3_TX_VLD_IN(gw_gnd),
    .FABRIC_POR_N_I(gw_gnd),
    .FABRIC_QUAD_MCU_REQ_I(gw_gnd),
    .CK_AHB_I(gw_gnd),
    .AHB_RSTN(gw_gnd),
    .TEST_DEC_EN(gw_gnd),
    .QUAD_PCIE_CLK(gw_gnd),
    .PCIE_DIV2_REG(gw_gnd),
    .PCIE_DIV4_REG(gw_gnd),
    .PMAC_LN_RSTN(gw_gnd)
);

defparam gtr12_quad_inst1.POSITION = "Q1";

JESD204B_Top JESD204B_Top_inst (
    .tx_cfg_rdata_o(JESD204B_Top_tx_cfg_rdata_o[31:0]),
    .tx_cfg_rdy_o(JESD204B_Top_tx_cfg_rdy_o),
    .tx_data_ready_o(JESD204B_Top_tx_data_ready_o),
    .tx_data_sof_o(JESD204B_Top_tx_data_sof_o[3:0]),
    .tx_data_eof_o(JESD204B_Top_tx_data_eof_o[3:0]),
    .tx_data_somf_o(JESD204B_Top_tx_data_somf_o[3:0]),
    .tx_data_eomf_o(JESD204B_Top_tx_data_eomf_o[3:0]),
    .tx_debug_o(JESD204B_Top_tx_debug_o[71:0]),
    .rx_cfg_rdata_o(JESD204B_Top_rx_cfg_rdata_o[31:0]),
    .rx_cfg_rdy_o(JESD204B_Top_rx_cfg_rdy_o),
    .rx_sync_o(JESD204B_Top_rx_sync_o),
    .rx_data_valid_o(JESD204B_Top_rx_data_valid_o),
    .rx_data_sof_o(JESD204B_Top_rx_data_sof_o[3:0]),
    .rx_data_eof_o(JESD204B_Top_rx_data_eof_o[3:0]),
    .rx_data_somf_o(JESD204B_Top_rx_data_somf_o[3:0]),
    .rx_data_eomf_o(JESD204B_Top_rx_data_eomf_o[3:0]),
    .rx_data_o(JESD204B_Top_rx_data_o[63:0]),
    .rx_data_err_o(JESD204B_Top_rx_data_err_o[7:0]),
    .rx_debug_o(JESD204B_Top_rx_debug_o[87:0]),
    .gt_q1_qpll1_ok_o(JESD204B_Top_gt_q1_qpll1_ok_o),
    .gt_cpll_ok_o(JESD204B_Top_gt_cpll_ok_o[1:0]),
    .gt_pcs_tx_clk_o(JESD204B_Top_gt_pcs_tx_clk_o),
    .gt_tx_fifo_wrusewd_o(JESD204B_Top_gt_tx_fifo_wrusewd_o[9:0]),
    .gt_pcs_rx_clk_o(JESD204B_Top_gt_pcs_rx_clk_o),
    .gt_pma_rx_lock_o(JESD204B_Top_gt_pma_rx_lock_o[1:0]),
    .gt_rx_k_lock_o(JESD204B_Top_gt_rx_k_lock_o[1:0]),
    .gt_rx_align_link_o(JESD204B_Top_gt_rx_align_link_o[1:0]),
    .gt_rx_fifo_rdusewd_o(JESD204B_Top_gt_rx_fifo_rdusewd_o[9:0]),
    .serdes_pcs_tx_rst_o(q1_lane1_pcs_tx_rst),
    .serdes_pcs_rx_rst_o(q1_lane1_pcs_rx_rst),
    .serdes_fabric_tx_clk_o(q1_lane1_fabric_tx_clk),
    .serdes_fabric_tx_vld_o(q1_fabric_ln1_tx_vld_in),
    .serdes_fabric_rx_clk_o(q1_lane1_fabric_rx_clk),
    .serdes_rxfifo_rd_en_o({q1_lane1_rx_if_fifo_rden,q1_lane0_rx_if_fifo_rden}),
    .serdes_fabric_rstn_o(q1_fabric_ln1_rstn_i),
    .serdes_txdata_o({q1_fabric_ln1_txdata_i[79:0],q1_fabric_ln0_txdata_i[79:0]}),
    .tx_rst_i(JESD204B_Top_tx_rst_i),
    .tx_core_clk_i(JESD204B_Top_tx_core_clk_i),
    .tx_cfg_clk_i(JESD204B_Top_tx_cfg_clk_i),
    .tx_cfg_rstn_i(JESD204B_Top_tx_cfg_rstn_i),
    .tx_cfg_addr_i(JESD204B_Top_tx_cfg_addr_i[31:0]),
    .tx_cfg_sel_i(JESD204B_Top_tx_cfg_sel_i),
    .tx_cfg_ena_i(JESD204B_Top_tx_cfg_ena_i),
    .tx_cfg_wr_i(JESD204B_Top_tx_cfg_wr_i),
    .tx_cfg_wdata_i(JESD204B_Top_tx_cfg_wdata_i[31:0]),
    .tx_cfg_strb_i(JESD204B_Top_tx_cfg_strb_i[3:0]),
    .tx_sysref_i(JESD204B_Top_tx_sysref_i),
    .tx_sync_i(JESD204B_Top_tx_sync_i),
    .tx_data_i(JESD204B_Top_tx_data_i[63:0]),
    .rx_rst_i(JESD204B_Top_rx_rst_i),
    .rx_core_clk_i(JESD204B_Top_rx_core_clk_i),
    .rx_cfg_clk_i(JESD204B_Top_rx_cfg_clk_i),
    .rx_cfg_rstn_i(JESD204B_Top_rx_cfg_rstn_i),
    .rx_cfg_addr_i(JESD204B_Top_rx_cfg_addr_i[31:0]),
    .rx_cfg_sel_i(JESD204B_Top_rx_cfg_sel_i),
    .rx_cfg_ena_i(JESD204B_Top_rx_cfg_ena_i),
    .rx_cfg_wr_i(JESD204B_Top_rx_cfg_wr_i),
    .rx_cfg_wdata_i(JESD204B_Top_rx_cfg_wdata_i[31:0]),
    .rx_cfg_strb_i(JESD204B_Top_rx_cfg_strb_i[3:0]),
    .rx_sysref_i(JESD204B_Top_rx_sysref_i),
    .gt_fabric_rstn_i(JESD204B_Top_gt_fabric_rstn_i),
    .gt_pcs_tx_rst_i(JESD204B_Top_gt_pcs_tx_rst_i),
    .gt_pcs_rx_rst_i(JESD204B_Top_gt_pcs_rx_rst_i),
    .serdes_q0_qpll0_ok_i(gw_gnd),
    .serdes_q0_qpll1_ok_i(gw_gnd),
    .serdes_q1_qpll0_ok_i(gw_gnd),
    .serdes_q1_qpll1_ok_i(q1_fabric_cmu1_ok_o),
    .serdes_cpll_ok_i({q1_fabric_lane1_cmu_ok_o,q1_fabric_lane0_cmu_ok_o}),
    .serdes_pcs_tx_clk_i({q1_lane1_pcs_tx_o_fabric_clk,q1_lane0_pcs_tx_o_fabric_clk}),
    .serdes_tx_fifo_wrusewd_i({q1_lane1_tx_if_fifo_wrusewd[4:0],q1_lane0_tx_if_fifo_wrusewd[4:0]}),
    .serdes_pcs_rx_clk_i({q1_lane1_pcs_rx_o_fabric_clk,q1_lane0_pcs_rx_o_fabric_clk}),
    .serdes_pma_rx_lock_i({q1_fabric_ln1_pma_rx_lock_o,q1_fabric_ln0_pma_rx_lock_o}),
    .serdes_rx_k_lock_i({q1_lane1_k_lock,q1_lane0_k_lock}),
    .serdes_rx_align_link_i({q1_lane1_align_link,q1_lane0_align_link}),
    .serdes_rxfifo_aempty_i({q1_lane1_rx_if_fifo_aempty,q1_lane0_rx_if_fifo_aempty}),
    .serdes_rx_fifo_rdusewd_i({q1_lane1_rx_if_fifo_rdusewd[4:0],q1_lane0_rx_if_fifo_rdusewd[4:0]}),
    .serdes_rxdata_i({q1_fabric_ln1_rxdata_o[87:0],q1_fabric_ln0_rxdata_o[87:0]})
);

endmodule //Serdes_Top
