//********************************************************************
//
// <File>     : AHB_to_AHB_16_Bridge_Top.v
// <Author>   : GOWIN
// <Function> : AHB_to_AHB_16_Bridge IP top level
// <Version>  : 1.1
//
//********************************************************************


// Includes ----------------------------------------------------------
`include "config.vh"
`include "const.vh"


// Definitions -------------------------------------------------------

// AHB_to_AHB_16_Bridge_Top
module `module_name
(
`ifdef AHB_SLAVE_0
    // Slave 0
    ds0_hsel,       // Slave 0 select
    ds0_hrdata,     // Slave 0 read data
    ds0_hreadyout,  // Slave 0 ready out
    ds0_hresp,      // Slave 0 response
`endif
`ifdef AHB_SLAVE_1
    // Slave 1
    ds1_hsel,
    ds1_hrdata,
    ds1_hreadyout,
    ds1_hresp,
`endif
`ifdef AHB_SLAVE_2
    // Slave 2
    ds2_hsel,
    ds2_hrdata,
    ds2_hreadyout,
    ds2_hresp,
`endif
`ifdef AHB_SLAVE_3
    // Slave 3
    ds3_hsel,
    ds3_hrdata,
    ds3_hreadyout,
    ds3_hresp,
`endif
`ifdef AHB_SLAVE_4
    // Slave 4
    ds4_hsel,
    ds4_hrdata,
    ds4_hreadyout,
    ds4_hresp,
`endif
`ifdef AHB_SLAVE_5
    // Slave 5
    ds5_hsel,
    ds5_hrdata,
    ds5_hreadyout,
    ds5_hresp,
`endif
`ifdef AHB_SLAVE_6
    // Slave 6
    ds6_hsel,
    ds6_hrdata,
    ds6_hreadyout,
    ds6_hresp,
`endif
`ifdef AHB_SLAVE_7
    // Slave 7
    ds7_hsel,
    ds7_hrdata,
    ds7_hreadyout,
    ds7_hresp,
`endif
`ifdef AHB_SLAVE_8
    // Slave 8
    ds8_hsel,
    ds8_hrdata,
    ds8_hreadyout,
    ds8_hresp,
`endif
`ifdef AHB_SLAVE_9
    // Slave 9
    ds9_hsel,
    ds9_hrdata,
    ds9_hreadyout,
    ds9_hresp,
`endif
`ifdef AHB_SLAVE_10
    // Slave 10
    ds10_hsel,
    ds10_hrdata,
    ds10_hreadyout,
    ds10_hresp,
`endif
`ifdef AHB_SLAVE_11
    // Slave 11
    ds11_hsel,
    ds11_hrdata,
    ds11_hreadyout,
    ds11_hresp,
`endif
`ifdef AHB_SLAVE_12
    // Slave 12
    ds12_hsel,
    ds12_hrdata,
    ds12_hreadyout,
    ds12_hresp,
`endif
`ifdef AHB_SLAVE_13
    // Slave 13
    ds13_hsel,
    ds13_hrdata,
    ds13_hreadyout,
    ds13_hresp,
`endif
`ifdef AHB_SLAVE_14
    // Slave 14
    ds14_hsel,
    ds14_hrdata,
    ds14_hreadyout,
    ds14_hresp,
`endif
`ifdef AHB_SLAVE_15
    // Slave 15
    ds15_hsel,
    ds15_hrdata,
    ds15_hreadyout,
    ds15_hresp,
