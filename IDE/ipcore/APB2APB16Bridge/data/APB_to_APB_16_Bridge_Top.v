//********************************************************************
//
// <File>     : APB_to_APB_16_Bridge_Top.v
// <Author>   : GOWIN
// <Function> : APB_to_APB_16_Bridge IP top level
// <Version>  : 1.1
//
//********************************************************************


// Includes ----------------------------------------------------------
`include "config.v"


// Definitions -------------------------------------------------------

module `module_name
(
`ifdef APB_SLAVE_0
    // Slave 0
    ps0_psel,       // APB slave 0, select 
    ps0_prdata,     // APB slave 0, read data
    ps0_pready,     // APB slave 0, ready in
    ps0_pslverr,    // APB slave 0, transfer error
`endif
`ifdef APB_SLAVE_1
    // Slave 1
    ps1_psel,
    ps1_prdata,
    ps1_pready,
    ps1_pslverr,
`endif
`ifdef APB_SLAVE_2
    // Slave 2
    ps2_psel,
    ps2_prdata,
    ps2_pready,
    ps2_pslverr,
`endif
`ifdef APB_SLAVE_3
    // Slave 3
    ps3_psel,
    ps3_prdata,
    ps3_pready,
    ps3_pslverr,
`endif
`ifdef APB_SLAVE_4
    // Slave 4
    ps4_psel,
    ps4_prdata,
    ps4_pready,
    ps4_pslverr,
`endif
`ifdef APB_SLAVE_5
    // Slave 5
    ps5_psel,
    ps5_prdata,
    ps5_pready,
    ps5_pslverr,
`endif
`ifdef APB_SLAVE_6
    // Slave 6
    ps6_psel,
    ps6_prdata,
    ps6_pready,
    ps6_pslverr,
`endif
`ifdef APB_SLAVE_7
    // Slave 7
    ps7_psel,
    ps7_prdata,
    ps7_pready,
    ps7_pslverr,
`endif
`ifdef APB_SLAVE_8
    // Slave 8
    ps8_psel,
    ps8_prdata,
    ps8_pready,
    ps8_pslverr,
`endif
`ifdef APB_SLAVE_9
    // Slave 9
    ps9_psel,
    ps9_prdata,
    ps9_pready,
    ps9_pslverr,
`endif
`ifdef APB_SLAVE_10
    // Slave 10
    ps10_psel,
    ps10_prdata,
    ps10_pready,
    ps10_pslverr,
`endif
`ifdef APB_SLAVE_11
    // Slave 11
    ps11_psel,
    ps11_prdata,
    ps11_pready,
    ps11_pslverr,
`endif
`ifdef APB_SLAVE_12
    // Slave 12
    ps12_psel,
    ps12_prdata,
    ps12_pready,
    ps12_pslverr,
`endif
`ifdef APB_SLAVE_13
    // Slave 13
    ps13_psel,
    ps13_prdata,
    ps13_pready,
    ps13_pslverr,
`endif
`ifdef APB_SLAVE_14
    // Slave 14
    ps14_psel,
    ps14_prdata,
    ps14_pready,
    ps14_pslverr,
`endif
`ifdef APB_SLAVE_15
    // Slave 15
    ps15_psel,
    ps15_prdata,
    ps15_pready,
    ps15_pslverr,
`endif
    paddr,              // Address
    psel,               // Select
    prdata,             // Read data
    pready,             // Ready out
    pslverr             // Transfer error
);


`ifdef APB_SLAVE_0
output          ps0_psel;
input [31:0]    ps0_prdata;
input           ps0_pready;
input           ps0_pslverr;
`endif
`ifdef APB_SLAVE_1
output          ps1_psel;
input [31:0]    ps1_prdata;
input           ps1_pready;
input           ps1_pslverr;
`endif
`ifdef APB_SLAVE_2
output          ps2_psel;
input [31:0]    ps2_prdata;
input           ps2_pready;
input           ps2_pslverr;
`endif
`ifdef APB_SLAVE_3
output          ps3_psel;
input [31:0]    ps3_prdata;
input           ps3_pready;
input           ps3_pslverr;
`endif
`ifdef APB_SLAVE_4
output          ps4_psel;
input [31:0]    ps4_prdata;
input           ps4_pready;
input           ps4_pslverr;
`endif
`ifdef APB_SLAVE_5
output          ps5_psel;
input [31:0]    ps5_prdata;
input           ps5_pready;
input           ps5_pslverr;
`endif
`ifdef APB_SLAVE_6
output          ps6_psel;
input [31:0]    ps6_prdata;
input           ps6_pready;
input           ps6_pslverr;
`endif
`ifdef APB_SLAVE_7
output          ps7_psel;
input [31:0]    ps7_prdata;
input           ps7_pready;
input           ps7_pslverr;
`endif
`ifdef APB_SLAVE_8
output          ps8_psel;
input [31:0]    ps8_prdata;
input           ps8_pready;
input           ps8_pslverr;
`endif
`ifdef APB_SLAVE_9
output          ps9_psel;
input [31:0]    ps9_prdata;
input           ps9_pready;
input           ps9_pslverr;
`endif
`ifdef APB_SLAVE_10
output          ps10_psel;
input [31:0]    ps10_prdata;
input           ps10_pready;
input           ps10_pslverr;
`endif
`ifdef APB_SLAVE_11
output          ps11_psel;
input [31:0]    ps11_prdata;
input           ps11_pready;
input           ps11_pslverr;
`endif
`ifdef APB_SLAVE_12
output          ps12_psel;
input [31:0]    ps12_prdata;
input           ps12_pready;
input           ps12_pslverr;
`endif
`ifdef APB_SLAVE_13
output          ps13_psel;
input [31:0]    ps13_prdata;
input           ps13_pready;
input           ps13_pslverr;
`endif
`ifdef APB_SLAVE_14
output          ps14_psel;
input [31:0]    ps14_prdata;
input           ps14_pready;
input           ps14_pslverr;
`endif
`ifdef APB_SLAVE_15
output          ps15_psel;
input [31:0]    ps15_prdata;
input           ps15_pready;
input           ps15_pslverr;
`endif

