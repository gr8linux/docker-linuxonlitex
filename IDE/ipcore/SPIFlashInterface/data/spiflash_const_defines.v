
//------------------------
`define CS2CLK_DEFAULT 3'h0 
`define CSHT_DEFAULT 3'h2


//======================================
`ifdef CONST_VH
`else
    `define CONST_VH
    
    
    `ifdef AHB_MEM_SUPPORT
        `define AHBBUS_EXIST
    `elsif REG_AHB
        `define AHBBUS_EXIST
    `endif
    
    `ifndef REG_AHB
        `define APBBUS_EXIST
        `ifndef REG_APB
            `define REG_APB
        `endif
    `endif
    
    `ifdef SPI_ADDR_WIDTH_24
        `define SPI_ADDR_WIDTH	24
    `else
        `define SPI_ADDR_WIDTH	32
    `endif
    
    `define SPI_ADDR_MSB		(`SPI_ADDR_WIDTH - 1)
    
    `ifdef ADDR_WIDTH_24
        `define HADDR_WIDTH 24
    `else
        `define HADDR_WIDTH 32
    `endif
    
    `define HMASTER_BIT 4
    
    `define HSPLIT_BIT (1<<`HMASTER_BIT)
    
    `ifdef AHB_MEM_SUPPORT
        `define MEM_SUPPORT
    `endif
    
    `ifdef QUADSPI_SUPPORT
        `define QUADDUAL_SUPPORT
    `elsif DUALSPI_SUPPORT
        `define QUADDUAL_SUPPORT
    `endif
    
    `define TXFIFO_WIDTH 32
    `define RXFIFO_WIDTH 32
    
    `ifdef TXFIFO_DEPTH_128W
        `define TXFPTR_BITS	8
        `define TXFIFO_DEPTH_INF	4'h6
    `elsif TXFIFO_DEPTH_64W
        `define TXFPTR_BITS	7
        `define TXFIFO_DEPTH_INF	4'h5
    `elsif TXFIFO_DEPTH_32W
        `define TXFPTR_BITS	6
        `define TXFIFO_DEPTH_INF	4'h4
    `elsif TXFIFO_DEPTH_16W
        `define TXFPTR_BITS	5
        `define TXFIFO_DEPTH_INF	4'h3
    `elsif TXFIFO_DEPTH_8W
        `define TXFPTR_BITS	4
        `define TXFIFO_DEPTH_INF	4'h2
    `elsif TXFIFO_DEPTH_4W
        `define TXFPTR_BITS	3
        `define TXFIFO_DEPTH_INF	4'h1
    `else
        `define TXFPTR_BITS	2
        `define TXFIFO_DEPTH_INF	4'h0
    `endif
    
    `define TXFIFO_DEPTH		(1 << (`TXFPTR_BITS - 1))
    
    `ifdef RXFIFO_DEPTH_128W
        `define RXFPTR_BITS	8
        `define RXFIFO_DEPTH_INF	4'h6
    `elsif RXFIFO_DEPTH_64W
        `define RXFPTR_BITS	7
        `define RXFIFO_DEPTH_INF	4'h5
    `elsif RXFIFO_DEPTH_32W
        `define RXFPTR_BITS	6
        `define RXFIFO_DEPTH_INF	4'h4
    `elsif RXFIFO_DEPTH_16W
        `define RXFPTR_BITS	5
        `define RXFIFO_DEPTH_INF	4'h3
    `elsif RXFIFO_DEPTH_8W
        `define RXFPTR_BITS	4
        `define RXFIFO_DEPTH_INF	4'h2
    `elsif RXFIFO_DEPTH_4W
        `define RXFPTR_BITS	3
        `define RXFIFO_DEPTH_INF	4'h1
    `else
        `define RXFPTR_BITS	2
        `define RXFIFO_DEPTH_INF	4'h0
    `endif
    
    `define RXFIFO_DEPTH		(1 << (`RXFPTR_BITS - 1))

`endif
