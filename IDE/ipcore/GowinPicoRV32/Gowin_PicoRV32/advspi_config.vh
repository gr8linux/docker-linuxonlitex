
`ifdef ADVSPI_CONFIG_VH
`else
`define ADVSPI_CONFIG_VH

// --------------------------------------------------------------------------
// Define register port:
//`define ADVSPI_REG

// --------------------------------------------------------------------------
// Define memory access function:
//`define ADVSPI_MEM_SUPPORT

// --------------------------------------------------------------------------
// Define Slave Mode support
// define ADVSPI_SLAVE_SUPPORT to support SPI Slave Mode
// --------------------------------------------------------------------------
//`define ADVSPI_SLAVE_SUPPORT

// --------------------------------------------------------------------------
// The macros below will effect the SPI interfaces of ADVSPI
// define ADVSPI_DUALSPI_SUPPORT to support dual SPI device.
// define ADVSPI_QUADSPI_SUPPORT to support quad and dual SPI device
// --------------------------------------------------------------------------
//`define ADVSPI_DUALSPI_SUPPORT
//`define ADVSPI_QUADSPI_SUPPORT

// --------------------------------------------------------------------------
// Define the depth of TX and RX fifo
// The values must be one of 2, 4, 8, 16 words
// The TX and RX values can be different
// --------------------------------------------------------------------------
`define ADVSPI_TXFIFO_DEPTH_4W
//`define ADVSPI_TXFIFO_DEPTH_8W
`define ADVSPI_RXFIFO_DEPTH_4W
//`define ADVSPI_RXFIFO_DEPTH_8W

// --------------------------------------------------------------------------
// Define the bit number of haddr
// if ADVSPI_ADDR_WIDTH_24 is defined, the haddr will be 24bits.
// if ADVSPI_ADDR_WIDTH_24 is not defined, the haddr will be 32bits.
// --------------------------------------------------------------------------
//`define ADVSPI_ADDR_WIDTH_24

// --------------------------------------------------------------------------
// Define ADVSPI_DIRECT_IO_SUPPORT to support the SPI direct I/O control.
// This macro will cost some area
// --------------------------------------------------------------------------
//`define ADVSPI_DIRECT_IO_SUPPORT

// ------------------------------------------------------------------------------
// Define register default values for MemRdCmd, CS2CLK, CSHT, and SCLKDIV fields
// ------------------------------------------------------------------------------
`define ADVSPI_MEM_RDCMD_DEFAULT	4'd0
`define ADVSPI_CS2CLK_DEFAULT	3'h0
`define ADVSPI_CSHT_DEFAULT		3'h2
`define ADVSPI_SCLKDIV_DEFAULT	8'h1

`endif // ADVSPI_CONFIG_VH

