
`resetall

`include "ahb_option_defs.v"

module Gowin_EMPU_M1_Top (
  LOCKUP,
  HALTED,
  //External Interrupt
`ifdef GOWIN_EXTINT_SUPPORT
  EXTINT,
`endif
  //GPIO
`ifdef GOWIN_GPIO_SUPPORT
  `ifdef GPIO_IOBUF_EN
  //IOBUF IF
  GPIO,
  `else
  //I/O/E IF
  GPIOIN,
  GPIOOUT,
  GPIOOUTEN,
  `endif
`endif
  //Debug Access Port
  JTAG_7,   //tms   |       swdio
  JTAG_9,   //tck   |       swclk
`ifdef DEBUG_PORT_JTAG
  JTAG_3,   //trstn
  JTAG_4,   //NC
  JTAG_5,   //tdi
  JTAG_6,   //NC
  JTAG_8,   //extFlash_sspi2_sio3/holdn
  JTAG_10,  //extFlash_spi2_mosi/sio1
  JTAG_11,  //NC    |       
  JTAG_12,  //extFlash_spi2_sclk
  JTAG_13,  //tdo   |       swo
  JTAG_14,  //extFlash_spi2_miso/sio0
  JTAG_15,  //srstn
  JTAG_16,  //extFlash_spi2_cs
  JTAG_17,  //NC
  JTAG_18,  //extFlash_sspi2_sio2/WPn
`endif
  //UART0
`ifdef GOWIN_UART0_SUPPORT
  UART0RXD,
  UART0TXD,
`endif
  //UART1
`ifdef GOWIN_UART1_SUPPORT
  UART1RXD,
  UART1TXD,
`endif
  //Timer0
`ifdef GOWIN_TIMER0_SUPPORT
  TIMER0EXTIN,
`endif
  //Timer1
`ifdef GOWIN_TIMER1_SUPPORT
  TIMER1EXTIN,
`endif
  //APB Master [1]
`ifdef GOWIN_APB1_SUPPORT
  APB1PADDR,     // APB Address
  APB1PENABLE,   // APB Enable
  APB1PWRITE,    // APB Write
  APB1PSTRB,     // APB Byte Strobe
  APB1PPROT,     // APB Prot
  APB1PWDATA,    // APB write data
  APB1PSEL,      // APB Select
  APB1PRDATA,    // Read data for each APB slave
  APB1PREADY,    // Ready for each APB slave
  APB1PSLVERR,   // Error state for each APB slave
  APB1PCLK,      // Clock
  APB1PRESET,    // Reset
`endif
  //APB Master [2]
`ifdef GOWIN_APB2_SUPPORT
  APB2PADDR,     // APB Address
  APB2PENABLE,   // APB Enable
  APB2PWRITE,    // APB Write
  APB2PSTRB,     // APB Byte Strobe
  APB2PPROT,     // APB Prot
  APB2PWDATA,    // APB write data
  APB2PSEL,      // APB Select
  APB2PRDATA,    // Read data for each APB slave
  APB2PREADY,    // Ready for each APB slave
  APB2PSLVERR,   // Error state for each APB slave
  APB2PCLK,      // Clock
  APB2PRESET,    // Reset
`endif
  //APB Master [3]
`ifdef GOWIN_APB3_SUPPORT
  APB3PADDR,     // APB Address
  APB3PENABLE,   // APB Enable
  APB3PWRITE,    // APB Write
  APB3PSTRB,     // APB Byte Strobe
  APB3PPROT,     // APB Prot
  APB3PWDATA,    // APB write data
  APB3PSEL,      // APB Select
  APB3PRDATA,    // Read data for each APB slave
  APB3PREADY,    // Ready for each APB slave
  APB3PSLVERR,   // Error state for each APB slave
  APB3PCLK,      // Clock
  APB3PRESET,    // Reset
`endif
  //APB Master [4]
`ifdef GOWIN_APB4_SUPPORT
  APB4PADDR,     // APB Address
  APB4PENABLE,   // APB Enable
  APB4PWRITE,    // APB Write
  APB4PSTRB,     // APB Byte Strobe
  APB4PPROT,     // APB Prot
  APB4PWDATA,    // APB write data
  APB4PSEL,      // APB Select
  APB4PRDATA,    // Read data for each APB slave
  APB4PREADY,    // Ready for each APB slave
  APB4PSLVERR,   // Error state for each APB slave
  APB4PCLK,      // Clock
  APB4PRESET,    // Reset
`endif
  //APB Master [5]
`ifdef GOWIN_APB5_SUPPORT
  APB5PADDR,     // APB Address
  APB5PENABLE,   // APB Enable
  APB5PWRITE,    // APB Write
  APB5PSTRB,     // APB Byte Strobe
  APB5PPROT,     // APB Prot
  APB5PWDATA,    // APB write data
  APB5PSEL,      // APB Select
  APB5PRDATA,    // Read data for each APB slave
  APB5PREADY,    // Ready for each APB slave
  APB5PSLVERR,   // Error state for each APB slave
  APB5PCLK,      // Clock
  APB5PRESET,    // Reset
`endif
  //APB Master [6]
`ifdef GOWIN_APB6_SUPPORT
  APB6PADDR,     // APB Address
  APB6PENABLE,   // APB Enable
  APB6PWRITE,    // APB Write
  APB6PSTRB,     // APB Byte Strobe
  APB6PPROT,     // APB Prot
  APB6PWDATA,    // APB write data
  APB6PSEL,      // APB Select
  APB6PRDATA,    // Read data for each APB slave
  APB6PREADY,    // Ready for each APB slave
  APB6PSLVERR,   // Error state for each APB slave
  APB6PCLK,      // Clock
  APB6PRESET,    // Reset
`endif
  //APB Master [7]
`ifdef GOWIN_APB7_SUPPORT
  APB7PADDR,     // APB Address
  APB7PENABLE,   // APB Enable
  APB7PWRITE,    // APB Write
  APB7PSTRB,     // APB Byte Strobe
  APB7PPROT,     // APB Prot
  APB7PWDATA,    // APB write data
  APB7PSEL,      // APB Select
  APB7PRDATA,    // Read data for each APB slave
  APB7PREADY,    // Ready for each APB slave
  APB7PSLVERR,   // Error state for each APB slave
  APB7PCLK,      // Clock
  APB7PRESET,    // Reset
`endif
  //APB Master [8]
`ifdef GOWIN_APB8_SUPPORT
  APB8PADDR,     // APB Address
  APB8PENABLE,   // APB Enable
  APB8PWRITE,    // APB Write
  APB8PSTRB,     // APB Byte Strobe
  APB8PPROT,     // APB Prot
  APB8PWDATA,    // APB write data
  APB8PSEL,      // APB Select
  APB8PRDATA,    // Read data for each APB slave
  APB8PREADY,    // Ready for each APB slave
  APB8PSLVERR,   // Error state for each APB slave
  APB8PCLK,      // Clock
  APB8PRESET,    // Reset
`endif
  //APB Master [9]
`ifdef GOWIN_APB9_SUPPORT
  APB9PADDR,     // APB Address
  APB9PENABLE,   // APB Enable
  APB9PWRITE,    // APB Write
  APB9PSTRB,     // APB Byte Strobe
  APB9PPROT,     // APB Prot
  APB9PWDATA,    // APB write data
  APB9PSEL,      // APB Select
  APB9PRDATA,    // Read data for each APB slave
  APB9PREADY,    // Ready for each APB slave
  APB9PSLVERR,   // Error state for each APB slave
  APB9PCLK,      // Clock
  APB9PRESET,    // Reset
`endif
  //APB Master [10]
`ifdef GOWIN_APB10_SUPPORT
  APB10PADDR,     // APB Address
  APB10PENABLE,   // APB Enable
  APB10PWRITE,    // APB Write
  APB10PSTRB,     // APB Byte Strobe
  APB10PPROT,     // APB Prot
  APB10PWDATA,    // APB write data
  APB10PSEL,      // APB Select
  APB10PRDATA,    // Read data for each APB slave
  APB10PREADY,    // Ready for each APB slave
  APB10PSLVERR,   // Error state for each APB slave
  APB10PCLK,      // Clock
  APB10PRESET,    // Reset
`endif
  //APB Master [11]
`ifdef GOWIN_APB11_SUPPORT
  APB11PADDR,     // APB Address
  APB11PENABLE,   // APB Enable
  APB11PWRITE,    // APB Write
  APB11PSTRB,     // APB Byte Strobe
  APB11PPROT,     // APB Prot
  APB11PWDATA,    // APB write data
  APB11PSEL,      // APB Select
  APB11PRDATA,    // Read data for each APB slave
  APB11PREADY,    // Ready for each APB slave
  APB11PSLVERR,   // Error state for each APB slave
  APB11PCLK,      // Clock
  APB11PRESET,    // Reset
`endif
  //APB Master [12]
`ifdef GOWIN_APB12_SUPPORT
  APB12PADDR,     // APB Address
  APB12PENABLE,   // APB Enable
  APB12PWRITE,    // APB Write
  APB12PSTRB,     // APB Byte Strobe
  APB12PPROT,     // APB Prot
  APB12PWDATA,    // APB write data
  APB12PSEL,      // APB Select
  APB12PRDATA,    // Read data for each APB slave
  APB12PREADY,    // Ready for each APB slave
  APB12PSLVERR,   // Error state for each APB slave
  APB12PCLK,      // Clock
  APB12PRESET,    // Reset
`endif
  //APB Master [13]
`ifdef GOWIN_APB13_SUPPORT
  APB13PADDR,     // APB Address
  APB13PENABLE,   // APB Enable
  APB13PWRITE,    // APB Write
  APB13PSTRB,     // APB Byte Strobe
  APB13PPROT,     // APB Prot
  APB13PWDATA,    // APB write data
  APB13PSEL,      // APB Select
  APB13PRDATA,    // Read data for each APB slave
  APB13PREADY,    // Ready for each APB slave
  APB13PSLVERR,   // Error state for each APB slave
  APB13PCLK,      // Clock
  APB13PRESET,    // Reset
`endif
  //APB Master [14]
`ifdef GOWIN_APB14_SUPPORT
  APB14PADDR,     // APB Address
  APB14PENABLE,   // APB Enable
  APB14PWRITE,    // APB Write
  APB14PSTRB,     // APB Byte Strobe
  APB14PPROT,     // APB Prot
  APB14PWDATA,    // APB write data
  APB14PSEL,      // APB Select
  APB14PRDATA,    // Read data for each APB slave
  APB14PREADY,    // Ready for each APB slave
  APB14PSLVERR,   // Error state for each APB slave
  APB14PCLK,      // Clock
  APB14PRESET,    // Reset
`endif
  //APB Master [15]
`ifdef GOWIN_APB15_SUPPORT
  APB15PADDR,     // APB Address
  APB15PENABLE,   // APB Enable
  APB15PWRITE,    // APB Write
  APB15PSTRB,     // APB Byte Strobe
  APB15PPROT,     // APB Prot
  APB15PWDATA,    // APB write data
  APB15PSEL,      // APB Select
  APB15PRDATA,    // Read data for each APB slave
  APB15PREADY,    // Ready for each APB slave
  APB15PSLVERR,   // Error state for each APB slave
  APB15PCLK,      // Clock
  APB15PRESET,    // Reset
`endif
  //APB Master [16]
`ifdef GOWIN_APB16_SUPPORT
  APB16PADDR,     // APB Address
  APB16PENABLE,   // APB Enable
  APB16PWRITE,    // APB Write
  APB16PSTRB,     // APB Byte Strobe
  APB16PPROT,     // APB Prot
  APB16PWDATA,    // APB write data
  APB16PSEL,      // APB Select
  APB16PRDATA,    // Read data for each APB slave
  APB16PREADY,    // Ready for each APB slave
  APB16PSLVERR,   // Error state for each APB slave
  APB16PCLK,      // Clock
  APB16PRESET,    // Reset
`endif
  //AHB Master [1]
`ifdef GOWIN_AHB1_SUPPORT
  AHB1HRDATA,      // Data from slave to master
  AHB1HREADYOUT,   // Slave ready signal
  AHB1HRESP,       // Slave response signal  
  AHB1HTRANS,      // Transfer type
  AHB1HBURST,      // Burst type
  AHB1HPROT,       // Transfer protection bits
  AHB1HSIZE,       // Transfer size
  AHB1HWRITE,      // Transfer direction
  AHB1HREADYMUX,
  AHB1HMASTER,
  AHB1HMASTLOCK,   // Transfer is a locked transfer
  AHB1HADDR,       // Transfer address
  AHB1HWDATA,      // Data from master to slave
  AHB1HSEL,
  AHB1HCLK,
  AHB1HRESET,
`endif
  //AHB Master [2]
`ifdef GOWIN_AHB2_SUPPORT
  AHB2HRDATA,      // Data from slave to master
  AHB2HREADYOUT,   // Slave ready signal
  AHB2HRESP,       // Slave response signal  
  AHB2HTRANS,      // Transfer type
  AHB2HBURST,      // Burst type
  AHB2HPROT,       // Transfer protection bits
  AHB2HSIZE,       // Transfer size
  AHB2HWRITE,      // Transfer direction
  AHB2HREADYMUX,
  AHB2HMASTER,
  AHB2HMASTLOCK,   // Transfer is a locked transfer
  AHB2HADDR,       // Transfer address
  AHB2HWDATA,      // Data from master to slave
  AHB2HSEL,
  AHB2HCLK,
  AHB2HRESET,
`endif
  //AHB Master [3]
`ifdef GOWIN_AHB3_SUPPORT
  AHB3HRDATA,      // Data from slave to master
  AHB3HREADYOUT,   // Slave ready signal
  AHB3HRESP,       // Slave response signal  
  AHB3HTRANS,      // Transfer type
  AHB3HBURST,      // Burst type
  AHB3HPROT,       // Transfer protection bits
  AHB3HSIZE,       // Transfer size
  AHB3HWRITE,      // Transfer direction
  AHB3HREADYMUX,
  AHB3HMASTER,
  AHB3HMASTLOCK,   // Transfer is a locked transfer
  AHB3HADDR,       // Transfer address
  AHB3HWDATA,      // Data from master to slave
  AHB3HSEL,
  AHB3HCLK,
  AHB3HRESET,
`endif
  //AHB Master [4]
`ifdef GOWIN_AHB4_SUPPORT
  AHB4HRDATA,      // Data from slave to master
  AHB4HREADYOUT,   // Slave ready signal
  AHB4HRESP,       // Slave response signal  
  AHB4HTRANS,      // Transfer type
  AHB4HBURST,      // Burst type
  AHB4HPROT,       // Transfer protection bits
  AHB4HSIZE,       // Transfer size
  AHB4HWRITE,      // Transfer direction
  AHB4HREADYMUX,
  AHB4HMASTER,
  AHB4HMASTLOCK,   // Transfer is a locked transfer
  AHB4HADDR,       // Transfer address
  AHB4HWDATA,      // Data from master to slave
  AHB4HSEL,
  AHB4HCLK,
  AHB4HRESET,
`endif
  //AHB Master [5]
`ifdef GOWIN_AHB5_SUPPORT
  AHB5HRDATA,      // Data from slave to master
  AHB5HREADYOUT,   // Slave ready signal
  AHB5HRESP,       // Slave response signal  
  AHB5HTRANS,      // Transfer type
  AHB5HBURST,      // Burst type
  AHB5HPROT,       // Transfer protection bits
  AHB5HSIZE,       // Transfer size
  AHB5HWRITE,      // Transfer direction
  AHB5HREADYMUX,
  AHB5HMASTER,
  AHB5HMASTLOCK,   // Transfer is a locked transfer
  AHB5HADDR,       // Transfer address
  AHB5HWDATA,      // Data from master to slave
  AHB5HSEL,
  AHB5HCLK,
  AHB5HRESET,
`endif
  //AHB Master [6]
`ifdef GOWIN_AHB6_SUPPORT
  AHB6HRDATA,      // Data from slave to master
  AHB6HREADYOUT,   // Slave ready signal
  AHB6HRESP,       // Slave response signal  
  AHB6HTRANS,      // Transfer type
  AHB6HBURST,      // Burst type
  AHB6HPROT,       // Transfer protection bits
  AHB6HSIZE,       // Transfer size
  AHB6HWRITE,      // Transfer direction
  AHB6HREADYMUX,
  AHB6HMASTER,
  AHB6HMASTLOCK,   // Transfer is a locked transfer
  AHB6HADDR,       // Transfer address
  AHB6HWDATA,      // Data from master to slave
  AHB6HSEL,
  AHB6HCLK,
  AHB6HRESET,
`endif
  //External Instruction Memory
`ifdef CM1_EXTERNAL_FLASH_EN
  EXTFLASH0HRDATA,      // Data from slave to master
  EXTFLASH0HREADYOUT,   // Slave ready signal
  EXTFLASH0HRESP,       // Slave response signal  
  EXTFLASH0HTRANS,      // Transfer type
  EXTFLASH0HBURST,      // Burst type
  EXTFLASH0HPROT,       // Transfer protection bits
  EXTFLASH0HSIZE,       // Transfer size
  EXTFLASH0HWRITE,      // Transfer direction
  EXTFLASH0HREADYMUX,
  EXTFLASH0HMASTER,
  EXTFLASH0HMASTLOCK,   // Transfer is a locked transfer
  EXTFLASH0HADDR,       // Transfer address
  EXTFLASH0HWDATA,      // Data from master to slave
  EXTFLASH0HSEL,
  EXTFLASH0HCLK,
  EXTFLASH0HRESET,
`endif
  //External Data Memory
`ifdef CM1_EXTERNAL_SRAM_EN
  EXTSRAM0HRDATA,      // Data from slave to master
  EXTSRAM0HREADYOUT,   // Slave ready signal
  EXTSRAM0HRESP,       // Slave response signal  
  EXTSRAM0HTRANS,      // Transfer type
  EXTSRAM0HBURST,      // Burst type
  EXTSRAM0HPROT,       // Transfer protection bits
  EXTSRAM0HSIZE,       // Transfer size
  EXTSRAM0HWRITE,      // Transfer direction
  EXTSRAM0HREADYMUX,
  EXTSRAM0HMASTER,
  EXTSRAM0HMASTLOCK,   // Transfer is a locked transfer
  EXTSRAM0HADDR,       // Transfer address
  EXTSRAM0HWDATA,      // Data from master to slave
  EXTSRAM0HSEL,
  EXTSRAM0HCLK,
  EXTSRAM0HRESET,
`endif
  //RTC
`ifdef GOWIN_RTC_SUPPORT
  RTCSRCCLK,
`endif
  //I2C
`ifdef GOWIN_I2C_SUPPORT
  `ifdef I2C_IOBUF_EN
  //IOBUF IF
  SCL,
  SDA,
  `else
  //I/O/E IF
  SCLIN,
  SCLOUT,
  SCLOUTEN,
  SDAIN,
  SDAOUT,
  SDAOUTEN,
 `endif
`endif
  //SPI
`ifdef GOWIN_SPI_SUPPORT
  MOSI,   // SPI output
  MISO,   // SPI input
  SCLK,   // SPI clock
  NSS,    // SPI select
`endif
  //SD-Card
`ifdef GOWIN_SD_SUPPORT
  SD_SPICLK,
  SD_CLK,
  SD_CS,
  SD_DATAIN,
  SD_DATAOUT,
  SD_CARD_INIT, //0:ok
  SD_CHECKIN,
  SD_CHECKOUT,
`endif
  //CAN
`ifdef GOWIN_CAN_SUPPORT
  CAN_RX,
  CAN_TX,
`endif
  //Ethernet
`ifdef GOWIN_INTERNET_SUPPORT
  //RGMII
  `ifdef RGMII_IF
    RGMII_TXC,
    RGMII_TX_CTL,
    RGMII_TXD,
    RGMII_RXC,
    RGMII_RX_CTL,
    RGMII_RXD,
    GTX_CLK,
  `endif
  //GMII
  `ifdef GMII_IF
    GMII_RX_CLK,
    GMII_RX_DV,
    GMII_RXD,
    GMII_RX_ER,
    GTX_CLK,
    GMII_GTX_CLK,
    GMII_TXD,
    GMII_TX_EN,
    GMII_TX_ER,
  `endif
  //MII
  `ifdef MII_IF
    MII_RX_CLK,
    MII_RXD,
    MII_RX_DV,
    MII_RX_ER,
    MII_TX_CLK,
    MII_TXD,
    MII_TX_EN,
    MII_TX_ER,
    MII_COL,
    MII_CRS,
  `endif
    MDC,
    MDIO,
`endif
  //SPI-Flash
`ifdef GOWIN_SPI_FLASH_SUPPORT
  FLASH_SPI_HOLDN,
  FLASH_SPI_CSN,
  FLASH_SPI_MISO,
  FLASH_SPI_MOSI,
  FLASH_SPI_WPN,
  FLASH_SPI_CLK,
`endif
  //DDR3
`ifdef GOWIN_DDR3_SUPPORT
  DDR_CLK_I,
  `ifndef ARORA_GW2A
  DDR_STOP_O,           //
  `endif
  DDR_MEM_CLK_I,        //
  DDR_LOCK_I,           //
  DDR_RSTN_I,           //
  DDR_INIT_COMPLETE_O,
  DDR_ADDR_O,
  DDR_BA_O,
  DDR_CS_N_O,
  DDR_RAS_N_O,
  DDR_CAS_N_O,
  DDR_WE_N_O,
  DDR_CLK_O,
  DDR_CLK_N_O,
  DDR_CKE_O,
  DDR_ODT_O,
  DDR_RESET_N_O,
  DDR_DQM_O,
  DDR_DQ_IO,
  DDR_DQS_IO,
  DDR_DQS_N_IO,
`endif
  //PSRAM
`ifdef GOWIN_PSRAM_SUPPORT
  O_psram_ck,             //CS_WIDTH=2
  O_psram_ck_n,           //CS_WIDTH=2
  IO_psram_rwds,          //CS_WIDTH=2
  IO_psram_dq,            //DQ_WIDTH=16
  O_psram_reset_n,        //CS_WIDTH=2
  O_psram_cs_n,           //CS_WIDTH=2
  init_calib,             //Initialization done flag
  psram_ref_clk,          //Reference input clock, osc clock from board
  psram_memory_clk,       //Working clock of user input grain
`endif
  HCLK,                   //System Clock
  hwRstn                  //System Reset
); 

