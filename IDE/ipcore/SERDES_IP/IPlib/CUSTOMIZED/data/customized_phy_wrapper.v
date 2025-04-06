
`include "define.vh"
`include "static_macro_define.vh"

//*******************Q0 Lane0 Define****************
    `ifdef GW5AT138
        `define Q0_LN0_GENERAL_USER_TX_IO
        `define Q0_LN0_GENERAL_USER_RX_IO
    `endif
    //`ifdef GW5AT60
        `ifdef Q0_LN0_8B10B_ENCODE
            `define Q0_LN0_GENERAL_USER_TX_IO
        `elsif Q0_LN0_64B66B_ENCODE
            `define Q0_LN0_6466_USER_TX_IO
        `elsif Q0_LN0_64B67B_ENCODE
            `define Q0_LN0_6467_USER_TX_IO
        `else
            `define Q0_LN0_GENERAL_USER_TX_IO
        `endif
        
        `ifdef Q0_LN0_8B10B_DECODE
            `define Q0_LN0_GENERAL_USER_RX_IO
        `elsif Q0_LN0_64B66B_DECODE
            `define Q0_LN0_6466_USER_RX_IO
        `elsif Q0_LN0_64B67B_DECODE
            `define Q0_LN0_6467_USER_RX_IO
        `else
            `define Q0_LN0_GENERAL_USER_RX_IO
        `endif
    //`endif
//*******************Q0 Lane1 Define****************
    `ifdef GW5AT138
        `define Q0_LN1_GENERAL_USER_TX_IO
        `define Q0_LN1_GENERAL_USER_RX_IO
    `endif
    //`ifdef GW5AT60
        `ifdef Q0_LN1_8B10B_ENCODE
            `define Q0_LN1_GENERAL_USER_TX_IO
        `elsif Q0_LN1_64B66B_ENCODE
            `define Q0_LN1_6466_USER_TX_IO
        `elsif Q0_LN1_64B67B_ENCODE
            `define Q0_LN1_6467_USER_TX_IO
        `else
            `define Q0_LN1_GENERAL_USER_TX_IO
        `endif
        
        `ifdef Q0_LN1_8B10B_DECODE
            `define Q0_LN1_GENERAL_USER_RX_IO
        `elsif Q0_LN1_64B66B_DECODE
            `define Q0_LN1_6466_USER_RX_IO
        `elsif Q0_LN1_64B67B_DECODE
            `define Q0_LN1_6467_USER_RX_IO
        `else
            `define Q0_LN1_GENERAL_USER_RX_IO
        `endif
    //`endif    
//*******************Q0 Lane2 Define****************
    `ifdef GW5AT138
        `define Q0_LN2_GENERAL_USER_TX_IO
        `define Q0_LN2_GENERAL_USER_RX_IO
    `endif
    //`ifdef GW5AT60
        `ifdef Q0_LN2_8B10B_ENCODE
            `define Q0_LN2_GENERAL_USER_TX_IO
        `elsif Q0_LN2_64B66B_ENCODE
            `define Q0_LN2_6466_USER_TX_IO
        `elsif Q0_LN2_64B67B_ENCODE
            `define Q0_LN2_6467_USER_TX_IO
        `else
            `define Q0_LN2_GENERAL_USER_TX_IO
        `endif
        
        `ifdef Q0_LN2_8B10B_DECODE
            `define Q0_LN2_GENERAL_USER_RX_IO
        `elsif Q0_LN2_64B66B_DECODE
            `define Q0_LN2_6466_USER_RX_IO
        `elsif Q0_LN2_64B67B_DECODE
            `define Q0_LN2_6467_USER_RX_IO
        `else
            `define Q0_LN2_GENERAL_USER_RX_IO
        `endif
    //`endif   
//*******************Q0 Lane3 Define****************
    `ifdef GW5AT138
        `define Q0_LN3_GENERAL_USER_TX_IO
        `define Q0_LN3_GENERAL_USER_RX_IO
    `endif
    //`ifdef GW5AT60
        `ifdef Q0_LN3_8B10B_ENCODE
            `define Q0_LN3_GENERAL_USER_TX_IO
        `elsif Q0_LN3_64B66B_ENCODE
            `define Q0_LN3_6466_USER_TX_IO
        `elsif Q0_LN3_64B67B_ENCODE
            `define Q0_LN3_6467_USER_TX_IO
        `else
            `define Q0_LN3_GENERAL_USER_TX_IO
        `endif
        
        `ifdef Q0_LN3_8B10B_DECODE
            `define Q0_LN3_GENERAL_USER_RX_IO
        `elsif Q0_LN3_64B66B_DECODE
            `define Q0_LN3_6466_USER_RX_IO
        `elsif Q0_LN3_64B67B_DECODE
            `define Q0_LN3_6467_USER_RX_IO
        `else
            `define Q0_LN3_GENERAL_USER_RX_IO
        `endif
    //`endif  
//**********************************************

module `MODULE_NAME (


//****************************Q0 LANE0***************************************
`ifdef Q0_LN0
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q0_LANE0_PCS_RX_O_FABRIC_CLK,
    output          Q0_LANE0_FABRIC_RX_CLK,
    input  [87:0]   Q0_FABRIC_LN0_RXDATA_O,
    output          Q0_LANE0_RX_IF_FIFO_RDEN,
    input  [4:0]    Q0_LANE0_RX_IF_FIFO_RDUSEWD,
    input           Q0_LANE0_RX_IF_FIFO_AEMPTY,
    input           Q0_LANE0_RX_IF_FIFO_EMPTY,
    input           Q0_FABRIC_LN0_RX_VLD_OUT,
    
    //TX PATH   
    input           Q0_LANE0_PCS_TX_O_FABRIC_CLK,
    output          Q0_LANE0_FABRIC_TX_CLK,
    output [79:0]   Q0_FABRIC_LN0_TXDATA_I,
    output          Q0_FABRIC_LN0_TX_VLD_IN,
    input  [4:0]    Q0_LANE0_TX_IF_FIFO_WRUSEWD,
    input           Q0_LANE0_TX_IF_FIFO_AFULL,
    input           Q0_LANE0_TX_IF_FIFO_FULL,	
    
    //stat
    input  [12:0]   Q0_FABRIC_LN0_STAT_O,
    
    //CTC   
    output          Q0_LANE0_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q0_LANE0_CHBOND_START,
        
    //RESET 
    output          Q0_FABRIC_LN0_RSTN_I,
    output          Q0_LANE0_PCS_RX_RST,
    output          Q0_LANE0_PCS_TX_RST,

    //Refclk 
    input           Q0_FABRIC_LANE0_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q0_FABRIC_LN0_ASTAT_O,
    
    //CDR LOCK
    input           Q0_FABRIC_LN0_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q0_LANE0_ALIGN_LINK,
    input           Q0_LANE0_K_LOCK,
    
    //CMU LOCK
    input           Q0_FABRIC_LANE0_CMU_OK_O,
    
    //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        input           Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE0_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE0_64B66B_RX_VALID,
    `endif
    `ifdef GW5AT15
        input           Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE0_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE0_64B66B_RX_VALID,
    `endif
    
    
    //------connect to User Design------

    //RX PATH
    output          q0_ln0_rx_pcs_clkout_o,
    input           q0_ln0_rx_clk_i,
    `ifdef Q0_LN0_GENERAL_USER_RX_IO
        output [87:0]   q0_ln0_rx_data_o,
        input           q0_ln0_rx_fifo_rden_i,
        output [4:0]    q0_ln0_rx_fifo_rdusewd_o,
        output          q0_ln0_rx_fifo_aempty_o,
        output          q0_ln0_rx_fifo_empty_o,
        output          q0_ln0_rx_valid_o,
    `endif
    `ifdef Q0_LN0_6466_USER_RX_IO
        output [7:0]    q0_ln0_rxc_o,
        output [63:0]   q0_ln0_rxd_o,
        output          q0_ln0_rx_valid_o,
        output          q0_ln0_rx_blk_lock_o,
        output          q0_ln0_rx_dec_err_o,
        output          q0_ln0_rx_dscr_err_o,
        output          q0_ln0_rx_invld_header_o,
        output [1:0]    q0_ln0_rx_ctc_ins_o,
        output [1:0]    q0_ln0_rx_ctc_del_o,
        output          q0_ln0_rx_her_hi_o,     
    `endif
    `ifdef Q0_LN0_6467_USER_RX_IO
        output [1:0]    q0_ln0_rx_header_o,
        output [63:0]   q0_ln0_rx_data_o,
        output          q0_ln0_rx_valid_o,
        output          q0_ln0_rx_blk_lock_o,
        output          q0_ln0_rx_dec_err_o,
        output          q0_ln0_rx_dscr_err_o,
        output          q0_ln0_rx_invld_header_o,
        output          q0_ln0_rx_her_hi_o,     
    `endif
    //TX PATH
    output              q0_ln0_tx_pcs_clkout_o,
    input               q0_ln0_tx_clk_i,
    `ifdef Q0_LN0_GENERAL_USER_TX_IO
        input [79:0]    q0_ln0_tx_data_i, 
        input           q0_ln0_tx_fifo_wren_i,
        output [4:0]    q0_ln0_tx_fifo_wrusewd_o,
        output          q0_ln0_tx_fifo_afull_o,
        output          q0_ln0_tx_fifo_full_o,
    `endif
    `ifdef Q0_LN0_6466_USER_TX_IO
        input [7:0]     q0_ln0_txc_i,
        input [63:0]    q0_ln0_txd_i,
        output          q0_ln0_tx_fetch_o,
        input [2:0]     q0_ln0_tx_ctrl_i,
        output          q0_ln0_tx_invld_blk_o,
    `endif   
    `ifdef Q0_LN0_6467_USER_TX_IO
        input [1:0]     q0_ln0_tx_header_i,
        input [63:0]    q0_ln0_tx_data_i,
        output          q0_ln0_tx_fetch_o,
        input [2:0]     q0_ln0_tx_ctrl_i,
        output          q0_ln0_tx_invld_blk_o,
    `endif
    //Lane ready
    output          q0_ln0_ready_o,
    
    //CTC 
    `ifdef Q0_LN0_CTC
        input       q0_ln0_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN0_CHANNEL_BONDING
        input       q0_ln0_cb_start_i,
    `endif
    
    //RESET
    input       q0_ln0_pma_rstn_i,
    input       q0_ln0_pcs_rx_rst_i,
    input       q0_ln0_pcs_tx_rst_i,
    
    //Refclk 
    output      q0_ln0_refclk_o,
    
    //signal detect
    output      q0_ln0_signal_detect_o,
    
    //CDR LOCK
    output      q0_ln0_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q0_LN0_WORD_ALIGN
        output q0_ln0_k_lock_o,
        output q0_ln0_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q0_ln0_pll_lock_o,

`endif

//****************************Q0 LANE1***************************************
`ifdef Q0_LN1
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q0_LANE1_PCS_RX_O_FABRIC_CLK,
    output          Q0_LANE1_FABRIC_RX_CLK,
    input  [87:0]   Q0_FABRIC_LN1_RXDATA_O,
    output          Q0_LANE1_RX_IF_FIFO_RDEN,
    input  [4:0]    Q0_LANE1_RX_IF_FIFO_RDUSEWD,
    input           Q0_LANE1_RX_IF_FIFO_AEMPTY,
    input           Q0_LANE1_RX_IF_FIFO_EMPTY,
    input           Q0_FABRIC_LN1_RX_VLD_OUT,
    
    //TX PATH   
    input           Q0_LANE1_PCS_TX_O_FABRIC_CLK,
    output          Q0_LANE1_FABRIC_TX_CLK,
    output [79:0]   Q0_FABRIC_LN1_TXDATA_I,
    output          Q0_FABRIC_LN1_TX_VLD_IN,
    input  [4:0]    Q0_LANE1_TX_IF_FIFO_WRUSEWD,
    input           Q0_LANE1_TX_IF_FIFO_AFULL,
    input           Q0_LANE1_TX_IF_FIFO_FULL,	
    
    //stat
    input  [12:0]   Q0_FABRIC_LN1_STAT_O,
    //CTC   
    output          Q0_LANE1_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q0_LANE1_CHBOND_START,
        
    //RESET 
    output          Q0_FABRIC_LN1_RSTN_I,
    output          Q0_LANE1_PCS_RX_RST,
    output          Q0_LANE1_PCS_TX_RST,

    //Refclk 
    input           Q0_FABRIC_LANE1_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q0_FABRIC_LN1_ASTAT_O,
    
    //CDR LOCK
    input           Q0_FABRIC_LN1_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q0_LANE1_ALIGN_LINK,
    input           Q0_LANE1_K_LOCK,
    
    //CMU LOCK
    input           Q0_FABRIC_LANE1_CMU_OK_O,
    
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        input           Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE1_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE1_64B66B_RX_VALID,
    `endif
    `ifdef GW5AT15
        input           Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE1_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE1_64B66B_RX_VALID,
    `endif
    
    //------connect to User Design------
   
    //RX PATH
    output          q0_ln1_rx_pcs_clkout_o,
    input           q0_ln1_rx_clk_i,
    `ifdef Q0_LN1_GENERAL_USER_RX_IO
        output [87:0]   q0_ln1_rx_data_o,
        input           q0_ln1_rx_fifo_rden_i,
        output [4:0]    q0_ln1_rx_fifo_rdusewd_o,
        output          q0_ln1_rx_fifo_aempty_o,
        output          q0_ln1_rx_fifo_empty_o,
        output          q0_ln1_rx_valid_o,
    `endif
    `ifdef Q0_LN1_6466_USER_RX_IO
        output [7:0]    q0_ln1_rxc_o,
        output [63:0]   q0_ln1_rxd_o,
        output          q0_ln1_rx_valid_o,
        output          q0_ln1_rx_blk_lock_o,
        output          q0_ln1_rx_dec_err_o,
        output          q0_ln1_rx_dscr_err_o,
        output          q0_ln1_rx_invld_header_o,
        output [1:0]    q0_ln1_rx_ctc_ins_o,
        output [1:0]    q0_ln1_rx_ctc_del_o,
        output          q0_ln1_rx_her_hi_o,     
    `endif
    `ifdef Q0_LN1_6467_USER_RX_IO
        output [1:0]    q0_ln1_rx_header_o,
        output [63:0]   q0_ln1_rx_data_o,
        output          q0_ln1_rx_valid_o,
        output          q0_ln1_rx_blk_lock_o,
        output          q0_ln1_rx_dec_err_o,
        output          q0_ln1_rx_dscr_err_o,
        output          q0_ln1_rx_invld_header_o,
        output          q0_ln1_rx_her_hi_o,     
    `endif
    //TX PATH
    output              q0_ln1_tx_pcs_clkout_o,
    input               q0_ln1_tx_clk_i,
    `ifdef Q0_LN1_GENERAL_USER_TX_IO
        input [79:0]    q0_ln1_tx_data_i, 
        input           q0_ln1_tx_fifo_wren_i,
        output [4:0]    q0_ln1_tx_fifo_wrusewd_o,
        output          q0_ln1_tx_fifo_afull_o,
        output          q0_ln1_tx_fifo_full_o,
    `endif
    `ifdef Q0_LN1_6466_USER_TX_IO
        input [7:0]     q0_ln1_txc_i,
        input [63:0]    q0_ln1_txd_i,
        output          q0_ln1_tx_fetch_o,
        input [2:0]     q0_ln1_tx_ctrl_i,
        output          q0_ln1_tx_invld_blk_o,
    `endif   
    `ifdef Q0_LN1_6467_USER_TX_IO
        input [1:0]     q0_ln1_tx_header_i,
        input [63:0]    q0_ln1_tx_data_i,
        output          q0_ln1_tx_fetch_o,
        input [2:0]     q0_ln1_tx_ctrl_i,
        output          q0_ln1_tx_invld_blk_o,
    `endif
    //Lane ready
    output          q0_ln1_ready_o,
    //CTC 
    `ifdef Q0_LN1_CTC
        input       q0_ln1_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN1_CHANNEL_BONDING
        input       q0_ln1_cb_start_i,
    `endif
    
    //RESET
    input       q0_ln1_pma_rstn_i,
    input       q0_ln1_pcs_rx_rst_i,
    input       q0_ln1_pcs_tx_rst_i,
    
    //Refclk 
    output      q0_ln1_refclk_o,
    
    //signal detect
    output      q0_ln1_signal_detect_o,
    
    //CDR LOCK
    output      q0_ln1_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q0_LN1_WORD_ALIGN
        output q0_ln1_k_lock_o,
        output q0_ln1_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q0_ln1_pll_lock_o,

