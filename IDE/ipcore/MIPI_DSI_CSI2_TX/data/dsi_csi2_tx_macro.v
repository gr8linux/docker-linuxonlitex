`ifndef DSICSI2_TX_MACRO
`define DSICSI2_TX_MACRO

//////////////////////////////////////////////////////////////////////////////////////////////////////
`ifdef SIM
`define     getname(oriName,TopModuleName)      ``TopModuleName``__``oriName
`else
`define     getname(oriName,TopModuleName)      \~``oriName``.``TopModuleName
`endif
//////////////////////////////////////////////////////////////////////////////////////////////////////
`ifndef MODULE_NAME
`define     MODULE_NAME         DSI_CSI2_TX_Top
`endif
//////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef DSICSI2_TX_DEVICE
// $error("DSICSI2_TX_DEVICE Undefined !");
`define     DSICSI2_TX_DEVICE           "GW2A"
`endif

`ifdef DSICSI2_TX_CSI
`define     DSICSI2_TX_IS_DSI           0
`else
`define     DSICSI2_TX_IS_DSI           1
    `ifndef DSICSI2_TX_DSI
    `define     DSICSI2_TX_DSI
    `endif
`endif

`ifdef DSICSI2_TX_GEAR16
`define     DSICSI2_TX_IS_GEAR16        1
`else
`define     DSICSI2_TX_IS_GEAR16        0
    `ifndef DSICSI2_TX_GEAR8
    `define     DSICSI2_TX_GEAR8
    `endif
`endif

`ifdef DSICSI2_TX_DATA_1_LANE
`define     DSICSI2_TX_LANE             1
`elsif DSICSI2_TX_DATA_2_LANE
`define     DSICSI2_TX_LANE             2
`define     LANE_1
`elsif DSICSI2_TX_DATA_3_LANE
`define     DSICSI2_TX_LANE             3
`define     LANE_1
`define     LANE_2
`else
`define     DSICSI2_TX_LANE             4
`define     LANE_1
`define     LANE_2
`define     LANE_3
    `ifndef DSICSI2_TX_DATA_4_LANE
    `define     DSICSI2_TX_DATA_4_LANE
    `endif
`endif

`ifdef DSICSI2_TX_SYNC_PULSE_MODE
`define     SYNC_PULSE                  1
`else
`define     SYNC_PULSE                  0
`endif

`ifdef DSICSI2_TX_CRC_GEN
`define     DSICSI2_TX_CRC_IS_FAKED     0
`else
`define     DSICSI2_TX_CRC_IS_FAKED     1
`endif

`ifdef DSICSI2_TX_DSI_EOTP_GEN
`define     DSICSI2_TX_DSI_EOTP         1
`else
`define     DSICSI2_TX_DSI_EOTP         0
`endif

`define     DSICSI2_TX_CLK_CONTINUOUS   1

