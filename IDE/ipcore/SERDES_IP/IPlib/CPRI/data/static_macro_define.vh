`ifndef STATIC_MACRO_VH
`define STATIC_MACRO_VH

`define getname(oriName,tmodule_name) \~oriName.tmodule_name 

`endif


///Only For Simulation
//`define  MODELSIM_EN
///cpri ip rtl parameter
`define MAX_PACKET_NUM 4 
`define IQ_REQ_LATENCY 1
`define FIXD_LINE_RATE
//`define USER_HDLC_RATE_OFF
//`define LOOPBACK_OFF

`ifdef    ETH_GMII 
`define   ETH_GMII_ENABLE  1   
`define   ETH_CLK_PERIOD  8    
`endif

`ifdef    ETH_MII 
`define   ETH_GMII_ENABLE  0   
`define   ETH_CLK_PERIOD  40    
`endif

`ifdef    LINE_RATE_3GBPS_AND_UNDER 
`define   DATA_PATH_WIDTH  16     
`define   VENDOR_CW_WIDTH  40     
`define   SLOT_NUM_WIDTH   6     
`endif

`ifdef    LINE_RATE_6GBPS_AND_UNDER 
`define   DATA_PATH_WIDTH  32     
`define   VENDOR_CW_WIDTH  80     
`define   SLOT_NUM_WIDTH   6     
`endif

`ifdef    LINE_RATE_9GBPS_AND_UNDER_32B 
`define   DATA_PATH_WIDTH  32     
`define   VENDOR_CW_WIDTH  128     
`define   SLOT_NUM_WIDTH   6     
`endif

`ifdef    LINE_RATE_9GBPS_AND_UNDER_64B 
`define   LINE_RATE_9GBPS_64B_EN
`define   DATA_PATH_WIDTH  64     
`define   VENDOR_CW_WIDTH  128     
`define   SLOT_NUM_WIDTH   6     
`endif

`ifdef    LINE_RATE_10GBPS_AND_UNDER 
`define   LINE_RATE_9GBPS_64B_EN
`define   gearbox_64b66b
`define   DATA_PATH_WIDTH  64     
`define   VENDOR_CW_WIDTH  128     
`define   SLOT_NUM_WIDTH   7     
`endif

`ifdef    LINE_RATE_12GBPS_AND_UNDER 
`define   LINE_RATE_9GBPS_64B_EN
`define   gearbox_64b66b
`define   DATA_PATH_WIDTH  64     
`define   VENDOR_CW_WIDTH  128     
`define   SLOT_NUM_WIDTH   7     
`endif