`ifndef PIXEL_TO_BYTE_MACRO
`define PIXEL_TO_BYTE_MACRO

`ifdef SIM
`define     getname(oriName,TopModuleName)      ``TopModuleName``__``oriName
`else
`define     getname(oriName,TopModuleName)      \~``oriName``.``TopModuleName
`endif

`ifndef MODULE_NAME
`define     MODULE_NAME         Pixel_to_Byte_Top
`endif

`ifndef P2B_DEVICE
// $error("P2B_DEVICE Undefined !");
`define     P2B_DEVICE           "GW2A"
`endif


`ifdef P2B_CSI
`define     P2B_IS_DSI          0
`else
`define     P2B_IS_DSI          1
    `ifndef P2B_DSI
    `define     P2B_DSI
    `endif
`endif

`ifdef P2B_GEAR8
`define     P2B_IS_GEAR16       0
`else
`define     P2B_IS_GEAR16       1
    `ifndef P2B_GEAR16
    `define     P2B_GEAR16
    `endif
`endif

`ifdef P2B_DATA_1_LANE
`define     P2B_LANE            1
`elsif P2B_DATA_2_LANE
`define     P2B_LANE            2
`elsif P2B_DATA_3_LANE
`define     P2B_LANE            3
`else
`define     P2B_LANE            4
    `ifndef P2B_DATA_4_LANE
    `define     P2B_DATA_4_LANE
    `endif
`endif

`ifdef P2B_VS_LOW
`define     P2B_VS_POL          1'b0
`else
`define     P2B_VS_POL          1'b1
    `ifndef P2B_VS_HIGH
    `define     P2B_VS_HIGH
    `endif
`endif

`ifdef P2B_HS_LOW
`define     P2B_HS_POL          1'b0
`else
`define     P2B_HS_POL          1'b1
    `ifndef P2B_HS_HIGH
    `define     P2B_HS_HIGH
    `endif
`endif

`ifdef P2B_DE_LOW
`define     P2B_DE_POL          1'b0
`else
`define     P2B_DE_POL          1'b1
    `ifndef P2B_DE_HIGH
    `define     P2B_DE_HIGH
    `endif
`endif

`define P2B_SYNC_POL        {`P2B_VS_POL, `P2B_HS_POL, `P2B_DE_POL}

`ifndef P2B_DATA_TYPE
    `ifdef P2B_CSI
    `define     P2B_DATA_TYPE   6'h24
    `else
    `define     P2B_DATA_TYPE   6'h3E
    `endif
`endif

`ifndef P2B_PXL_PER_CLK
`define     P2B_PXL_PER_CLK     1
`endif

`ifndef P2B_SYNC_DELAY
`define     P2B_SYNC_DELAY      8
`endif

`define     P2B_PBW_UNIT    ( (`P2B_IS_DSI) \
                            ? ((`P2B_DATA_TYPE == 6'h3e) ? 24 : \
                               (`P2B_DATA_TYPE == 6'h2e) ? 24 : \
                               (`P2B_DATA_TYPE == 6'h1e) ? 18 : \
                               (`P2B_DATA_TYPE == 6'h0e) ? 16 : \
                               (`P2B_DATA_TYPE == 6'h2c) ? 16 : \
                               (`P2B_DATA_TYPE == 6'h1c) ? 24 : \
                               (`P2B_DATA_TYPE == 6'h0c) ? 24 : \
                               (`P2B_DATA_TYPE == 6'h1d) ? 36 : \
                               (`P2B_DATA_TYPE == 6'h0d) ? 30 : 8) \
                            : ((`P2B_DATA_TYPE == 6'h2d) ? 14 : \
                               (`P2B_DATA_TYPE == 6'h2c) ? 12 : \
                               (`P2B_DATA_TYPE == 6'h2b) ? 10 : \
                               (`P2B_DATA_TYPE == 6'h24) ? 24 : \
                               (`P2B_DATA_TYPE == 6'h23) ? 18 : \
                               (`P2B_DATA_TYPE == 6'h22) ? 16 : \
                               (`P2B_DATA_TYPE == 6'h21) ? 16 : \
                               (`P2B_DATA_TYPE == 6'h20) ? 16 : \
                               (`P2B_DATA_TYPE == 6'h1f) ? 10 : \
                               (`P2B_DATA_TYPE == 6'h1d) ? 10 : \
                               (`P2B_DATA_TYPE == 6'h19) ? 10 : 8))
`define     P2B_PIXEL_BW    (`P2B_PBW_UNIT * `P2B_PXL_PER_CLK)
`define     P2B_DATA_BN     ((`P2B_IS_GEAR16+1)*`P2B_LANE)
`define     P2B_DATA_BW     (`P2B_DATA_BN*8)

`endif //! PIXEL_TO_BYTE_MACRO