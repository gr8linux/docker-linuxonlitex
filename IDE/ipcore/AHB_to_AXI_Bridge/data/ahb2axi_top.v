`include "top_define.vh"
`include "static_macro_define.vh"

module `module_name 
(
  //ahb
  AHB_HCLK,
  AHB_HRESETN, 
  AHB_HSEL,
  AHB_HWRITE,
  AHB_HSIZE,
  AHB_HBURST,
  AHB_HPROT,
  AHB_HTRANS,
  AHB_HADDR,
  AHB_HRDATA,
  AHB_HWDATA,  
  AHB_HREADY,
  AHB_HREADYOUT,
  AHB_HRESP,
  //axi
  AXI_ACLK,
  AXI_ARESETN,  
  AXI_ARADDR,
  AXI_ARBURST,
  AXI_ARCACHE,
  AXI_ARLEN,
  AXI_ARLOCK,
  AXI_ARPROT,
  AXI_ARREADY,
  AXI_ARSIZE,
  AXI_ARVALID,
  AXI_AWADDR,
  AXI_AWBURST,
  AXI_AWCACHE,
  AXI_AWLEN,
  AXI_AWLOCK,
  AXI_AWPROT,
  AXI_AWREADY,
  AXI_AWSIZE,
  AXI_AWVALID,
  AXI_BREADY,
  AXI_BRESP,
  AXI_BVALID,
  AXI_RDATA,
  AXI_RLAST,
  AXI_RREADY,
  AXI_RRESP,
  AXI_RVAILD,
  AXI_WDATA,
  AXI_WLAST,
  AXI_WREADY,
  AXI_WSTRB,
  AXI_WVALID
);

parameter ADDR_WIDTH = 32;
parameter DATA_WIDTH = 32;
parameter RDATA_FIFO_DEPTH = 4;
parameter WDATA_FIFO_DEPTH = 4;
localparam WSTRB_WIDTH = DATA_WIDTH / 8;

input                    AHB_HCLK; //ahb slave
input                    AHB_HRESETN; //ahb slave
input                    AHB_HSEL; //ahb slave
input                    AHB_HWRITE; //ahb slave
input              [2:0] AHB_HSIZE; //ahb slave
input              [2:0] AHB_HBURST; //ahb slave
input              [3:0] AHB_HPROT; //ahb slave
input              [1:0] AHB_HTRANS; //ahb slave
input   [ADDR_WIDTH-1:0] AHB_HADDR; //ahb slave
output  [DATA_WIDTH-1:0] AHB_HRDATA; //ahb slave
input   [DATA_WIDTH-1:0] AHB_HWDATA; //ahb slave
input                    AHB_HREADY; //ahb slave,AHB1HREADYMUX from master?
output                   AHB_HREADYOUT; //ahb slave
output                   AHB_HRESP; //ahb slave,2bit?

input                    AXI_ACLK;
input                    AXI_ARESETN;
output  [ADDR_WIDTH-1:0] AXI_ARADDR;
output             [1:0] AXI_ARBURST;
output             [3:0] AXI_ARCACHE;
output             [7:0] AXI_ARLEN;
output                   AXI_ARLOCK;
output             [2:0] AXI_ARPROT;
input                    AXI_ARREADY;
output             [2:0] AXI_ARSIZE;
output                   AXI_ARVALID;
output  [ADDR_WIDTH-1:0] AXI_AWADDR;
output             [1:0] AXI_AWBURST;
output             [3:0] AXI_AWCACHE;
output             [7:0] AXI_AWLEN;
output                   AXI_AWLOCK;
output             [2:0] AXI_AWPROT;
input                    AXI_AWREADY;
output             [2:0] AXI_AWSIZE;
output                   AXI_AWVALID;
output                   AXI_BREADY;
input              [1:0] AXI_BRESP;
input                    AXI_BVALID;
input   [DATA_WIDTH-1:0] AXI_RDATA;
input                    AXI_RLAST;
output                   AXI_RREADY;
input              [1:0] AXI_RRESP;
input                    AXI_RVAILD;
output  [DATA_WIDTH-1:0] AXI_WDATA;
output                   AXI_WLAST;
input                    AXI_WREADY;
output [WSTRB_WIDTH-1:0] AXI_WSTRB;
output                   AXI_WVALID;

 
// Instantiation of AHB_to_AXI4_Bridge IP
`getname(ahb2axi,`module_name) # ( 
  .ADDR_WIDTH(ADDR_WIDTH),
  .DATA_WIDTH(DATA_WIDTH),
  .RDATA_FIFO_DEPTH(RDATA_FIFO_DEPTH),
  .WDATA_FIFO_DEPTH(WDATA_FIFO_DEPTH)
) ahb2axi_inst (
  //ahb
  .haddr(AHB_HADDR),
  .hburst(AHB_HBURST),
  .hprot(AHB_HPROT),
  .hrdata(AHB_HRDATA),
  .hready(AHB_HREADY),
  .hreadyout(AHB_HREADYOUT),
  .hresp(AHB_HRESP),
  .hsel(AHB_HSEL),
  .hsize(AHB_HSIZE),
  .htrans(AHB_HTRANS),
  .hwdata(AHB_HWDATA),
  .hwrite(AHB_HWRITE),
  .hclk(AHB_HCLK),
  .hresetn(AHB_HRESETN),
  //axi
  .araddr(AXI_ARADDR),
  .arburst(AXI_ARBURST),
  .arcache(AXI_ARCACHE),
  .arlen(AXI_ARLEN),
  .arlock(AXI_ARLOCK),
  .arprot(AXI_ARPROT),
  .arready(AXI_ARREADY),
  .arsize(AXI_ARSIZE),
  .arvalid(AXI_ARVALID),
  .awaddr(AXI_AWADDR),
  .awburst(AXI_AWBURST),
  .awcache(AXI_AWCACHE),
  .awlen(AXI_AWLEN),
  .awlock(AXI_AWLOCK),
  .awprot(AXI_AWPROT),
  .awready(AXI_AWREADY),
  .awsize(AXI_AWSIZE),
  .awvalid(AXI_AWVALID),
  .bready(AXI_BREADY),
  .bresp(AXI_BRESP),
  .bvalid(AXI_BVALID),
  .rdata(AXI_RDATA),
  .rlast(AXI_RLAST),
  .rready(AXI_RREADY),
  .rresp(AXI_RRESP),
  .rvalid(AXI_RVAILD),
  .wdata(AXI_WDATA),
  .wlast(AXI_WLAST),
  .wready(AXI_WREADY),
  .wstrb(AXI_WSTRB),
  .wvalid(AXI_WVALID),
  .aclk(AXI_ACLK),
  .aresetn(AXI_ARESETN)
);



 endmodule