//------------------------------------------------------------------------------
// Port declaration
//-------------------------------
  // Debug Access Port
  inout   JTAG_7;   //tms
  inout   JTAG_9;   //tck
`ifdef DEBUG_PORT_JTAG
  inout   JTAG_3;   //trstn
  inout   JTAG_4;   //NC
  inout   JTAG_5;   //tdi
  inout   JTAG_6;   //NC
  inout   JTAG_8;   //extFlash_sspi2_sio3/holdn
  inout   JTAG_10;  //extFlash_spi2_mosi/sio1
  inout   JTAG_11;  //NC RTCK
  inout   JTAG_12;  //extFlash_spi2_sclk
  inout   JTAG_13;  //tdo
  inout   JTAG_14;  //extFlash_spi2_miso/sio0
  inout   JTAG_15;  //srstn
  inout   JTAG_16;  //extFlash_spi2_cs
  inout   JTAG_17;  //NC DBGQ
  inout   JTAG_18;  //extFlash_sspi2_sio2/WPn
`endif
 
  // Clocks and Reset
  input                 HCLK;          // System clock
  input                 hwRstn;        // System reset

  // External Interrupt
`ifdef GOWIN_EXTINT_SUPPORT
  input [3:0]           EXTINT;
`endif

  // RTC
`ifdef GOWIN_RTC_SUPPORT
  input                 RTCSRCCLK;
`endif

  // GPIO 
