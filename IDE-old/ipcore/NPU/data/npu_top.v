//===========================================================================
//
// File         : npu_top.v
// Description  : NPU top level
// Revision     : V1.0
// Date         : 8/1/2022
// Author       : Embedded RnD of Gowin
//
//===========================================================================

module NPU_Top #(
    parameter                     ADDRWIDTH = 12
  ) (
    //PSRAM interface
    input   wire                  pri_fclk,
    input   wire                  pri_fclk90, 
    output  wire  [1:0]           O_psram_ck,
    output  wire  [1:0]           O_psram_ck_n,
    inout   wire  [1:0]           IO_psram_rwds,
    inout   wire  [15:0]          IO_psram_dq,
    output  wire  [1:0]           O_psram_reset_n,
    output  wire  [1:0]           O_psram_cs_n,
    //SPI-Flash interface
    inout   wire  [3:0]           spi_io,
    output  wire                  spi_clk,
    output  wire                  spi_cs_n,
    //AHB slave interface
    input   wire                  HCLK,       //HCLK
    input   wire                  HRESETn,    //HRESETn
    input   wire                  HSELS,      //HSELS
    input   wire  [ADDRWIDTH-1:0] HADDRS,     //HADDRS
    input   wire  [1:0]           HTRANSS,    //HTRANSS
    input   wire  [2:0]           HSIZES,     //HSIZES
    input   wire                  HWRITES,    //HWRITES
    input   wire                  HREADYS,    //HREADYS
    input   wire  [31:0]          HWDATAS,    //HWDATAS
    output  wire                  HREADYOUTS, //HREADYOUTS
    output  wire                  HRESPS,     //HRESPS
    output  wire  [31:0]          HRDATAS     //HRDATAS
);

  //NPU integration
  npu_integration #(
    .ADDRWIDTH        (ADDRWIDTH            )
  ) u_npu_integration (
    //PSRAM interface
    .pri_fclk         (pri_fclk             ),
    .pri_fclk90       (pri_fclk90           ),
    .O_psram_ck       (O_psram_ck           ),
    .O_psram_ck_n     (O_psram_ck_n         ),
    .IO_psram_rwds    (IO_psram_rwds        ),
    .IO_psram_dq      (IO_psram_dq          ),
    .O_psram_reset_n  (O_psram_reset_n      ),
    .O_psram_cs_n     (O_psram_cs_n         ),
    //SPI-Flash interface
    .spi_io           (spi_io               ),
    .spi_clk          (spi_clk              ),
    .spi_cs_n         (spi_cs_n             ),
    // AHB slave interface
    .HCLK             (HCLK                 ), 
    .HRESETn          (HRESETn              ), 
    .HSELS            (HSELS                ), 
    .HADDRS           (HADDRS               ), 
    .HTRANSS          (HTRANSS              ), 
    .HSIZES           (HSIZES               ), 
    .HWRITES          (HWRITES              ), 
    .HREADYS          (HREADYS              ), 
    .HWDATAS          (HWDATAS              ), 
    .HREADYOUTS       (HREADYOUTS           ), 
    .HRESPS           (HRESPS               ), 
    .HRDATAS          (HRDATAS              )
  );

endmodule
