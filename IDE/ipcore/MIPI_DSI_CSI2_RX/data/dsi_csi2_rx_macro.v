`ifndef DSICSI2_RX_MACRO
`define     DSICSI2_RX_MACRO

`ifdef SIM
`define     getname(oriName,TopModuleName)      ``TopModuleName``__``oriName
`else
`define     getname(oriName,TopModuleName)      \~``oriName.``TopModuleName
`endif

`ifndef MODULE_NAME
`define     MODULE_NAME         DSI_CSI2_RX_TOP
`endif

`ifdef  DSICSI2_RX_CSI
`define     DSICSI2_RX_IS_DSI               0
`else
`define     DSICSI2_RX_IS_DSI               1
    `ifndef DSICSI2_RX_DSI
    `define     DSICSI2_RX_DSI
    `endif
`endif

`ifdef  DSICSI2_RX_GEAR8
`define     DSICSI2_RX_IS_GEAR16            0
`else
`define     DSICSI2_RX_IS_GEAR16            1
    `ifndef DSICSI2_RX_GEAR16
    `define     DSICSI2_RX_GEAR16
    `endif
`endif

`ifdef  DSICSI2_RX_DATA_1_LANE
`define     DSICSI2_RX_LANE                 1
`elsif  DSICSI2_RX_DATA_2_LANE
`define     DSICSI2_RX_LANE                 2
`define     LANE_1
`elsif  DSICSI2_RX_DATA_3_LANE
`define     DSICSI2_RX_LANE                 3
`define     LANE_1
`define     LANE_2
    `ifdef  DSICSI2_RX_GEAR16
    `define     DSICSI2_RX_CTRL_AUX
    `endif
`else
`define     DSICSI2_RX_LANE                 4
`define     LANE_1
`define     LANE_2
`define     LANE_3
    `ifndef DSICSI2_RX_DATA_4_LANE
    `define     DSICSI2_RX_DATA_4_LANE
    `endif
    `ifdef  DSICSI2_RX_GEAR16
    `define     DSICSI2_RX_CTRL_AUX
    `endif
`endif

`ifndef DSICSI2_RX_SYNC_EVENT_ONLY
`define     DSICSI2_RX_SYNC_EVENT_ONLY     0
`endif

`ifdef  DSICSI2_RX_GEAR8
`define     USE_TPYE_C
`else
    `ifdef  DSICSI2_RX_DATA_3_LANE
    `define     USE_TPYE_A
    `elsif  DSICSI2_RX_DATA_4_LANE
    `define     USE_TPYE_B
    `else
    `define     USE_TPYE_C
    `endif
`endif

`ifdef  DSICSI2_RX_GEAR16
`define     DSICSI2_RX_BN      (`DSICSI2_RX_LANE*2)
`define     DSICSI2_RX_DW      16
`else
`define     DSICSI2_RX_BN      (`DSICSI2_RX_LANE*1)
`define     DSICSI2_RX_DW      8
`endif
`define     DSICSI2_RX_PW      (`DSICSI2_RX_BN*8)
`define     DSICSI2_RX_PWH     (`DSICSI2_RX_LANE*8)

`define SYNC_BYTE               8'hB8

`define DSIDT_SP_VSSE           6'h01
`define DSIDT_SP_VSEE           6'h11
`define DSIDT_SP_HSSE           6'h21
`define DSIDT_SP_HSEE           6'h31
`define DSIDT_SP_EOTP           6'h08
`define DSIDT_SP_CMFC           6'h02
`define DSIDT_SP_CMNC           6'h12
`define DSIDT_SP_SDPC           6'h22
`define DSIDT_SP_TOPC           6'h32
`define DSIDT_SP_GSW0           6'h03
`define DSIDT_SP_GSW1           6'h13
`define DSIDT_SP_GSW2           6'h23
`define DSIDT_SP_GR0            6'h04
`define DSIDT_SP_GR1            6'h14
`define DSIDT_SP_GR2            6'h24
`define DSIDT_SP_DCSW0          6'h05
`define DSIDT_SP_DCSW1          6'h15
`define DSIDT_SP_DCSR0          6'h06
`define DSIDT_SP_SMRPS          6'h37

`define DSIDT_LP_NP             6'h09
`define DSIDT_LP_BP             6'h19
`define DSIDT_LP_GLW            6'h29
`define DSIDT_LP_DCSLWCP        6'h39
`define DSIDT_LP_YUV422_10L     6'h0C
`define DSIDT_LP_YUV422_12      6'h1C
`define DSIDT_LP_YUV422_8       6'h2C
`define DSIDT_LP_RGB10          6'h0D
`define DSIDT_LP_RGB12          6'h1D
`define DSIDT_LP_YUV420_12      6'h3D
`define DSIDT_LP_RGB565         6'h0E
`define DSIDT_LP_RGB666         6'h1E
`define DSIDT_LP_RGB666L        6'h2E
`define DSIDT_LP_RGB8           6'h3E

`define CSIDT_SP_FSC            6'h00
`define CSIDT_SP_FEC            6'h01
`define CSIDT_SP_LSC            6'h02
`define CSIDT_SP_LEC            6'h03
`define CSIDT_SP_GENERIC1       6'h08
`define CSIDT_SP_GENERIC2       6'h09
`define CSIDT_SP_GENERIC3       6'h0A
`define CSIDT_SP_GENERIC4       6'h0B
`define CSIDT_SP_GENERIC5       6'h0C
`define CSIDT_SP_GENERIC6       6'h0D
`define CSIDT_SP_GENERIC7       6'h0E
`define CSIDT_SP_GENERIC8       6'h0F

`define CSIDT_LP_NULL           6'h10
`define CSIDT_LP_BLANKING       6'h11
`define CSIDT_LP_EMBEDDED       6'h12
`define CSIDT_LP_YUV420_8       6'h18
`define CSIDT_LP_YUV420_10      6'h19
`define CSIDT_LP_YUV420_8L      6'h1A
`define CSIDT_LP_YUV420_8CSPS   6'h1C
`define CSIDT_LP_YUV420_10CSPS  6'h1D
`define CSIDT_LP_YUV422_8       6'h1E
`define CSIDT_LP_YUV422_10      6'h1F
`define CSIDT_LP_RGB444         6'h20
`define CSIDT_LP_RGB555         6'h21
`define CSIDT_LP_RGB565         6'h22
`define CSIDT_LP_RGB666         6'h23
`define CSIDT_LP_RGB888         6'h24
`define CSIDT_LP_RAW6           6'h28
`define CSIDT_LP_RAW7           6'h29
`define CSIDT_LP_RAW8           6'h2A
`define CSIDT_LP_RAW10          6'h2B
`define CSIDT_LP_RAW12          6'h2C
`define CSIDT_LP_RAW14          6'h2D
`define CSIDT_LP_USER_T1        6'h30
`define CSIDT_LP_USER_T2        6'h31
`define CSIDT_LP_USER_T3        6'h32
`define CSIDT_LP_USER_T4        6'h33
`define CSIDT_LP_USER_T5        6'h34
`define CSIDT_LP_USER_T6        6'h35
`define CSIDT_LP_USER_T7        6'h36
`define CSIDT_LP_USER_T8        6'h37

`endif  //! DSICSI2_RX_MACRO