`ifdef GOWIN_GPIO_SUPPORT
  `ifdef GPIO_IOBUF_EN
  inout [15:0]          GPIO;
  `else
  input  wire [15:0] GPIOIN;
  output wire [15:0] GPIOOUT;
  output wire [15:0] GPIOOUTEN;
  `endif
`endif

  // Misc status signals
  output                LOCKUP;        // Core is in lockup state
  output                HALTED;        // Core is in Halt debug state

  // UART0
`ifdef GOWIN_UART0_SUPPORT
  input                 UART0RXD;
  output                UART0TXD;
`endif

  // UART1
`ifdef GOWIN_UART1_SUPPORT
  input                 UART1RXD;
  output                UART1TXD;
`endif

  // Timer0
`ifdef GOWIN_TIMER0_SUPPORT
  input                 TIMER0EXTIN;
`endif

  // Timer1
`ifdef GOWIN_TIMER1_SUPPORT
  input                 TIMER1EXTIN;
`endif

  // I2C
`ifdef GOWIN_I2C_SUPPORT
  `ifdef I2C_IOBUF_EN
  inout wire SCL;
  inout wire SDA;
  `else
  input  wire SCLIN;
  output wire SCLOUT;
  output wire SCLOUTEN;
  input  wire SDAIN;
  output wire SDAOUT;
  output wire SDAOUTEN;
  `endif
`endif

  // SPI
`ifdef GOWIN_SPI_SUPPORT
  output  wire        MOSI;   // SPI output
  input   wire        MISO;   // SPI input
  output  wire        SCLK;   // SPI clock
  output  wire        NSS;    // SPI select
`endif

  // SD-Card
`ifdef GOWIN_SD_SUPPORT
  input   SD_SPICLK;
  output  SD_CLK;
  output  SD_CS;
  output  SD_DATAOUT;
  input   SD_DATAIN;
  output  SD_CARD_INIT;       //0:ok
  input   SD_CHECKIN;
  output  SD_CHECKOUT;
`endif

  // CAN
`ifdef GOWIN_CAN_SUPPORT
  output wire CAN_TX;
  input  wire CAN_RX;
`endif

  // Ethernet
`ifdef GOWIN_INTERNET_SUPPORT
  // RGMII
  `ifdef RGMII_IF
    output       wire         RGMII_TXC;
    output       wire         RGMII_TX_CTL;
    output  wire [3:0]        RGMII_TXD;
    input        wire         RGMII_RXC;
    input        wire         RGMII_RX_CTL;
    input   wire [3:0]        RGMII_RXD;
    input        wire         GTX_CLK;
  `endif
  // GMII
  `ifdef GMII_IF
    input        wire         GMII_RX_CLK;
    input        wire         GMII_RX_DV;
    input        wire         [7:0] GMII_RXD;
    input        wire         GMII_RX_ER;
    input        wire         GTX_CLK;
    output       wire         GMII_GTX_CLK;
    output       wire         [7:0] GMII_TXD;
    output       wire         GMII_TX_EN;
    output       wire         GMII_TX_ER;
  `endif
  // MII
  `ifdef MII_IF
    input        wire         MII_RX_CLK;
    input        wire         [3:0] MII_RXD;
    input        wire         MII_RX_DV;
    input        wire         MII_RX_ER;
    input        wire         MII_TX_CLK;
    output       wire         [3:0] MII_TXD;
    output       wire         MII_TX_EN;
    output       wire         MII_TX_ER;
    input        wire         MII_COL;
    input        wire         MII_CRS;
  `endif
  output       wire         MDC;
  inout        wire         MDIO;
`endif

  // SPI-Flash
`ifdef GOWIN_SPI_FLASH_SUPPORT
  inout   wire FLASH_SPI_HOLDN;
  inout   wire  FLASH_SPI_CSN;
  inout   wire  FLASH_SPI_MISO;
  inout   wire  FLASH_SPI_MOSI;
  inout   wire  FLASH_SPI_WPN;
  inout   wire  FLASH_SPI_CLK;
`endif

  // APB Master [1]
`ifdef GOWIN_APB1_SUPPORT
  output wire [31:0]   APB1PADDR;      // APB Address
  output wire          APB1PENABLE;    // APB Enable
  output wire          APB1PWRITE;     // APB Write
  output wire [3:0]    APB1PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB1PPROT;      // APB Prot
  output wire [31:0]   APB1PWDATA;     // APB write data
  output wire          APB1PSEL;       // APB Select
  input  wire [31:0]   APB1PRDATA;     // Read data for each APB slave
  input  wire          APB1PREADY;     // Ready for each APB slave
  input  wire          APB1PSLVERR;    // Error state for each APB slave
  output               APB1PCLK;       // Clock
  output               APB1PRESET;     // Reset
`endif

  // APB Master [2]
`ifdef GOWIN_APB2_SUPPORT
  output wire [31:0]   APB2PADDR;      // APB Address
  output wire          APB2PENABLE;    // APB Enable
  output wire          APB2PWRITE;     // APB Write
  output wire [3:0]    APB2PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB2PPROT;      // APB Prot
  output wire [31:0]   APB2PWDATA;     // APB write data
  output wire          APB2PSEL;       // APB Select
  input  wire [31:0]   APB2PRDATA;     // Read data for each APB slave
  input  wire          APB2PREADY;     // Ready for each APB slave
  input  wire          APB2PSLVERR;    // Error state for each APB slave
  output               APB2PCLK;       // Clock
  output               APB2PRESET;     // Reset
`endif

  // APB Master [3]
`ifdef GOWIN_APB3_SUPPORT
  output wire [31:0]   APB3PADDR;      // APB Address
  output wire          APB3PENABLE;    // APB Enable
  output wire          APB3PWRITE;     // APB Write
  output wire [3:0]    APB3PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB3PPROT;      // APB Prot
  output wire [31:0]   APB3PWDATA;     // APB write data
  output wire          APB3PSEL;       // APB Select
  input  wire [31:0]   APB3PRDATA;     // Read data for each APB slave
  input  wire          APB3PREADY;     // Ready for each APB slave
  input  wire          APB3PSLVERR;    // Error state for each APB slave
  output               APB3PCLK;       // Clock
  output               APB3PRESET;     // Reset
`endif

  // APB Master [4]
`ifdef GOWIN_APB4_SUPPORT
  output wire [31:0]   APB4PADDR;      // APB Address
  output wire          APB4PENABLE;    // APB Enable
  output wire          APB4PWRITE;     // APB Write
  output wire [3:0]    APB4PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB4PPROT;      // APB Prot
  output wire [31:0]   APB4PWDATA;     // APB write data
  output wire          APB4PSEL;       // APB Select
  input  wire [31:0]   APB4PRDATA;     // Read data for each APB slave
  input  wire          APB4PREADY;     // Ready for each APB slave
  input  wire          APB4PSLVERR;    // Error state for each APB slave
  output               APB4PCLK;       // Clock
  output               APB4PRESET;     // Reset
`endif

  // APB Master [5]
`ifdef GOWIN_APB5_SUPPORT
  output wire [31:0]   APB5PADDR;      // APB Address
  output wire          APB5PENABLE;    // APB Enable
  output wire          APB5PWRITE;     // APB Write
  output wire [3:0]    APB5PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB5PPROT;      // APB Prot
  output wire [31:0]   APB5PWDATA;     // APB write data
  output wire          APB5PSEL;       // APB Select
  input  wire [31:0]   APB5PRDATA;     // Read data for each APB slave
  input  wire          APB5PREADY;     // Ready for each APB slave
  input  wire          APB5PSLVERR;    // Error state for each APB slave
  output               APB5PCLK;       // Clock
  output               APB5PRESET;     // Reset
`endif

  // APB Master [6]
