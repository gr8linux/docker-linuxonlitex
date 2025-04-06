`include "dsi_csi2_rx_define.v"
`include "dsi_csi2_rx_macro.v"

module `MODULE_NAME #
(   parameter   DW  = `DSICSI2_RX_DW
,   parameter   PW  = `DSICSI2_RX_PW
,   parameter   BN  = `DSICSI2_RX_BN
)
(   input           I_RSTN
,   input           I_BYTE_CLK
,   input  [ 5:0]   I_REF_DT
//
,   input           I_READY
,   input  [DW-1:0] I_DATA0
`ifdef LANE_1
,   input  [DW-1:0] I_DATA1
`endif
`ifdef LANE_2
,   input  [DW-1:0] I_DATA2
`endif
`ifdef LANE_3
,   input  [DW-1:0] I_DATA3
`endif
//
,   output          O_SP_EN
,   output          O_LP_EN
,   output          O_LP_AV_EN
,   output          O_ECC_OK
,   output [ 7:0]   O_ECC
,   output [15:0]   O_WC
,   output [ 1:0]   O_VC
,   output [ 5:0]   O_DT
//
`ifdef DSICSI2_RX_CTRL_AUX
,   output          O_SP2_EN
,   output          O_LP2_EN
,   output          O_LP2_AV_EN
,   output          O_ECC2_OK
,   output [ 7:0]   O_ECC2
,   output [15:0]   O_WC2
,   output [ 1:0]   O_VC2
,   output [ 5:0]   O_DT2
`endif
//
,   output [PW-1:0] O_PAYLOAD
,   output [BN-1:0] O_PAYLOAD_DV
);

`getname(DSI_CSI2_RX, `MODULE_NAME) u_dsi_csi2
(   .I_RSTN         ( I_RSTN            )
,   .I_BYTE_CLK     ( I_BYTE_CLK        )
,   .I_REF_DT       ( I_REF_DT          )
,   .I_READY        ( I_READY           )
,   .I_DATA0        ( I_DATA0           )
`ifdef LANE_1
,   .I_DATA1        ( I_DATA1           )
`endif
`ifdef LANE_2
,   .I_DATA2        ( I_DATA2           )
`endif
`ifdef LANE_3
,   .I_DATA3        ( I_DATA3           )
`endif

,   .O_SP_EN        ( O_SP_EN           )
,   .O_LP_EN        ( O_LP_EN           )
,   .O_LP_AV_EN     ( O_LP_AV_EN        )
,   .O_ECC_OK       ( O_ECC_OK          )
,   .O_ECC          ( O_ECC             )
,   .O_WC           ( O_WC              )
,   .O_VC           ( O_VC              )
,   .O_DT           ( O_DT              )
`ifdef DSICSI2_RX_CTRL_AUX
,   .O_SP2_EN       ( O_SP2_EN          )
,   .O_LP2_EN       ( O_LP2_EN          )
,   .O_LP2_AV_EN    ( O_LP2_AV_EN       )
,   .O_ECC2_OK      ( O_ECC2_OK         )
,   .O_ECC2         ( O_ECC2            )
,   .O_WC2          ( O_WC2             )
,   .O_VC2          ( O_VC2             )
,   .O_DT2          ( O_DT2             )
`endif
,   .O_PAYLOAD      ( O_PAYLOAD         )
,   .O_PAYLOAD_DV   ( O_PAYLOAD_DV      )
);


endmodule