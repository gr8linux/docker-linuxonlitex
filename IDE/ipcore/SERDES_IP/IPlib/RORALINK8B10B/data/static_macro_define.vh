`ifndef STATIC_MACRO_VH
`define STATIC_MACRO_VH

`define getname(oriName,tmodule_name) \~oriName.tmodule_name 

`endif


///Only For Simulation
///`define  MODELSIM_EN

`ifdef DUPLEX_EN
   `define TX_EN
`elsif SIMPLEX_TX_EN
   `define TX_EN
`endif

`ifdef DUPLEX_EN
   `define RX_EN
`elsif SIMPLEX_RX_EN
   `define RX_EN
`endif

`ifdef INFC_EN
   `define NFC_EN
`elsif CNFC_EN
   `define NFC_EN
`endif
