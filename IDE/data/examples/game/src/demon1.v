
`timescale 1ns/1ps

module Demon1(
  clka,
  addra,
  din,
  douta
);

input clka;
input [3 : 0] addra;
input [11 : 0] din;
output [0 : 0] douta;
reg [11 : 0] mem [2**11-1:0];
reg [11 : 0] douta_reg;
always @(posedge clka)begin
    mem[addra]<=din;
    douta_reg <= mem[addra];
end
assign douta = ^douta_reg;
 

endmodule
