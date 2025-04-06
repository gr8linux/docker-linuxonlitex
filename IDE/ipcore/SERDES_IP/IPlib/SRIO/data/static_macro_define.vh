`ifndef STATIC_MACRO_VH
`define STATIC_MACRO_VH

`define getname(oriName,tmodule_name) \~oriName.tmodule_name 

`endif

//Only For Simulation
//`define  MODELSIM_EN
//`define  C_SIM 
`define  DEVICEREVCAR 32'h20000

//"distributed_ram"
//"block_ram"
//"registers"
`define  RX_MAINTS_RAM_STYLE "block_ram"
`define  TX_BUF_ACKID_RAM_STYLE "block_ram"
`define  TX_MAINTS_RAM_STYLE "block_ram"
`define  TX_BUF_DELAY_RAM_STYLE "registers"
`define  TX_BUF_FIFO_RAM_STYLE "block_ram"

`define DEST_WRITE_EN
`define DEST_DOORBELL_EN
`define DEST_SWRITE_EN
`define DEST_ATOMIC_EN
`define DEST_READ_EN
`define DEST_MESSAGE_EN
`define DEST_NWRITE_EN

`define SOURCE_WRITE_EN
`define SOURCE_DOORBELL_EN
`define SOURCE_SWRITE_EN
`define SOURCE_ATOMIC_EN
`define SOURCE_READ_EN
`define SOURCE_MESSAGE_EN
`define SOURCE_NWRITE_EN

`define MAINTENANCE_EN
