`ifdef BUILD_LOAD
    `define PROGADDR_RESET_DEF 32'h0200_0000
    `define PROGADDR_IRQ_DEF   32'h0200_0010
`elsif BUILD_BURN
    `define PROGADDR_RESET_DEF 32'h1040_0000
    `define PROGADDR_IRQ_DEF   32'h0200_0010
`elsif BUILD_XIP
    `define PROGADDR_RESET_DEF 32'h1040_0000
    `define PROGADDR_IRQ_DEF   32'h1040_0010
`else
    `define PROGADDR_RESET_DEF 32'h0200_0000
    `define PROGADDR_IRQ_DEF   32'h0200_0010
`endif

`ifdef BUILD_BURN
    `ifndef ADVSPI_MEM_SUPPORT
        `define ADVSPI_MEM_SUPPORT
    `endif
`endif

`ifdef BUILD_XIP
    `ifndef ADVSPI_MEM_SUPPORT
        `define ADVSPI_MEM_SUPPORT
    `endif
`endif

`ifdef ADVSPI_REG
    `ifndef ENABLE_ADVSPI
        `define ENABLE_ADVSPI
    `endif
`endif

`ifdef ADVSPI_MEM_SUPPORT
    `define ADVSPI_REG_AW 28
    `ifndef ENABLE_ADVSPI
        `define ENABLE_ADVSPI
    `endif
`endif

`ifdef ENABLE_WB_UART
    `define ENABLE_WB_SLAVE0
    `define WB_SLAVE0_AW 4
`endif

`ifdef ENABLE_WB_GPIO
    `define ENABLE_WB_SLAVE1
    `define WB_SLAVE1_AW 5
`endif

`ifdef ENABLE_WB_SPI_MASTER
    `define ENABLE_WB_SLAVE2
    `define WB_SLAVE2_AW 8
`endif

`ifdef ENABLE_WB_SPI_SLAVE
    `define ENABLE_WB_SLAVE3
    `define WB_SLAVE3_AW 8
`endif

`ifdef ADVSPI_REG
    `define ENABLE_WB_SLAVE4
    `define WB_SLAVE4_AW 8
`endif

`ifdef ENABLE_WB_I2C
    `define ENABLE_WB_SLAVE5
    `define WB_SLAVE5_AW 5
`endif
