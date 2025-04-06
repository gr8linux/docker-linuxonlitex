`include "mipi_rx_to_dpi_define.v"
`include "static_macro_define.v"

module `module_name #(
    parameter LANE_WIDTH = `LW,
    parameter RGB_DT =`RGB_DATA_WIDTH
) 
(
    input  rstn,
    input  sclk,
    input  [LANE_WIDTH*8 - 1:0] din,
    input  pixclk,
    output [RGB_DT -1:0]pixdata,
    output de  
`ifdef SYNC_EN
   ,output HSYNC
   ,output VSYNC 
`endif
);

`getname(mipi_rx_to_dpi,`module_name) 
//  mipi_rx_to_dpi 
#(
    .LANE_WIDTH(LANE_WIDTH),
    .RGB_DT(RGB_DT))
  u_serial2parallel
  (
    .rstn(rstn),
    .din(din),
    .de(de),
`ifdef SYNC_EN
   .HSYNC(HSYNC),
   .VSYNC(VSYNC),
`endif
    .pixdata(pixdata),
    .pixclk(pixclk),
    .sclk(sclk)
  );

  endmodule