`ifdef GOWIN_APB6_SUPPORT
  output wire [31:0]   APB6PADDR;      // APB Address
  output wire          APB6PENABLE;    // APB Enable
  output wire          APB6PWRITE;     // APB Write
  output wire [3:0]    APB6PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB6PPROT;      // APB Prot
  output wire [31:0]   APB6PWDATA;     // APB write data
  output wire          APB6PSEL;       // APB Select
  input  wire [31:0]   APB6PRDATA;     // Read data for each APB slave
  input  wire          APB6PREADY;     // Ready for each APB slave
  input  wire          APB6PSLVERR;    // Error state for each APB slave
  output               APB6PCLK;       // Clock
  output               APB6PRESET;     // Reset
`endif

  // APB Master [7]
`ifdef GOWIN_APB7_SUPPORT
  output wire [31:0]   APB7PADDR;      // APB Address
  output wire          APB7PENABLE;    // APB Enable
  output wire          APB7PWRITE;     // APB Write
  output wire [3:0]    APB7PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB7PPROT;      // APB Prot
  output wire [31:0]   APB7PWDATA;     // APB write data
  output wire          APB7PSEL;       // APB Select
  input  wire [31:0]   APB7PRDATA;     // Read data for each APB slave
  input  wire          APB7PREADY;     // Ready for each APB slave
  input  wire          APB7PSLVERR;    // Error state for each APB slave
  output               APB7PCLK;       // Clock
  output               APB7PRESET;     // Reset
`endif

  // APB Master [8]
`ifdef GOWIN_APB8_SUPPORT
  output wire [31:0]   APB8PADDR;      // APB Address
  output wire          APB8PENABLE;    // APB Enable
  output wire          APB8PWRITE;     // APB Write
  output wire [3:0]    APB8PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB8PPROT;      // APB Prot
  output wire [31:0]   APB8PWDATA;     // APB write data
  output wire          APB8PSEL;       // APB Select
  input  wire [31:0]   APB8PRDATA;     // Read data for each APB slave
  input  wire          APB8PREADY;     // Ready for each APB slave
  input  wire          APB8PSLVERR;    // Error state for each APB slave
  output               APB8PCLK;       // Clock
  output               APB8PRESET;     // Reset
`endif

  // APB Master [9]
`ifdef GOWIN_APB9_SUPPORT
  output wire [31:0]   APB9PADDR;      // APB Address
  output wire          APB9PENABLE;    // APB Enable
  output wire          APB9PWRITE;     // APB Write
  output wire [3:0]    APB9PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB9PPROT;      // APB Prot
  output wire [31:0]   APB9PWDATA;     // APB write data
  output wire          APB9PSEL;       // APB Select
  input  wire [31:0]   APB9PRDATA;     // Read data for each APB slave
  input  wire          APB9PREADY;     // Ready for each APB slave
  input  wire          APB9PSLVERR;    // Error state for each APB slave
  output               APB9PCLK;       // Clock
  output               APB9PRESET;     // Reset
`endif

  // APB Master [10]
`ifdef GOWIN_APB10_SUPPORT
  output wire [31:0]   APB10PADDR;      // APB Address
  output wire          APB10PENABLE;    // APB Enable
  output wire          APB10PWRITE;     // APB Write
  output wire [3:0]    APB10PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB10PPROT;      // APB Prot
  output wire [31:0]   APB10PWDATA;     // APB write data
  output wire          APB10PSEL;       // APB Select
  input  wire [31:0]   APB10PRDATA;     // Read data for each APB slave
  input  wire          APB10PREADY;     // Ready for each APB slave
  input  wire          APB10PSLVERR;    // Error state for each APB slave
  output               APB10PCLK;       // Clock
  output               APB10PRESET;     // Reset
`endif

  // APB Master [11]
`ifdef GOWIN_APB11_SUPPORT
  output wire [31:0]   APB11PADDR;      // APB Address
  output wire          APB11PENABLE;    // APB Enable
  output wire          APB11PWRITE;     // APB Write
  output wire [3:0]    APB11PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB11PPROT;      // APB Prot
  output wire [31:0]   APB11PWDATA;     // APB write data
  output wire          APB11PSEL;       // APB Select
  input  wire [31:0]   APB11PRDATA;     // Read data for each APB slave
  input  wire          APB11PREADY;     // Ready for each APB slave
  input  wire          APB11PSLVERR;    // Error state for each APB slave
  output               APB11PCLK;       // Clock
  output               APB11PRESET;     // Reset
`endif

  // APB Master [12]
`ifdef GOWIN_APB12_SUPPORT
  output wire [31:0]   APB12PADDR;      // APB Address
  output wire          APB12PENABLE;    // APB Enable
  output wire          APB12PWRITE;     // APB Write
  output wire [3:0]    APB12PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB12PPROT;      // APB Prot
  output wire [31:0]   APB12PWDATA;     // APB write data
  output wire          APB12PSEL;       // APB Select
  input  wire [31:0]   APB12PRDATA;     // Read data for each APB slave
  input  wire          APB12PREADY;     // Ready for each APB slave
  input  wire          APB12PSLVERR;    // Error state for each APB slave
  output               APB12PCLK;       // Clock
  output               APB12PRESET;     // Reset
`endif

  // APB Master [13]
`ifdef GOWIN_APB13_SUPPORT
  output wire [31:0]   APB13PADDR;      // APB Address
  output wire          APB13PENABLE;    // APB Enable
  output wire          APB13PWRITE;     // APB Write
  output wire [3:0]    APB13PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB13PPROT;      // APB Prot
  output wire [31:0]   APB13PWDATA;     // APB write data
  output wire          APB13PSEL;       // APB Select
  input  wire [31:0]   APB13PRDATA;     // Read data for each APB slave
  input  wire          APB13PREADY;     // Ready for each APB slave
  input  wire          APB13PSLVERR;    // Error state for each APB slave
  output               APB13PCLK;       // Clock
  output               APB13PRESET;     // Reset
`endif

  // APB Master [14]
`ifdef GOWIN_APB14_SUPPORT
  output wire [31:0]   APB14PADDR;      // APB Address
  output wire          APB14PENABLE;    // APB Enable
  output wire          APB14PWRITE;     // APB Write
  output wire [3:0]    APB14PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB14PPROT;      // APB Prot
  output wire [31:0]   APB14PWDATA;     // APB write data
  output wire          APB14PSEL;       // APB Select
  input  wire [31:0]   APB14PRDATA;     // Read data for each APB slave
  input  wire          APB14PREADY;     // Ready for each APB slave
  input  wire          APB14PSLVERR;    // Error state for each APB slave
  output               APB14PCLK;       // Clock
  output               APB14PRESET;     // Reset
`endif

  // APB Master [15]
`ifdef GOWIN_APB15_SUPPORT
  output wire [31:0]   APB15PADDR;      // APB Address
  output wire          APB15PENABLE;    // APB Enable
  output wire          APB15PWRITE;     // APB Write
  output wire [3:0]    APB15PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB15PPROT;      // APB Prot
  output wire [31:0]   APB15PWDATA;     // APB write data
  output wire          APB15PSEL;       // APB Select
  input  wire [31:0]   APB15PRDATA;     // Read data for each APB slave
  input  wire          APB15PREADY;     // Ready for each APB slave
  input  wire          APB15PSLVERR;    // Error state for each APB slave
  output               APB15PCLK;       // Clock
  output               APB15PRESET;     // Reset
`endif

  // APB Master [16]
`ifdef GOWIN_APB16_SUPPORT
  output wire [31:0]   APB16PADDR;      // APB Address
  output wire          APB16PENABLE;    // APB Enable
  output wire          APB16PWRITE;     // APB Write
  output wire [3:0]    APB16PSTRB;      // APB Byte Strobe
  output wire [2:0]    APB16PPROT;      // APB Prot
  output wire [31:0]   APB16PWDATA;     // APB write data
  output wire          APB16PSEL;       // APB Select
  input  wire [31:0]   APB16PRDATA;     // Read data for each APB slave
  input  wire          APB16PREADY;     // Ready for each APB slave
  input  wire          APB16PSLVERR;    // Error state for each APB slave
  output               APB16PCLK;       // Clock
  output               APB16PRESET;     // Reset
`endif

  // AHB Master [1]
  `ifdef GOWIN_AHB1_SUPPORT
  input  [31:0]        AHB1HRDATA;       // Data from slave to master
  input                AHB1HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB1HRESP;        // Slave response signal  
  output [1:0]         AHB1HTRANS;       // Transfer type
  output [2:0]         AHB1HBURST;       // Burst type
  output [3:0]         AHB1HPROT;        // Transfer protection bits
  output [2:0]         AHB1HSIZE;        // Transfer size
  output               AHB1HWRITE;       // Transfer direction
  output               AHB1HREADYMUX;
  output [3:0]         AHB1HMASTER;
  output               AHB1HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB1HADDR;        // Transfer address
  output [31:0]        AHB1HWDATA;       // Data from master to slave
  output               AHB1HSEL;
  output               AHB1HCLK;
  output               AHB1HRESET;
`endif

  // AHB Master [2]
`ifdef GOWIN_AHB2_SUPPORT
  input  [31:0]        AHB2HRDATA;       // Data from slave to master
  input                AHB2HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB2HRESP;        // Slave response signal  
  output [1:0]         AHB2HTRANS;       // Transfer type
  output [2:0]         AHB2HBURST;       // Burst type
  output [3:0]         AHB2HPROT;        // Transfer protection bits
  output [2:0]         AHB2HSIZE;        // Transfer size
  output               AHB2HWRITE;       // Transfer direction
  output               AHB2HREADYMUX;
  output [3:0]         AHB2HMASTER;
  output               AHB2HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB2HADDR;        // Transfer address
  output [31:0]        AHB2HWDATA;       // Data from master to slave
  output               AHB2HSEL;
  output               AHB2HCLK;
  output               AHB2HRESET;
`endif

  // AHB Master [3]
