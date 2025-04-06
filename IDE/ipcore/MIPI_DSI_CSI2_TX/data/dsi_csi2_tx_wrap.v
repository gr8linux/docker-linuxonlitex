`timescale 1ns/1ns

`include "dsi_csi2_tx_define.v"

`include "dsi_csi2_tx_macro.v"

module `MODULE_NAME #
// module DSI_CSI2_TX_TOP #
(   parameter           CW  =   `DSICSI2_TX_CW
,   parameter           DW  =   `DSICSI2_TX_DW
)
(   input               I_RSTN
,   input               I_BYTE_CLK
//
`ifdef DSICSI2_TX_DSI
,   input               I_VS_START
,   input               I_VS_END
,   input               I_HS_START
,   input               I_HS_END
`else
,   input               I_FV_START
,   input               I_FV_END
`endif
//
,   input  [15:0]       I_WC
,   input  [ 1:0]       I_VC
,   input  [ 5:0]       I_DT
,   input               I_DATA_EN
,   input  [DW-1:0]     I_DATA
//
,   output [ 1:0]       O_LP_CLK
,   output              O_HS_CLK_EN
,   output [CW-1:0]     O_HS_CLK
,   output [ 1:0]       O_LP_DATA0
,   output              O_HS_DATA_EN
,   output [CW-1:0]     O_HS_DATA0
`ifdef LANE_1
,   output [CW-1:0]     O_HS_DATA1
`endif
`ifdef LANE_2
,   output [CW-1:0]     O_HS_DATA2
`endif
`ifdef LANE_3
,   output [CW-1:0]     O_HS_DATA3
`endif
);


`getname(DSI_CSI2_TX, `MODULE_NAME) u_tx
// DSI_CSI2_TX u_tx
(   .I_RSTN         ( I_RSTN        )
,   .I_BYTE_CLK     ( I_BYTE_CLK    )
`ifdef DSICSI2_TX_DSI
,   .I_VS_START     ( I_VS_START    )
,   .I_VS_END       ( I_VS_END      )
,   .I_HS_START     ( I_HS_START    )
,   .I_HS_END       ( I_HS_END      )
`else
,   .I_FV_START     ( I_FV_START    )
,   .I_FV_END       ( I_FV_END      )
`endif
,   .I_DATA         ( I_DATA        )
,   .I_DATA_EN      ( I_DATA_EN     )
,   .I_WC           ( I_WC          )
,   .I_VC           ( I_VC          )
,   .I_DT           ( I_DT          )

,   .O_LP_CLK       ( O_LP_CLK      )
,   .O_HS_CLK_EN    ( O_HS_CLK_EN   )
,   .O_HS_CLK       ( O_HS_CLK      )
,   .O_LP_DATA0     ( O_LP_DATA0    )
,   .O_HS_DATA_EN   ( O_HS_DATA_EN  )
,   .O_HS_DATA0     ( O_HS_DATA0    )
`ifdef LANE_1
,   .O_HS_DATA1     ( O_HS_DATA1    )
`endif
`ifdef LANE_2
,   .O_HS_DATA2     ( O_HS_DATA2    )
`endif
`ifdef LANE_3
,   .O_HS_DATA3     ( O_HS_DATA3    )
`endif
);

endmodule