`endif


//****************************Q0 LANE2***************************************
`ifdef Q0_LN2
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q0_LANE2_PCS_RX_O_FABRIC_CLK,
    output          Q0_LANE2_FABRIC_RX_CLK,
    input  [87:0]   Q0_FABRIC_LN2_RXDATA_O,
    output          Q0_LANE2_RX_IF_FIFO_RDEN,
    input  [4:0]    Q0_LANE2_RX_IF_FIFO_RDUSEWD,
    input           Q0_LANE2_RX_IF_FIFO_AEMPTY,
    input           Q0_LANE2_RX_IF_FIFO_EMPTY,
    input           Q0_FABRIC_LN2_RX_VLD_OUT,
    
    //TX PATH   
    input           Q0_LANE2_PCS_TX_O_FABRIC_CLK,
    output          Q0_LANE2_FABRIC_TX_CLK,
    output [79:0]   Q0_FABRIC_LN2_TXDATA_I,
    output          Q0_FABRIC_LN2_TX_VLD_IN,
    input  [4:0]    Q0_LANE2_TX_IF_FIFO_WRUSEWD,
    input           Q0_LANE2_TX_IF_FIFO_AFULL,
    input           Q0_LANE2_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q0_FABRIC_LN2_STAT_O,
    //CTC   
    output          Q0_LANE2_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q0_LANE2_CHBOND_START,
        
    //RESET 
    output          Q0_FABRIC_LN2_RSTN_I,
    output          Q0_LANE2_PCS_RX_RST,
    output          Q0_LANE2_PCS_TX_RST,

    //Refclk 
    input           Q0_FABRIC_LANE2_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q0_FABRIC_LN2_ASTAT_O,
    
    //CDR LOCK
    input           Q0_FABRIC_LN2_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q0_LANE2_ALIGN_LINK,
    input           Q0_LANE2_K_LOCK,
    
    //CMU LOCK
    input           Q0_FABRIC_LANE2_CMU_OK_O,
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        input           Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE2_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE2_64B66B_RX_VALID,
    `endif
    `ifdef GW5AT15
        input           Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE2_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE2_64B66B_RX_VALID,
    `endif
    //------connect to User Design------

    //RX PATH
    output          q0_ln2_rx_pcs_clkout_o,
    input           q0_ln2_rx_clk_i,
    `ifdef Q0_LN2_GENERAL_USER_RX_IO
        output [87:0]   q0_ln2_rx_data_o,
        input           q0_ln2_rx_fifo_rden_i,
        output [4:0]    q0_ln2_rx_fifo_rdusewd_o,
        output          q0_ln2_rx_fifo_aempty_o,
        output          q0_ln2_rx_fifo_empty_o,
        output          q0_ln2_rx_valid_o,
    `endif
    `ifdef Q0_LN2_6466_USER_RX_IO
        output [7:0]    q0_ln2_rxc_o,
        output [63:0]   q0_ln2_rxd_o,
        output          q0_ln2_rx_valid_o,
        output          q0_ln2_rx_blk_lock_o,
        output          q0_ln2_rx_dec_err_o,
        output          q0_ln2_rx_dscr_err_o,
        output          q0_ln2_rx_invld_header_o,
        output [1:0]    q0_ln2_rx_ctc_ins_o,
        output [1:0]    q0_ln2_rx_ctc_del_o,
        output          q0_ln2_rx_her_hi_o,     
    `endif
    `ifdef Q0_LN2_6467_USER_RX_IO
        output [1:0]    q0_ln2_rx_header_o,
        output [63:0]   q0_ln2_rx_data_o,
        output          q0_ln2_rx_valid_o,
        output          q0_ln2_rx_blk_lock_o,
        output          q0_ln2_rx_dec_err_o,
        output          q0_ln2_rx_dscr_err_o,
        output          q0_ln2_rx_invld_header_o,
        output          q0_ln2_rx_her_hi_o,     
    `endif
    //TX PATH
    output              q0_ln2_tx_pcs_clkout_o,
    input               q0_ln2_tx_clk_i,
    `ifdef Q0_LN2_GENERAL_USER_TX_IO
        input [79:0]    q0_ln2_tx_data_i, 
        input           q0_ln2_tx_fifo_wren_i,
        output [4:0]    q0_ln2_tx_fifo_wrusewd_o,
        output          q0_ln2_tx_fifo_afull_o,
        output          q0_ln2_tx_fifo_full_o,
    `endif
    `ifdef Q0_LN2_6466_USER_TX_IO
        input [7:0]     q0_ln2_txc_i,
        input [63:0]    q0_ln2_txd_i,
        output          q0_ln2_tx_fetch_o,
        input [2:0]     q0_ln2_tx_ctrl_i,
        output          q0_ln2_tx_invld_blk_o,
    `endif   
    `ifdef Q0_LN2_6467_USER_TX_IO
        input [1:0]     q0_ln2_tx_header_i,
        input [63:0]    q0_ln2_tx_data_i,
        output          q0_ln2_tx_fetch_o,
        input [2:0]     q0_ln2_tx_ctrl_i,
        output          q0_ln2_tx_invld_blk_o,
    `endif
    //Lane ready
    output          q0_ln2_ready_o,
    //CTC 
    `ifdef Q0_LN2_CTC
        input       q0_ln2_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN2_CHANNEL_BONDING
        input       q0_ln2_cb_start_i,
    `endif
    
    //RESET
    input       q0_ln2_pma_rstn_i,
    input       q0_ln2_pcs_rx_rst_i,
    input       q0_ln2_pcs_tx_rst_i,
    
    //Refclk 
    output      q0_ln2_refclk_o,
    
    //signal detect
    output      q0_ln2_signal_detect_o,
    
    //CDR LOCK
    output      q0_ln2_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q0_LN2_WORD_ALIGN
        output q0_ln2_k_lock_o,
        output q0_ln2_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q0_ln2_pll_lock_o,

`endif


//****************************Q0 LANE3***************************************
`ifdef Q0_LN3
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q0_LANE3_PCS_RX_O_FABRIC_CLK,
    output          Q0_LANE3_FABRIC_RX_CLK,
    input  [87:0]   Q0_FABRIC_LN3_RXDATA_O,
    output          Q0_LANE3_RX_IF_FIFO_RDEN,
    input  [4:0]    Q0_LANE3_RX_IF_FIFO_RDUSEWD,
    input           Q0_LANE3_RX_IF_FIFO_AEMPTY,
    input           Q0_LANE3_RX_IF_FIFO_EMPTY,
    input           Q0_FABRIC_LN3_RX_VLD_OUT,
    
    //TX PATH   
    input           Q0_LANE3_PCS_TX_O_FABRIC_CLK,
    output          Q0_LANE3_FABRIC_TX_CLK,
    output [79:0]   Q0_FABRIC_LN3_TXDATA_I,
    output          Q0_FABRIC_LN3_TX_VLD_IN,
    input  [4:0]    Q0_LANE3_TX_IF_FIFO_WRUSEWD,
    input           Q0_LANE3_TX_IF_FIFO_AFULL,
    input           Q0_LANE3_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q0_FABRIC_LN3_STAT_O,
    //CTC   
    output          Q0_LANE3_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q0_LANE3_CHBOND_START,
        
    //RESET 
    output          Q0_FABRIC_LN3_RSTN_I,
    output          Q0_LANE3_PCS_RX_RST,
    output          Q0_LANE3_PCS_TX_RST,

    //Refclk 
    input           Q0_FABRIC_LANE3_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q0_FABRIC_LN3_ASTAT_O,
    
    //CDR LOCK
    input           Q0_FABRIC_LN3_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q0_LANE3_ALIGN_LINK,
    input           Q0_LANE3_K_LOCK,
    
    //CMU LOCK
    input           Q0_FABRIC_LANE3_CMU_OK_O,
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        input           Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE3_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE3_64B66B_RX_VALID,
    `endif
    `ifdef GW5AT15
        input           Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK,
        input           Q0_FABRIC_LANE3_64B66B_TX_FETCH,
        input           Q0_FABRIC_LANE3_64B66B_RX_VALID,
    `endif
    //------connect to User Design------

    //RX PATH
    output          q0_ln3_rx_pcs_clkout_o,
    input           q0_ln3_rx_clk_i,
    `ifdef Q0_LN3_GENERAL_USER_RX_IO
        output [87:0]   q0_ln3_rx_data_o,
        input           q0_ln3_rx_fifo_rden_i,
        output [4:0]    q0_ln3_rx_fifo_rdusewd_o,
        output          q0_ln3_rx_fifo_aempty_o,
        output          q0_ln3_rx_fifo_empty_o,
        output          q0_ln3_rx_valid_o,
    `endif
    `ifdef Q0_LN3_6466_USER_RX_IO
        output [7:0]    q0_ln3_rxc_o,
        output [63:0]   q0_ln3_rxd_o,
        output          q0_ln3_rx_valid_o,
        output          q0_ln3_rx_blk_lock_o,
        output          q0_ln3_rx_dec_err_o,
        output          q0_ln3_rx_dscr_err_o,
        output          q0_ln3_rx_invld_header_o,
        output [1:0]    q0_ln3_rx_ctc_ins_o,
        output [1:0]    q0_ln3_rx_ctc_del_o,
        output          q0_ln3_rx_her_hi_o,     
    `endif
    `ifdef Q0_LN3_6467_USER_RX_IO
        output [1:0]    q0_ln3_rx_header_o,
        output [63:0]   q0_ln3_rx_data_o,
        output          q0_ln3_rx_valid_o,
        output          q0_ln3_rx_blk_lock_o,
        output          q0_ln3_rx_dec_err_o,
        output          q0_ln3_rx_dscr_err_o,
        output          q0_ln3_rx_invld_header_o,
        output          q0_ln3_rx_her_hi_o,     
    `endif
    //TX PATH
    output              q0_ln3_tx_pcs_clkout_o,
    input               q0_ln3_tx_clk_i,
    `ifdef Q0_LN3_GENERAL_USER_TX_IO
        input [79:0]    q0_ln3_tx_data_i, 
        input           q0_ln3_tx_fifo_wren_i,
        output [4:0]    q0_ln3_tx_fifo_wrusewd_o,
        output          q0_ln3_tx_fifo_afull_o,
        output          q0_ln3_tx_fifo_full_o,
    `endif
    `ifdef Q0_LN3_6466_USER_TX_IO
        input [7:0]     q0_ln3_txc_i,
        input [63:0]    q0_ln3_txd_i,
        output          q0_ln3_tx_fetch_o,
        input [2:0]     q0_ln3_tx_ctrl_i,
        output          q0_ln3_tx_invld_blk_o,
    `endif   
    `ifdef Q0_LN3_6467_USER_TX_IO
        input [1:0]     q0_ln3_tx_header_i,
        input [63:0]    q0_ln3_tx_data_i,
        output          q0_ln3_tx_fetch_o,
        input [2:0]     q0_ln3_tx_ctrl_i,
        output          q0_ln3_tx_invld_blk_o,
    `endif
    //Lane ready
    output          q0_ln3_ready_o,
    //CTC 
    `ifdef Q0_LN3_CTC
        input       q0_ln3_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN3_CHANNEL_BONDING
        input       q0_ln3_cb_start_i,
    `endif
    
    //RESET
    input       q0_ln3_pma_rstn_i,
    input       q0_ln3_pcs_rx_rst_i,
    input       q0_ln3_pcs_tx_rst_i,
    
    //Refclk 
    output      q0_ln3_refclk_o,
    
    //signal detect
    output      q0_ln3_signal_detect_o,
    
    //CDR LOCK
    output      q0_ln3_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q0_LN3_WORD_ALIGN
        output q0_ln3_k_lock_o,
        output q0_ln3_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q0_ln3_pll_lock_o,

