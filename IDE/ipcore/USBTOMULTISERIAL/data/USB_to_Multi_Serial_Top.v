`include "top_define.vh"
`include "static_macro_define.vh"
`include "usb_to_multi_serial_defines.vh"

`timescale 1 ps / 1 ps
module `module_name (
    input   wire        phy_clk,        // word-rate clock
    input   wire        rst_n ,       // async reset

    `ifdef SERIAL_UART
        // UART INTERFACE
    output             UART_TXD   ,
    input              UART_RXD   ,
    output             UART_RTS   , // when UART_RTS = 0, UART This Device Ready to receive.
    input              UART_CTS   , // when UART_CTS = 0, UART Opposite Device Ready to receive.
        // UART Control Reg
    input  [31:0]      BAUD_RATE ,
    input  [7:0]       PARITY_BIT,
    input  [7:0]       STOP_BIT  ,
    input  [7:0]       DATA_BITS ,
        // USER DATA INPUT INTERFACE
    input   [15:0]     TX_DATA    , //
    input              TX_DATA_VAL, // when TX_DATA_VAL = 1, data on TX_DATA will be transmit, DATA_SEND can set to 1 only when BUSY = 0
    output             TX_BUSY    , // when BUSY = 1 transiever is busy, you must not set DATA_SEND to 1
        // USER FIFO CONTROL INTERFACE
    output  [15:0]     RX_DATA    , //
    output             RX_DATA_VAL,  //
    `endif

    `ifdef SERIAL_JTAG
    input             usb_jtag_tck, 
    input             usb_jtag_rx_dval      ,
    input  [ 7:0]     usb_jtag_rx_data        ,
    output            usb_jtag_in_rdy    ,
    output            usb_jtag_tx_dval        ,
    output [ 7:0]     usb_jtag_tx_data        ,

    output  jtag_clk,      // JTAG Test clock
    output  jtag_tms,      // JTAG Test Mode Select
    input   jtag_tdo,      // JTAG Serial Input Data
    output  jtag_tdi,       // JTAG Serial Output Data
    `endif

    `ifdef SERIAL_SPI
    input             usb_spi_clk      ,
    input             usb_spi_rx_dval  ,
    input      [ 7:0] usb_spi_rx_data  ,
    output reg        usb_spi_tx_dval  ,
    output reg [ 7:0] usb_spi_tx_data  ,
    output            spi_clk_o    ,
    output            spi_cs_n_o   ,
    inout             spi_miso_io  ,
    inout             spi_mosi_io  ,
    `endif

    `ifdef SERIAL_I2C
    input           usb_i2c_clk    ,
    input           usb_i2c_rx_dval,
    input   [7:0]   usb_i2c_rx_data,
    output          usb_i2c_tx_dval,
    output  [7:0]   usb_i2c_tx_data,
    inout   I2C1_SCL,
    inout   I2C1_SDA,
    `endif
    output          status_o
);

//usb_to_multi_serial_wrapper usb_to_multi_serial_wrapper_u0
`getname(usb_to_multi_serial_wrapper,`module_name) usb_to_multi_serial_wrapper_u0
(
     .phy_clk       (phy_clk )//clock
    ,.rst_n         (rst_n   )//reset

    `ifdef SERIAL_UART
    ,.UART_TXD   (UART_TXD      )
    ,.UART_RXD   (UART_RXD      )//
    ,.UART_RTS   () // when UART_RTS = 0, UART This Device Ready to receive.
    ,.UART_CTS   (UART_CTS      ) // when UART_CTS = 0, UART Opposite Device Ready to receive.
    ,.BAUD_RATE  (BAUD_RATE     )
    ,.PARITY_BIT (PARITY_BIT    )
    ,.STOP_BIT   (STOP_BIT      )
    ,.DATA_BITS  (DATA_BITS     )
    ,.TX_DATA    (TX_DATA       ) //
    //,.TX_DATA_VAL(uart1_tx_data_val&uart1_en) // when TX_DATA_VAL = 1, data on TX_DATA will be transmit, DATA_SEND can set to 1 only when BUSY = 0
    ,.TX_DATA_VAL(TX_DATA_VAL   ) // when TX_DATA_VAL = 1, data on TX_DATA will be transmit, DATA_SEND can set to 1 only when BUSY = 0
    ,.TX_BUSY    (TX_BUSY       ) // when BUSY = 1 transiever is busy, you must not set DATA_SEND to 1
    ,.RX_DATA    (RX_DATA       ) //
    ,.RX_DATA_VAL(RX_DATA_VAL   ) //
    `endif

    `ifdef SERIAL_JTAG
    ,.usb_jtag_tck    (usb_jtag_tck    ) 
    ,.usb_jtag_rx_dval(usb_jtag_rx_dval)
    ,.usb_jtag_rx_data(usb_jtag_rx_data) 
    ,.usb_jtag_in_rdy (usb_jtag_in_rdy ) 
    ,.usb_jtag_tx_dval(usb_jtag_tx_dval)
    ,.usb_jtag_tx_data(usb_jtag_tx_data)
    ,.jtag_clk        (jtag_clk        ) 
    ,.jtag_tms        (jtag_tms        ) 
    ,.jtag_tdo        (jtag_tdo        ) 
    ,.jtag_tdi        (jtag_tdi        ) 
    `endif

    `ifdef SERIAL_SPI
    ,.usb_spi_clk      (usb_spi_clk    )
    ,.usb_spi_rx_dval  (usb_spi_rx_dval)
    ,.usb_spi_rx_data  (usb_spi_rx_data)
    ,.usb_spi_tx_dval  (usb_spi_tx_dval)
    ,.usb_spi_tx_data  (usb_spi_tx_data)
    ,.spi_clk_o        (spi_clk_o      )
    ,.spi_cs_n_o       (spi_cs_n_o     )
    ,.spi_miso_io      (spi_miso_io    )
    ,.spi_mosi_io      (spi_mosi_io    )
    `endif

    `ifdef SERIAL_I2C
    ,.usb_i2c_clk      (usb_i2c_clk    )
    ,.usb_i2c_rx_dval  (usb_i2c_rx_dval)           
    ,.usb_i2c_rx_data  (usb_i2c_rx_data)           
    ,.usb_i2c_tx_dval  (usb_i2c_tx_dval)           
    ,.usb_i2c_tx_data  (usb_i2c_tx_data)           
    ,.I2C1_SCL         (I2C1_SCL)
    ,.I2C1_SDA         (I2C1_SDA)
    `endif
    ,.status_o         (status_o)
);

endmodule