`include "pixel_to_byte_define.v"

`include "pixel_to_byte_macro.v"

`timescale 1ns/10ps

// module PIXEL_TO_BYTE_TOP
module `MODULE_NAME
(   input                       I_RSTN
,   input                       I_PIXEL_CLK
,   input                       I_BYTE_CLK

`ifdef P2B_DSI
,   input                       I_VSYNC
,   input                       I_HSYNC
,   input                       I_DE
`else
,   input                       I_FV
,   input                       I_LV
`endif
,   input  [`P2B_PIXEL_BW-1:0]  I_PIXEL
//
`ifdef P2B_DSI
,   output                      O_VS_START
,   output                      O_VS_END
,   output                      O_HS_START
,   output                      O_HS_END
`else
,   output                      O_FV_START
,   output                      O_FV_END
`endif
,   output                      O_DATA_EN
,   output [`P2B_DATA_BW-1:0]   O_DATA
);

// PIXEL_TO_BYTE u_p2b
`getname(PIXEL_TO_BYTE, `MODULE_NAME) u_p2b
(   .I_RSTN         ( I_RSTN        )
,   .I_PIXEL_CLK    ( I_PIXEL_CLK   )
,   .I_BYTE_CLK     ( I_BYTE_CLK    )
//
`ifdef P2B_DSI
,   .I_VSYNC        ( I_VSYNC       )
,   .I_HSYNC        ( I_HSYNC       )
,   .I_DE           ( I_DE          )
`else
,   .I_FV           ( I_FV          )
,   .I_LV           ( I_LV          )
`endif
,   .I_PIXEL        ( I_PIXEL       )
//
`ifdef P2B_DSI
,   .O_VS_START     ( O_VS_START    )
,   .O_VS_END       ( O_VS_END      )
,   .O_HS_START     ( O_HS_START    )
,   .O_HS_END       ( O_HS_END      )
`else
,   .O_FV_START     ( O_FV_START    )
,   .O_FV_END       ( O_FV_END      )
`endif
,   .O_DATA         ( O_DATA        )
,   .O_DATA_EN      ( O_DATA_EN     )
);

endmodule