`endif



//****************************Q1 LANE0***************************************
`ifdef Q1_LN0
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q1_LANE0_PCS_RX_O_FABRIC_CLK,
    output          Q1_LANE0_FABRIC_RX_CLK,
    input  [87:0]   Q1_FABRIC_LN0_RXDATA_O,
    output          Q1_LANE0_RX_IF_FIFO_RDEN,
    input  [4:0]    Q1_LANE0_RX_IF_FIFO_RDUSEWD,
    input           Q1_LANE0_RX_IF_FIFO_AEMPTY,
    input           Q1_LANE0_RX_IF_FIFO_EMPTY,
    input           Q1_FABRIC_LN0_RX_VLD_OUT,
    
    //TX PATH   
    input           Q1_LANE0_PCS_TX_O_FABRIC_CLK,
    output          Q1_LANE0_FABRIC_TX_CLK,
    output [79:0]   Q1_FABRIC_LN0_TXDATA_I,
    output          Q1_FABRIC_LN0_TX_VLD_IN,
    input  [4:0]    Q1_LANE0_TX_IF_FIFO_WRUSEWD,
    input           Q1_LANE0_TX_IF_FIFO_AFULL,
    input           Q1_LANE0_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q1_FABRIC_LN0_STAT_O,
    //CTC   
    output          Q1_LANE0_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q1_LANE0_CHBOND_START,
        
    //RESET 
    output          Q1_FABRIC_LN0_RSTN_I,
    output          Q1_LANE0_PCS_RX_RST,
    output          Q1_LANE0_PCS_TX_RST,

    //Refclk 
    input           Q1_FABRIC_LANE0_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q1_FABRIC_LN0_ASTAT_O,
    
    //CDR LOCK
    input           Q1_FABRIC_LN0_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q1_LANE0_ALIGN_LINK,
    input           Q1_LANE0_K_LOCK,
    
    //CMU LOCK
    input           Q1_FABRIC_LANE0_CMU_OK_O,
    
    //------connect to User Design------
    //RX PATH
    output          q1_ln0_rx_pcs_clkout_o,
    input           q1_ln0_rx_clk_i,
    output [87:0]   q1_ln0_rx_data_o,
    input           q1_ln0_rx_fifo_rden_i,
    output [4:0]    q1_ln0_rx_fifo_rdusewd_o,
    output          q1_ln0_rx_fifo_aempty_o,
    output          q1_ln0_rx_fifo_empty_o,
    output          q1_ln0_rx_valid_o,

    //TX PATH
    output          q1_ln0_tx_pcs_clkout_o,
    input           q1_ln0_tx_clk_i,
    input [79:0]    q1_ln0_tx_data_i, 
    input           q1_ln0_tx_fifo_wren_i,
    output [4:0]    q1_ln0_tx_fifo_wrusewd_o,
    output          q1_ln0_tx_fifo_afull_o,
    output          q1_ln0_tx_fifo_full_o,
    //Lane ready
    output          q1_ln0_ready_o,
    //CTC 
    `ifdef Q1_LN0_CTC
        input       q1_ln0_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN0_CHANNEL_BONDING
        input       q1_ln0_cb_start_i,
    `endif
    
    //RESET
    input       q1_ln0_pma_rstn_i,
    input       q1_ln0_pcs_rx_rst_i,
    input       q1_ln0_pcs_tx_rst_i,
    
    //Refclk 
    output      q1_ln0_refclk_o,
    
    //signal detect
    output      q1_ln0_signal_detect_o,
    
    //CDR LOCK
    output      q1_ln0_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q1_LN0_WORD_ALIGN
        output q1_ln0_k_lock_o,
        output q1_ln0_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q1_ln0_pll_lock_o,

`endif

//****************************Q1 LANE1***************************************
`ifdef Q1_LN1
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q1_LANE1_PCS_RX_O_FABRIC_CLK,
    output          Q1_LANE1_FABRIC_RX_CLK,
    input  [87:0]   Q1_FABRIC_LN1_RXDATA_O,
    output          Q1_LANE1_RX_IF_FIFO_RDEN,
    input  [4:0]    Q1_LANE1_RX_IF_FIFO_RDUSEWD,
    input           Q1_LANE1_RX_IF_FIFO_AEMPTY,
    input           Q1_LANE1_RX_IF_FIFO_EMPTY,
    input           Q1_FABRIC_LN1_RX_VLD_OUT,
    
    //TX PATH   
    input           Q1_LANE1_PCS_TX_O_FABRIC_CLK,
    output          Q1_LANE1_FABRIC_TX_CLK,
    output [79:0]   Q1_FABRIC_LN1_TXDATA_I,
    output          Q1_FABRIC_LN1_TX_VLD_IN,
    input  [4:0]    Q1_LANE1_TX_IF_FIFO_WRUSEWD,
    input           Q1_LANE1_TX_IF_FIFO_AFULL,
    input           Q1_LANE1_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q1_FABRIC_LN1_STAT_O,
    //CTC   
    output          Q1_LANE1_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q1_LANE1_CHBOND_START,
        
    //RESET 
    output          Q1_FABRIC_LN1_RSTN_I,
    output          Q1_LANE1_PCS_RX_RST,
    output          Q1_LANE1_PCS_TX_RST,

    //Refclk 
    input           Q1_FABRIC_LANE1_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q1_FABRIC_LN1_ASTAT_O,
    
    //CDR LOCK
    input           Q1_FABRIC_LN1_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q1_LANE1_ALIGN_LINK,
    input           Q1_LANE1_K_LOCK,
    
    //CMU LOCK
    input           Q1_FABRIC_LANE1_CMU_OK_O,
    
    //------connect to User Design------
    //RX PATH
    output          q1_ln1_rx_pcs_clkout_o,
    input           q1_ln1_rx_clk_i,
    output [87:0]   q1_ln1_rx_data_o,
    input           q1_ln1_rx_fifo_rden_i,
    output [4:0]    q1_ln1_rx_fifo_rdusewd_o,
    output          q1_ln1_rx_fifo_aempty_o,
    output          q1_ln1_rx_fifo_empty_o,
    output          q1_ln1_rx_valid_o,

    //TX PATH
    output          q1_ln1_tx_pcs_clkout_o,
    input           q1_ln1_tx_clk_i,
    input [79:0]    q1_ln1_tx_data_i, 
    input           q1_ln1_tx_fifo_wren_i,
    output [4:0]    q1_ln1_tx_fifo_wrusewd_o,
    output          q1_ln1_tx_fifo_afull_o,
    output          q1_ln1_tx_fifo_full_o,
    //Lane ready
    output          q1_ln1_ready_o,
    //CTC 
    `ifdef Q1_LN1_CTC
        input       q1_ln1_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN1_CHANNEL_BONDING
        input       q1_ln1_cb_start_i,
    `endif
    
    //RESET
    input       q1_ln1_pma_rstn_i,
    input       q1_ln1_pcs_rx_rst_i,
    input       q1_ln1_pcs_tx_rst_i,
    
    //Refclk 
    output      q1_ln1_refclk_o,
    
    //signal detect
    output      q1_ln1_signal_detect_o,
    
    //CDR LOCK
    output      q1_ln1_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q1_LN1_WORD_ALIGN
        output q1_ln1_k_lock_o,
        output q1_ln1_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q1_ln1_pll_lock_o,

`endif


//****************************Q1 LANE2***************************************
`ifdef Q1_LN2
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q1_LANE2_PCS_RX_O_FABRIC_CLK,
    output          Q1_LANE2_FABRIC_RX_CLK,
    input  [87:0]   Q1_FABRIC_LN2_RXDATA_O,
    output          Q1_LANE2_RX_IF_FIFO_RDEN,
    input  [4:0]    Q1_LANE2_RX_IF_FIFO_RDUSEWD,
    input           Q1_LANE2_RX_IF_FIFO_AEMPTY,
    input           Q1_LANE2_RX_IF_FIFO_EMPTY,
    input           Q1_FABRIC_LN2_RX_VLD_OUT,
    
    //TX PATH   
    input           Q1_LANE2_PCS_TX_O_FABRIC_CLK,
    output          Q1_LANE2_FABRIC_TX_CLK,
    output [79:0]   Q1_FABRIC_LN2_TXDATA_I,
    output          Q1_FABRIC_LN2_TX_VLD_IN,
    input  [4:0]    Q1_LANE2_TX_IF_FIFO_WRUSEWD,
    input           Q1_LANE2_TX_IF_FIFO_AFULL,
    input           Q1_LANE2_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q1_FABRIC_LN2_STAT_O,
    //CTC   
    output          Q1_LANE2_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q1_LANE2_CHBOND_START,
        
    //RESET 
    output          Q1_FABRIC_LN2_RSTN_I,
    output          Q1_LANE2_PCS_RX_RST,
    output          Q1_LANE2_PCS_TX_RST,

    //Refclk 
    input           Q1_FABRIC_LANE2_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q1_FABRIC_LN2_ASTAT_O,
    
    //CDR LOCK
    input           Q1_FABRIC_LN2_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q1_LANE2_ALIGN_LINK,
    input           Q1_LANE2_K_LOCK,
    
    //CMU LOCK
    input           Q1_FABRIC_LANE2_CMU_OK_O,
    
    //------connect to User Design------
    //RX PATH
    output          q1_ln2_rx_pcs_clkout_o,
    input           q1_ln2_rx_clk_i,
    output [87:0]   q1_ln2_rx_data_o,
    input           q1_ln2_rx_fifo_rden_i,
    output [4:0]    q1_ln2_rx_fifo_rdusewd_o,
    output          q1_ln2_rx_fifo_aempty_o,
    output          q1_ln2_rx_fifo_empty_o,
    output          q1_ln2_rx_valid_o,

    //TX PATH
    output          q1_ln2_tx_pcs_clkout_o,
    input           q1_ln2_tx_clk_i,
    input [79:0]    q1_ln2_tx_data_i, 
    input           q1_ln2_tx_fifo_wren_i,
    output [4:0]    q1_ln2_tx_fifo_wrusewd_o,
    output          q1_ln2_tx_fifo_afull_o,
    output          q1_ln2_tx_fifo_full_o,
    //Lane ready
    output          q1_ln2_ready_o,
    //CTC 
    `ifdef Q1_LN2_CTC
        input       q1_ln2_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN2_CHANNEL_BONDING
        input       q1_ln2_cb_start_i,
    `endif
    
    //RESET
    input       q1_ln2_pma_rstn_i,
    input       q1_ln2_pcs_rx_rst_i,
    input       q1_ln2_pcs_tx_rst_i,
    
    //Refclk 
    output      q1_ln2_refclk_o,
    
    //signal detect
    output      q1_ln2_signal_detect_o,
    
    //CDR LOCK
    output      q1_ln2_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q1_LN2_WORD_ALIGN
        output q1_ln2_k_lock_o,
        output q1_ln2_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q1_ln2_pll_lock_o,

`endif


//****************************Q1 LANE3***************************************
`ifdef Q1_LN3
    //------connect to QUAD Primitive------
    //RX PATH
    input           Q1_LANE3_PCS_RX_O_FABRIC_CLK,
    output          Q1_LANE3_FABRIC_RX_CLK,
    input  [87:0]   Q1_FABRIC_LN3_RXDATA_O,
    output          Q1_LANE3_RX_IF_FIFO_RDEN,
    input  [4:0]    Q1_LANE3_RX_IF_FIFO_RDUSEWD,
    input           Q1_LANE3_RX_IF_FIFO_AEMPTY,
    input           Q1_LANE3_RX_IF_FIFO_EMPTY,
    input           Q1_FABRIC_LN3_RX_VLD_OUT,
    
    //TX PATH   
    input           Q1_LANE3_PCS_TX_O_FABRIC_CLK,
    output          Q1_LANE3_FABRIC_TX_CLK,
    output [79:0]   Q1_FABRIC_LN3_TXDATA_I,
    output          Q1_FABRIC_LN3_TX_VLD_IN,
    input  [4:0]    Q1_LANE3_TX_IF_FIFO_WRUSEWD,
    input           Q1_LANE3_TX_IF_FIFO_AFULL,
    input           Q1_LANE3_TX_IF_FIFO_FULL,	
    //stat
    input  [12:0]   Q1_FABRIC_LN3_STAT_O,
    //CTC   
    output          Q1_LANE3_FABRIC_C2I_CLK,
    
    //Channel Bonding 
    output          Q1_LANE3_CHBOND_START,
        
    //RESET 
    output          Q1_FABRIC_LN3_RSTN_I,
    output          Q1_LANE3_PCS_RX_RST,
    output          Q1_LANE3_PCS_TX_RST,

    //Refclk 
    input           Q1_FABRIC_LANE3_CMU_CK_REF_O,
    
    //astat
    input  [5:0]    Q1_FABRIC_LN3_ASTAT_O,
    
    //CDR LOCK
    input           Q1_FABRIC_LN3_PMA_RX_LOCK_O,
    
    //Word Align
    input           Q1_LANE3_ALIGN_LINK,
    input           Q1_LANE3_K_LOCK,
    
    //CMU LOCK
    input           Q1_FABRIC_LANE3_CMU_OK_O,
    
    //------connect to User Design------
    //RX PATH
    output          q1_ln3_rx_pcs_clkout_o,
    input           q1_ln3_rx_clk_i,
    output [87:0]   q1_ln3_rx_data_o,
    input           q1_ln3_rx_fifo_rden_i,
    output [4:0]    q1_ln3_rx_fifo_rdusewd_o,
    output          q1_ln3_rx_fifo_aempty_o,
    output          q1_ln3_rx_fifo_empty_o,
    output          q1_ln3_rx_valid_o,

    //TX PATH
    output          q1_ln3_tx_pcs_clkout_o,
    input           q1_ln3_tx_clk_i,
    input [79:0]    q1_ln3_tx_data_i, 
    input           q1_ln3_tx_fifo_wren_i,
    output [4:0]    q1_ln3_tx_fifo_wrusewd_o,
    output          q1_ln3_tx_fifo_afull_o,
    output          q1_ln3_tx_fifo_full_o,
    //Lane ready
    output          q1_ln3_ready_o,
    //CTC 
    `ifdef Q1_LN3_CTC
        input       q1_ln3_cc_clk_i,
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN3_CHANNEL_BONDING
        input       q1_ln3_cb_start_i,
    `endif
    
    //RESET
    input       q1_ln3_pma_rstn_i,
    input       q1_ln3_pcs_rx_rst_i,
    input       q1_ln3_pcs_tx_rst_i,
    
    //Refclk 
    output      q1_ln3_refclk_o,
    
    //signal detect
    output      q1_ln3_signal_detect_o,
    
    //CDR LOCK
    output      q1_ln3_rx_cdr_lock_o,
    
    //Word Align
    `ifdef Q1_LN3_WORD_ALIGN
        output q1_ln3_k_lock_o,
        output q1_ln3_word_align_link_o,
    `endif
    
    //PLL LOCK
    output      q1_ln3_pll_lock_o,

