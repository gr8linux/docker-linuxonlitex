`include "define.v"
`include "static_macro_define.v"

module `module_name 
(input rst
// RX Serial Interface
,input RXC
,input RXD
// RX External Memory Interface
,output [7:0]RX_data_o
,output RX_status_n
,output RX_valid_n
// TX Serial Interface
,input TXC
,output TXD
// RX External Memory Interface
,input TX_start
,input TX_abort
,input TX_empty_n
,input [7:0]TX_data_i
,output TX_read_n
);

  `getname(HDLC_Top,`module_name) HDLC_inst (
    .rst              ( rst),
    .RXC              ( RXC),
    .RXD              ( RXD),
    .RX_data_o        ( RX_data_o),
    .RX_status_n  	  ( RX_status_n),
    .RX_valid_n    	  ( RX_valid_n),
    .TXC              ( TXC),
    .TXD              ( TXD),
    .TX_start         ( TX_start),
    .TX_abort         ( TX_abort),
    .TX_empty_n       ( TX_empty_n),
    .TX_data_i        ( TX_data_i),
    .TX_read_n        ( TX_read_n)
  );
  
endmodule