`endif
    hclk,
    hresetn,
    us_haddr,
    us_hsel,
    us_htrans,
    us_hrdata,
    us_hready,
    us_hreadyout,
    us_hresp,
    ds_hready
);


`ifdef AHB_SLAVE_0
output                      ds0_hsel;
input [`AHBDEC_DATA_MSB:0]  ds0_hrdata;
input                       ds0_hreadyout;
input                       ds0_hresp;
`endif
`ifdef AHB_SLAVE_1
output                      ds1_hsel;
input [`AHBDEC_DATA_MSB:0]  ds1_hrdata;
input                       ds1_hreadyout;
input                       ds1_hresp;
`endif
`ifdef AHB_SLAVE_2
output                      ds2_hsel;
input [`AHBDEC_DATA_MSB:0]  ds2_hrdata;
input                       ds2_hreadyout;
input                       ds2_hresp;
`endif
`ifdef AHB_SLAVE_3
output                      ds3_hsel;
input [`AHBDEC_DATA_MSB:0]  ds3_hrdata;
input                       ds3_hreadyout;
input                       ds3_hresp;
`endif
`ifdef AHB_SLAVE_4
output                      ds4_hsel;
input [`AHBDEC_DATA_MSB:0]  ds4_hrdata;
input                       ds4_hreadyout;
input                       ds4_hresp;
`endif
`ifdef AHB_SLAVE_5
output                      ds5_hsel;
input [`AHBDEC_DATA_MSB:0]  ds5_hrdata;
input                       ds5_hreadyout;
input                       ds5_hresp;
`endif
`ifdef AHB_SLAVE_6
output                      ds6_hsel;
input [`AHBDEC_DATA_MSB:0]  ds6_hrdata;
input                       ds6_hreadyout;
input                       ds6_hresp;
`endif
`ifdef AHB_SLAVE_7
output                      ds7_hsel;
input [`AHBDEC_DATA_MSB:0]  ds7_hrdata;
input                       ds7_hreadyout;
input                       ds7_hresp;
`endif
`ifdef AHB_SLAVE_8
output                      ds8_hsel;
input [`AHBDEC_DATA_MSB:0]  ds8_hrdata;
input                       ds8_hreadyout;
input                       ds8_hresp;
`endif
`ifdef AHB_SLAVE_9
output                      ds9_hsel;
input [`AHBDEC_DATA_MSB:0]  ds9_hrdata;
input                       ds9_hreadyout;
input                       ds9_hresp;
`endif
`ifdef AHB_SLAVE_10
output                      ds10_hsel;
input [`AHBDEC_DATA_MSB:0]  ds10_hrdata;
input                       ds10_hreadyout;
input                       ds10_hresp;
`endif
`ifdef AHB_SLAVE_11
output                      ds11_hsel;
input [`AHBDEC_DATA_MSB:0]  ds11_hrdata;
input                       ds11_hreadyout;
input                       ds11_hresp;
`endif
`ifdef AHB_SLAVE_12
output                      ds12_hsel;
input [`AHBDEC_DATA_MSB:0]  ds12_hrdata;
input                       ds12_hreadyout;
input                       ds12_hresp;
`endif
`ifdef AHB_SLAVE_13
output                      ds13_hsel;
input [`AHBDEC_DATA_MSB:0]  ds13_hrdata;
input                       ds13_hreadyout;
input                       ds13_hresp;
`endif
`ifdef AHB_SLAVE_14
output                      ds14_hsel;
input [`AHBDEC_DATA_MSB:0]  ds14_hrdata;
input                       ds14_hreadyout;
input                       ds14_hresp;
`endif
`ifdef AHB_SLAVE_15
output                      ds15_hsel;
input [`AHBDEC_DATA_MSB:0]  ds15_hrdata;
input                       ds15_hreadyout;
input                       ds15_hresp;
`endif
input                       hclk;
input                       hresetn;
input [`AHBDEC_ADDR_MSB:0]  us_haddr;
input                       us_hsel;
input [1:0]                 us_htrans;
output [`AHBDEC_DATA_MSB:0]	us_hrdata;
input                       us_hready;
output                      us_hreadyout;
output                      us_hresp;
output                      ds_hready;


// AHB_to_AHB_16_Bridge instantiation
`getname(AHB_to_AHB_16_Bridge,`module_name) u_AHB_to_AHB_16_Bridge
(
`ifdef AHB_SLAVE_0
    .ds0_hsel(ds0_hsel),
    .ds0_hrdata(ds0_hrdata),
    .ds0_hreadyout(ds0_hreadyout),
    .ds0_hresp(ds0_hresp),
`endif
`ifdef AHB_SLAVE_1
    .ds1_hsel(ds1_hsel),
    .ds1_hrdata(ds1_hrdata),
    .ds1_hreadyout(ds1_hreadyout),
    .ds1_hresp(ds1_hresp),
`endif
`ifdef AHB_SLAVE_2
    .ds2_hsel(ds2_hsel),
    .ds2_hrdata(ds2_hrdata),
    .ds2_hreadyout(ds2_hreadyout),
    .ds2_hresp(ds2_hresp),
`endif
`ifdef AHB_SLAVE_3
    .ds3_hsel(ds3_hsel),
    .ds3_hrdata(ds3_hrdata),
    .ds3_hreadyout(ds3_hreadyout),
    .ds3_hresp(ds3_hresp),
`endif
`ifdef AHB_SLAVE_4
    .ds4_hsel(ds4_hsel),
    .ds4_hrdata(ds4_hrdata),
    .ds4_hreadyout(ds4_hreadyout),
    .ds4_hresp(ds4_hresp),
`endif
`ifdef AHB_SLAVE_5
    .ds5_hsel(ds5_hsel),
    .ds5_hrdata(ds5_hrdata),
    .ds5_hreadyout(ds5_hreadyout),
    .ds5_hresp(ds5_hresp),
`endif
`ifdef AHB_SLAVE_6
    .ds6_hsel(ds6_hsel),
    .ds6_hrdata(ds6_hrdata),
    .ds6_hreadyout(ds6_hreadyout),
    .ds6_hresp(ds6_hresp),
`endif
`ifdef AHB_SLAVE_7
    .ds7_hsel(ds7_hsel),
    .ds7_hrdata(ds7_hrdata),
    .ds7_hreadyout(ds7_hreadyout),
    .ds7_hresp(ds7_hresp),
`endif
`ifdef AHB_SLAVE_8
    .ds8_hsel(ds8_hsel),
    .ds8_hrdata(ds8_hrdata),
    .ds8_hreadyout(ds8_hreadyout),
    .ds8_hresp(ds8_hresp),
`endif
`ifdef AHB_SLAVE_9
    .ds9_hsel(ds9_hsel),
    .ds9_hrdata(ds9_hrdata),
    .ds9_hreadyout(ds9_hreadyout),
    .ds9_hresp(ds9_hresp),
`endif
`ifdef AHB_SLAVE_10
    .ds10_hsel(ds10_hsel),
    .ds10_hrdata(ds10_hrdata),
    .ds10_hreadyout(ds10_hreadyout),
    .ds10_hresp(ds10_hresp),
`endif
`ifdef AHB_SLAVE_11
    .ds11_hsel(ds11_hsel),
    .ds11_hrdata(ds11_hrdata),
    .ds11_hreadyout(ds11_hreadyout),
    .ds11_hresp(ds11_hresp),
`endif
`ifdef AHB_SLAVE_12
    .ds12_hsel(ds12_hsel),
    .ds12_hrdata(ds12_hrdata),
    .ds12_hreadyout(ds12_hreadyout),
    .ds12_hresp(ds12_hresp),
`endif
`ifdef AHB_SLAVE_13
    .ds13_hsel(ds13_hsel),
    .ds13_hrdata(ds13_hrdata),
    .ds13_hreadyout(ds13_hreadyout),
    .ds13_hresp(ds13_hresp),
`endif
`ifdef AHB_SLAVE_14
    .ds14_hsel(ds14_hsel),
    .ds14_hrdata(ds14_hrdata),
    .ds14_hreadyout(ds14_hreadyout),
    .ds14_hresp(ds14_hresp),
`endif
`ifdef AHB_SLAVE_15
    .ds15_hsel(ds15_hsel),
    .ds15_hrdata(ds15_hrdata),
    .ds15_hreadyout(ds15_hreadyout),
    .ds15_hresp(ds15_hresp),
`endif
    .hclk(hclk),
    .hresetn(hresetn),
    .us_haddr(us_haddr),
    .us_hsel(us_hsel),
    .us_htrans(us_htrans),
    .us_hrdata(us_hrdata),
    .us_hready(us_hready),
    .us_hreadyout(us_hreadyout),
    .us_hresp(us_hresp),
    .ds_hready(ds_hready)
);

endmodule