`endif

`ifdef DRP
    //------connect to UPAR Arbiter ------
    input         drp_clk_i,
    output [23:0] drp_addr_o,
    output        drp_wren_o,
    output [31:0] drp_wrdata_o,
    output [7:0]  drp_strb_o,
    input         drp_ready_i,
    output        drp_rden_o,
    input         drp_rdvld_i,
    input [31:0]  drp_rddata_i,
    input         drp_resp_i,
    //------connect to User Design------
    output        drp_clk_o,
    input [23:0]  drp_addr_i,
    input         drp_wren_i,
    input [31:0]  drp_wrdata_i,
    input [7:0]   drp_strb_i,
    output        drp_ready_o,
    input         drp_rden_i,
    output        drp_rdvld_o,
    output [31:0] drp_rddata_o,
    output        drp_resp_o,
`endif
    //------connect to QUAD Primitive, exist all the time------
    input           Q0_FABRIC_CMU_CK_REF_O,
    input           Q0_FABRIC_CMU1_CK_REF_O,
    input           Q0_FABRIC_CMU1_OK_O,
    input           Q0_FABRIC_CMU_OK_O,
    input           Q1_FABRIC_CMU_CK_REF_O,
    input           Q1_FABRIC_CMU1_CK_REF_O,
    input           Q1_FABRIC_CMU1_OK_O,
    input           Q1_FABRIC_CMU_OK_O
);



`getname(customized_phy_top,`MODULE_NAME) customized_phy_top (


//****************************Q0 LANE0***************************************
`ifdef Q0_LN0
    //------connect to QUAD Primitive------
    //RX PATH
    .Q0_LANE0_PCS_RX_O_FABRIC_CLK(Q0_LANE0_PCS_RX_O_FABRIC_CLK),
    .Q0_LANE0_FABRIC_RX_CLK(Q0_LANE0_FABRIC_RX_CLK),
    .Q0_FABRIC_LN0_RXDATA_O(Q0_FABRIC_LN0_RXDATA_O),
    .Q0_LANE0_RX_IF_FIFO_RDEN(Q0_LANE0_RX_IF_FIFO_RDEN),
    .Q0_LANE0_RX_IF_FIFO_RDUSEWD(Q0_LANE0_RX_IF_FIFO_RDUSEWD),
    .Q0_LANE0_RX_IF_FIFO_AEMPTY(Q0_LANE0_RX_IF_FIFO_AEMPTY),
    .Q0_LANE0_RX_IF_FIFO_EMPTY(Q0_LANE0_RX_IF_FIFO_EMPTY),
    .Q0_FABRIC_LN0_RX_VLD_OUT(Q0_FABRIC_LN0_RX_VLD_OUT),
    
    //TX PATH   
    .Q0_LANE0_PCS_TX_O_FABRIC_CLK(Q0_LANE0_PCS_TX_O_FABRIC_CLK),
    .Q0_LANE0_FABRIC_TX_CLK(Q0_LANE0_FABRIC_TX_CLK),
    .Q0_FABRIC_LN0_TXDATA_I(Q0_FABRIC_LN0_TXDATA_I),
    .Q0_FABRIC_LN0_TX_VLD_IN(Q0_FABRIC_LN0_TX_VLD_IN),
    .Q0_LANE0_TX_IF_FIFO_WRUSEWD(Q0_LANE0_TX_IF_FIFO_WRUSEWD),
    .Q0_LANE0_TX_IF_FIFO_AFULL(Q0_LANE0_TX_IF_FIFO_AFULL),
    .Q0_LANE0_TX_IF_FIFO_FULL(Q0_LANE0_TX_IF_FIFO_FULL),	
    
    //stat
    .Q0_FABRIC_LN0_STAT_O(Q0_FABRIC_LN0_STAT_O),
    
    //CTC   
    .Q0_LANE0_FABRIC_C2I_CLK(Q0_LANE0_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q0_LANE0_CHBOND_START(Q0_LANE0_CHBOND_START),
        
    //RESET 
    .Q0_FABRIC_LN0_RSTN_I(Q0_FABRIC_LN0_RSTN_I),
    .Q0_LANE0_PCS_RX_RST(Q0_LANE0_PCS_RX_RST),
    .Q0_LANE0_PCS_TX_RST(Q0_LANE0_PCS_TX_RST),

    //Refclk 
    .Q0_FABRIC_LANE0_CMU_CK_REF_O(Q0_FABRIC_LANE0_CMU_CK_REF_O),
    
    //astat
    .Q0_FABRIC_LN0_ASTAT_O(Q0_FABRIC_LN0_ASTAT_O),
    
    //CDR LOCK
    .Q0_FABRIC_LN0_PMA_RX_LOCK_O(Q0_FABRIC_LN0_PMA_RX_LOCK_O),
    
    //Word Align
    .Q0_LANE0_ALIGN_LINK(Q0_LANE0_ALIGN_LINK),
    .Q0_LANE0_K_LOCK(Q0_LANE0_K_LOCK),
    
    //CMU LOCK
    .Q0_FABRIC_LANE0_CMU_OK_O(Q0_FABRIC_LANE0_CMU_OK_O),
    
    //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        .Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE0_64B66B_TX_FETCH(Q0_FABRIC_LANE0_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE0_64B66B_RX_VALID(Q0_FABRIC_LANE0_64B66B_RX_VALID),
    `endif
    `ifdef GW5AT15
        .Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE0_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE0_64B66B_TX_FETCH(Q0_FABRIC_LANE0_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE0_64B66B_RX_VALID(Q0_FABRIC_LANE0_64B66B_RX_VALID),
    `endif
    
    
    //------connect to User Design------

    //RX PATH
    .q0_ln0_rx_pcs_clkout_o(q0_ln0_rx_pcs_clkout_o),
    .q0_ln0_rx_clk_i(q0_ln0_rx_clk_i),
    `ifdef Q0_LN0_GENERAL_USER_RX_IO
        .q0_ln0_rx_data_o(q0_ln0_rx_data_o),
        .q0_ln0_rx_fifo_rden_i(q0_ln0_rx_fifo_rden_i),
        .q0_ln0_rx_fifo_rdusewd_o(q0_ln0_rx_fifo_rdusewd_o),
        .q0_ln0_rx_fifo_aempty_o(q0_ln0_rx_fifo_aempty_o),
        .q0_ln0_rx_fifo_empty_o(q0_ln0_rx_fifo_empty_o),
        .q0_ln0_rx_valid_o(q0_ln0_rx_valid_o),
    `endif
    `ifdef Q0_LN0_6466_USER_RX_IO
        .q0_ln0_rxc_o(q0_ln0_rxc_o),
        .q0_ln0_rxd_o(q0_ln0_rxd_o),
        .q0_ln0_rx_valid_o(q0_ln0_rx_valid_o),
        .q0_ln0_rx_blk_lock_o(q0_ln0_rx_blk_lock_o),
        .q0_ln0_rx_dec_err_o(q0_ln0_rx_dec_err_o),
        .q0_ln0_rx_dscr_err_o(q0_ln0_rx_dscr_err_o),
        .q0_ln0_rx_invld_header_o(q0_ln0_rx_invld_header_o),
        .q0_ln0_rx_ctc_ins_o(q0_ln0_rx_ctc_ins_o),
        .q0_ln0_rx_ctc_del_o(q0_ln0_rx_ctc_del_o),
        .q0_ln0_rx_her_hi_o(q0_ln0_rx_her_hi_o),     
    `endif
    `ifdef Q0_LN0_6467_USER_RX_IO
        .q0_ln0_rx_header_o(q0_ln0_rx_header_o),
        .q0_ln0_rx_data_o(q0_ln0_rx_data_o),
        .q0_ln0_rx_valid_o(q0_ln0_rx_valid_o),
        .q0_ln0_rx_blk_lock_o(q0_ln0_rx_blk_lock_o),
        .q0_ln0_rx_dec_err_o(q0_ln0_rx_dec_err_o),
        .q0_ln0_rx_dscr_err_o(q0_ln0_rx_dscr_err_o),
        .q0_ln0_rx_invld_header_o(q0_ln0_rx_invld_header_o),
        .q0_ln0_rx_her_hi_o(q0_ln0_rx_her_hi_o),     
    `endif
    //TX PATH
    .q0_ln0_tx_pcs_clkout_o(q0_ln0_tx_pcs_clkout_o),
    .q0_ln0_tx_clk_i(q0_ln0_tx_clk_i),
    `ifdef Q0_LN0_GENERAL_USER_TX_IO
        .q0_ln0_tx_data_i(q0_ln0_tx_data_i), 
        .q0_ln0_tx_fifo_wren_i(q0_ln0_tx_fifo_wren_i),
        .q0_ln0_tx_fifo_wrusewd_o(q0_ln0_tx_fifo_wrusewd_o),
        .q0_ln0_tx_fifo_afull_o(q0_ln0_tx_fifo_afull_o),
        .q0_ln0_tx_fifo_full_o(q0_ln0_tx_fifo_full_o),
    `endif
    `ifdef Q0_LN0_6466_USER_TX_IO
        .q0_ln0_txc_i(q0_ln0_txc_i),
        .q0_ln0_txd_i(q0_ln0_txd_i),
        .q0_ln0_tx_fetch_o(q0_ln0_tx_fetch_o),
        .q0_ln0_tx_ctrl_i(q0_ln0_tx_ctrl_i),
        .q0_ln0_tx_invld_blk_o(q0_ln0_tx_invld_blk_o),
    `endif   
    `ifdef Q0_LN0_6467_USER_TX_IO
        .q0_ln0_tx_header_i(q0_ln0_tx_header_i),
        .q0_ln0_tx_data_i(q0_ln0_tx_data_i),
        .q0_ln0_tx_fetch_o(q0_ln0_tx_fetch_o),
        .q0_ln0_tx_ctrl_i(q0_ln0_tx_ctrl_i),
        .q0_ln0_tx_invld_blk_o(q0_ln0_tx_invld_blk_o),
    `endif
    //Lane ready
    .q0_ln0_ready_o(q0_ln0_ready_o),
    
    //CTC 
    `ifdef Q0_LN0_CTC
        .q0_ln0_cc_clk_i(q0_ln0_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN0_CHANNEL_BONDING
        .q0_ln0_cb_start_i(q0_ln0_cb_start_i),
    `endif
    
    //RESET
    .q0_ln0_pma_rstn_i(q0_ln0_pma_rstn_i),
    .q0_ln0_pcs_rx_rst_i(q0_ln0_pcs_rx_rst_i),
    .q0_ln0_pcs_tx_rst_i(q0_ln0_pcs_tx_rst_i),
    
    //Refclk 
    .q0_ln0_refclk_o(q0_ln0_refclk_o),
    
    //signal detect
    .q0_ln0_signal_detect_o(q0_ln0_signal_detect_o),
    
    //CDR LOCK
    .q0_ln0_rx_cdr_lock_o(q0_ln0_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q0_LN0_WORD_ALIGN
        .q0_ln0_k_lock_o(q0_ln0_k_lock_o),
        .q0_ln0_word_align_link_o(q0_ln0_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q0_ln0_pll_lock_o(q0_ln0_pll_lock_o),

`endif

//****************************Q0 LANE1***************************************
`ifdef Q0_LN1
    //------connect to QUAD Primitive------
    //RX PATH
    .Q0_LANE1_PCS_RX_O_FABRIC_CLK(Q0_LANE1_PCS_RX_O_FABRIC_CLK),
    .Q0_LANE1_FABRIC_RX_CLK(Q0_LANE1_FABRIC_RX_CLK),
    .Q0_FABRIC_LN1_RXDATA_O(Q0_FABRIC_LN1_RXDATA_O),
    .Q0_LANE1_RX_IF_FIFO_RDEN(Q0_LANE1_RX_IF_FIFO_RDEN),
    .Q0_LANE1_RX_IF_FIFO_RDUSEWD(Q0_LANE1_RX_IF_FIFO_RDUSEWD),
    .Q0_LANE1_RX_IF_FIFO_AEMPTY(Q0_LANE1_RX_IF_FIFO_AEMPTY),
    .Q0_LANE1_RX_IF_FIFO_EMPTY(Q0_LANE1_RX_IF_FIFO_EMPTY),
    .Q0_FABRIC_LN1_RX_VLD_OUT(Q0_FABRIC_LN1_RX_VLD_OUT),
    
    //TX PATH   
    .Q0_LANE1_PCS_TX_O_FABRIC_CLK(Q0_LANE1_PCS_TX_O_FABRIC_CLK),
    .Q0_LANE1_FABRIC_TX_CLK(Q0_LANE1_FABRIC_TX_CLK),
    .Q0_FABRIC_LN1_TXDATA_I(Q0_FABRIC_LN1_TXDATA_I),
    .Q0_FABRIC_LN1_TX_VLD_IN(Q0_FABRIC_LN1_TX_VLD_IN),
    .Q0_LANE1_TX_IF_FIFO_WRUSEWD(Q0_LANE1_TX_IF_FIFO_WRUSEWD),
    .Q0_LANE1_TX_IF_FIFO_AFULL(Q0_LANE1_TX_IF_FIFO_AFULL),
    .Q0_LANE1_TX_IF_FIFO_FULL(Q0_LANE1_TX_IF_FIFO_FULL),	
    
    //stat
    .Q0_FABRIC_LN1_STAT_O(Q0_FABRIC_LN1_STAT_O),
    //CTC   
    .Q0_LANE1_FABRIC_C2I_CLK(Q0_LANE1_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q0_LANE1_CHBOND_START(Q0_LANE1_CHBOND_START),
        
    //RESET 
    .Q0_FABRIC_LN1_RSTN_I(Q0_FABRIC_LN1_RSTN_I),
    .Q0_LANE1_PCS_RX_RST(Q0_LANE1_PCS_RX_RST),
    .Q0_LANE1_PCS_TX_RST(Q0_LANE1_PCS_TX_RST),

    //Refclk 
    .Q0_FABRIC_LANE1_CMU_CK_REF_O(Q0_FABRIC_LANE1_CMU_CK_REF_O),
    
    //astat
    .Q0_FABRIC_LN1_ASTAT_O(Q0_FABRIC_LN1_ASTAT_O),
    
    //CDR LOCK
    .Q0_FABRIC_LN1_PMA_RX_LOCK_O(Q0_FABRIC_LN1_PMA_RX_LOCK_O),
    
    //Word Align
    .Q0_LANE1_ALIGN_LINK(Q0_LANE1_ALIGN_LINK),
    .Q0_LANE1_K_LOCK(Q0_LANE1_K_LOCK),
    
    //CMU LOCK
    .Q0_FABRIC_LANE1_CMU_OK_O(Q0_FABRIC_LANE1_CMU_OK_O),
    
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        .Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE1_64B66B_TX_FETCH(Q0_FABRIC_LANE1_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE1_64B66B_RX_VALID(Q0_FABRIC_LANE1_64B66B_RX_VALID),
    `endif
    `ifdef GW5AT15
        .Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE1_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE1_64B66B_TX_FETCH(Q0_FABRIC_LANE1_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE1_64B66B_RX_VALID(Q0_FABRIC_LANE1_64B66B_RX_VALID),
    `endif
    
    //------connect to User Design------
   
    //RX PATH
    .q0_ln1_rx_pcs_clkout_o(q0_ln1_rx_pcs_clkout_o),
    .q0_ln1_rx_clk_i(q0_ln1_rx_clk_i),
    `ifdef Q0_LN1_GENERAL_USER_RX_IO
        .q0_ln1_rx_data_o(q0_ln1_rx_data_o),
        .q0_ln1_rx_fifo_rden_i(q0_ln1_rx_fifo_rden_i),
        .q0_ln1_rx_fifo_rdusewd_o(q0_ln1_rx_fifo_rdusewd_o),
        .q0_ln1_rx_fifo_aempty_o(q0_ln1_rx_fifo_aempty_o),
        .q0_ln1_rx_fifo_empty_o(q0_ln1_rx_fifo_empty_o),
        .q0_ln1_rx_valid_o(q0_ln1_rx_valid_o),
    `endif
    `ifdef Q0_LN1_6466_USER_RX_IO
        .q0_ln1_rxc_o(q0_ln1_rxc_o),
        .q0_ln1_rxd_o(q0_ln1_rxd_o),
        .q0_ln1_rx_valid_o(q0_ln1_rx_valid_o),
        .q0_ln1_rx_blk_lock_o(q0_ln1_rx_blk_lock_o),
        .q0_ln1_rx_dec_err_o(q0_ln1_rx_dec_err_o),
        .q0_ln1_rx_dscr_err_o(q0_ln1_rx_dscr_err_o),
        .q0_ln1_rx_invld_header_o(q0_ln1_rx_invld_header_o),
        .q0_ln1_rx_ctc_ins_o(q0_ln1_rx_ctc_ins_o),
        .q0_ln1_rx_ctc_del_o(q0_ln1_rx_ctc_del_o),
        .q0_ln1_rx_her_hi_o(q0_ln1_rx_her_hi_o),     
    `endif
    `ifdef Q0_LN1_6467_USER_RX_IO
        .q0_ln1_rx_header_o(q0_ln1_rx_header_o),
        .q0_ln1_rx_data_o(q0_ln1_rx_data_o),
        .q0_ln1_rx_valid_o(q0_ln1_rx_valid_o),
        .q0_ln1_rx_blk_lock_o(q0_ln1_rx_blk_lock_o),
        .q0_ln1_rx_dec_err_o(q0_ln1_rx_dec_err_o),
        .q0_ln1_rx_dscr_err_o(q0_ln1_rx_dscr_err_o),
        .q0_ln1_rx_invld_header_o(q0_ln1_rx_invld_header_o),
        .q0_ln1_rx_her_hi_o(q0_ln1_rx_her_hi_o),     
    `endif
    //TX PATH
    .q0_ln1_tx_pcs_clkout_o(q0_ln1_tx_pcs_clkout_o),
    .q0_ln1_tx_clk_i(q0_ln1_tx_clk_i),
    `ifdef Q0_LN1_GENERAL_USER_TX_IO
        .q0_ln1_tx_data_i(q0_ln1_tx_data_i), 
        .q0_ln1_tx_fifo_wren_i(q0_ln1_tx_fifo_wren_i),
        .q0_ln1_tx_fifo_wrusewd_o(q0_ln1_tx_fifo_wrusewd_o),
        .q0_ln1_tx_fifo_afull_o(q0_ln1_tx_fifo_afull_o),
        .q0_ln1_tx_fifo_full_o(q0_ln1_tx_fifo_full_o),
    `endif
    `ifdef Q0_LN1_6466_USER_TX_IO
        .q0_ln1_txc_i(q0_ln1_txc_i),
        .q0_ln1_txd_i(q0_ln1_txd_i),
        .q0_ln1_tx_fetch_o(q0_ln1_tx_fetch_o),
        .q0_ln1_tx_ctrl_i(q0_ln1_tx_ctrl_i),
        .q0_ln1_tx_invld_blk_o(q0_ln1_tx_invld_blk_o),
    `endif   
    `ifdef Q0_LN1_6467_USER_TX_IO
        .q0_ln1_tx_header_i(q0_ln1_tx_header_i),
        .q0_ln1_tx_data_i(q0_ln1_tx_data_i),
        .q0_ln1_tx_fetch_o(q0_ln1_tx_fetch_o),
        .q0_ln1_tx_ctrl_i(q0_ln1_tx_ctrl_i),
        .q0_ln1_tx_invld_blk_o(q0_ln1_tx_invld_blk_o),
    `endif
    //Lane ready
    .q0_ln1_ready_o(q0_ln1_ready_o),
    //CTC 
    `ifdef Q0_LN1_CTC
        .q0_ln1_cc_clk_i(q0_ln1_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN1_CHANNEL_BONDING
        .q0_ln1_cb_start_i(q0_ln1_cb_start_i),
    `endif
    
    //RESET
    .q0_ln1_pma_rstn_i(q0_ln1_pma_rstn_i),
    .q0_ln1_pcs_rx_rst_i(q0_ln1_pcs_rx_rst_i),
    .q0_ln1_pcs_tx_rst_i(q0_ln1_pcs_tx_rst_i),
    
    //Refclk 
    .q0_ln1_refclk_o(q0_ln1_refclk_o),
    
    //signal detect
    .q0_ln1_signal_detect_o(q0_ln1_signal_detect_o),
    
    //CDR LOCK
    .q0_ln1_rx_cdr_lock_o(q0_ln1_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q0_LN1_WORD_ALIGN
        .q0_ln1_k_lock_o(q0_ln1_k_lock_o),
        .q0_ln1_word_align_link_o(q0_ln1_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q0_ln1_pll_lock_o(q0_ln1_pll_lock_o),

`endif


//****************************Q0 LANE2***************************************
`ifdef Q0_LN2
    //------connect to QUAD Primitive------
    //RX PATH
    .Q0_LANE2_PCS_RX_O_FABRIC_CLK(Q0_LANE2_PCS_RX_O_FABRIC_CLK),
    .Q0_LANE2_FABRIC_RX_CLK(Q0_LANE2_FABRIC_RX_CLK),
    .Q0_FABRIC_LN2_RXDATA_O(Q0_FABRIC_LN2_RXDATA_O),
    .Q0_LANE2_RX_IF_FIFO_RDEN(Q0_LANE2_RX_IF_FIFO_RDEN),
    .Q0_LANE2_RX_IF_FIFO_RDUSEWD(Q0_LANE2_RX_IF_FIFO_RDUSEWD),
    .Q0_LANE2_RX_IF_FIFO_AEMPTY(Q0_LANE2_RX_IF_FIFO_AEMPTY),
    .Q0_LANE2_RX_IF_FIFO_EMPTY(Q0_LANE2_RX_IF_FIFO_EMPTY),
    .Q0_FABRIC_LN2_RX_VLD_OUT(Q0_FABRIC_LN2_RX_VLD_OUT),
    
    //TX PATH   
    .Q0_LANE2_PCS_TX_O_FABRIC_CLK(Q0_LANE2_PCS_TX_O_FABRIC_CLK),
    .Q0_LANE2_FABRIC_TX_CLK(Q0_LANE2_FABRIC_TX_CLK),
    .Q0_FABRIC_LN2_TXDATA_I(Q0_FABRIC_LN2_TXDATA_I),
    .Q0_FABRIC_LN2_TX_VLD_IN(Q0_FABRIC_LN2_TX_VLD_IN),
    .Q0_LANE2_TX_IF_FIFO_WRUSEWD(Q0_LANE2_TX_IF_FIFO_WRUSEWD),
    .Q0_LANE2_TX_IF_FIFO_AFULL(Q0_LANE2_TX_IF_FIFO_AFULL),
    .Q0_LANE2_TX_IF_FIFO_FULL(Q0_LANE2_TX_IF_FIFO_FULL),	
    //stat
    .Q0_FABRIC_LN2_STAT_O(Q0_FABRIC_LN2_STAT_O),
    //CTC   
    .Q0_LANE2_FABRIC_C2I_CLK(Q0_LANE2_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q0_LANE2_CHBOND_START(Q0_LANE2_CHBOND_START),
        
    //RESET 
    .Q0_FABRIC_LN2_RSTN_I(Q0_FABRIC_LN2_RSTN_I),
    .Q0_LANE2_PCS_RX_RST(Q0_LANE2_PCS_RX_RST),
    .Q0_LANE2_PCS_TX_RST(Q0_LANE2_PCS_TX_RST),

    //Refclk 
    .Q0_FABRIC_LANE2_CMU_CK_REF_O(Q0_FABRIC_LANE2_CMU_CK_REF_O),
    
    //astat
    .Q0_FABRIC_LN2_ASTAT_O(Q0_FABRIC_LN2_ASTAT_O),
    
    //CDR LOCK
    .Q0_FABRIC_LN2_PMA_RX_LOCK_O(Q0_FABRIC_LN2_PMA_RX_LOCK_O),
    
    //Word Align
    .Q0_LANE2_ALIGN_LINK(Q0_LANE2_ALIGN_LINK),
    .Q0_LANE2_K_LOCK(Q0_LANE2_K_LOCK),
    
    //CMU LOCK
    .Q0_FABRIC_LANE2_CMU_OK_O(Q0_FABRIC_LANE2_CMU_OK_O),
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        .Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE2_64B66B_TX_FETCH(Q0_FABRIC_LANE2_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE2_64B66B_RX_VALID(Q0_FABRIC_LANE2_64B66B_RX_VALID),
    `endif
    `ifdef GW5AT15
        .Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE2_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE2_64B66B_TX_FETCH(Q0_FABRIC_LANE2_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE2_64B66B_RX_VALID(Q0_FABRIC_LANE2_64B66B_RX_VALID),
    `endif
    //------connect to User Design------

    //RX PATH
    .q0_ln2_rx_pcs_clkout_o(q0_ln2_rx_pcs_clkout_o),
    .q0_ln2_rx_clk_i(q0_ln2_rx_clk_i),
    `ifdef Q0_LN2_GENERAL_USER_RX_IO
        .q0_ln2_rx_data_o(q0_ln2_rx_data_o),
        .q0_ln2_rx_fifo_rden_i(q0_ln2_rx_fifo_rden_i),
        .q0_ln2_rx_fifo_rdusewd_o(q0_ln2_rx_fifo_rdusewd_o),
        .q0_ln2_rx_fifo_aempty_o(q0_ln2_rx_fifo_aempty_o),
        .q0_ln2_rx_fifo_empty_o(q0_ln2_rx_fifo_empty_o),
        .q0_ln2_rx_valid_o(q0_ln2_rx_valid_o),
    `endif
    `ifdef Q0_LN2_6466_USER_RX_IO
        .q0_ln2_rxc_o(q0_ln2_rxc_o),
        .q0_ln2_rxd_o(q0_ln2_rxd_o),
        .q0_ln2_rx_valid_o(q0_ln2_rx_valid_o),
        .q0_ln2_rx_blk_lock_o(q0_ln2_rx_blk_lock_o),
        .q0_ln2_rx_dec_err_o(q0_ln2_rx_dec_err_o),
        .q0_ln2_rx_dscr_err_o(q0_ln2_rx_dscr_err_o),
        .q0_ln2_rx_invld_header_o(q0_ln2_rx_invld_header_o),
        .q0_ln2_rx_ctc_ins_o(q0_ln2_rx_ctc_ins_o),
        .q0_ln2_rx_ctc_del_o(q0_ln2_rx_ctc_del_o),
        .q0_ln2_rx_her_hi_o(q0_ln2_rx_her_hi_o),     
    `endif
    `ifdef Q0_LN2_6467_USER_RX_IO
        .q0_ln2_rx_header_o(q0_ln2_rx_header_o),
        .q0_ln2_rx_data_o(q0_ln2_rx_data_o),
        .q0_ln2_rx_valid_o(q0_ln2_rx_valid_o),
        .q0_ln2_rx_blk_lock_o(q0_ln2_rx_blk_lock_o),
        .q0_ln2_rx_dec_err_o(q0_ln2_rx_dec_err_o),
        .q0_ln2_rx_dscr_err_o(q0_ln2_rx_dscr_err_o),
        .q0_ln2_rx_invld_header_o(q0_ln2_rx_invld_header_o),
        .q0_ln2_rx_her_hi_o(q0_ln2_rx_her_hi_o),     
    `endif
    //TX PATH
    .q0_ln2_tx_pcs_clkout_o(q0_ln2_tx_pcs_clkout_o),
    .q0_ln2_tx_clk_i(q0_ln2_tx_clk_i),
    `ifdef Q0_LN2_GENERAL_USER_TX_IO
        .q0_ln2_tx_data_i(q0_ln2_tx_data_i), 
        .q0_ln2_tx_fifo_wren_i(q0_ln2_tx_fifo_wren_i),
        .q0_ln2_tx_fifo_wrusewd_o(q0_ln2_tx_fifo_wrusewd_o),
        .q0_ln2_tx_fifo_afull_o(q0_ln2_tx_fifo_afull_o),
        .q0_ln2_tx_fifo_full_o(q0_ln2_tx_fifo_full_o),
    `endif
    `ifdef Q0_LN2_6466_USER_TX_IO
        .q0_ln2_txc_i(q0_ln2_txc_i),
        .q0_ln2_txd_i(q0_ln2_txd_i),
        .q0_ln2_tx_fetch_o(q0_ln2_tx_fetch_o),
        .q0_ln2_tx_ctrl_i(q0_ln2_tx_ctrl_i),
        .q0_ln2_tx_invld_blk_o(q0_ln2_tx_invld_blk_o),
    `endif   
    `ifdef Q0_LN2_6467_USER_TX_IO
        .q0_ln2_tx_header_i(q0_ln2_tx_header_i),
        .q0_ln2_tx_data_i(q0_ln2_tx_data_i),
        .q0_ln2_tx_fetch_o(q0_ln2_tx_fetch_o),
        .q0_ln2_tx_ctrl_i(q0_ln2_tx_ctrl_i),
        .q0_ln2_tx_invld_blk_o(q0_ln2_tx_invld_blk_o),
    `endif
    //Lane ready
    .q0_ln2_ready_o(q0_ln2_ready_o),
    //CTC 
    `ifdef Q0_LN2_CTC
        .q0_ln2_cc_clk_i(q0_ln2_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN2_CHANNEL_BONDING
        .q0_ln2_cb_start_i(q0_ln2_cb_start_i),
    `endif
    
    //RESET
    .q0_ln2_pma_rstn_i(q0_ln2_pma_rstn_i),
    .q0_ln2_pcs_rx_rst_i(q0_ln2_pcs_rx_rst_i),
    .q0_ln2_pcs_tx_rst_i(q0_ln2_pcs_tx_rst_i),
    
    //Refclk 
    .q0_ln2_refclk_o(q0_ln2_refclk_o),
    
    //signal detect
    .q0_ln2_signal_detect_o(q0_ln2_signal_detect_o),
    
    //CDR LOCK
    .q0_ln2_rx_cdr_lock_o(q0_ln2_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q0_LN2_WORD_ALIGN
        .q0_ln2_k_lock_o(q0_ln2_k_lock_o),
        .q0_ln2_word_align_link_o(q0_ln2_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q0_ln2_pll_lock_o(q0_ln2_pll_lock_o),

`endif


//****************************Q0 LANE3***************************************
`ifdef Q0_LN3
    //------connect to QUAD Primitive------
    //RX PATH
    .Q0_LANE3_PCS_RX_O_FABRIC_CLK(Q0_LANE3_PCS_RX_O_FABRIC_CLK),
    .Q0_LANE3_FABRIC_RX_CLK(Q0_LANE3_FABRIC_RX_CLK),
    .Q0_FABRIC_LN3_RXDATA_O(Q0_FABRIC_LN3_RXDATA_O),
    .Q0_LANE3_RX_IF_FIFO_RDEN(Q0_LANE3_RX_IF_FIFO_RDEN),
    .Q0_LANE3_RX_IF_FIFO_RDUSEWD(Q0_LANE3_RX_IF_FIFO_RDUSEWD),
    .Q0_LANE3_RX_IF_FIFO_AEMPTY(Q0_LANE3_RX_IF_FIFO_AEMPTY),
    .Q0_LANE3_RX_IF_FIFO_EMPTY(Q0_LANE3_RX_IF_FIFO_EMPTY),
    .Q0_FABRIC_LN3_RX_VLD_OUT(Q0_FABRIC_LN3_RX_VLD_OUT),
    
    //TX PATH   
    .Q0_LANE3_PCS_TX_O_FABRIC_CLK(Q0_LANE3_PCS_TX_O_FABRIC_CLK),
    .Q0_LANE3_FABRIC_TX_CLK(Q0_LANE3_FABRIC_TX_CLK),
    .Q0_FABRIC_LN3_TXDATA_I(Q0_FABRIC_LN3_TXDATA_I),
    .Q0_FABRIC_LN3_TX_VLD_IN(Q0_FABRIC_LN3_TX_VLD_IN),
    .Q0_LANE3_TX_IF_FIFO_WRUSEWD(Q0_LANE3_TX_IF_FIFO_WRUSEWD),
    .Q0_LANE3_TX_IF_FIFO_AFULL(Q0_LANE3_TX_IF_FIFO_AFULL),
    .Q0_LANE3_TX_IF_FIFO_FULL(Q0_LANE3_TX_IF_FIFO_FULL),	
    //stat
    .Q0_FABRIC_LN3_STAT_O(Q0_FABRIC_LN3_STAT_O),
    //CTC   
    .Q0_LANE3_FABRIC_C2I_CLK(Q0_LANE3_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q0_LANE3_CHBOND_START(Q0_LANE3_CHBOND_START),
        
    //RESET 
    .Q0_FABRIC_LN3_RSTN_I(Q0_FABRIC_LN3_RSTN_I),
    .Q0_LANE3_PCS_RX_RST(Q0_LANE3_PCS_RX_RST),
    .Q0_LANE3_PCS_TX_RST(Q0_LANE3_PCS_TX_RST),

    //Refclk 
    .Q0_FABRIC_LANE3_CMU_CK_REF_O(Q0_FABRIC_LANE3_CMU_CK_REF_O),
    
    //astat
    .Q0_FABRIC_LN3_ASTAT_O(Q0_FABRIC_LN3_ASTAT_O),
    
    //CDR LOCK
    .Q0_FABRIC_LN3_PMA_RX_LOCK_O(Q0_FABRIC_LN3_PMA_RX_LOCK_O),
    
    //Word Align
    .Q0_LANE3_ALIGN_LINK(Q0_LANE3_ALIGN_LINK),
    .Q0_LANE3_K_LOCK(Q0_LANE3_K_LOCK),
    
    //CMU LOCK
    .Q0_FABRIC_LANE3_CMU_OK_O(Q0_FABRIC_LANE3_CMU_OK_O),
     //64b66b/64b67b Quad New IO
    `ifdef GW5AT60
        .Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE3_64B66B_TX_FETCH(Q0_FABRIC_LANE3_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE3_64B66B_RX_VALID(Q0_FABRIC_LANE3_64B66B_RX_VALID),
    `endif
    `ifdef GW5AT15
        .Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK(Q0_FABRIC_LANE3_64B66B_TX_INVLD_BLK),
        .Q0_FABRIC_LANE3_64B66B_TX_FETCH(Q0_FABRIC_LANE3_64B66B_TX_FETCH),
        .Q0_FABRIC_LANE3_64B66B_RX_VALID(Q0_FABRIC_LANE3_64B66B_RX_VALID),
    `endif
    //------connect to User Design------

    //RX PATH
    .q0_ln3_rx_pcs_clkout_o(q0_ln3_rx_pcs_clkout_o),
    .q0_ln3_rx_clk_i(q0_ln3_rx_clk_i),
    `ifdef Q0_LN3_GENERAL_USER_RX_IO
        .q0_ln3_rx_data_o(q0_ln3_rx_data_o),
        .q0_ln3_rx_fifo_rden_i(q0_ln3_rx_fifo_rden_i),
        .q0_ln3_rx_fifo_rdusewd_o(q0_ln3_rx_fifo_rdusewd_o),
        .q0_ln3_rx_fifo_aempty_o(q0_ln3_rx_fifo_aempty_o),
        .q0_ln3_rx_fifo_empty_o(q0_ln3_rx_fifo_empty_o),
        .q0_ln3_rx_valid_o(q0_ln3_rx_valid_o),
    `endif
    `ifdef Q0_LN3_6466_USER_RX_IO
        .q0_ln3_rxc_o(q0_ln3_rxc_o),
        .q0_ln3_rxd_o(q0_ln3_rxd_o),
        .q0_ln3_rx_valid_o(q0_ln3_rx_valid_o),
        .q0_ln3_rx_blk_lock_o(q0_ln3_rx_blk_lock_o),
        .q0_ln3_rx_dec_err_o(q0_ln3_rx_dec_err_o),
        .q0_ln3_rx_dscr_err_o(q0_ln3_rx_dscr_err_o),
        .q0_ln3_rx_invld_header_o(q0_ln3_rx_invld_header_o),
        .q0_ln3_rx_ctc_ins_o(q0_ln3_rx_ctc_ins_o),
        .q0_ln3_rx_ctc_del_o(q0_ln3_rx_ctc_del_o),
        .q0_ln3_rx_her_hi_o(q0_ln3_rx_her_hi_o),     
    `endif
    `ifdef Q0_LN3_6467_USER_RX_IO
        .q0_ln3_rx_header_o(q0_ln3_rx_header_o),
        .q0_ln3_rx_data_o(q0_ln3_rx_data_o),
        .q0_ln3_rx_valid_o(q0_ln3_rx_valid_o),
        .q0_ln3_rx_blk_lock_o(q0_ln3_rx_blk_lock_o),
        .q0_ln3_rx_dec_err_o(q0_ln3_rx_dec_err_o),
        .q0_ln3_rx_dscr_err_o(q0_ln3_rx_dscr_err_o),
        .q0_ln3_rx_invld_header_o(q0_ln3_rx_invld_header_o),
        .q0_ln3_rx_her_hi_o(q0_ln3_rx_her_hi_o),     
    `endif
    //TX PATH
    .q0_ln3_tx_pcs_clkout_o(q0_ln3_tx_pcs_clkout_o),
    .q0_ln3_tx_clk_i(q0_ln3_tx_clk_i),
    `ifdef Q0_LN3_GENERAL_USER_TX_IO
        .q0_ln3_tx_data_i(q0_ln3_tx_data_i), 
        .q0_ln3_tx_fifo_wren_i(q0_ln3_tx_fifo_wren_i),
        .q0_ln3_tx_fifo_wrusewd_o(q0_ln3_tx_fifo_wrusewd_o),
        .q0_ln3_tx_fifo_afull_o(q0_ln3_tx_fifo_afull_o),
        .q0_ln3_tx_fifo_full_o(q0_ln3_tx_fifo_full_o),
    `endif
    `ifdef Q0_LN3_6466_USER_TX_IO
        .q0_ln3_txc_i(q0_ln3_txc_i),
        .q0_ln3_txd_i(q0_ln3_txd_i),
        .q0_ln3_tx_fetch_o(q0_ln3_tx_fetch_o),
        .q0_ln3_tx_ctrl_i(q0_ln3_tx_ctrl_i),
        .q0_ln3_tx_invld_blk_o(q0_ln3_tx_invld_blk_o),
    `endif   
    `ifdef Q0_LN3_6467_USER_TX_IO
        .q0_ln3_tx_header_i(q0_ln3_tx_header_i),
        .q0_ln3_tx_data_i(q0_ln3_tx_data_i),
        .q0_ln3_tx_fetch_o(q0_ln3_tx_fetch_o),
        .q0_ln3_tx_ctrl_i(q0_ln3_tx_ctrl_i),
        .q0_ln3_tx_invld_blk_o(q0_ln3_tx_invld_blk_o),
    `endif
    //Lane ready
    .q0_ln3_ready_o(q0_ln3_ready_o),
    //CTC 
    `ifdef Q0_LN3_CTC
        .q0_ln3_cc_clk_i(q0_ln3_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q0_LN3_CHANNEL_BONDING
        .q0_ln3_cb_start_i(q0_ln3_cb_start_i),
    `endif
    
    //RESET
    .q0_ln3_pma_rstn_i(q0_ln3_pma_rstn_i),
    .q0_ln3_pcs_rx_rst_i(q0_ln3_pcs_rx_rst_i),
    .q0_ln3_pcs_tx_rst_i(q0_ln3_pcs_tx_rst_i),
    
    //Refclk 
    .q0_ln3_refclk_o(q0_ln3_refclk_o),
    
    //signal detect
    .q0_ln3_signal_detect_o(q0_ln3_signal_detect_o),
    
    //CDR LOCK
    .q0_ln3_rx_cdr_lock_o(q0_ln3_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q0_LN3_WORD_ALIGN
        .q0_ln3_k_lock_o(q0_ln3_k_lock_o),
        .q0_ln3_word_align_link_o(q0_ln3_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q0_ln3_pll_lock_o(q0_ln3_pll_lock_o),

`endif



//****************************Q1 LANE0***************************************
`ifdef Q1_LN0
    //------connect to QUAD Primitive------
    //RX PATH
    .Q1_LANE0_PCS_RX_O_FABRIC_CLK(Q1_LANE0_PCS_RX_O_FABRIC_CLK),
    .Q1_LANE0_FABRIC_RX_CLK(Q1_LANE0_FABRIC_RX_CLK),
    .Q1_FABRIC_LN0_RXDATA_O(Q1_FABRIC_LN0_RXDATA_O),
    .Q1_LANE0_RX_IF_FIFO_RDEN(Q1_LANE0_RX_IF_FIFO_RDEN),
    .Q1_LANE0_RX_IF_FIFO_RDUSEWD(Q1_LANE0_RX_IF_FIFO_RDUSEWD),
    .Q1_LANE0_RX_IF_FIFO_AEMPTY(Q1_LANE0_RX_IF_FIFO_AEMPTY),
    .Q1_LANE0_RX_IF_FIFO_EMPTY(Q1_LANE0_RX_IF_FIFO_EMPTY),
    .Q1_FABRIC_LN0_RX_VLD_OUT(Q1_FABRIC_LN0_RX_VLD_OUT),
    
    //TX PATH   
    .Q1_LANE0_PCS_TX_O_FABRIC_CLK(Q1_LANE0_PCS_TX_O_FABRIC_CLK),
    .Q1_LANE0_FABRIC_TX_CLK(Q1_LANE0_FABRIC_TX_CLK),
    .Q1_FABRIC_LN0_TXDATA_I(Q1_FABRIC_LN0_TXDATA_I),
    .Q1_FABRIC_LN0_TX_VLD_IN(Q1_FABRIC_LN0_TX_VLD_IN),
    .Q1_LANE0_TX_IF_FIFO_WRUSEWD(Q1_LANE0_TX_IF_FIFO_WRUSEWD),
    .Q1_LANE0_TX_IF_FIFO_AFULL(Q1_LANE0_TX_IF_FIFO_AFULL),
    .Q1_LANE0_TX_IF_FIFO_FULL(Q1_LANE0_TX_IF_FIFO_FULL),	
    //stat
    .Q1_FABRIC_LN0_STAT_O(Q1_FABRIC_LN0_STAT_O),
    //CTC   
    .Q1_LANE0_FABRIC_C2I_CLK(Q1_LANE0_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q1_LANE0_CHBOND_START(Q1_LANE0_CHBOND_START),
        
    //RESET 
    .Q1_FABRIC_LN0_RSTN_I(Q1_FABRIC_LN0_RSTN_I),
    .Q1_LANE0_PCS_RX_RST(Q1_LANE0_PCS_RX_RST),
    .Q1_LANE0_PCS_TX_RST(Q1_LANE0_PCS_TX_RST),

    //Refclk 
    .Q1_FABRIC_LANE0_CMU_CK_REF_O(Q1_FABRIC_LANE0_CMU_CK_REF_O),
    
    //astat
    .Q1_FABRIC_LN0_ASTAT_O(Q1_FABRIC_LN0_ASTAT_O),
    
    //CDR LOCK
    .Q1_FABRIC_LN0_PMA_RX_LOCK_O(Q1_FABRIC_LN0_PMA_RX_LOCK_O),
    
    //Word Align
    .Q1_LANE0_ALIGN_LINK(Q1_LANE0_ALIGN_LINK),
    .Q1_LANE0_K_LOCK(Q1_LANE0_K_LOCK),
    
    //CMU LOCK
    .Q1_FABRIC_LANE0_CMU_OK_O(Q1_FABRIC_LANE0_CMU_OK_O),
    
    //------connect to User Design------
    //RX PATH
    .q1_ln0_rx_pcs_clkout_o(q1_ln0_rx_pcs_clkout_o),
    .q1_ln0_rx_clk_i(q1_ln0_rx_clk_i),
    .q1_ln0_rx_data_o(q1_ln0_rx_data_o),
    .q1_ln0_rx_fifo_rden_i(q1_ln0_rx_fifo_rden_i),
    .q1_ln0_rx_fifo_rdusewd_o(q1_ln0_rx_fifo_rdusewd_o),
    .q1_ln0_rx_fifo_aempty_o(q1_ln0_rx_fifo_aempty_o),
    .q1_ln0_rx_fifo_empty_o(q1_ln0_rx_fifo_empty_o),
    .q1_ln0_rx_valid_o(q1_ln0_rx_valid_o),

    //TX PATH
    .q1_ln0_tx_pcs_clkout_o(q1_ln0_tx_pcs_clkout_o),
    .q1_ln0_tx_clk_i(q1_ln0_tx_clk_i),
    .q1_ln0_tx_data_i(q1_ln0_tx_data_i), 
    .q1_ln0_tx_fifo_wren_i(q1_ln0_tx_fifo_wren_i),
    .q1_ln0_tx_fifo_wrusewd_o(q1_ln0_tx_fifo_wrusewd_o),
    .q1_ln0_tx_fifo_afull_o(q1_ln0_tx_fifo_afull_o),
    .q1_ln0_tx_fifo_full_o(q1_ln0_tx_fifo_full_o),
    //Lane ready
    .q1_ln0_ready_o(q1_ln0_ready_o),
    //CTC 
    `ifdef Q1_LN0_CTC
        .q1_ln0_cc_clk_i(q1_ln0_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN0_CHANNEL_BONDING
        .q1_ln0_cb_start_i(q1_ln0_cb_start_i),
    `endif
    
    //RESET
    .q1_ln0_pma_rstn_i(q1_ln0_pma_rstn_i),
    .q1_ln0_pcs_rx_rst_i(q1_ln0_pcs_rx_rst_i),
    .q1_ln0_pcs_tx_rst_i(q1_ln0_pcs_tx_rst_i),
    
    //Refclk 
    .q1_ln0_refclk_o(q1_ln0_refclk_o),
    
    //signal detect
    .q1_ln0_signal_detect_o(q1_ln0_signal_detect_o),
    
    //CDR LOCK
    .q1_ln0_rx_cdr_lock_o(q1_ln0_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q1_LN0_WORD_ALIGN
        .q1_ln0_k_lock_o(q1_ln0_k_lock_o),
        .q1_ln0_word_align_link_o(q1_ln0_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q1_ln0_pll_lock_o(q1_ln0_pll_lock_o),

`endif

//****************************Q1 LANE1***************************************
`ifdef Q1_LN1
    //------connect to QUAD Primitive------
    //RX PATH
    .Q1_LANE1_PCS_RX_O_FABRIC_CLK(Q1_LANE1_PCS_RX_O_FABRIC_CLK),
    .Q1_LANE1_FABRIC_RX_CLK(Q1_LANE1_FABRIC_RX_CLK),
    .Q1_FABRIC_LN1_RXDATA_O(Q1_FABRIC_LN1_RXDATA_O),
    .Q1_LANE1_RX_IF_FIFO_RDEN(Q1_LANE1_RX_IF_FIFO_RDEN),
    .Q1_LANE1_RX_IF_FIFO_RDUSEWD(Q1_LANE1_RX_IF_FIFO_RDUSEWD),
    .Q1_LANE1_RX_IF_FIFO_AEMPTY(Q1_LANE1_RX_IF_FIFO_AEMPTY),
    .Q1_LANE1_RX_IF_FIFO_EMPTY(Q1_LANE1_RX_IF_FIFO_EMPTY),
    .Q1_FABRIC_LN1_RX_VLD_OUT(Q1_FABRIC_LN1_RX_VLD_OUT),
    
    //TX PATH   
    .Q1_LANE1_PCS_TX_O_FABRIC_CLK(Q1_LANE1_PCS_TX_O_FABRIC_CLK),
    .Q1_LANE1_FABRIC_TX_CLK(Q1_LANE1_FABRIC_TX_CLK),
    .Q1_FABRIC_LN1_TXDATA_I(Q1_FABRIC_LN1_TXDATA_I),
    .Q1_FABRIC_LN1_TX_VLD_IN(Q1_FABRIC_LN1_TX_VLD_IN),
    .Q1_LANE1_TX_IF_FIFO_WRUSEWD(Q1_LANE1_TX_IF_FIFO_WRUSEWD),
    .Q1_LANE1_TX_IF_FIFO_AFULL(Q1_LANE1_TX_IF_FIFO_AFULL),
    .Q1_LANE1_TX_IF_FIFO_FULL(Q1_LANE1_TX_IF_FIFO_FULL),	
    //stat
    .Q1_FABRIC_LN1_STAT_O(Q1_FABRIC_LN1_STAT_O),
    //CTC   
    .Q1_LANE1_FABRIC_C2I_CLK(Q1_LANE1_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q1_LANE1_CHBOND_START(Q1_LANE1_CHBOND_START),
        
    //RESET 
    .Q1_FABRIC_LN1_RSTN_I(Q1_FABRIC_LN1_RSTN_I),
    .Q1_LANE1_PCS_RX_RST(Q1_LANE1_PCS_RX_RST),
    .Q1_LANE1_PCS_TX_RST(Q1_LANE1_PCS_TX_RST),

    //Refclk 
    .Q1_FABRIC_LANE1_CMU_CK_REF_O(Q1_FABRIC_LANE1_CMU_CK_REF_O),
    
    //astat
    .Q1_FABRIC_LN1_ASTAT_O(Q1_FABRIC_LN1_ASTAT_O),
    
    //CDR LOCK
    .Q1_FABRIC_LN1_PMA_RX_LOCK_O(Q1_FABRIC_LN1_PMA_RX_LOCK_O),
    
    //Word Align
    .Q1_LANE1_ALIGN_LINK(Q1_LANE1_ALIGN_LINK),
    .Q1_LANE1_K_LOCK(Q1_LANE1_K_LOCK),
    
    //CMU LOCK
    .Q1_FABRIC_LANE1_CMU_OK_O(Q1_FABRIC_LANE1_CMU_OK_O),
    
    //------connect to User Design------
    //RX PATH
    .q1_ln1_rx_pcs_clkout_o(q1_ln1_rx_pcs_clkout_o),
    .q1_ln1_rx_clk_i(q1_ln1_rx_clk_i),
    .q1_ln1_rx_data_o(q1_ln1_rx_data_o),
    .q1_ln1_rx_fifo_rden_i(q1_ln1_rx_fifo_rden_i),
    .q1_ln1_rx_fifo_rdusewd_o(q1_ln1_rx_fifo_rdusewd_o),
    .q1_ln1_rx_fifo_aempty_o(q1_ln1_rx_fifo_aempty_o),
    .q1_ln1_rx_fifo_empty_o(q1_ln1_rx_fifo_empty_o),
    .q1_ln1_rx_valid_o(q1_ln1_rx_valid_o),

    //TX PATH
    .q1_ln1_tx_pcs_clkout_o(q1_ln1_tx_pcs_clkout_o),
    .q1_ln1_tx_clk_i(q1_ln1_tx_clk_i),
    .q1_ln1_tx_data_i(q1_ln1_tx_data_i), 
    .q1_ln1_tx_fifo_wren_i(q1_ln1_tx_fifo_wren_i),
    .q1_ln1_tx_fifo_wrusewd_o(q1_ln1_tx_fifo_wrusewd_o),
    .q1_ln1_tx_fifo_afull_o(q1_ln1_tx_fifo_afull_o),
    .q1_ln1_tx_fifo_full_o(q1_ln1_tx_fifo_full_o),
    //Lane ready
    .q1_ln1_ready_o(q1_ln1_ready_o),
    //CTC 
    `ifdef Q1_LN1_CTC
        .q1_ln1_cc_clk_i(q1_ln1_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN1_CHANNEL_BONDING
        .q1_ln1_cb_start_i(q1_ln1_cb_start_i),
    `endif
    
    //RESET
    .q1_ln1_pma_rstn_i(q1_ln1_pma_rstn_i),
    .q1_ln1_pcs_rx_rst_i(q1_ln1_pcs_rx_rst_i),
    .q1_ln1_pcs_tx_rst_i(q1_ln1_pcs_tx_rst_i),
    
    //Refclk 
    .q1_ln1_refclk_o(q1_ln1_refclk_o),
    
    //signal detect
    .q1_ln1_signal_detect_o(q1_ln1_signal_detect_o),
    
    //CDR LOCK
    .q1_ln1_rx_cdr_lock_o(q1_ln1_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q1_LN1_WORD_ALIGN
        .q1_ln1_k_lock_o(q1_ln1_k_lock_o),
        .q1_ln1_word_align_link_o(q1_ln1_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q1_ln1_pll_lock_o(q1_ln1_pll_lock_o),

`endif


//****************************Q1 LANE2***************************************
`ifdef Q1_LN2
    //------connect to QUAD Primitive------
    //RX PATH
    .Q1_LANE2_PCS_RX_O_FABRIC_CLK(Q1_LANE2_PCS_RX_O_FABRIC_CLK),
    .Q1_LANE2_FABRIC_RX_CLK(Q1_LANE2_FABRIC_RX_CLK),
    .Q1_FABRIC_LN2_RXDATA_O(Q1_FABRIC_LN2_RXDATA_O),
    .Q1_LANE2_RX_IF_FIFO_RDEN(Q1_LANE2_RX_IF_FIFO_RDEN),
    .Q1_LANE2_RX_IF_FIFO_RDUSEWD(Q1_LANE2_RX_IF_FIFO_RDUSEWD),
    .Q1_LANE2_RX_IF_FIFO_AEMPTY(Q1_LANE2_RX_IF_FIFO_AEMPTY),
    .Q1_LANE2_RX_IF_FIFO_EMPTY(Q1_LANE2_RX_IF_FIFO_EMPTY),
    .Q1_FABRIC_LN2_RX_VLD_OUT(Q1_FABRIC_LN2_RX_VLD_OUT),
    
    //TX PATH   
    .Q1_LANE2_PCS_TX_O_FABRIC_CLK(Q1_LANE2_PCS_TX_O_FABRIC_CLK),
    .Q1_LANE2_FABRIC_TX_CLK(Q1_LANE2_FABRIC_TX_CLK),
    .Q1_FABRIC_LN2_TXDATA_I(Q1_FABRIC_LN2_TXDATA_I),
    .Q1_FABRIC_LN2_TX_VLD_IN(Q1_FABRIC_LN2_TX_VLD_IN),
    .Q1_LANE2_TX_IF_FIFO_WRUSEWD(Q1_LANE2_TX_IF_FIFO_WRUSEWD),
    .Q1_LANE2_TX_IF_FIFO_AFULL(Q1_LANE2_TX_IF_FIFO_AFULL),
    .Q1_LANE2_TX_IF_FIFO_FULL(Q1_LANE2_TX_IF_FIFO_FULL),	
    //stat
    .Q1_FABRIC_LN2_STAT_O(Q1_FABRIC_LN2_STAT_O),
    //CTC   
    .Q1_LANE2_FABRIC_C2I_CLK(Q1_LANE2_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q1_LANE2_CHBOND_START(Q1_LANE2_CHBOND_START),
        
    //RESET 
    .Q1_FABRIC_LN2_RSTN_I(Q1_FABRIC_LN2_RSTN_I),
    .Q1_LANE2_PCS_RX_RST(Q1_LANE2_PCS_RX_RST),
    .Q1_LANE2_PCS_TX_RST(Q1_LANE2_PCS_TX_RST),

    //Refclk 
    .Q1_FABRIC_LANE2_CMU_CK_REF_O(Q1_FABRIC_LANE2_CMU_CK_REF_O),
    
    //astat
    .Q1_FABRIC_LN2_ASTAT_O(Q1_FABRIC_LN2_ASTAT_O),
    
    //CDR LOCK
    .Q1_FABRIC_LN2_PMA_RX_LOCK_O(Q1_FABRIC_LN2_PMA_RX_LOCK_O),
    
    //Word Align
    .Q1_LANE2_ALIGN_LINK(Q1_LANE2_ALIGN_LINK),
    .Q1_LANE2_K_LOCK(Q1_LANE2_K_LOCK),
    
    //CMU LOCK
    .Q1_FABRIC_LANE2_CMU_OK_O(Q1_FABRIC_LANE2_CMU_OK_O),
    
    //------connect to User Design------
    //RX PATH
    .q1_ln2_rx_pcs_clkout_o(q1_ln2_rx_pcs_clkout_o),
    .q1_ln2_rx_clk_i(q1_ln2_rx_clk_i),
    .q1_ln2_rx_data_o(q1_ln2_rx_data_o),
    .q1_ln2_rx_fifo_rden_i(q1_ln2_rx_fifo_rden_i),
    .q1_ln2_rx_fifo_rdusewd_o(q1_ln2_rx_fifo_rdusewd_o),
    .q1_ln2_rx_fifo_aempty_o(q1_ln2_rx_fifo_aempty_o),
    .q1_ln2_rx_fifo_empty_o(q1_ln2_rx_fifo_empty_o),
    .q1_ln2_rx_valid_o(q1_ln2_rx_valid_o),

    //TX PATH
    .q1_ln2_tx_pcs_clkout_o(q1_ln2_tx_pcs_clkout_o),
    .q1_ln2_tx_clk_i(q1_ln2_tx_clk_i),
    .q1_ln2_tx_data_i(q1_ln2_tx_data_i), 
    .q1_ln2_tx_fifo_wren_i(q1_ln2_tx_fifo_wren_i),
    .q1_ln2_tx_fifo_wrusewd_o(q1_ln2_tx_fifo_wrusewd_o),
    .q1_ln2_tx_fifo_afull_o(q1_ln2_tx_fifo_afull_o),
    .q1_ln2_tx_fifo_full_o(q1_ln2_tx_fifo_full_o),
    //Lane ready
    .q1_ln2_ready_o(q1_ln2_ready_o),
    //CTC 
    `ifdef Q1_LN2_CTC
        .q1_ln2_cc_clk_i(q1_ln2_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN2_CHANNEL_BONDING
        .q1_ln2_cb_start_i(q1_ln2_cb_start_i),
    `endif
    
    //RESET
    .q1_ln2_pma_rstn_i(q1_ln2_pma_rstn_i),
    .q1_ln2_pcs_rx_rst_i(q1_ln2_pcs_rx_rst_i),
    .q1_ln2_pcs_tx_rst_i(q1_ln2_pcs_tx_rst_i),
    
    //Refclk 
    .q1_ln2_refclk_o(q1_ln2_refclk_o),
    
    //signal detect
    .q1_ln2_signal_detect_o(q1_ln2_signal_detect_o),
    
    //CDR LOCK
    .q1_ln2_rx_cdr_lock_o(q1_ln2_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q1_LN2_WORD_ALIGN
        .q1_ln2_k_lock_o(q1_ln2_k_lock_o),
        .q1_ln2_word_align_link_o(q1_ln2_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q1_ln2_pll_lock_o(q1_ln2_pll_lock_o),

`endif


//****************************Q1 LANE3***************************************
`ifdef Q1_LN3
    //------connect to QUAD Primitive------
    //RX PATH
    .Q1_LANE3_PCS_RX_O_FABRIC_CLK(Q1_LANE3_PCS_RX_O_FABRIC_CLK),
    .Q1_LANE3_FABRIC_RX_CLK(Q1_LANE3_FABRIC_RX_CLK),
    .Q1_FABRIC_LN3_RXDATA_O(Q1_FABRIC_LN3_RXDATA_O),
    .Q1_LANE3_RX_IF_FIFO_RDEN(Q1_LANE3_RX_IF_FIFO_RDEN),
    .Q1_LANE3_RX_IF_FIFO_RDUSEWD(Q1_LANE3_RX_IF_FIFO_RDUSEWD),
    .Q1_LANE3_RX_IF_FIFO_AEMPTY(Q1_LANE3_RX_IF_FIFO_AEMPTY),
    .Q1_LANE3_RX_IF_FIFO_EMPTY(Q1_LANE3_RX_IF_FIFO_EMPTY),
    .Q1_FABRIC_LN3_RX_VLD_OUT(Q1_FABRIC_LN3_RX_VLD_OUT),
    
    //TX PATH   
    .Q1_LANE3_PCS_TX_O_FABRIC_CLK(Q1_LANE3_PCS_TX_O_FABRIC_CLK),
    .Q1_LANE3_FABRIC_TX_CLK(Q1_LANE3_FABRIC_TX_CLK),
    .Q1_FABRIC_LN3_TXDATA_I(Q1_FABRIC_LN3_TXDATA_I),
    .Q1_FABRIC_LN3_TX_VLD_IN(Q1_FABRIC_LN3_TX_VLD_IN),
    .Q1_LANE3_TX_IF_FIFO_WRUSEWD(Q1_LANE3_TX_IF_FIFO_WRUSEWD),
    .Q1_LANE3_TX_IF_FIFO_AFULL(Q1_LANE3_TX_IF_FIFO_AFULL),
    .Q1_LANE3_TX_IF_FIFO_FULL(Q1_LANE3_TX_IF_FIFO_FULL),	
    //stat
    .Q1_FABRIC_LN3_STAT_O(Q1_FABRIC_LN3_STAT_O),
    //CTC   
    .Q1_LANE3_FABRIC_C2I_CLK(Q1_LANE3_FABRIC_C2I_CLK),
    
    //Channel Bonding 
    .Q1_LANE3_CHBOND_START(Q1_LANE3_CHBOND_START),
        
    //RESET 
    .Q1_FABRIC_LN3_RSTN_I(Q1_FABRIC_LN3_RSTN_I),
    .Q1_LANE3_PCS_RX_RST(Q1_LANE3_PCS_RX_RST),
    .Q1_LANE3_PCS_TX_RST(Q1_LANE3_PCS_TX_RST),

    //Refclk 
    .Q1_FABRIC_LANE3_CMU_CK_REF_O(Q1_FABRIC_LANE3_CMU_CK_REF_O),
    
    //astat
    .Q1_FABRIC_LN3_ASTAT_O(Q1_FABRIC_LN3_ASTAT_O),
    
    //CDR LOCK
    .Q1_FABRIC_LN3_PMA_RX_LOCK_O(Q1_FABRIC_LN3_PMA_RX_LOCK_O),
    
    //Word Align
    .Q1_LANE3_ALIGN_LINK(Q1_LANE3_ALIGN_LINK),
    .Q1_LANE3_K_LOCK(Q1_LANE3_K_LOCK),
    
    //CMU LOCK
    .Q1_FABRIC_LANE3_CMU_OK_O(Q1_FABRIC_LANE3_CMU_OK_O),
    
    //------connect to User Design------
    //RX PATH
    .q1_ln3_rx_pcs_clkout_o(q1_ln3_rx_pcs_clkout_o),
    .q1_ln3_rx_clk_i(q1_ln3_rx_clk_i),
    .q1_ln3_rx_data_o(q1_ln3_rx_data_o),
    .q1_ln3_rx_fifo_rden_i(q1_ln3_rx_fifo_rden_i),
    .q1_ln3_rx_fifo_rdusewd_o(q1_ln3_rx_fifo_rdusewd_o),
    .q1_ln3_rx_fifo_aempty_o(q1_ln3_rx_fifo_aempty_o),
    .q1_ln3_rx_fifo_empty_o(q1_ln3_rx_fifo_empty_o),
    .q1_ln3_rx_valid_o(q1_ln3_rx_valid_o),

    //TX PATH
    .q1_ln3_tx_pcs_clkout_o(q1_ln3_tx_pcs_clkout_o),
    .q1_ln3_tx_clk_i(q1_ln3_tx_clk_i),
    .q1_ln3_tx_data_i(q1_ln3_tx_data_i), 
    .q1_ln3_tx_fifo_wren_i(q1_ln3_tx_fifo_wren_i),
    .q1_ln3_tx_fifo_wrusewd_o(q1_ln3_tx_fifo_wrusewd_o),
    .q1_ln3_tx_fifo_afull_o(q1_ln3_tx_fifo_afull_o),
    .q1_ln3_tx_fifo_full_o(q1_ln3_tx_fifo_full_o),
    //Lane ready
    .q1_ln3_ready_o(q1_ln3_ready_o),
    //CTC 
    `ifdef Q1_LN3_CTC
        .q1_ln3_cc_clk_i(q1_ln3_cc_clk_i),
    `endif
    
    //Channel Bonding 
    `ifdef Q1_LN3_CHANNEL_BONDING
        .q1_ln3_cb_start_i(q1_ln3_cb_start_i),
    `endif
    
    //RESET
    .q1_ln3_pma_rstn_i(q1_ln3_pma_rstn_i),
    .q1_ln3_pcs_rx_rst_i(q1_ln3_pcs_rx_rst_i),
    .q1_ln3_pcs_tx_rst_i(q1_ln3_pcs_tx_rst_i),
    
    //Refclk 
    .q1_ln3_refclk_o(q1_ln3_refclk_o),
    
    //signal detect
    .q1_ln3_signal_detect_o(q1_ln3_signal_detect_o),
    
    //CDR LOCK
    .q1_ln3_rx_cdr_lock_o(q1_ln3_rx_cdr_lock_o),
    
    //Word Align
    `ifdef Q1_LN3_WORD_ALIGN
        .q1_ln3_k_lock_o(q1_ln3_k_lock_o),
        .q1_ln3_word_align_link_o(q1_ln3_word_align_link_o),
    `endif
    
    //PLL LOCK
    .q1_ln3_pll_lock_o(q1_ln3_pll_lock_o),

`endif

`ifdef DRP
    //------connect to UPAR Arbiter ------
    .drp_clk_i(drp_clk_i),
    .drp_addr_o(drp_addr_o),
    .drp_wren_o(drp_wren_o),
    .drp_wrdata_o(drp_wrdata_o),
    .drp_strb_o(drp_strb_o),
    .drp_ready_i(drp_ready_i),
    .drp_rden_o(drp_rden_o),
    .drp_rdvld_i(drp_rdvld_i),
    .drp_rddata_i(drp_rddata_i),
    .drp_resp_i(drp_resp_i),
    //------connect to User Design------
    .drp_clk_o(drp_clk_o),
    .drp_addr_i(drp_addr_i),
    .drp_wren_i(drp_wren_i),
    .drp_wrdata_i(drp_wrdata_i),
    .drp_strb_i(drp_strb_i),
    .drp_ready_o(drp_ready_o),
    .drp_rden_i(drp_rden_i),
    .drp_rdvld_o(drp_rdvld_o),
    .drp_rddata_o(drp_rddata_o),
    .drp_resp_o(drp_resp_o),
`endif
    //------connect to QUAD Primitive, exist all the time------
    .Q0_FABRIC_CMU_CK_REF_O(Q0_FABRIC_CMU_CK_REF_O),
    .Q0_FABRIC_CMU1_CK_REF_O(Q0_FABRIC_CMU1_CK_REF_O),
    .Q0_FABRIC_CMU1_OK_O(Q0_FABRIC_CMU1_OK_O),
    .Q0_FABRIC_CMU_OK_O(Q0_FABRIC_CMU_OK_O),
    .Q1_FABRIC_CMU_CK_REF_O(Q1_FABRIC_CMU_CK_REF_O),
    .Q1_FABRIC_CMU1_CK_REF_O(Q1_FABRIC_CMU1_CK_REF_O),
    .Q1_FABRIC_CMU1_OK_O(Q1_FABRIC_CMU1_OK_O),
    .Q1_FABRIC_CMU_OK_O(Q1_FABRIC_CMU_OK_O)
);
endmodule