input [31:0]    paddr;
input           psel;
output [31:0]   prdata;
output          pready;
output          pslverr;


// APB_to_APB_16_Bridge IP instantiation
`define getname(oriName,tmodule_name) \~oriName.tmodule_name
`getname(APB_to_APB_16_Bridge,`module_name) u_APB_to_APB_16_Bridge
(
`ifdef APB_SLAVE_0
    .ps0_psel(ps0_psel),
    .ps0_prdata(ps0_prdata),
    .ps0_pready(ps0_pready),
    .ps0_pslverr(ps0_pslverr),
`endif
`ifdef APB_SLAVE_1
    .ps1_psel(ps1_psel),
    .ps1_prdata(ps1_prdata),
    .ps1_pready(ps1_pready),
    .ps1_pslverr(ps1_pslverr),
`endif
`ifdef APB_SLAVE_2
    .ps2_psel(ps2_psel),
    .ps2_prdata(ps2_prdata),
    .ps2_pready(ps2_pready),
    .ps2_pslverr(ps2_pslverr),
`endif
`ifdef APB_SLAVE_3
    .ps3_psel(ps3_psel),
    .ps3_prdata(ps3_prdata),
    .ps3_pready(ps3_pready),
    .ps3_pslverr(ps3_pslverr),
`endif
`ifdef APB_SLAVE_4
    .ps4_psel(ps4_psel),
    .ps4_prdata(ps4_prdata),
    .ps4_pready(ps4_pready),
    .ps4_pslverr(ps4_pslverr),
`endif
`ifdef APB_SLAVE_5
    .ps5_psel(ps5_psel),
    .ps5_prdata(ps5_prdata),
    .ps5_pready(ps5_pready),
    .ps5_pslverr(ps5_pslverr),
`endif
`ifdef APB_SLAVE_6
    .ps6_psel(ps6_psel),
    .ps6_prdata(ps6_prdata),
    .ps6_pready(ps6_pready),
    .ps6_pslverr(ps6_pslverr),
`endif
`ifdef APB_SLAVE_7
    .ps7_psel(ps7_psel),
    .ps7_prdata(ps7_prdata),
    .ps7_pready(ps7_pready),
    .ps7_pslverr(ps7_pslverr),
`endif
`ifdef APB_SLAVE_8
    .ps8_psel(ps8_psel),
    .ps8_prdata(ps8_prdata),
    .ps8_pready(ps8_pready),
    .ps8_pslverr(ps8_pslverr),
`endif
`ifdef APB_SLAVE_9
    .ps9_psel(ps9_psel),
    .ps9_prdata(ps9_prdata),
    .ps9_pready(ps9_pready),
    .ps9_pslverr(ps9_pslverr),
`endif
`ifdef APB_SLAVE_10
    .ps10_psel(ps10_psel),
    .ps10_prdata(ps10_prdata),
    .ps10_pready(ps10_pready),
    .ps10_pslverr(ps10_pslverr),
`endif
`ifdef APB_SLAVE_11
    .ps11_psel(ps11_psel),
    .ps11_prdata(ps11_prdata),
    .ps11_pready(ps11_pready),
    .ps11_pslverr(ps11_pslverr),
`endif
`ifdef APB_SLAVE_12
    .ps12_psel(ps12_psel),
    .ps12_prdata(ps12_prdata),
    .ps12_pready(ps12_pready),
    .ps12_pslverr(ps12_pslverr),
`endif
`ifdef APB_SLAVE_13
    .ps13_psel(ps13_psel),
    .ps13_prdata(ps13_prdata),
    .ps13_pready(ps13_pready),
    .ps13_pslverr(ps13_pslverr),
`endif
`ifdef APB_SLAVE_14
    .ps14_psel(ps14_psel),
    .ps14_prdata(ps14_prdata),
    .ps14_pready(ps14_pready),
    .ps14_pslverr(ps14_pslverr),
`endif
`ifdef APB_SLAVE_15
    .ps15_psel(ps15_psel),
    .ps15_prdata(ps15_prdata),
    .ps15_pready(ps15_pready),
    .ps15_pslverr(ps15_pslverr),
`endif
    .paddr(paddr),
    .psel(psel),
    .prdata(prdata),
    .pready(pready),
    .pslverr(pslverr)
);

endmodule