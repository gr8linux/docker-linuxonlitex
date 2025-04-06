`define getname(oriName,tmodule_name) \~oriName.tmodule_name
`ifdef DATA_LANE4
	`define HS_DATA0
	`define HS_DATA1
	`define HS_DATA2
	`define HS_DATA3
    `define LW 4
    `define SYNC_EN
`elsif DATA_LANE2
	`define HS_DATA0
	`define HS_DATA1
    `define LW 2
    `define SYNC_EN
`else 
	`define HS_DATA0
    `define LW 1
    `define SYNC_EN
`endif
`ifdef DES_NON_CONT_CLK
	`define CROSS_FIFO
`endif