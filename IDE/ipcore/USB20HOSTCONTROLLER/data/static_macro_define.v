`define getname(oriName,tmodule_name) \~oriName.tmodule_name



//`define SIM

//`define UTMI

`define ULPI 

//`define TEST_MODE 

//`define ISO

`define ISO_DIR 1'b0 

`define ISO_EDP 4'd1  

`define SUSPEND

`define RESUME 

`define LENGTH 15'd64


// TD type 
`define	ITD 2'b00

`define QH 	2'b01

`define SITD 2'b10

`define FSTN 2'b11

// ram offset and allocation 
`define RAM_OFFSET	 32'h00_00_02_00 

`define QH_OFFSET ( `RAM_OFFSET  ) //32'h00_00_02_00

`define QTD_OFFSET	( `QH_OFFSET + 64 * 3 ) //32'h00_00_02_C0
								//C0

`define ITD_OFFSET ( `QTD_OFFSET + 32 * 16  ) //32'h00_00_04_C0
									//200


`define BF_OFFSET ( `ITD_OFFSET	+ 64 * 1  ) //32'h00_00_05_00
									//40

`define FR_LS_PT_OFFSET ( `BF_OFFSET + 2048 ) //32'h00_00_0D_00
									// 800 


`define RAM_BOTTOM ( `FR_LS_PT_OFFSET +  4 * 256 ) // 32'h00_00_11_00
									// 400
									
// 	TD eps
`define HIGH 2'b10

`define FULL 2'b00

`define LOW 2'b01

// TD PID CODE
`define OUT_CODE 2'B00

`define IN_CODE 2'b01

`define SETUP_CODE 2'b10

// TD tranXsplit
`define DS	1'b0

`define DC	1'b1

// TD OUT / PING 
`define DO	1'b0

`define DP 1'b1 



`define ISO_IN							5'd1   				
`define ISO_OUT                         5'd2 
`define ISO_SS_IN                       5'd3 
`define ISO_SC_IN                       5'd4 
`define ISO_SS_OUT                      5'd5 
`define BULK_CTRL_IN                    5'd6 	
`define BULK_CTRL_OUT_SETUP             5'd7 	
`define BULK_CTRL_PING                  5'd8 	
`define BULK_CTRL_SS_IN                 5'd9 	
`define BULK_CTRL_SC_IN                 5'd10	 
`define BULK_CTRL_SS_OUT_SETUP          5'd11	 
`define BULK_CTRL_SC_OUT_SETUP          5'd12 	
`define INT_IN                          5'd13 	
`define INT_OUT                         5'd14 	
`define INT_SS_IN                       5'd15 	
`define INT_SC_IN                       5'd16 	
`define INT_SS_OUT                      5'd17 	
`define INT_SC_OUT                      5'd18 	
`define INI_SOF                         5'd19 	
`define RE_BULK_CTRL_SC_OUT_SETUP       5'd20 
`define RE_BULK_CTRL_SC_IN              5'd21	
`define RE_INT_SC_IN                    5'd22
`define RE_INT_SC_OUT                   5'd23
`define RE_ISO_SC_IN	                5'd25


`define	ITD_DAT 1

`define QH_DAT 	2

`define QTD_DAT  3

`define SITD_DAT 4

`define FSTN_DAT 5

`define FR_LS_PT_DAT 6 

`define DAT 7

`define P_SITD_DAT 8

`define OUT 	4'B0001
`define IN		4'B1001
`define SOF		4'B0101
`define SETUP	4'B1101
`define DATA0 	4'B0011
`define DATA1 	4'B1011
`define DATA2 	4'B0111
`define MDATA 	4'B1111
`define PING 	4'B0100
`define SPLIT	4'B1000


