`define  ID_WIDTH 4                                    //C_S_AXI_ID_WIDTH 
`define  ADDR_WIDTH 8                                  //C_S_AXI_ADDR_WIDTH
`define  LITE_DWIDTH 32                                //Data width by AXI4-Lite protocol
`define  LEN_MEM_DEPTH 16                               //Data depth need to be stored

`define MODULE_NAME AXI_Stream_FIFO_Top
`define getname(oriName,tmodule_name) \~oriName.tmodule_name


//原parameter
`define DSIZE 32

/* Choose different implementation: default is EBR_BASED */      
       `define     EBR_BASED
/* Specify that registers are used for the output data. There is no change to the flag logic */

/* Select to include an almost empty flag */
      `define     Al_Empty_Flag
      `define     Empty_S_Dual_Th

/* Select to include an almost full flag */
      `define     Al_Full_Flag
      `define     Full_S_Dual_Th

/* Enables the data count output */
      `define     Count_W //Synchronized with  Clk      
