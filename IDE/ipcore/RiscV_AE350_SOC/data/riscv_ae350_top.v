//********************************************************************
// <File>     : riscv_ae350_top.v
// <Author>   : GOWIN EMB
// <Function> : RiscV AE350_SOC top level
// <Version>  : 1.2
// <Date>     : 2024
//********************************************************************


// Includes ----------------------------------------------------------
`include "riscv_ae350_config.v"


// Definitions -------------------------------------------------------

module RiscV_AE350_SOC_Top
(
    // Embedded instruction memory (SPI Flash) signals
`ifdef AE350_EMB_SPIFLASH_EN
    // SPI Flash signals
    inout   wire            FLASH_SPI_CSN,      // Flash spi chip select
    inout   wire            FLASH_SPI_MISO,     // Flash spi master in and slave out
    inout   wire            FLASH_SPI_MOSI,     // Flash spi master out and slave in
    inout   wire            FLASH_SPI_CLK,      // Flash spi clock
    inout   wire            FLASH_SPI_HOLDN,    // Flash spi hold
    inout   wire            FLASH_SPI_WPN,      // Flash spi write protection
`ifdef AE350_APB_FLASH_EN
    // SPI Flash APB bus register signals
    input   wire            FR_PCLK,            // Flash register APB clock
    input   wire            FR_PRESETN,         // Flash register APB resetn
    input   wire    [31:0]  FR_PADDR,           // Flash register APB address
    input   wire            FR_PENABLE,         // Flash register APB enable
    output  wire    [31:0]  FR_PRDATA,          // Flash register APB read data
    output  wire            FR_PREADY,          // Flash register APB ready
    input   wire            FR_PSEL,            // Flash register APB select
    input   wire    [31:0]  FR_PWDATA,          // Flash register APB write data
    input   wire            FR_PWRITE,          // Flash register APB write control
`endif  // AE350_APB_FLASH_EN
`endif  // AE350_EMB_SPIFLASH_EN

    // Extended instruction memory (Customized) signals
`ifdef AE350_EXT_I_MEM_EN
    // ROM AHB bus signals
    input   wire    [31:0]  ROM_HRDATA,         // ROM AHB read data
    input   wire            ROM_HREADY,         // ROM AHB ready input
    input   wire            ROM_HRESP,          // ROM AHB response
    output  wire    [31:0]  ROM_HADDR,          // ROM AHB address
    output  wire    [1:0]   ROM_HTRANS,         // ROM AHB trans control
    output  wire            ROM_HWRITE,         // ROM AHB write control
    output  wire            ROM_HCLK,           // ROM AHB clock
    output  wire            ROM_HRSTN,          // ROM AHB reset_n
`endif  // AE350_EXT_I_MEM_EN

    // Embedded data memory (DDR3) signals
`ifdef AE350_EMB_DDR3_EN
    // DDR3 signals
    input   wire            DDR3_MEMORY_CLK,    // DDR3 memory clock
    input   wire            DDR3_CLK_IN,        // DDR3 clock in
    input   wire            DDR3_RSTN,          // DDR3 reset input, 0 is reset state
    input   wire            DDR3_LOCK,          // DDR3 lock
    output  wire            DDR3_STOP,          // DDR3 stop
    output  wire            DDR3_INIT,          // DDR3 initialized completed
    output  wire    [2:0]   DDR3_BANK,          // DDR3 bank address
    output  wire            DDR3_CS_N,          // DDR3 chip select
    output  wire            DDR3_RAS_N,         // DDR3 row address select
    output  wire            DDR3_CAS_N,         // DDR3 column address select
    output  wire            DDR3_WE_N,          // DDR3 write enable
    output  wire            DDR3_CK,            // DDR3 clock
    output  wire            DDR3_CK_N,          // DDR3 clock differential
    output  wire            DDR3_CKE,           // DDR3 clock enable
    output  wire            DDR3_RESET_N,       // DDR3 reset output for users, 1 is reset state
    output  wire            DDR3_ODT,           // DDR3 on-die termination
    output  wire    [13:0]  DDR3_ADDR,          // DDR3 row and column address
    output  wire    [1:0]   DDR3_DM,            // DDR3 data mask
    inout   wire    [15:0]  DDR3_DQ,            // DDR3 data input and output
    inout   wire    [1:0]   DDR3_DQS,           // DDR3 data select
    inout   wire    [1:0]   DDR3_DQS_N,         // DDR3 data select differential