`define ACK 	4'B0010
`define NAK 	4'B1010
`define STALL 	4'B1110
`define NYET 	4'B0110
`define ERR		4'B1100

`define ALL 	2'B00
`define BEG		2'B01
`define MID		2'B10
`define END		2'B11



/*
parameter
	HALT			  =  6'd0  ,
	IDLE              =  6'd1  ,
	TX_SOF            =  6'd2  ,
	CK_P_STA          =  6'd3  ,
	RD_FR_LS_PT       =  6'd4  ,
	CK_A_STA          =  6'd5  ,
	RD_QH             =  6'd6  ,
	PARSE_QH		  =	 6'd7  ,	
	FL_QH_H_PT		  =	 6'd8  ,
	RD_N_QTD          =	 6'd9  ,
	RL_NAK_CNT1       =	 6'd10 ,
	RL_NAK_CNT2       =	 6'd11 ,
	RL_QH_TXN_CNT     =	 6'd12 ,
	INI_QH_TXN        =	 6'd13 ,
	RD_QTD_DATA		  =  6'd14 ,
	WR_QTD_DATA		  =	 6'd15 ,
	ADV_QTD			  =	 6'd16 ,
	WR_BACK_OVERLAY   =  6'd17 ,
	RETIRE_QTD		  =  6'd18 ,
	RD_ITD			  =  6'd19 ,
	RD_FSTN           =  6'd20 ,
	ADJ_C_QTD_PT	  =  6'd21 ,
	OVERLAY			  =  6'd22 ,
	PREP_INTER_TXN 	  =  6'd23 ,
	MULT_CK			  =  6'd24 ,
	RD_SITD			  =  6'd25 ,
	REBAL_P			  =  6'd26 ,
	PARSE_ITD		  =  6'd27 ,
	FL_ITD_L_PT		  =  6'd28 ,
	INI_ITD_TXN		  =  6'd29 ,
	RD_ITD_DATA		  =  6'd30 ,
	ADV_ITD			  =  6'd31 ,
	WR_ITD_DATA 	  =  6'd32 ,
	WR_BACK_ITD		  =  6'd33 ,
	PARSE_SITD		  =  6'd35 ,
	RD_PREV_SITD	  =  6'd36 ,
	RD_SITD_DATA	  =  6'd37 ,
	INI_SITD_TXN	  =  6'd38 ,
	WR_SITD_DATA	  =  6'd39 ,
	ADV_SITD		  =  6'd40 ,
	WR_BACK_PREV_SITD =  6'd41 ,
	WR_BACK_SITD	  =  6'd42 ,
	FL_SITD_L_PT	  =  6'd43 ;
	
	WT_DB 	= 0 ,
	WT_QH1  = 1 ,
	WT_QH2  = 2 ,
	SET_STS  = 3 ,
	CLR_CMD = 4 ;	
	
	EHCI_OWNER	= 0 ,
	PT_RST      = 1 ,
	PT_EN       = 2 ,
	PT_SPND     = 3 ,
	PT_RES      = 4 ,
	CHC_OWNER   = 5 ,
	TX_SE0 		= 6	,
	TX_J        = 7 ,
	TX_K        = 8 ,
	TM_K		= 9 ,
	WT_SE0		= 10 ;

parameter
	IDLE 		= 0  ,
	INI_TXN		= 1  ,
	WT		 	= 2  ,
	TXN_DONE	= 3  ;

parameter 
	WT_LS_H 	= 'd0	,
	DO_RL       = 'd1   ,
	WT_S_EVENT  = 'd2   ;

// traversing state machine 
parameter 
	TRA_A_SCHED = 'd3 ,
	TRA_P_SCHED = 'D4 ;	



localparam STATE_IDLE       = 4'd0;
localparam STATE_RX_DATA    = 4'd1;
localparam STATE_TX_PID     = 4'd2;
localparam STATE_TX_DATA    = 4'd3;
localparam STATE_TX_CRC1    = 4'd4;
localparam STATE_TX_CRC2    = 4'd5;
localparam STATE_TX_TOKEN1  = 4'd6;
localparam STATE_TX_TOKEN2  = 4'd7;
localparam STATE_TX_TOKEN3  = 4'd8;
localparam STATE_TX_ACKNAK  = 4'd9;
localparam STATE_TX_WAIT    = 4'd10;
localparam STATE_RX_WAIT    = 4'd11;
localparam STATE_TX_IFS     = 4'd12;


parameter 
	N_ACTIVE =  0	,	
	ACTIVE   =  1	,
	SLEEP    =  2	;
	
parameter 
	IDLE		 = 'd0	,
	READING      = 'd1	,
	PREP_WR		 = 'd2	,
	WRITING      = 'd3	,
	PREP_RD      = 'D4	;
	
	memory allocation





 32'h00_00_00_00 --QH offset

 30 QH 64 bytes each  ( 48 bytes each QH)

 32'h00_00_07_80 --qTD offset

 40 qTD	32bytes each ( 32 bytes each qTD )

 32'h00_00_0C_80  -- ITD offset

 20 iTD  64 bytes each ( 64 bytes each iTD )

 32'h00_00_11_80 -- SITD offset 

 20 siTD 32 Bytes each ( 28 bytes each siTD )

 32'h00_00_14_00 --FSTN offset

 10 fstn 32bytes each ( 8 bytes each FSTN)

 32'h00_00_15_40 -- 

 32'h00_00_20_00 -- DATA buffer offset

 10 buffer 4K bytes each

 32'h00_00_80_00  frame list pointer offset 
 
 16 pointers 4 bytes each
 
 
 


*/