/*
    Name    :"AXI-Stream FIFO".
    Source  :Written by GowinSynthesis.
    Date    :06/14/2023

    Application:Allows memory mapped access to a AXI4-Stream interface.

    Features:
        1)32bit axi4-lite slave interface;
        2)Axi4-full/lite data interface type can be config;
        3)Configurable 32/64/128/256/512b AXI4-Stream data interface,"Slaver supports 32bit/64bit only for this design";
        4)Independently internal TX and RX data FIFOs(32/64 DATA in,32/64 DATA out);
        5)Full duplex operation;
        6)Supports AXI Ethernet basic mode;
        7)Provides interrupts for error and status conditions;
        8)TX and RX cut-through mode;
        9)a.When AXI4-Lite is selected, register access and FIFO accesses are handled by the AXI4-Lite interface. 
          b.When AXI4-full is selected, register access is handled by AXI4-Lite interface and FIFO accesses are handled by AXI4 interface.

        10)a.For AXI4 Lite Ports: For Strb every byte is valid,that is Strb's every bit is 'b1.
           b.For Stream Ports: For Strb,every byte is valid,that is Strb's every bit is 'b1.
                               Nonsupport Transmit Control.
                               Nonsupport ID,DESET,USER,KEEP.
           c.For AXI4 Ports: For Strb,every byte is valid,that is Strb's every bit is 'b1.
                             Nonsupport ID.
                             Nonsupport Data Width of 128bit,256bit,512bit

    component and module:
  ____________________________________________________________________________________________________________________________________________________________________________________________________
 |                          _______________________________________________________________________________________________________________________________________                                   |
 |                         |       _________________________                                              AXI4 stream fifo                                        |                                   |
 |                         |      |  AXI4_LITE interface    |                ___________                                                                          |                                   |
 |                         |      |       _______           | ------------->| REG space |                                                                         |                                   |
 | AXI4_lite   <----------------->|      |       |          |                ----------                                                                           |                                   |
 |  interface              |      |      | slave |          |       _________________        ___________________________________                                  |                                   |
 |                         |      |      |_______|          |      | AXI4-LITE_Tdata |      |                                   |                                 |                                   |
 |                         |      |      ____________       |  ---------------------------->|                                   |                                 |                                   |
 |                         |      |     | interrupt  |      |     _________________         |               _______             |                                 |                                   |
 |                         |      |     | controller |      |    | AXI4-LITE_Rdata |        |  Tdata_sel   |       | Transmit   |      __________________         |                                   |
 |                         |      |      ------------       | <-----------------------------|  ----------> | Tfifo | ---------->| --->| Transmit Control |------------->AXI4_stream_TXD interface     |
 |                         |      |_________________________|                               |              |_______|            |      ------------------         |                                   |
 |                         |                                                                |                                   |                                 |                                   |
 |                         |        ________________________                                |                                   |                                 |                                   |
 |                         |       |                         |        _________________     |              _______              |                                 |                                   |
 |                         |       |    AXI4_FULL interface  |       | AXI4-FULL_Rdata |    |  Rdata_sel  |       | Recveive    |      __________________         |                                   |
 |                         |       |       _______           |   <--------------------------|  <----------| Rfifo | <---------- | <---| Receive Control  |<--------------AXI4_stream_RXD interface    |  
 |     AXI4  <-------------------->|      |       |          |      _________________       |             |_______|             |      ------------------         |                                   |
 |  interface              |       |      | slave |          |     | AXI4-FULL_Tdata |      |                                   |                                 |                                   |
 |                         |       |      |_______|          |  --------------------------->|                                   |                                 |                                   |
 |                         |       |_________________________|                              |___________________________________|                                 |                                   |
 |                         |______________________________________________________________________________________________________________________________________|                                   |
 |____________________________________________________________________________________________________________________________________________________________________________________________________| 
*/  