//////////////////////////////////////////////////////////////////////////////////////////////////////
`ifdef  DSICSI2_TX_GEAR16
`define     DSICSI2_TX_BN      (`DSICSI2_TX_LANE*2)
`define     DSICSI2_TX_CW      16
`else
`define     DSICSI2_TX_BN      (`DSICSI2_TX_LANE*1)
`define     DSICSI2_TX_CW      8
`endif
`define     DSICSI2_TX_DW      (`DSICSI2_TX_BN*8)

//////////////////////////////////////////////////////////////////////////////////////////////////////
`ifndef DSICSI2_TX_LPX_CN
`define     DSICSI2_TX_LPX_CN           8
`endif

`ifndef DSICSI2_TX_HS_PREP_CN
`define     DSICSI2_TX_HS_PREP_CN       8
`endif
`ifndef DSICSI2_TX_HS_ZERO_CN
`define     DSICSI2_TX_HS_ZERO_CN       8
`endif
`ifndef DSICSI2_TX_HS_TRAIL_CN
`define     DSICSI2_TX_HS_TRAIL_CN      8
`endif
`ifndef DSICSI2_TX_HS_EXIT_CN
`define     DSICSI2_TX_HS_EXIT_CN       8
`endif

`ifndef DSICSI2_TX_CK_PREP_CN
`define     DSICSI2_TX_CK_PREP_CN       `DSICSI2_TX_HS_PREP_CN
`endif
`ifndef DSICSI2_TX_CK_ZERO_CN
`define     DSICSI2_TX_CK_ZERO_CN       `DSICSI2_TX_HS_ZERO_CN
`endif
`ifndef DSICSI2_TX_CK_PRE_CN
`define     DSICSI2_TX_CK_PRE_CN        `DSICSI2_TX_CK_ZERO_CN
`endif
`ifndef DSICSI2_TX_CK_TRAIL_CN
`define     DSICSI2_TX_CK_TRAIL_CN      `DSICSI2_TX_HS_TRAIL_CN
`endif
`ifndef DSICSI2_TX_CK_POST_CN
`define     DSICSI2_TX_CK_POST_CN       `DSICSI2_TX_CK_TRAIL_CN
`endif
`ifndef DSICSI2_TX_CK_EXIT_CN
`define     DSICSI2_TX_CK_EXIT_CN       `DSICSI2_TX_HS_EXIT_CN
`endif
//////////////////////////////////////////////////////////////////////////////////////////////////////
`define     DSIDT_SP_VSSE   6'h01
`define     DSIDT_SP_VSEE   6'h11
`define     DSIDT_SP_HSSE   6'h21
`define     DSIDT_SP_HSEE   6'h31
`define     DSIDT_SP_EOTP   6'h08
`define     CSIDT_SP_FSC    6'h00
`define     CSIDT_SP_FEC    6'h01
`define     CSIDT_SP_LSC    6'h02
`define     CSIDT_SP_LEC    6'h03
//////////////////////////////////////////////////////////////////////////////////////////////////////
`define     LP_LIMIT_CN     (`DSICSI2_TX_LPX_CN + `DSICSI2_TX_HS_PREP_CN + `DSICSI2_TX_HS_ZERO_CN  + `DSICSI2_TX_HS_EXIT_CN + `DSICSI2_TX_HS_TRAIL_CN)
`define     LP_LIMIT_WC     (`LP_LIMIT_CN * `DSICSI2_TX_LANE)
//////////////////////////////////////////////////////////////////////////////////////////////////////
`define     BLLP_WC_TMP     (`DSICSI2_TX_HBP_WC + `DSICSI2_TX_HFP_WC + `DSICSI2_TX_HACT_WC + 6)
`define     BLLP_CN         ((`BLLP_WC_TMP + `DSICSI2_TX_LANE - 1) / `DSICSI2_TX_LANE)
`define     BLLP_WC         (`BLLP_CN * `DSICSI2_TX_LANE)
////
`define     HSA_LP          (`DSICSI2_TX_HSA_WC - `LP_LIMIT_WC - 6 - `DSICSI2_TX_LANE >= 0)
`define     HBP_LP          (`DSICSI2_TX_HBP_WC - `LP_LIMIT_WC - 6 - `DSICSI2_TX_LANE >= 0)
`define     HFP_LP          (`DSICSI2_TX_HFP_WC - `LP_LIMIT_WC - 6 - `DSICSI2_TX_LANE >= 0)
`define     BLLP_WC_LP      (`BLLP_WC - `LP_LIMIT_WC - 6 - `DSICSI2_TX_LANE >= 0)
////
`define     HSA_HS_EXIT_CN  ((`DSICSI2_TX_HSA_WC - `LP_LIMIT_WC - 6) / `DSICSI2_TX_LANE + `DSICSI2_TX_HS_EXIT_CN - 1)
`define     HBP_HS_EXIT_CN  ((`DSICSI2_TX_HBP_WC - `LP_LIMIT_WC - 6) / `DSICSI2_TX_LANE + `DSICSI2_TX_HS_EXIT_CN - 1)
`define     HFP_HS_EXIT_CN  ((`DSICSI2_TX_HFP_WC - `LP_LIMIT_WC - 6) / `DSICSI2_TX_LANE + `DSICSI2_TX_HS_EXIT_CN - 1)
`define     BLLP_HS_EXIT_CN ((`BLLP_WC - `LP_LIMIT_WC - 6) / `DSICSI2_TX_LANE + `DSICSI2_TX_HS_EXIT_CN - 1)
//////////////////////////////////////////////////////////////////////////////////////////////////////
`define     CTRL_CK_LP11    4'b1111  //! CLK LP11, clk dis, clk_exit(min)
`define     CTRL_CK_LP01    4'b1101  //! CLK LP01, lpx
`define     CTRL_CK_LP10    4'b1110  //! CLK LP10
`define     CTRL_CK_LP00    4'b1100  //! CLK LP00 , clk_prep
`define     CTRL_CK_NULL    4'b1000  //!    
`define     CTRL_CK_HSENA   4'b1001  //! CLK hs en, clk_zero
`define     CTRL_CK_TXENA   4'b1011  //! clk hs tx, clk_pre
`define     CTRL_CK_TXDIS   4'b1010  //! CLK hs tx end, clk_trail
`define     CTRL_DA_LP11    4'b0111  //! DATA LP11, data hs dis, hs_exit(min) or clk_post
`define     CTRL_DA_LP01    4'b0101  //! DATA LP10
`define     CTRL_DA_LP10    4'b0110  //! DATA LP01, lpx
`define     CTRL_DA_LP00    4'b0100  //! DATA LP00, hs_prep
`define     CTRL_NULL       4'b0000  //! ALL NULL
`define     CTRL_DA_HSENA   4'b0001  //! DATA hs en, data_zero
`define     CTRL_DA_TXENA   4'b0011  //! DATA tx
`define     CTRL_DA_NULL    4'b0010  //! DATA null for data_tail`define //! DSICSI2_TX_MRO
//////////////////////////////////////////////////////////////////////////////////////////////////////
`endif //! DSICSI2_TX_MACRO