`ifdef GOWIN_AHB3_SUPPORT
  input  [31:0]        AHB3HRDATA;       // Data from slave to master
  input                AHB3HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB3HRESP;        // Slave response signal  
  output [1:0]         AHB3HTRANS;       // Transfer type
  output [2:0]         AHB3HBURST;       // Burst type
  output [3:0]         AHB3HPROT;        // Transfer protection bits
  output [2:0]         AHB3HSIZE;        // Transfer size
  output               AHB3HWRITE;       // Transfer direction
  output               AHB3HREADYMUX;
  output [3:0]         AHB3HMASTER;
  output               AHB3HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB3HADDR;        // Transfer address
  output [31:0]        AHB3HWDATA;       // Data from master to slave
  output               AHB3HSEL;
  output               AHB3HCLK;
  output               AHB3HRESET;
`endif

  // AHB Master [4]
`ifdef GOWIN_AHB4_SUPPORT
  input  [31:0]        AHB4HRDATA;       // Data from slave to master
  input                AHB4HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB4HRESP;        // Slave response signal  
  output [1:0]         AHB4HTRANS;       // Transfer type
  output [2:0]         AHB4HBURST;       // Burst type
  output [3:0]         AHB4HPROT;        // Transfer protection bits
  output [2:0]         AHB4HSIZE;        // Transfer size
  output               AHB4HWRITE;       // Transfer direction
  output               AHB4HREADYMUX;
  output [3:0]         AHB4HMASTER;
  output               AHB4HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB4HADDR;        // Transfer address
  output [31:0]        AHB4HWDATA;       // Data from master to slave
  output               AHB4HSEL;
  output               AHB4HCLK;
  output               AHB4HRESET;
`endif

  // AHB Master [5]
`ifdef GOWIN_AHB5_SUPPORT
  input  [31:0]        AHB5HRDATA;       // Data from slave to master
  input                AHB5HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB5HRESP;        // Slave response signal  
  output [1:0]         AHB5HTRANS;       // Transfer type
  output [2:0]         AHB5HBURST;       // Burst type
  output [3:0]         AHB5HPROT;        // Transfer protection bits
  output [2:0]         AHB5HSIZE;        // Transfer size
  output               AHB5HWRITE;       // Transfer direction
  output               AHB5HREADYMUX; 
  output [3:0]         AHB5HMASTER; 
  output               AHB5HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB5HADDR;        // Transfer address
  output [31:0]        AHB5HWDATA;       // Data from master to slave
  output               AHB5HSEL;
  output               AHB5HCLK;
  output               AHB5HRESET;
`endif

  // AHB Master [6]
`ifdef GOWIN_AHB6_SUPPORT
  input  [31:0]        AHB6HRDATA;       // Data from slave to master
  input                AHB6HREADYOUT;    // Slave ready signal
  input  [1:0]         AHB6HRESP;        // Slave response signal  
  output [1:0]         AHB6HTRANS;       // Transfer type
  output [2:0]         AHB6HBURST;       // Burst type
  output [3:0]         AHB6HPROT;        // Transfer protection bits
  output [2:0]         AHB6HSIZE;        // Transfer size
  output               AHB6HWRITE;       // Transfer direction
  output               AHB6HREADYMUX;
  output [3:0]         AHB6HMASTER;
  output               AHB6HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        AHB6HADDR;        // Transfer address
  output [31:0]        AHB6HWDATA;       // Data from master to slave
  output               AHB6HSEL;
  output               AHB6HCLK;
  output               AHB6HRESET;
`endif

  //External Instruction Memory
`ifdef CM1_EXTERNAL_FLASH_EN
  input  [31:0]        EXTFLASH0HRDATA;       // Data from slave to master
  input                EXTFLASH0HREADYOUT;    // Slave ready signal
  input  [1:0]         EXTFLASH0HRESP;        // Slave response signal  
  output [1:0]         EXTFLASH0HTRANS;       // Transfer type
  output [2:0]         EXTFLASH0HBURST;       // Burst type
  output [3:0]         EXTFLASH0HPROT;        // Transfer protection bits
  output [2:0]         EXTFLASH0HSIZE;        // Transfer size
  output               EXTFLASH0HWRITE;       // Transfer direction
  output               EXTFLASH0HREADYMUX;
  output [3:0]         EXTFLASH0HMASTER;
  output               EXTFLASH0HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        EXTFLASH0HADDR;        // Transfer address
  output [31:0]        EXTFLASH0HWDATA;       // Data from master to slave
  output               EXTFLASH0HSEL;
  output               EXTFLASH0HCLK;
  output               EXTFLASH0HRESET;
`endif

  //External Data Memory
`ifdef CM1_EXTERNAL_SRAM_EN
  input  [31:0]        EXTSRAM0HRDATA;       // Data from slave to master
  input                EXTSRAM0HREADYOUT;    // Slave ready signal
  input  [1:0]         EXTSRAM0HRESP;        // Slave response signal  
  output [1:0]         EXTSRAM0HTRANS;       // Transfer type
  output [2:0]         EXTSRAM0HBURST;       // Burst type
  output [3:0]         EXTSRAM0HPROT;        // Transfer protection bits
  output [2:0]         EXTSRAM0HSIZE;        // Transfer size
  output               EXTSRAM0HWRITE;       // Transfer direction
  output               EXTSRAM0HREADYMUX;
  output [3:0]         EXTSRAM0HMASTER;
  output               EXTSRAM0HMASTLOCK;    // Transfer is a locked transfer
  output [31:0]        EXTSRAM0HADDR;        // Transfer address
  output [31:0]        EXTSRAM0HWDATA;       // Data from master to slave
  output               EXTSRAM0HSEL;
  output               EXTSRAM0HCLK;
  output               EXTSRAM0HRESET;
`endif

  //DDR3
`ifdef GOWIN_DDR3_SUPPORT
  input  wire        DDR_CLK_I;
  `ifndef ARORA_GW2A
  output wire        DDR_STOP_O;            //
  `endif
  input  wire        DDR_MEM_CLK_I;         //
  input  wire        DDR_LOCK_I;            //
  input  wire        DDR_RSTN_I;            //
  output wire        DDR_INIT_COMPLETE_O;
  output wire [13:0] DDR_ADDR_O;            //
  output wire [2:0]  DDR_BA_O;
  output wire        DDR_CS_N_O;
  output wire        DDR_RAS_N_O;
  output wire        DDR_CAS_N_O;
  output wire        DDR_WE_N_O;
  output wire        DDR_CLK_O;
  output wire        DDR_CLK_N_O;
  output wire        DDR_CKE_O;
  output wire        DDR_ODT_O;
  output wire        DDR_RESET_N_O;
  output wire [1:0]  DDR_DQM_O;
  inout  wire [15:0] DDR_DQ_IO;
  inout  wire [1:0]  DDR_DQS_IO;
  inout  wire [1:0]  DDR_DQS_N_IO;
`endif

  //PSRAM
`ifdef GOWIN_PSRAM_SUPPORT
  output  wire [2-1:0]   O_psram_ck;          //CS_WIDTH=2
  output  wire [2-1:0]   O_psram_ck_n;        //CS_WIDTH=2
  inout   wire [2-1:0]   IO_psram_rwds;       //CS_WIDTH=2
  inout   wire [16-1:0]  IO_psram_dq;         //DQ_WIDTH=16
  output  wire [2-1:0]   O_psram_reset_n;     //CS_WIDTH=2
  output  wire [2-1:0]   O_psram_cs_n;        //CS_WIDTH=2
  output  wire           init_calib;          //Initialization done flag
  input   wire           psram_ref_clk;       //Reference input clock, osc clock from board
  input   wire           psram_memory_clk;    //Working clock of user input grain
`endif

//-------------------------------------------------------------------------
// Wire declaration
//-------------------------------------------------------------------------
`ifndef DEBUG_PORT_JTAG
  wire   JTAG_3;   //trstn
  wire   JTAG_4;   //NC
  wire   JTAG_5;   //tdi
  wire   JTAG_6;   //NC
  wire   JTAG_8;   //extFlash_sspi2_sio3/holdn
  wire   JTAG_10;  //extFlash_spi2_mosi/sio1
  wire   JTAG_11;  //NC RTCK
  wire   JTAG_12;  //extFlash_spi2_sclk
  wire   JTAG_13;  //tdo
  wire   JTAG_14;  //extFlash_spi2_miso/sio0
  wire   JTAG_15;  //srstn
  wire   JTAG_16;  //extFlash_spi2_cs
  wire   JTAG_17;  //NC DBGQ
  wire   JTAG_18;  //extFlash_sspi2_sio2/WPn
`endif

wire [1:0] HTRANS;
wire [2:0] HBURST;
wire [3:0] HPROT;
wire [2:0] HSIZE;
wire HWRITE;
wire HMASTLOCK;
wire [31:0] HADDR;
wire [31:0] HWDATA;
wire HRESP;
wire [31:0] HRDATA;
wire HREADY;
wire SWDIO;
wire TDO, nTDOEN;
wire nTRST, SWCLKTCK, SWDITMS, TDI;
wire SYSRESETREQ;
wire SWDO, SWDOEN;
wire wdog_reset_req;
wire [31:0] IRQ;          // From AHB lite
wire [31:0] MIRQ;         // To MCU core
wire NMI;

reg     [3:0]   sysRstGen = 4'b0;
reg             dbgRstGen = 1'b0;

wire    SYSRESETn       =   sysRstGen[3];
wire    DBGRESETn       =   dbgRstGen;

assign  nTRST           = JTAG_3;
assign  SWCLKTCK        = JTAG_9;
assign  TDI             = JTAG_5;

assign  JTAG_13 = TDO;
assign  JTAG_15 = SYSRESETn;
assign  JTAG_11 = 0;
assign  JTAG_17 = 0;

assign  JTAG_4  = 0;
assign  JTAG_6  = 0;
assign  JTAG_8  = 0;
assign  JTAG_10  = 0;
assign  JTAG_12  = 0;
assign  JTAG_14  = 0;
assign  JTAG_16  = 0;
assign  JTAG_18  = 0;

