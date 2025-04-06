`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME(
    clk,
    rstn,
    wr,
    waddr,
    wdata,
    dout,
    out_valid
	);

input clk;
input rstn;
output out_valid;
output [`DOUT_WIDTH-1:0]dout;

input wr;
input [15:0] waddr;
input [31:0] wdata;

`getname(DDS,`MODULE_NAME) DDS(
//DDS DDS(
.clk (clk),
.rstn (rstn),
.wr (wr),
.waddr(waddr),
.wdata (wdata),
.out_valid (out_valid),
.dout (dout)
);

endmodule
