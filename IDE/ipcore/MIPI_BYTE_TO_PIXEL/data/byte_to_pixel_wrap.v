`include "byte_to_pixel_define.v"

`include "byte_to_pixel_macro.v"

`timescale 1ns/10ps

module `MODULE_NAME #
(   parameter   DATA_BN     = `B2P_DATA_BN
,   parameter   DATA_BW     = `B2P_DATA_BW
,   parameter   PIXEL_BW    = `B2P_PIXEL_BW
)
(   input                   I_RSTN
,   input                   I_BYTE_CLK
,   input                   I_PIXEL_CLK

,   input                   I_SP_EN
,   input                   I_LP_AV_EN
,   input  [5:0]            I_DT
,   input  [15:0]           I_WC
`ifdef B2P_CTRL_AUX
,   input                   I_SP2_EN
,   input                   I_LP2_AV_EN
,   input  [5:0]            I_DT2
,   input  [15:0]           I_WC2
`endif
//
,   input  [DATA_BN-1:0]    I_PAYLOAD_DV
,   input  [DATA_BW-1:0]    I_PAYLOAD
//
`ifdef B2P_DSI
,   output                  O_VSYNC
,   output                  O_HSYNC
,   output                  O_DE
`endif
`ifdef B2P_CSI
,   output                  O_FV
,   output                  O_LV
`endif
,   output [PIXEL_BW-1:0]   O_PIXEL
//
`ifdef B2P_DEBUG
,   output                  o_dt_err
,   output                  o_wc_err
,   output                  o_align_err
,   output                  o_fifo_full
,   output                  o_fifo_empty
`endif
);

`getname(BYTE_TO_PIXEL, `MODULE_NAME) u_b2p_inst
// BYTE_TO_PIXEL u_b2p
(   .I_RSTN         (I_RSTN         )
,   .I_BYTE_CLK     (I_BYTE_CLK     )
,   .I_PIXEL_CLK    (I_PIXEL_CLK    )
//
,   .I_SP_EN        (I_SP_EN        )
,   .I_LP_AV_EN     (I_LP_AV_EN     )
,   .I_DT           (I_DT           )
,   .I_WC           (I_WC           )
`ifdef B2P_CTRL_AUX
,   .I_SP2_EN       (I_SP2_EN       )
,   .I_LP2_AV_EN    (I_LP2_AV_EN    )
,   .I_DT2          (I_DT2          )
,   .I_WC2          (I_WC2          )
`else
,   .I_SP2_EN       ('b0            )
,   .I_LP2_AV_EN    ('b0            )
,   .I_DT2          ('b0            )
,   .I_WC2          ('b0            )
`endif
//
,   .I_PAYLOAD_DV   (I_PAYLOAD_DV   )
,   .I_PAYLOAD      (I_PAYLOAD      )
//
`ifdef B2P_DSI
,   .O_VSYNC        (O_VSYNC        )
,   .O_HSYNC        (O_HSYNC        )
,   .O_DE           (O_DE           )
`endif
`ifdef B2P_CSI
,   .O_FV           (O_FV           )
,   .O_LV           (O_LV           )
`endif
,   .O_PIXEL        (O_PIXEL        )
//
`ifdef B2P_DEBUG
,   .o_dt_err       (o_dt_err       )
,   .o_wc_err       (o_wc_err       )
,   .o_align_err    (o_align_err    )
,   .o_fifo_full    (o_fifo_full    )
,   .o_fifo_empty   (o_fifo_empty   )
`endif
);

endmodule