`ifdef AE350_DDR3_PL_RW_EN
    // DDR3 R/W in PL
    // Write channel
    input   wire                                clk_lane4,          // Clock
    input   wire    [`DDR3_RW_ADDR_WIDTH-1 : 0] addr_lane4,         // Address
    input	wire    [3:0]                       wr_mask_lane4,      // Mask
    input   wire    [`DDR3_RW_DATA_WIDTH-1 : 0] wr_data_lane4,      // Data
    input   wire                                wr_en_lane4,        // Enable
    input   wire                                wr_go_lane4,        // Control
    input   wire    [7 : 0]                     burstcount_lane4,   // Burst amout
    output  wire                                wr_wait_lane4,      // Wait
    output	reg                                 wr_done_lane4,      // Done
    // Read channel
    input   wire                                clk_lane5,          // Clock
    input   wire    [`DDR3_RW_ADDR_WIDTH-1 : 0] addr_lane5,         // Address
    input   wire                                rd_en_lane5,        // Enable
    input   wire                                rd_go_lane5,        // Control
    input   wire    [7 : 0]                     burstcount_lane5,   // Burst amout
    output  wire                                rd_valid_lane5,     // Valid
    output  wire    [`DDR3_RW_DATA_WIDTH-1 : 0] rd_data_lane5,      // Data
    output	reg                                 rd_rdy_lane5,       // Ready
`endif  // AE350_DDR3_PL_RW_EN
`endif  // AE350_EMB_DDR3_EN

    // Extended data memory (Customized) signals
`ifdef AE350_EXT_D_MEM_EN
    // DDR AHB bus signals
    input   wire    [63:0]  DDR_HRDATA,         // DDR/SRAM AHB read data
    input   wire            DDR_HREADY,         // DDR/SRAM AHB ready input
    input   wire            DDR_HRESP,          // DDR/SRAM AHB response
    output  wire    [31:0]  DDR_HADDR,          // DDR/SRAM AHB access address
    output  wire    [2:0]   DDR_HBURST,         // DDR/SRAM AHB burst
    output  wire    [3:0]   DDR_HPROT,          // DDR/SRAM AHB prot
    output  wire    [2:0]   DDR_HSIZE,          // DDR/SRAM AHB size
    output  wire    [1:0]   DDR_HTRANS,         // DDR/SRAM AHB trans control
    output  wire    [63:0]  DDR_HWDATA,         // DDR/SRAM AHB write data
    output  wire            DDR_HWRITE,         // DDR/SRAM AHB write control
    output  wire            DDR_HCLK,           // DDR/SRAM AHB clock
    output  wire            DDR_HRSTN,          // DDR/SRAM AHB reset_n
`endif  // AE350_EXT_D_MEM_EN

    // Debug JTAG signals
    input   wire            TCK_IN,             // JTAG tck clock input
    input   wire            TMS_IN,             // JTAG tms input
    input   wire            TRST_IN,            // JTAG trst input
    input   wire            TDI_IN,             // JTAG tdi input
    output  wire            TDO_OUT,            // JTAG tdo output
    output  wire            TDO_OE,             // JTAG tdo_oe output

    // Extended interupt signals
`ifdef AE350_EXT_INT_EN
    input   wire    [15:0]  EXT_INT,            // 16 user interrupts input
`endif  // AE350_EXT_INT_EN

    // Extended AHB slave signals
    // MCU is master
`ifdef AE350_EXT_AHB_SLAVE_EN
    input   wire    [31:0]  EXTS_HRDATA,        // Extended AHB slave read data
    input   wire            EXTS_HREADYIN,      // Extended AHB slave ready input
    input   wire            EXTS_HRESP,         // Extended AHB slave read response
    output  wire    [31:0]  EXTS_HADDR,         // Extended AHB slave address
    output  wire    [2:0]   EXTS_HBURST,        // Extended AHB slave burst
    output  wire    [3:0]   EXTS_HPROT,         // Extended AHB slave prot
    output  wire            EXTS_HSEL,          // Extended AHB slave select
    output  wire    [2:0]   EXTS_HSIZE,         // Extended AHB slave size
    output  wire    [1:0]   EXTS_HTRANS,        // Extended AHB slave trans control
    output  wire    [31:0]  EXTS_HWDATA,        // Extended AHB slave write data
    output  wire            EXTS_HWRITE,        // Extended AHB slave write control
    output  wire            EXTS_HCLK,          // Extended AHB slave clock
    output  wire            EXTS_HRSTN,         // Extended AHB slave reset_n
`endif  // AE350_EXT_AHB_SLAVE_EN

    // Extended AHB master signals
    // MCU is slave
`ifdef AE350_EXT_AHB_MASTER_EN
    input   wire    [31:0]  EXTM_HADDR,         // Extended AHB master address
    input   wire    [2:0]   EXTM_HBURST,        // Extended AHB master burst
    input   wire    [3:0]   EXTM_HPROT,         // Extended AHB master prot
    input   wire            EXTM_HREADY,        // Extended AHB master ready input
    input   wire            EXTM_HSEL,          // Extended AHB master select
    input   wire    [2:0]   EXTM_HSIZE,         // Extended AHB master size
    input   wire    [1:0]   EXTM_HTRANS,        // Extended AHB master trans control
    input   wire    [63:0]  EXTM_HWDATA,        // Extended AHB master write data
    input   wire            EXTM_HWRITE,        // Extended AHB master write control
    output  wire    [63:0]  EXTM_HRDATA,        // Extended AHB master read data
    output  wire            EXTM_HREADYOUT,     // Extended AHB master ready output
    output  wire            EXTM_HRESP,         // Extended AHB master response
`endif  // AE350_EXT_AHB_MASTER_EN

    // Extended APB slave signals
`ifdef AE350_EXT_APB_SLAVE_EN
    input   wire    [31:0]  APB_PRDATA,         // Extended APB slave read data
    input   wire            APB_PREADY,         // Extended APB slave ready input
    input   wire            APB_PSLVERR,        // Extended APB slave slverr
    output  wire    [31:0]  APB_PADDR,          // Extended APB slave address
    output  wire            APB_PENABLE,        // Extended APB slave enable control
    output  wire            APB_PSEL,           // Extended APB slave select
    output  wire    [31:0]  APB_PWDATA,         // Extended APB slave write data
    output  wire            APB_PWRITE,         // Extended APB slave write control
    output  wire    [2:0]   APB_PPROT,          // Extended APB slave prot
    output  wire    [3:0]   APB_PSTRB,          // Extended APB slave strb
    output  wire            APB_PCLK,           // Extended APB slave clock
    output  wire            APB_PRSTN,          // Extended APB slave reset_n
`endif  // AE350_EXT_APB_SLAVE_EN

    // Extended DMA signals
`ifdef AE350_EXT_DMA_EN
    input   wire    [7:0]   DMA_REQ,            // DMA requests input
    output  wire    [7:0]   DMA_ACK,            // DMA ack output
`endif  // AE350_EXT_DMA_EN

    // Peripheral SPI signals
`ifdef AE350_APB_SPI_EN
`ifdef AE350_SPI_IOPORT_EN
    // IO port type
    inout   wire            SPI_HOLDN,          // SPI holdn
    inout   wire            SPI_WPN,            // SPI wpn
    inout   wire            SPI_CLK,            // SPI clk
    inout   wire            SPI_CSN,            // SPI csn
    inout   wire            SPI_MISO,           // SPI miso
    inout   wire            SPI_MOSI,           // SPI mosi
`else
    input   wire            SPI_HOLDN_IN,       // SPI holdn_in
    input   wire            SPI_WPN_IN,         // SPI wpn_in
    input   wire            SPI_CLK_IN,         // SPI clk_in
    input   wire            SPI_CSN_IN,         // SPI csn_in
    input   wire            SPI_MISO_IN,        // SPI miso_in
    input   wire            SPI_MOSI_IN,        // SPI mosi_in
    output  wire            SPI_HOLDN_OUT,      // SPI holdn_out
    output  wire            SPI_HOLDN_OE,       // SPI holdn_out enable
    output  wire            SPI_WPN_OUT,        // SPI wpn_out
    output  wire            SPI_WPN_OE,         // SPI wpn_out enable
    output  wire            SPI_CLK_OUT,        // SPI clk_out
    output  wire            SPI_CLK_OE,         // SPI clk_out enable
    output  wire            SPI_CSN_OUT,        // SPI csn_out
    output  wire            SPI_CSN_OE,         // SPI csn_out enable
    output  wire            SPI_MISO_OUT,       // SPI miso_out
    output  wire            SPI_MISO_OE,        // SPI miso_out enable
    output  wire            SPI_MOSI_OUT,       // SPI mosi_out
    output  wire            SPI_MOSI_OE,        // SPI mosi_out enable
`endif  // AE350_SPI_IOPORT_EN
`endif  // AE350_APB_SPI_EN

    // Peripheral I2C signals
`ifdef AE350_APB_I2C_EN
`ifdef AE350_I2C_IOPORT_EN
    // IO port type
    inout   wire            I2C_SCL,            // I2C SCL
    inout   wire            I2C_SDA,            // I2C SDA
`else
    input   wire            I2C_SCL_IN,         // I2C SCL input
    input   wire            I2C_SDA_IN,         // I2C SDA input
    output  wire            I2C_SCL_OUT,        // I2C SCL output
    output  wire            I2C_SDA_OUT,        // I2C SDA output
`endif  // AE350_I2C_IOPORT_EN
`endif  // AE350_APB_I2C_EN

    // Peripheral UART1 signals
`ifdef AE350_APB_UART1_EN
    output  wire            UART1_TXD,          // UART1 txd
    output  wire            UART1_RTSN,         // UART1 rtsn
    input   wire            UART1_RXD,          // UART1 rxd
    input   wire            UART1_CTSN,         // UART1 ctsn
    input   wire            UART1_DSRN,         // UART1 dsrn
    input   wire            UART1_DCDN,         // UART1 dcdn
    input   wire            UART1_RIN,          // UART1 rin
    output  wire            UART1_DTRN,         // UART1 dtrn
    output  wire            UART1_OUT1N,        // UART1 out1n
    output  wire            UART1_OUT2N,        // UART1 out2n
`endif  // AE350_APB_UART1_EN

    // Peripheral UART2 signals
`ifdef AE350_APB_UART2_EN
    output  wire            UART2_TXD,          // UART2 txd
    output  wire            UART2_RTSN,         // UART2 rtsn
    input   wire            UART2_RXD,          // UART2 rxd
    input   wire            UART2_CTSN,         // UART2 ctsn
    input   wire            UART2_DCDN,         // UART2 dcdn
    input   wire            UART2_DSRN,         // UART2 dsrn
    input   wire            UART2_RIN,          // UART2 rin
    output  wire            UART2_DTRN,         // UART2 dtrn
    output  wire            UART2_OUT1N,        // UART2 out1n
    output  wire            UART2_OUT2N,        // UART2 out2n
`endif  // AE350_APB_UART2_EN

    // Peripheral PIT/PWM signals
`ifdef AE350_APB_PIT_EN
`ifdef AE350_PWM_CH_0
    output  wire            CH0_PWM,            // PWM channel 0 output
    output  wire            CH0_PWMOE,          // PWM channel 0 output enable
`endif  // AE350_PWM_CH_0
`ifdef AE350_PWM_CH_1
    output  wire            CH1_PWM,            // PWM channel 1 output
    output  wire            CH1_PWMOE,          // PWM channel 1 output enable
`endif  // AE350_PWM_CH_1
`ifdef AE350_PWM_CH_2
    output  wire            CH2_PWM,            // PWM channel 2 output
    output  wire            CH2_PWMOE,          // PWM channel 2 output enable
`endif  // AE350_PWM_CH_2
`ifdef AE350_PWM_CH_3
    output  wire            CH3_PWM,            // PWM channel 3 output
    output  wire            CH3_PWMOE,          // PWM channel 3 output enable
`endif  // AE350_PWM_CH_3
`endif  // AE350_APB_PIT_EN

    // Peripheral GPIO signals
`ifdef AE350_APB_GPIO_EN
`ifdef AE350_GPIO_IOPORT_EN
    // GPIO IO port type
    inout   wire    [31:0]  GPIO,               // GPIO
`else
    input   wire    [31:0]  GPIO_IN,            // GPIO input
    output  wire    [31:0]  GPIO_OE,            // GPIO output enable
    output  wire    [31:0]  GPIO_OUT,           // GPIO output
`endif  // AE350_GPIO_IOPORT_EN
`endif  // AE350_APB_GPIO_EN

    // Peripheral SMU signals
`ifdef AE350_APB_SMU_EN
    output  wire            CORE0_WFI_MODE,     // CPU going into WFI mode, posedge is WFI valid
    output  wire            RTC_WAKEUP,         // Output to wake up RTC clock, 1 is wake up
`endif  // AE350_APB_SMU_EN

    // AE350 clock signals
    input   wire            CORE_CLK,           // CPU core clock, up to 800MHz, dedicated clock path
    input   wire            DDR_CLK,            // DDR bus clock in, up to 250MHz
    input   wire            AHB_CLK,            // AHB bus clock in, up to 250MHz
    input   wire            APB_CLK,            // APB bus clock in, up to 250MHz
    input   wire            RTC_CLK,            // RTC clock input, this clock should be alive while CPU waiting for wake up

    // AE350 reset signals
    input   wire            POR_RSTN,           // CPU core power on reset input, 0 is reset state
    input   wire            HW_RSTN             // Hardware reset input, 0 is reset state
);