always@(posedge HCLK)begin
    if(!hwRstn | !DBGRESETn | SYSRESETREQ |wdog_reset_req)
        sysRstGen <= 4'b0;
    else
        sysRstGen <= {sysRstGen[2:0],1'b1};
end
always@(posedge HCLK)begin
    if(!hwRstn)
        dbgRstGen <= 1'b0;
    else
        dbgRstGen <= 1'b1;
end

IOBUF swdio (
    .O(SWDITMS),
    .IO(JTAG_7),
    .I(SWDO), 
    .OEN(!(SWDOEN  & !JTAGNSW)));

assign  JTAG_4  = 0;
assign  JTAG_6  = 0;
assign  JTAG_8  = 0;
assign  JTAG_10  = 0;
assign  JTAG_12  = 0;
assign  JTAG_14  = 0;
assign  JTAG_16  = 0;
assign  JTAG_18  = 0;

`ifdef GOWIN_EXTINT_SUPPORT
    assign MIRQ = {IRQ[31:16], EXTINT[3:1], IRQ[12:11], EXTINT[0], IRQ[9:0]};
`else
    assign MIRQ = IRQ;
`endif

//Instance Cortex-M1
CortexM1DbgIntegrationWrapper M1_inst(
    .DBGRESTARTED(),
    .JTAGNSW(JTAGNSW),
    .JTAGTOP(),
    .TDO(TDO),
    .nTDOEN(nTDOEN),
    .SWDO(SWDO),
    .SWDOEN(SWDOEN),
    .LOCKUP(LOCKUP),
    .HALTED(HALTED),
    .SYSRESETREQ(SYSRESETREQ),
    .HTRANS(HTRANS),
    .HBURST(HBURST),
    .HPROT(HPROT),
    .HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HMASTLOCK(HMASTLOCK),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
  // Inputs
    .HCLK(HCLK),
    .SYSRESETn(SYSRESETn),
    .IRQ(MIRQ),               // MIRQ
    .NMI(NMI),
    .DBGRESETn(DBGRESETn),
    .EDBGRQ(1'b0),
    .DBGRESTART(1'b0),
    .nTRST(nTRST),
    .SWCLKTCK(SWCLKTCK),
    .SWDITMS(SWDITMS),
    .TDI(TDI),
    .HREADY(HREADY),
    .HRESP(HRESP),
    .HRDATA(HRDATA)
);

//Instance AHB-Lite
GowinCM1AhbExtWrapper u_GowinCM1AhbExtWrapper(
    .IRQ(IRQ),         // External interrupts
    .NMI(NMI),         // Non-maskable interrupt
`ifdef GOWIN_RTC_SUPPORT
    .RTCSRCCLK(RTCSRCCLK),
`endif
    .HCLK(HCLK),
    .HTRANS(HTRANS),
    .HBURST(HBURST),
    .HPROT(HPROT),
    .HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HMASTLOCK(HMASTLOCK),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
    .HRESP(HRESP),
    .HRDATA(HRDATA),
    .HREADY(HREADY),
`ifdef GOWIN_AHB1_SUPPORT
  .AHB1HRDATA(AHB1HRDATA),      // Data from slave to master
  .AHB1HREADYOUT(AHB1HREADYOUT),   // Slave ready signal
  .AHB1HRESP(AHB1HRESP),       // Slave response signal  
  .AHB1HTRANS(AHB1HTRANS),      // Transfer type
  .AHB1HBURST(AHB1HBURST),      // Burst type
  .AHB1HPROT(AHB1HPROT),       // Transfer protection bits
  .AHB1HSIZE(AHB1HSIZE),       // Transfer size
  .AHB1HWRITE(AHB1HWRITE),      // Transfer direction
  .AHB1HREADYMUX(AHB1HREADYMUX),
  .AHB1HMASTER(AHB1HMASTER),
  .AHB1HMASTLOCK(AHB1HMASTLOCK),   // Transfer is a locked transfer
  .AHB1HADDR(AHB1HADDR),       // Transfer address
  .AHB1HWDATA(AHB1HWDATA),      // Data from master to slave
  .AHB1HSEL(AHB1HSEL),
`endif
`ifdef GOWIN_AHB2_SUPPORT
  .AHB2HRDATA(AHB2HRDATA),      // Data from slave to master
  .AHB2HREADYOUT(AHB2HREADYOUT),   // Slave ready signal
  .AHB2HRESP(AHB2HRESP),       // Slave response signal  
  .AHB2HTRANS(AHB2HTRANS),      // Transfer type
  .AHB2HBURST(AHB2HBURST),      // Burst type
  .AHB2HPROT(AHB2HPROT),       // Transfer protection bits
  .AHB2HSIZE(AHB2HSIZE),       // Transfer size
  .AHB2HWRITE(AHB2HWRITE),      // Transfer direction
  .AHB2HREADYMUX(AHB2HREADYMUX),
  .AHB2HMASTER(AHB2HMASTER),
  .AHB2HMASTLOCK(AHB2HMASTLOCK),   // Transfer is a locked transfer
  .AHB2HADDR(AHB2HADDR),       // Transfer address
  .AHB2HWDATA(AHB2HWDATA),      // Data from master to slave
  .AHB2HSEL(AHB2HSEL),
`endif
`ifdef GOWIN_AHB3_SUPPORT
  .AHB3HRDATA(AHB3HRDATA),      // Data from slave to master
  .AHB3HREADYOUT(AHB3HREADYOUT),   // Slave ready signal
  .AHB3HRESP(AHB3HRESP),       // Slave response signal  
  .AHB3HTRANS(AHB3HTRANS),      // Transfer type
  .AHB3HBURST(AHB3HBURST),      // Burst type
  .AHB3HPROT(AHB3HPROT),       // Transfer protection bits
  .AHB3HSIZE(AHB3HSIZE),       // Transfer size
  .AHB3HWRITE(AHB3HWRITE),      // Transfer direction
  .AHB3HREADYMUX(AHB3HREADYMUX),
  .AHB3HMASTER(AHB3HMASTER),
  .AHB3HMASTLOCK(AHB3HMASTLOCK),   // Transfer is a locked transfer
  .AHB3HADDR(AHB3HADDR),       // Transfer address
  .AHB3HWDATA(AHB3HWDATA),      // Data from master to slave
  .AHB3HSEL(AHB3HSEL),
`endif
`ifdef GOWIN_AHB4_SUPPORT
  .AHB4HRDATA(AHB4HRDATA),      // Data from slave to master
  .AHB4HREADYOUT(AHB4HREADYOUT),   // Slave ready signal
  .AHB4HRESP(AHB4HRESP),       // Slave response signal  
  .AHB4HTRANS(AHB4HTRANS),      // Transfer type
  .AHB4HBURST(AHB4HBURST),      // Burst type
  .AHB4HPROT(AHB4HPROT),       // Transfer protection bits
  .AHB4HSIZE(AHB4HSIZE),       // Transfer size
  .AHB4HWRITE(AHB4HWRITE),      // Transfer direction
  .AHB4HREADYMUX(AHB4HREADYMUX),
  .AHB4HMASTER(AHB4HMASTER),
  .AHB4HMASTLOCK(AHB4HMASTLOCK),   // Transfer is a locked transfer
  .AHB4HADDR(AHB4HADDR),       // Transfer address
  .AHB4HWDATA(AHB4HWDATA),      // Data from master to slave
  .AHB4HSEL(AHB4HSEL),
`endif
`ifdef GOWIN_AHB5_SUPPORT
  .AHB5HRDATA(AHB5HRDATA),      // Data from slave to master
  .AHB5HREADYOUT(AHB5HREADYOUT),   // Slave ready signal
  .AHB5HRESP(AHB5HRESP),       // Slave response signal  
  .AHB5HTRANS(AHB5HTRANS),      // Transfer type
  .AHB5HBURST(AHB5HBURST),      // Burst type
  .AHB5HPROT(AHB5HPROT),       // Transfer protection bits
  .AHB5HSIZE(AHB5HSIZE),       // Transfer size
  .AHB5HWRITE(AHB5HWRITE),      // Transfer direction
  .AHB5HREADYMUX(AHB5HREADYMUX),
  .AHB5HMASTER(AHB5HMASTER),
  .AHB5HMASTLOCK(AHB5HMASTLOCK),   // Transfer is a locked transfer
  .AHB5HADDR(AHB5HADDR),       // Transfer address
  .AHB5HWDATA(AHB5HWDATA),      // Data from master to slave
  .AHB5HSEL(AHB5HSEL),
`endif

`ifdef GOWIN_AHB6_SUPPORT
  .AHB6HRDATA(AHB6HRDATA),      // Data from slave to master
  .AHB6HREADYOUT(AHB6HREADYOUT),   // Slave ready signal
  .AHB6HRESP(AHB6HRESP),       // Slave response signal  
  .AHB6HTRANS(AHB6HTRANS),      // Transfer type
  .AHB6HBURST(AHB6HBURST),      // Burst type
  .AHB6HPROT(AHB6HPROT),       // Transfer protection bits
  .AHB6HSIZE(AHB6HSIZE),       // Transfer size
  .AHB6HWRITE(AHB6HWRITE),      // Transfer direction
  .AHB6HREADYMUX(AHB6HREADYMUX),
  .AHB6HMASTER(AHB6HMASTER),
  .AHB6HMASTLOCK(AHB6HMASTLOCK),   // Transfer is a locked transfer
  .AHB6HADDR(AHB6HADDR),       // Transfer address
  .AHB6HWDATA(AHB6HWDATA),      // Data from master to slave
  .AHB6HSEL(AHB6HSEL),
`endif
`ifdef CM1_EXTERNAL_FLASH_EN
  .EXTFLASH0HRDATA(EXTFLASH0HRDATA),      // Data from slave to master
  .EXTFLASH0HREADYOUT(EXTFLASH0HREADYOUT),   // Slave ready signal
  .EXTFLASH0HRESP(EXTFLASH0HRESP),       // Slave response signal  
  .EXTFLASH0HTRANS(EXTFLASH0HTRANS),      // Transfer type
  .EXTFLASH0HBURST(EXTFLASH0HBURST),      // Burst type
  .EXTFLASH0HPROT(EXTFLASH0HPROT),       // Transfer protection bits
  .EXTFLASH0HSIZE(EXTFLASH0HSIZE),       // Transfer size
  .EXTFLASH0HWRITE(EXTFLASH0HWRITE),      // Transfer direction
  .EXTFLASH0HREADYMUX(EXTFLASH0HREADYMUX),
  .EXTFLASH0HMASTER(EXTFLASH0HMASTER),
  .EXTFLASH0HMASTLOCK(EXTFLASH0HMASTLOCK),   // Transfer is a locked transfer
  .EXTFLASH0HADDR(EXTFLASH0HADDR),       // Transfer address
  .EXTFLASH0HWDATA(EXTFLASH0HWDATA),      // Data from master to slave
  .EXTFLASH0HSEL(EXTFLASH0HSEL),
`endif
`ifdef CM1_EXTERNAL_SRAM_EN
  .EXTSRAM0HRDATA(EXTSRAM0HRDATA),      // Data from slave to master
  .EXTSRAM0HREADYOUT(EXTSRAM0HREADYOUT),   // Slave ready signal
  .EXTSRAM0HRESP(EXTSRAM0HRESP),       // Slave response signal  
  .EXTSRAM0HTRANS(EXTSRAM0HTRANS),      // Transfer type
  .EXTSRAM0HBURST(EXTSRAM0HBURST),      // Burst type
  .EXTSRAM0HPROT(EXTSRAM0HPROT),       // Transfer protection bits
  .EXTSRAM0HSIZE(EXTSRAM0HSIZE),       // Transfer size
  .EXTSRAM0HWRITE(EXTSRAM0HWRITE),      // Transfer direction
  .EXTSRAM0HREADYMUX(EXTSRAM0HREADYMUX),
  .EXTSRAM0HMASTER(EXTSRAM0HMASTER),
  .EXTSRAM0HMASTLOCK(EXTSRAM0HMASTLOCK),   // Transfer is a locked transfer
  .EXTSRAM0HADDR(EXTSRAM0HADDR),       // Transfer address
  .EXTSRAM0HWDATA(EXTSRAM0HWDATA),      // Data from master to slave
  .EXTSRAM0HSEL(EXTSRAM0HSEL),
`endif

`ifdef GOWIN_APB1_SUPPORT
    .APB1PADDR(      APB1PADDR     ),
    .APB1PENABLE(    APB1PENABLE   ),
    .APB1PWRITE(     APB1PWRITE    ),
    .APB1PSTRB(      APB1PSTRB     ),
    .APB1PPROT(      APB1PPROT     ),
    .APB1PWDATA(     APB1PWDATA    ),
    .APB1PSEL(       APB1PSEL      ),
    .APB1PRDATA(     APB1PRDATA    ),
    .APB1PREADY(     APB1PREADY    ),
    .APB1PSLVERR(    APB1PSLVERR   ),
`endif
`ifdef GOWIN_APB2_SUPPORT
    .APB2PADDR(      APB2PADDR     ),
    .APB2PENABLE(    APB2PENABLE   ),
    .APB2PWRITE(     APB2PWRITE    ),
    .APB2PSTRB(      APB2PSTRB     ),
    .APB2PPROT(      APB2PPROT     ),
    .APB2PWDATA(     APB2PWDATA    ),
    .APB2PSEL(       APB2PSEL      ),
    .APB2PRDATA(     APB2PRDATA    ),
    .APB2PREADY(     APB2PREADY    ),
    .APB2PSLVERR(    APB2PSLVERR   ),
`endif

`ifdef GOWIN_APB3_SUPPORT
    .APB3PADDR(      APB3PADDR     ),
    .APB3PENABLE(    APB3PENABLE   ),
    .APB3PWRITE(     APB3PWRITE    ),
    .APB3PSTRB(      APB3PSTRB     ),
    .APB3PPROT(      APB3PPROT     ),
    .APB3PWDATA(     APB3PWDATA    ),
    .APB3PSEL(       APB3PSEL      ),
    .APB3PRDATA(     APB3PRDATA    ),
    .APB3PREADY(     APB3PREADY    ),
    .APB3PSLVERR(    APB3PSLVERR   ),
`endif


`ifdef GOWIN_APB4_SUPPORT
    .APB4PADDR(      APB4PADDR     ),
    .APB4PENABLE(    APB4PENABLE   ),
    .APB4PWRITE(     APB4PWRITE    ),
    .APB4PSTRB(      APB4PSTRB     ),
    .APB4PPROT(      APB4PPROT     ),
    .APB4PWDATA(     APB4PWDATA    ),
    .APB4PSEL(       APB4PSEL      ),
    .APB4PRDATA(     APB4PRDATA    ),
    .APB4PREADY(     APB4PREADY    ),
    .APB4PSLVERR(    APB4PSLVERR   ),
`endif
`ifdef GOWIN_APB5_SUPPORT
    .APB5PADDR(      APB5PADDR     ),
    .APB5PENABLE(    APB5PENABLE   ),
    .APB5PWRITE(     APB5PWRITE    ),
    .APB5PSTRB(      APB5PSTRB     ),
    .APB5PPROT(      APB5PPROT     ),
    .APB5PWDATA(     APB5PWDATA    ),
    .APB5PSEL(       APB5PSEL      ),
    .APB5PRDATA(     APB5PRDATA    ),
    .APB5PREADY(     APB5PREADY    ),
    .APB5PSLVERR(    APB5PSLVERR   ),
`endif
`ifdef GOWIN_APB6_SUPPORT
    .APB6PADDR(      APB6PADDR     ),
    .APB6PENABLE(    APB6PENABLE   ),
    .APB6PWRITE(     APB6PWRITE    ),
    .APB6PSTRB(      APB6PSTRB     ),
    .APB6PPROT(      APB6PPROT     ),
    .APB6PWDATA(     APB6PWDATA    ),
    .APB6PSEL(       APB6PSEL      ),
    .APB6PRDATA(     APB6PRDATA    ),
    .APB6PREADY(     APB6PREADY    ),
    .APB6PSLVERR(    APB6PSLVERR   ),
`endif

`ifdef GOWIN_APB7_SUPPORT
    .APB7PADDR(      APB7PADDR     ),
    .APB7PENABLE(    APB7PENABLE   ),
    .APB7PWRITE(     APB7PWRITE    ),
    .APB7PSTRB(      APB7PSTRB     ),
    .APB7PPROT(      APB7PPROT     ),
    .APB7PWDATA(     APB7PWDATA    ),
    .APB7PSEL(       APB7PSEL      ),
    .APB7PRDATA(     APB7PRDATA    ),
    .APB7PREADY(     APB7PREADY    ),
    .APB7PSLVERR(    APB7PSLVERR   ),
`endif

`ifdef GOWIN_APB8_SUPPORT
    .APB8PADDR(      APB8PADDR     ),
    .APB8PENABLE(    APB8PENABLE   ),
    .APB8PWRITE(     APB8PWRITE    ),
    .APB8PSTRB(      APB8PSTRB     ),
    .APB8PPROT(      APB8PPROT     ),
    .APB8PWDATA(     APB8PWDATA    ),
    .APB8PSEL(       APB8PSEL      ),
    .APB8PRDATA(     APB8PRDATA    ),
    .APB8PREADY(     APB8PREADY    ),
    .APB8PSLVERR(    APB8PSLVERR   ),
`endif
`ifdef GOWIN_APB9_SUPPORT
    .APB9PADDR(      APB9PADDR     ),
    .APB9PENABLE(    APB9PENABLE   ),
    .APB9PWRITE(     APB9PWRITE    ),
    .APB9PSTRB(      APB9PSTRB     ),
    .APB9PPROT(      APB9PPROT     ),
    .APB9PWDATA(     APB9PWDATA    ),
    .APB9PSEL(       APB9PSEL      ),
    .APB9PRDATA(     APB9PRDATA    ),
    .APB9PREADY(     APB9PREADY    ),
    .APB9PSLVERR(    APB9PSLVERR   ),
`endif
`ifdef GOWIN_APB10_SUPPORT
    .APB10PADDR(      APB10PADDR     ),
    .APB10PENABLE(    APB10PENABLE   ),
    .APB10PWRITE(     APB10PWRITE    ),
    .APB10PSTRB(      APB10PSTRB     ),
    .APB10PPROT(      APB10PPROT     ),
    .APB10PWDATA(     APB10PWDATA    ),
    .APB10PSEL(       APB10PSEL      ),
    .APB10PRDATA(     APB10PRDATA    ),
    .APB10PREADY(     APB10PREADY    ),
    .APB10PSLVERR(    APB10PSLVERR   ),
`endif
`ifdef GOWIN_APB11_SUPPORT
    .APB11PADDR(      APB11PADDR     ),
    .APB11PENABLE(    APB11PENABLE   ),
    .APB11PWRITE(     APB11PWRITE    ),
    .APB11PSTRB(      APB11PSTRB     ),
    .APB11PPROT(      APB11PPROT     ),
    .APB11PWDATA(     APB11PWDATA    ),
    .APB11PSEL(       APB11PSEL      ),
    .APB11PRDATA(     APB11PRDATA    ),
    .APB11PREADY(     APB11PREADY    ),
    .APB11PSLVERR(    APB11PSLVERR   ),
`endif


`ifdef GOWIN_APB12_SUPPORT
    .APB12PADDR(      APB12PADDR     ),
    .APB12PENABLE(    APB12PENABLE   ),
    .APB12PWRITE(     APB12PWRITE    ),
    .APB12PSTRB(      APB12PSTRB     ),
    .APB12PPROT(      APB12PPROT     ),
    .APB12PWDATA(     APB12PWDATA    ),
    .APB12PSEL(       APB12PSEL      ),
    .APB12PRDATA(     APB12PRDATA    ),
    .APB12PREADY(     APB12PREADY    ),
    .APB12PSLVERR(    APB12PSLVERR   ),
`endif
`ifdef GOWIN_APB13_SUPPORT
    .APB13PADDR(      APB13PADDR     ),
    .APB13PENABLE(    APB13PENABLE   ),
    .APB13PWRITE(     APB13PWRITE    ),
    .APB13PSTRB(      APB13PSTRB     ),
    .APB13PPROT(      APB13PPROT     ),
    .APB13PWDATA(     APB13PWDATA    ),
    .APB13PSEL(       APB13PSEL      ),
    .APB13PRDATA(     APB13PRDATA    ),
    .APB13PREADY(     APB13PREADY    ),
    .APB13PSLVERR(    APB13PSLVERR   ),
`endif
`ifdef GOWIN_APB14_SUPPORT
    .APB14PADDR(      APB14PADDR     ),
    .APB14PENABLE(    APB14PENABLE   ),
    .APB14PWRITE(     APB14PWRITE    ),
    .APB14PSTRB(      APB14PSTRB     ),
    .APB14PPROT(      APB14PPROT     ),
    .APB14PWDATA(     APB14PWDATA    ),
    .APB14PSEL(       APB14PSEL      ),
    .APB14PRDATA(     APB14PRDATA    ),
    .APB14PREADY(     APB14PREADY    ),
    .APB14PSLVERR(    APB14PSLVERR   ),
`endif
`ifdef GOWIN_APB15_SUPPORT
    .APB15PADDR(      APB15PADDR     ),
    .APB15PENABLE(    APB15PENABLE   ),
    .APB15PWRITE(     APB15PWRITE    ),
    .APB15PSTRB(      APB15PSTRB     ),
    .APB15PPROT(      APB15PPROT     ),
    .APB15PWDATA(     APB15PWDATA    ),
    .APB15PSEL(       APB15PSEL      ),
    .APB15PRDATA(     APB15PRDATA    ),
    .APB15PREADY(     APB15PREADY    ),
    .APB15PSLVERR(    APB15PSLVERR   ),
`endif


`ifdef GOWIN_APB16_SUPPORT
    .APB16PADDR(      APB16PADDR     ),
    .APB16PENABLE(    APB16PENABLE   ),
    .APB16PWRITE(     APB16PWRITE    ),
    .APB16PSTRB(      APB16PSTRB     ),
    .APB16PPROT(      APB16PPROT     ),
    .APB16PWDATA(     APB16PWDATA    ),
    .APB16PSEL(       APB16PSEL      ),
    .APB16PRDATA(     APB16PRDATA    ),
    .APB16PREADY(     APB16PREADY    ),
    .APB16PSLVERR(    APB16PSLVERR   ),
`endif
`ifdef GOWIN_TIMER0_SUPPORT
    .TIMER0EXTIN          (TIMER0EXTIN),
`endif 
`ifdef GOWIN_TIMER1_SUPPORT
    .TIMER1EXTIN          (TIMER1EXTIN),
`endif
`ifdef GOWIN_UART0_SUPPORT
    .UART0RXD             (UART0RXD),
    .UART0TXD             (UART0TXD),
`endif
`ifdef GOWIN_UART1_SUPPORT
    .UART1RXD             (UART1RXD),
    .UART1TXD             (UART1TXD),
`endif
`ifdef GOWIN_WDOG_SUPPORT
    .WDOGRESREQ           (wdog_reset_req),
`endif
//GPIO
`ifdef GOWIN_GPIO_SUPPORT
    `ifdef GPIO_IOBUF_EN
    .GPIO(GPIO),
    `else
    .GPIOIN(GPIOIN),
    .GPIOOUT(GPIOOUT),
    .GPIOOUTEN(GPIOOUTEN),
    `endif
`endif
`ifdef GOWIN_SD_SUPPORT
     .SD_spiclk(SD_SPICLK),
     .SD_clk(SD_CLK),				
     .SD_cs(SD_CS),
     .SD_datain(SD_DATAIN),
     .SD_dataout(SD_DATAOUT),
     .SD_card_init_led(SD_CARD_INIT), //0:ok
`endif
`ifdef GOWIN_I2C_SUPPORT
`ifdef I2C_IOBUF_EN
     .SCL(SCL),
     .SDA(SDA),
     `else
     .SCLIN(SCLIN),
     .SCLOUT(SCLOUT),
     .SCLOUTEN(SCLOUTEN),
     .SDAIN(SDAIN),
     .SDAOUT(SDAOUT),
     .SDAOUTEN(SDAOUTEN),
     `endif
`endif
`ifdef GOWIN_SPI_SUPPORT
     .MOSI(MOSI),   // SPI output
     .MISO(MISO),   // SPI input
     .SCLK(SCLK),   // SPI clock
     .NSS(NSS),
`endif
`ifdef GOWIN_CAN_SUPPORT
     .CAN_RX(CAN_RX),
     .CAN_TX(CAN_TX),
`endif
`ifdef GOWIN_INTERNET_SUPPORT
  `ifdef RGMII_IF
     .RGMII_TXC(RGMII_TXC),
     .RGMII_TX_CTL(RGMII_TX_CTL),
     .RGMII_TXD(RGMII_TXD),
     .RGMII_RXC(RGMII_RXC),  
     .RGMII_RX_CTL(RGMII_RX_CTL),    
     .RGMII_RXD(RGMII_RXD),
     .GTX_CLK(GTX_CLK),
  `endif
  `ifdef GMII_IF
     .GMII_RX_CLK(GMII_RX_CLK),
     .GMII_RX_DV(GMII_RX_DV),
     .GMII_RXD(GMII_RXD),
     .GMII_RX_ER(GMII_RX_ER),
     .GTX_CLK(GTX_CLK),
     .GMII_GTX_CLK(GMII_GTX_CLK),         
     .GMII_TXD(GMII_TXD),        
     .GMII_TX_EN(GMII_TX_EN),          
     .GMII_TX_ER(GMII_TX_ER),          
  `endif
  `ifdef MII_IF
     .MII_RX_CLK(MII_RX_CLK),       
     .MII_RXD(MII_RXD),      
     .MII_RX_DV(MII_RX_DV),        
     .MII_RX_ER(MII_RX_ER),        
     .MII_TX_CLK(MII_TX_CLK),       
     .MII_TXD(MII_TXD),     
     .MII_TX_EN(MII_TX_EN),       
     .MII_TX_ER(MII_TX_ER),       
     .MII_COL(MII_COL),
     .MII_CRS(MII_CRS),
  `endif
     .MDC(MDC),
     .MDIO(MDIO),
`endif
`ifdef GOWIN_SPI_FLASH_SUPPORT
     .FLASH_SPI_HOLDN(FLASH_SPI_HOLDN),
     .FLASH_SPI_CSN(FLASH_SPI_CSN),
     .FLASH_SPI_MISO(FLASH_SPI_MISO),
     .FLASH_SPI_MOSI(FLASH_SPI_MOSI),
     .FLASH_SPI_WPN(FLASH_SPI_WPN),
     .FLASH_SPI_CLK(FLASH_SPI_CLK),
`endif

`ifdef GOWIN_DDR3_SUPPORT
  .DDR_CLK(DDR_CLK_I),
  `ifndef ARORA_GW2A
  .DDR_STOP_O(DDR_STOP_O),          //
  `endif
  .DDR_MEM_CLK(DDR_MEM_CLK_I),      //
  .DDR_LOCK(DDR_LOCK_I),            //
  .DDR_RSTN(DDR_RSTN_I),            //
  .DDR_ADDR_O(DDR_ADDR_O),
  .DDR_BA_O(DDR_BA_O)  ,
  .DDR_CS_N_O(DDR_CS_N_O),
  .DDR_RAS_N_O(DDR_RAS_N_O),
  .DDR_CAS_N_O(DDR_CAS_N_O),
  .DDR_WE_N_O(DDR_WE_N_O),
  .DDR_CLK_O(DDR_CLK_O),
  .DDR_CLK_N_O(DDR_CLK_N_O),
  .DDR_CKE_O(DDR_CKE_O),
  .DDR_ODT_O(DDR_ODT_O),
  .DDR_RESET_N_O(DDR_RESET_N_O),
  .DDR_DQM_O(DDR_DQM_O),
  .DDR_DQ_IO(DDR_DQ_IO),
  .DDR_DQS_IO(DDR_DQS_IO),
  .DDR_DQS_N_IO(DDR_DQS_N_IO),
  .DDR_INIT_COMPLETE_O(DDR_INIT_COMPLETE_O),
`endif
`ifdef GOWIN_PSRAM_SUPPORT
    .led_init           (init_calib),
	.O_psram_ck         (O_psram_ck),
	.O_psram_ck_n       (O_psram_ck_n),
	.O_psram_cs_n       (O_psram_cs_n),
	.O_psram_reset_n    (O_psram_reset_n),    
	.IO_psram_dq        (IO_psram_dq),
	.IO_psram_rwds      (IO_psram_rwds),
    .psram_base_clk     (psram_ref_clk),
    .psram_memory_clk   (psram_memory_clk), 
`endif
    .SYSRESETn(SYSRESETn),
    .PORESETn(hwRstn) 
 );   
`ifdef GOWIN_APB1_SUPPORT
  assign APB1PCLK = HCLK;
  assign APB1PRESET = SYSRESETn;
`endif

`ifdef GOWIN_APB2_SUPPORT
  assign APB2PCLK = HCLK;
  assign APB2PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB3_SUPPORT
  assign APB3PCLK = HCLK;
  assign APB3PRESET = SYSRESETn;
`endif

`ifdef GOWIN_APB4_SUPPORT
  assign APB4PCLK = HCLK;
assign APB4PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB5_SUPPORT
  assign APB5PCLK = HCLK;
  assign APB5PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB6_SUPPORT
  assign APB6PCLK = HCLK;
  assign APB6PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB7_SUPPORT
  assign APB7PCLK = HCLK;
  assign APB7PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB8_SUPPORT
  assign APB8PCLK = HCLK;
  assign APB8PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB9_SUPPORT
  assign APB9PCLK = HCLK;
  assign APB9PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB10_SUPPORT
  assign APB10PCLK = HCLK;
  assign APB10PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB11_SUPPORT
  assign APB11PCLK = HCLK;
  assign APB11PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB12_SUPPORT
  assign APB12PCLK = HCLK;
  assign APB12PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB13_SUPPORT
  assign APB13PCLK = HCLK;
  assign APB13PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB14_SUPPORT
  assign APB14PCLK = HCLK;
  assign APB14PRESET = SYSRESETn;
`endif
`ifdef GOWIN_APB15_SUPPORT
  assign APB15PCLK = HCLK;
  assign APB15PRESET = SYSRESETn;
`endif


`ifdef GOWIN_APB16_SUPPORT
  assign APB16PCLK = HCLK;
  assign APB16PRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB1_SUPPORT
  assign AHB1HCLK = HCLK;
  assign AHB1HRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB2_SUPPORT
  assign AHB2HCLK = HCLK;
  assign AHB2HRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB3_SUPPORT
  assign AHB3HCLK = HCLK;
  assign AHB3HRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB4_SUPPORT
  assign AHB4HCLK = HCLK;
  assign AHB4HRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB5_SUPPORT
  assign AHB5HCLK = HCLK;
  assign AHB5HRESET = SYSRESETn;
`endif
`ifdef GOWIN_AHB6_SUPPORT
  assign AHB6HCLK = HCLK;
  assign AHB6HRESET = SYSRESETn;
`endif
`ifdef CM1_EXTERNAL_FLASH_EN
  assign EXTFLASH0HCLK = HCLK;
  assign EXTFLASH0HRESET = SYSRESETn;
`endif
`ifdef CM1_EXTERNAL_SRAM_EN
  assign EXTSRAM0HCLK = HCLK;
  assign EXTSRAM0HRESET = SYSRESETn;
`endif
`ifdef GOWIN_SD_SUPPORT
  assign SD_CHECKOUT = SD_CHECKIN;
`endif

endmodule
