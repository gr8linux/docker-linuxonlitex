`ifndef STATIC_MACRO_DEFINE
`define STATIC_MACRO_DEFINE

`ifdef SIM
`define     getname(oriName,TopModuleName)      ``TopModuleName``__``oriName
`else
`define     getname(oriName,TopModuleName)      \~``oriName``.``TopModuleName
`endif

`ifndef MODULE_NAME
`define     MODULE_NAME         Byte_to_Pixel_Top
`endif

`ifndef B2P_DEVICE
// $error("B2P_DEVICE Undefined !");
`define     B2P_DEVICE           "GW2A"
`endif

`ifdef B2P_CSI
`define     B2P_IS_DSI          0
`else
`define     B2P_IS_DSI          1
    `ifndef B2P_DSI
    `define     B2P_DSI
    `endif
`endif

`ifdef B2P_GEAR8
`define     B2P_IS_GEAR16       0
`else
`define     B2P_IS_GEAR16       1
    `ifndef B2P_GEAR16
    `define     B2P_GEAR16
    `endif
`endif

`ifdef B2P_DATA_1_LANE
`define     B2P_LANE            1
`elsif B2P_DATA_2_LANE
`define     B2P_LANE            2
`elsif B2P_DATA_3_LANE
`define     B2P_LANE            3
    `ifdef B2P_GEAR16
    `define     B2P_CTRL_AUX
    `endif
`else
`define     B2P_LANE            4
    `ifdef B2P_GEAR16
    `define     B2P_CTRL_AUX
    `endif
    `ifndef B2P_DATA_4_LANE
    `define     B2P_DATA_4_LANE
    `endif
`endif

`ifndef B2P_DSI_MODE
`define     B2P_DSI_MODE        0
`endif

`ifndef B2P_PXL_PER_CLK
`define     B2P_PXL_PER_CLK     1
`endif

`ifndef B2P_DATA_TYPE
    `ifdef B2P_CSI
    `define     B2P_DATA_TYPE   6'h24
    `else
    `define     B2P_DATA_TYPE   6'h3E
    `endif
`endif

`ifndef B2P_VS_LINE_NUM
`define     B2P_VS_LINE_NUM     2
`endif

`ifndef B2P_HS_CLK_NUM
`define     B2P_HS_CLK_NUM      8
`endif

`ifndef B2P_HS_DELAY
`define     B2P_HS_DELAY        8
`endif

`define     B2P_PBW_UNIT        ( (`B2P_IS_DSI != 0) ? \
                                  ((`B2P_DATA_TYPE == 6'h3e) ? 24 : \
                                   (`B2P_DATA_TYPE == 6'h2e) ? 24 : \
                                   (`B2P_DATA_TYPE == 6'h1e) ? 18 : \
                                   (`B2P_DATA_TYPE == 6'h0e) ? 16 : \
                                   (`B2P_DATA_TYPE == 6'h2c) ? 16 : \
                                   (`B2P_DATA_TYPE == 6'h1c) ? 24 : \
                                   (`B2P_DATA_TYPE == 6'h0c) ? 24 : \
                                   (`B2P_DATA_TYPE == 6'h1d) ? 36 : \
                                   (`B2P_DATA_TYPE == 6'h0d) ? 30 : 8) \
                                : ((`B2P_DATA_TYPE == 6'h2d) ? 14 : \
                                   (`B2P_DATA_TYPE == 6'h2c) ? 12 : \
                                   (`B2P_DATA_TYPE == 6'h2b) ? 10 : \
                                   (`B2P_DATA_TYPE == 6'h24) ? 24 : \
                                   (`B2P_DATA_TYPE == 6'h23) ? 18 : \
                                   (`B2P_DATA_TYPE == 6'h22) ? 16 : \
                                   (`B2P_DATA_TYPE == 6'h21) ? 16 : \
                                   (`B2P_DATA_TYPE == 6'h20) ? 16 : \
                                   (`B2P_DATA_TYPE == 6'h1f) ? 10 : \
                                   (`B2P_DATA_TYPE == 6'h1d) ? 10 : \
                                   (`B2P_DATA_TYPE == 6'h19) ? 10 : 8))
`define     B2P_PIXEL_BW        (`B2P_PBW_UNIT * `B2P_PXL_PER_CLK)
`define     B2P_DATA_BN         ((`B2P_IS_GEAR16+1)*`B2P_LANE)
`define     B2P_DATA_BW         (`B2P_DATA_BN*8)

`endif  //! STATIC_MACRO_DEFINE