// RiscV_AE350_SOC instantiation
RiscV_AE350_SOC u_RiscV_AE350_SOC
(
    // Embedded instruction memory (SPI Flash) signals
`ifdef AE350_EMB_SPIFLASH_EN
    // SPI Flash signals 
    .FLASH_SPI_CSN(FLASH_SPI_CSN),
    .FLASH_SPI_MISO(FLASH_SPI_MISO),
    .FLASH_SPI_MOSI(FLASH_SPI_MOSI),
    .FLASH_SPI_CLK(FLASH_SPI_CLK),
    .FLASH_SPI_HOLDN(FLASH_SPI_HOLDN),
    .FLASH_SPI_WPN(FLASH_SPI_WPN),
`ifdef AE350_APB_FLASH_EN
    // SPI Flash APB bus register signals
    .FR_PCLK(FR_PCLK),
    .FR_PRESETN(FR_PRESETN),
    .FR_PADDR(FR_PADDR),
    .FR_PENABLE(FR_PENABLE),
    .FR_PRDATA(FR_PRDATA),
    .FR_PREADY(FR_PREADY),
    .FR_PSEL(FR_PSEL),
    .FR_PWDATA(FR_PWDATA),
    .FR_PWRITE(FR_PWRITE),
`endif  // AE350_APB_FLASH_EN
`endif  // AE350_EMB_SPIFLASH_EN

    // Extended instruction memory (Customized) signals
`ifdef AE350_EXT_I_MEM_EN
    // ROM AHB bus signals
    .ROM_HRDATA(ROM_HRDATA),
    .ROM_HREADY(ROM_HREADY),
    .ROM_HRESP(ROM_HRESP),
    .ROM_HADDR(ROM_HADDR),
    .ROM_HTRANS(ROM_HTRANS),
    .ROM_HWRITE(ROM_HWRITE),
    .ROM_HCLK(ROM_HCLK),
    .ROM_HRSTN(ROM_HRSTN),
`endif  // AE350_EXT_I_MEM_EN

    // Embedded data memory (DDR3) signals
`ifdef AE350_EMB_DDR3_EN
    // DDR3 signals
    .DDR3_MEMORY_CLK(DDR3_MEMORY_CLK),
    .DDR3_CLK_IN(DDR3_CLK_IN),
    .DDR3_RSTN(DDR3_RSTN),
    .DDR3_LOCK(DDR3_LOCK),
    .DDR3_STOP(DDR3_STOP),
    .DDR3_INIT(DDR3_INIT),
    .DDR3_BANK(DDR3_BANK),
    .DDR3_CS_N(DDR3_CS_N),
    .DDR3_RAS_N(DDR3_RAS_N),
    .DDR3_CAS_N(DDR3_CAS_N),
    .DDR3_WE_N(DDR3_WE_N),
    .DDR3_CK(DDR3_CK),
    .DDR3_CK_N(DDR3_CK_N),
    .DDR3_CKE(DDR3_CKE),
    .DDR3_RESET_N(DDR3_RESET_N),
    .DDR3_ODT(DDR3_ODT),
    .DDR3_ADDR(DDR3_ADDR),
    .DDR3_DM(DDR3_DM),
    .DDR3_DQ(DDR3_DQ),
    .DDR3_DQS(DDR3_DQS),
    .DDR3_DQS_N(DDR3_DQS_N),
`ifdef AE350_DDR3_PL_RW_EN
    // DDR3 R/W in PL
    .clk_lane4(clk_lane4),              // Write
    .addr_lane4(addr_lane4),
    .wr_mask_lane4(wr_mask_lane4),
    .wr_data_lane4(wr_data_lane4),
    .wr_en_lane4(wr_en_lane4),
    .wr_go_lane4(wr_go_lane4),
    .burstcount_lane4(burstcount_lane4),
    .wr_wait_lane4(wr_wait_lane4),
    .wr_done_lane4(wr_done_lane4),
    .clk_lane5(clk_lane5),              // Read
    .addr_lane5(addr_lane5),
    .rd_en_lane5(rd_en_lane5),
    .rd_go_lane5(rd_go_lane5),
    .burstcount_lane5(burstcount_lane5), 
    .rd_valid_lane5(rd_valid_lane5),
    .rd_data_lane5(rd_data_lane5),
    .rd_rdy_lane5(rd_rdy_lane5),
`endif  // AE350_DDR3_PL_RW_EN
`endif  // AE350_EMB_DDR3_EN

    // Extended data memory (Customized) signals
`ifdef AE350_EXT_D_MEM_EN
    // DDR AHB bus signals
    .DDR_HRDATA(DDR_HRDATA),
    .DDR_HREADY(DDR_HREADY),
    .DDR_HRESP(DDR_HRESP),
    .DDR_HADDR(DDR_HADDR),
    .DDR_HBURST(DDR_HBURST),
    .DDR_HPROT(DDR_HPROT),
    .DDR_HSIZE(DDR_HSIZE),
    .DDR_HTRANS(DDR_HTRANS),
    .DDR_HWDATA(DDR_HWDATA),
    .DDR_HWRITE(DDR_HWRITE),
    .DDR_HCLK(DDR_HCLK),
    .DDR_HRSTN(DDR_HRSTN),
`endif  // AE350_EXT_D_MEM_EN

    // Debug JTAG signals
    .TCK_IN(TCK_IN),
    .TMS_IN(TMS_IN),
    .TRST_IN(TRST_IN),
    .TDI_IN(TDI_IN),
    .TDO_OUT(TDO_OUT),
    .TDO_OE(TDO_OE),

    // Extended interupt signals
`ifdef AE350_EXT_INT_EN
    .EXT_INT(EXT_INT),
`endif  // AE350_EXT_INT_EN

    // Extended AHB slave signals
`ifdef AE350_EXT_AHB_SLAVE_EN
    .EXTS_HRDATA(EXTS_HRDATA),
    .EXTS_HREADYIN(EXTS_HREADYIN),
    .EXTS_HRESP(EXTS_HRESP),
    .EXTS_HADDR(EXTS_HADDR),
    .EXTS_HBURST(EXTS_HBURST),
    .EXTS_HPROT(EXTS_HPROT),
    .EXTS_HSEL(EXTS_HSEL),
    .EXTS_HSIZE(EXTS_HSIZE),
    .EXTS_HTRANS(EXTS_HTRANS),
    .EXTS_HWDATA(EXTS_HWDATA),
    .EXTS_HWRITE(EXTS_HWRITE),
    .EXTS_HCLK(EXTS_HCLK),
    .EXTS_HRSTN(EXTS_HRSTN),
`endif  // AE350_EXT_AHB_SLAVE_EN

    // Extended AHB master signals
`ifdef AE350_EXT_AHB_MASTER_EN
    .EXTM_HADDR(EXTM_HADDR),
    .EXTM_HBURST(EXTM_HBURST),
    .EXTM_HPROT(EXTM_HPROT),
    .EXTM_HREADY(EXTM_HREADY),
    .EXTM_HSEL(EXTM_HSEL),
    .EXTM_HSIZE(EXTM_HSIZE),
    .EXTM_HTRANS(EXTM_HTRANS),
    .EXTM_HWDATA(EXTM_HWDATA),
    .EXTM_HWRITE(EXTM_HWRITE),
    .EXTM_HRDATA(EXTM_HRDATA),
    .EXTM_HREADYOUT(EXTM_HREADYOUT),
    .EXTM_HRESP(EXTM_HRESP),
`endif  // AE350_EXT_AHB_MASTER_EN

    // Extended APB slave signals
`ifdef AE350_EXT_APB_SLAVE_EN
    .APB_PRDATA(APB_PRDATA),
    .APB_PREADY(APB_PREADY),
    .APB_PSLVERR(APB_PSLVERR),
    .APB_PADDR(APB_PADDR),
    .APB_PENABLE(APB_PENABLE),
    .APB_PSEL(APB_PSEL),
    .APB_PWDATA(APB_PWDATA),
    .APB_PWRITE(APB_PWRITE),
    .APB_PPROT(APB_PPROT),
    .APB_PSTRB(APB_PSTRB),
    .APB_PCLK(APB_PCLK),
    .APB_PRSTN(APB_PRSTN),
`endif  // AE350_EXT_APB_SLAVE_EN

    // Extended DMA signals
`ifdef AE350_EXT_DMA_EN
    .DMA_REQ(DMA_REQ),
    .DMA_ACK(DMA_ACK),
`endif  // AE350_EXT_DMA_EN

    // Peripheral SPI signals
`ifdef AE350_APB_SPI_EN
`ifdef AE350_SPI_IOPORT_EN
    // IO port type
    .SPI_HOLDN(SPI_HOLDN),
    .SPI_WPN(SPI_WPN),
    .SPI_CLK(SPI_CLK),
    .SPI_CSN(SPI_CSN),
    .SPI_MISO(SPI_MISO),
    .SPI_MOSI(SPI_MOSI),
`else
    .SPI_HOLDN_IN(SPI_HOLDN_IN),
    .SPI_WPN_IN(SPI_WPN_IN),
    .SPI_CLK_IN(SPI_CLK_IN),
    .SPI_CSN_IN(SPI_CSN_IN),
    .SPI_MISO_IN(SPI_MISO_IN),
    .SPI_MOSI_IN(SPI_MOSI_IN),
    .SPI_HOLDN_OUT(SPI_HOLDN_OUT),
    .SPI_HOLDN_OE(SPI_HOLDN_OE),
    .SPI_WPN_OUT(SPI_WPN_OUT),
    .SPI_WPN_OE(SPI_WPN_OE),
    .SPI_CLK_OUT(SPI_CLK_OUT),
    .SPI_CLK_OE(SPI_CLK_OE),
    .SPI_CSN_OUT(SPI_CSN_OUT),
    .SPI_CSN_OE(SPI_CSN_OE),
    .SPI_MISO_OUT(SPI_MISO_OUT),
    .SPI_MISO_OE(SPI_MISO_OE),
    .SPI_MOSI_OUT(SPI_MOSI_OUT),
    .SPI_MOSI_OE(SPI_MOSI_OE),
`endif  // AE350_SPI_IOPORT_EN
`endif  // AE350_APB_SPI_EN

    // Peripheral I2C signals
`ifdef AE350_APB_I2C_EN
`ifdef AE350_I2C_IOPORT_EN
    // IO port type
    .I2C_SCL(I2C_SCL),
    .I2C_SDA(I2C_SDA),
`else
    .I2C_SCL_IN(I2C_SCL_IN),
    .I2C_SDA_IN(I2C_SDA_IN),
    .I2C_SCL_OUT(I2C_SCL_OUT),
    .I2C_SDA_OUT(I2C_SDA_OUT),
`endif  // AE350_I2C_IOPORT_EN
`endif  // AE350_APB_I2C_EN

    // Peripheral UART1 signals
`ifdef AE350_APB_UART1_EN
    .UART1_TXD(UART1_TXD),
    .UART1_RTSN(UART1_RTSN),
    .UART1_RXD(UART1_RXD),
    .UART1_CTSN(UART1_CTSN),
    .UART1_DSRN(UART1_DSRN),
    .UART1_DCDN(UART1_DCDN),
    .UART1_RIN(UART1_RIN),
    .UART1_DTRN(UART1_DTRN),
    .UART1_OUT1N(UART1_OUT1N),
    .UART1_OUT2N(UART1_OUT2N),
`endif  // AE350_APB_UART1_EN

    // Peripheral UART2 signals
`ifdef AE350_APB_UART2_EN
    .UART2_TXD(UART2_TXD),
    .UART2_RTSN(UART2_RTSN),
    .UART2_RXD(UART2_RXD),
    .UART2_CTSN(UART2_CTSN),
    .UART2_DCDN(UART2_DCDN),
    .UART2_DSRN(UART2_DSRN),
    .UART2_RIN(UART2_RIN),
    .UART2_DTRN(UART2_DTRN),
    .UART2_OUT1N(UART2_OUT1N),
    .UART2_OUT2N(UART2_OUT2N),
`endif  // AE350_APB_UART2_EN

    // Peripheral PIT/PWM signals
`ifdef AE350_APB_PIT_EN
`ifdef AE350_PWM_CH_0
    .CH0_PWM(CH0_PWM),
    .CH0_PWMOE(CH0_PWMOE),
`endif  // AE350_PWM_CH_0
`ifdef AE350_PWM_CH_1
    .CH1_PWM(CH1_PWM),
    .CH1_PWMOE(CH1_PWMOE),
`endif  // AE350_PWM_CH_1
`ifdef AE350_PWM_CH_2
    .CH2_PWM(CH2_PWM),
    .CH2_PWMOE(CH2_PWMOE),
`endif  // AE350_PWM_CH_2
`ifdef AE350_PWM_CH_3
    .CH3_PWM(CH3_PWM),
    .CH3_PWMOE(CH3_PWMOE),
`endif  // AE350_PWM_CH_3
`endif  // AE350_APB_PIT_EN

    // Peripheral GPIO signals
`ifdef AE350_APB_GPIO_EN
`ifdef AE350_GPIO_IOPORT_EN
    // GPIO IO port type
    .GPIO(GPIO),
`else
    .GPIO_IN(GPIO_IN),
    .GPIO_OE(GPIO_OE),
    .GPIO_OUT(GPIO_OUT),
`endif  // AE350_GPIO_IOPORT_EN
`endif  // AE350_APB_GPIO_EN

    // Peripheral SMU signals
`ifdef AE350_APB_SMU_EN
    .CORE0_WFI_MODE(CORE0_WFI_MODE),
    .RTC_WAKEUP(RTC_WAKEUP),
`endif  // AE350_APB_SMU_EN

    // AE350 clock signals
    .CORE_CLK(CORE_CLK),
    .DDR_CLK(DDR_CLK),
    .AHB_CLK(AHB_CLK),
    .APB_CLK(APB_CLK),
    .RTC_CLK(RTC_CLK),

    // AE350 reset signals
    .POR_RSTN(POR_RSTN),
    .HW_RSTN(HW_RSTN)
);

endmodule