`timescale 1ns / 1ns
`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME
//module AXI_Stream_FIFO_Top
    #(
    parameter  AXI4_FULL_LITE_SEL          = `PROTOCOL                 ,
    parameter  TX_SF_CT_MODE_SEL           = `TX_MODE                  ,
    parameter  RX_SF_CT_MODE_SEL           = `RX_MODE                  ,
    parameter  C_S_AXI_ID_WIDTH            = `ID_WIDTH                 ,
    parameter  C_S_AXI_DATA_WIDTH          = `LITE_DWIDTH              ,
    parameter  C_S_AXI4_DATA_WIDTH         = `FULL_DWIDTH              ,
    parameter  C_S_AXI_ADDR_WIDTH          = `ADDR_WIDTH               ,
    parameter  AXI4DATA_BIT_NUM_SEL        = `AXI4_DSEL                
    )
    (
    input   wire                                        S_axi_aclk                      ,       
    input   wire                                        S_axi_aresetn                   ,   
                                                                                        
    input   wire[C_S_AXI_ADDR_WIDTH-1:0]                S_axi_araddr                    ,
    output  wire                                        S_axi_arready                   ,
    input   wire                                        S_axi_arvalid                   ,
                                                                                        
    input   wire[C_S_AXI_ADDR_WIDTH-1:0]                S_axi_awaddr                    ,
    output  wire                                        S_axi_awready                   ,
    input   wire                                        S_axi_awvalid                   ,
                                                                                        
    input   wire                                        S_axi_bready                    ,
    output  wire[1:0]                                   S_axi_bresp                     ,
    output  wire                                        S_axi_bvalid                    ,
                                                                                        
    output  wire[C_S_AXI_DATA_WIDTH-1:0]                S_axi_rdata                     ,
    input   wire                                        S_axi_rready                    ,
    output  wire[1:0]                                   S_axi_rresp                     ,                        
    output  wire                                        S_axi_rvalid                    ,
                                                                                        
    input   wire[C_S_AXI_DATA_WIDTH-1:0]                S_axi_wdata                     ,
    output  wire                                        S_axi_wready                    ,
    input   wire[C_S_AXI_DATA_WIDTH/8-1:0]              S_axi_wstrb                     ,       
    input   wire                                        S_axi_wvalid                    ,
                                                                                        
    input   wire[C_S_AXI4_DATA_WIDTH-1:0]               Axi_str_rxd_tdata               ,
    input   wire                                        Axi_str_rxd_tlast               ,
    output  wire                                        Axi_str_rxd_tready              ,
    input   wire                                        Axi_str_rxd_tvalid              ,

    `ifdef AXI4_FULL_PORT                                                                                   
    input   wire[C_S_AXI_ADDR_WIDTH-1:0]                S_axi4_araddr                   ,
    input   wire[1:0]                                   S_axi4_arburst                  ,    
    input   wire[3:0]                                   S_axi4_arcache                  ,                      
    input   wire[C_S_AXI_ID_WIDTH-1:0]                  S_axi4_arid                     ,    
    input   wire[7:0]                                   S_axi4_arlen                    ,
    input   wire                                        S_axi4_arlock                   ,
    input   wire[2:0]                                   S_axi4_arport                   ,
    output  wire                                        S_axi4_arready                  ,
    input   wire[2:0]                                   S_axi4_arsize                   ,    
    input   wire                                        S_axi4_arvalid                  ,
                                                                                        
    input   wire[C_S_AXI_ADDR_WIDTH-1:0]                S_axi4_awaddr                   ,
    input   wire[1:0]                                   S_axi4_awburst                  ,
    input   wire[3:0]                                   S_axi4_awcache                  ,                      
    input   wire[C_S_AXI_ID_WIDTH-1:0]                  S_axi4_awid                     ,
    input   wire[7:0]                                   S_axi4_awlen                    ,
    input   wire                                        S_axi4_awlock                   ,
    input   wire[2:0]                                   S_axi4_awport                   ,
    output  wire                                        S_axi4_awready                  ,
    input   wire[2:0]                                   S_axi4_awsize                   ,
    input   wire                                        S_axi4_awvalid                  ,
                                                                                        
    output  wire[C_S_AXI_ID_WIDTH-1:0]                  S_axi4_bid                      ,
    input   wire                                        S_axi4_bready                   ,
    output  wire[1:0]                                   S_axi4_bresp                    ,
    output  wire                                        S_axi4_bvalid                   ,
                                                                                        
    output  wire[C_S_AXI4_DATA_WIDTH-1:0]               S_axi4_rdata                    ,
    output  wire[C_S_AXI_ID_WIDTH-1:0]                  S_axi4_rid                      ,
    output  wire                                        S_axi4_rlast                    ,
    input   wire                                        S_axi4_rready                   ,
    output  wire[1:0]                                   S_axi4_rresp                    ,
    output  wire                                        S_axi4_rvalid                   ,
                                                                                        
    input   wire[C_S_AXI4_DATA_WIDTH-1:0]               S_axi4_wdata                    ,
    input   wire                                        S_axi4_wlast                    ,
    output  wire                                        S_axi4_wready                   ,
    input   wire[C_S_AXI4_DATA_WIDTH/8-1:0]             S_axi4_wstrb                    ,
    input   wire                                        S_axi4_wvalid                   ,
    `endif                                                                                 
    output  wire[C_S_AXI4_DATA_WIDTH-1:0]               Axi_str_txd_tdata               ,
    output  wire                                        Axi_str_txd_tlast               ,
    input   wire                                        Axi_str_txd_tready              ,
    output  wire                                        Axi_str_txd_tvalid              ,
                                                                                        
    output  wire[C_S_AXI4_DATA_WIDTH-1:0]               Axi_str_txc_tdata               ,
    output  wire                                        Axi_str_txc_tlast               ,
    input   wire                                        Axi_str_txc_tready              ,
    output  wire                                        Axi_str_txc_tvalid              ,
                                                                                        
    output  wire                                        Interrupt                       ,
    output  wire                                        Mm2s_prmry_reset_out_n          ,
    output  wire                                        Mm2s_cntrl_reset_out_n          ,
    output  wire                                        S2mm_prmry_reset_out_n          
    );

    `getname(AXI_Stream_FIFO,`MODULE_NAME) #(
    .AXI4_FULL_LITE_SEL          ( `PROTOCOL                 ),
    .TX_SF_CT_MODE_SEL           ( `TX_MODE                  ),
    .RX_SF_CT_MODE_SEL           ( `RX_MODE                  ),
    .C_S_AXI_ID_WIDTH            ( `ID_WIDTH                 ),
    .C_S_AXI_DATA_WIDTH          ( `LITE_DWIDTH              ),
    .C_S_AXI4_DATA_WIDTH         ( `FULL_DWIDTH              ),
    .C_S_AXI_ADDR_WIDTH          ( `ADDR_WIDTH               ),
    .AXI4DATA_BIT_NUM_SEL        ( `AXI4_DSEL                ),
    .TLR_RLR_DEPTH               ( `LEN_MEM_DEPTH            )
    )AXI_Stream_FIFO_inst (
    .S_axi_aclk             (S_axi_aclk            )  ,       
    .S_axi_aresetn          (S_axi_aresetn         )  ,
    .S_axi_araddr           (S_axi_araddr          )  ,
    .S_axi_arready          (S_axi_arready         )  ,
    .S_axi_arvalid          (S_axi_arvalid         )  ,
    .S_axi_awaddr           (S_axi_awaddr          )  ,
    .S_axi_awready          (S_axi_awready         )  ,
    .S_axi_awvalid          (S_axi_awvalid         )  ,
    .S_axi_bready           (S_axi_bready          )  ,
    .S_axi_bresp            (S_axi_bresp           )  ,
    .S_axi_bvalid           (S_axi_bvalid          )  ,
    .S_axi_rdata            (S_axi_rdata           )  ,
    .S_axi_rready           (S_axi_rready          )  ,
    .S_axi_rresp            (S_axi_rresp           )  ,                        
    .S_axi_rvalid           (S_axi_rvalid          )  ,
    .S_axi_wdata            (S_axi_wdata           )  ,
    .S_axi_wready           (S_axi_wready          )  ,
    .S_axi_wstrb            (S_axi_wstrb           )  ,       
    .S_axi_wvalid           (S_axi_wvalid          )  ,
    .Axi_str_rxd_tdata      (Axi_str_rxd_tdata     )  ,
    .Axi_str_rxd_tlast      (Axi_str_rxd_tlast     )  ,
    .Axi_str_rxd_tready     (Axi_str_rxd_tready    )  ,
    .Axi_str_rxd_tvalid     (Axi_str_rxd_tvalid    )  ,
    `ifdef AXI4_FULL_PORT
    .S_axi4_araddr          (S_axi4_araddr         )  ,
    .S_axi4_arburst         (S_axi4_arburst        )  ,    
    .S_axi4_arcache         (S_axi4_arcache        )  ,                      
    .S_axi4_arid            (S_axi4_arid           )  ,    
    .S_axi4_arlen           (S_axi4_arlen          )  ,
    .S_axi4_arlock          (S_axi4_arlock         )  ,
    .S_axi4_arport          (S_axi4_arport         )  ,
    .S_axi4_arready         (S_axi4_arready        )  ,
    .S_axi4_arsize          (S_axi4_arsize         )  ,    
    .S_axi4_arvalid         (S_axi4_arvalid        )  ,
    .S_axi4_awaddr          (S_axi4_awaddr         )  ,
    .S_axi4_awburst         (S_axi4_awburst        )  ,
    .S_axi4_awcache         (S_axi4_awcache        )  ,                      
    .S_axi4_awid            (S_axi4_awid           )  ,
    .S_axi4_awlen           (S_axi4_awlen          )  ,
    .S_axi4_awlock          (S_axi4_awlock         )  ,
    .S_axi4_awport          (S_axi4_awport         )  ,
    .S_axi4_awready         (S_axi4_awready        )  ,
    .S_axi4_awsize          (S_axi4_awsize         )  ,
    .S_axi4_awvalid         (S_axi4_awvalid        )  ,
    .S_axi4_bid             (S_axi4_bid            )  ,
    .S_axi4_bready          (S_axi4_bready         )  ,
    .S_axi4_bresp           (S_axi4_bresp          )  ,
    .S_axi4_bvalid          (S_axi4_bvalid         )  ,
    .S_axi4_rdata           (S_axi4_rdata          )  ,
    .S_axi4_rid             (S_axi4_rid            )  ,
    .S_axi4_rlast           (S_axi4_rlast          )  ,
    .S_axi4_rready          (S_axi4_rready         )  ,
    .S_axi4_rresp           (S_axi4_rresp          )  ,
    .S_axi4_rvalid          (S_axi4_rvalid         )  ,
    .S_axi4_wdata           (S_axi4_wdata          )  ,
    .S_axi4_wlast           (S_axi4_wlast          )  ,
    .S_axi4_wready          (S_axi4_wready         )  ,
    .S_axi4_wstrb           (S_axi4_wstrb          )  ,
    .S_axi4_wvalid          (S_axi4_wvalid         )  ,
    `endif
    .Axi_str_txd_tdata      (Axi_str_txd_tdata     )  ,
    .Axi_str_txd_tlast      (Axi_str_txd_tlast     )  ,
    .Axi_str_txd_tready     (Axi_str_txd_tready    )  ,
    .Axi_str_txd_tvalid     (Axi_str_txd_tvalid    )  ,
    .Axi_str_txc_tdata      (Axi_str_txc_tdata     )  ,
    .Axi_str_txc_tlast      (Axi_str_txc_tlast     )  ,
    .Axi_str_txc_tready     (Axi_str_txc_tready    )  ,
    .Axi_str_txc_tvalid     (Axi_str_txc_tvalid    )  ,
    .Interrupt              (Interrupt             )  ,
    .Mm2s_prmry_reset_out_n (Mm2s_prmry_reset_out_n)  ,                
    .Mm2s_cntrl_reset_out_n (Mm2s_cntrl_reset_out_n)  ,                
    .S2mm_prmry_reset_out_n (S2mm_prmry_reset_out_n)      
    );
endmodule