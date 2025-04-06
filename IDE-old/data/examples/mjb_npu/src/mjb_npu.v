//===========================================================================
//
// File         : mjb_npu.v
// Description  : Top level
// Revision     : V1.0
// Date         : 8/1/2022
// Author       : Embedded RnD of Gowin
//
//===========================================================================

module mjb_npu (
  input                         clk12,
  input                         rst_n,

  //SPI-Flash interface
  inout   wire  [3:0]           SPI_IO,
  output  wire                  SCLK,
  output  wire                  NSS,

  //PSRAM interface
  output  wire  [1:0]           O_psram_ck,
  output  wire  [1:0]           O_psram_ck_n,
  inout   wire  [1:0]           IO_psram_rwds,
  output  wire  [1:0]           O_psram_reset_n,
  inout   wire  [15:0]          IO_psram_dq,
  output  wire  [1:0]           O_psram_cs_n,
  
  //I2C camera configuration interface
  inout  wire                   SDA,
  inout  wire                   SCL,
  
  //Camera interface
  input  wire                   VSYNC,
  input  wire                   HREF,
  input  wire [9:0]             PIXDATA,
  output wire                   XCLK,
  input  wire                   PIXCLK,

  //DVI output interface
  output [3:0] dout,

  //UART0 output interface
  output wire                   UART0TXD,

  //LED
  //LED[0] : system running indicator
  //LED[1]~[7] : GoAI running indicator
  output wire [7:0]             LED
);

  parameter p_scale = 1; //camera image scaling for HDMI output.  0=no scale, 1=2x, 2=4x, etc.

  localparam                    VRAM_DATA_LOC   = 12'h800;
  localparam                    VREG_DATA_LOC   = 4'h9;
  localparam                    CONVOLUTOR_LOC  = 4'hA;
  localparam                    VREG_INFER_LOC  = 4'hB;

  wire                          convolutor_hsel;
  wire                          convolutor_hreadyout;
  wire          [31:0]          convolutor_hrdata;
  wire                          convolutor_hresp;
  
  wire                          buf_read;
  wire                          buf_sel;
  wire          [31:0]          buf_hrdata;

  wire                          reg_sel;
  reg                           q_reg_sel, q_convolutor_hsel, q_sw_sel;
  reg                           q_reset_n;
  reg                           m1_im_read_en;
  
  wire                          reg_write;
  wire          [31:0]          iAHB2HRDATA;
  wire                          iAHB2HREADYOUT;
  wire                          iAHB2HRESP;
  wire          [1:0]           oAHB2HTRANS;
  wire          [2:0]           oAHB2HBURST;
  wire          [3:0]           oAHB2HPROT;
  wire          [2:0]           oAHB2HSIZE;
  wire                          oAHB2HWRITE;
  wire                          oAHB2HMASTLOCK;
  wire          [31:0]          oAHB2HADDR;
  wire          [31:0]          oAHB2HWDATA;
  wire                          oAHB2HSEL;

  wire                          spi_cs_n;
  wire                          spi_clk;

  wire                          clk_40M;
  
  wire                          pri_fclk;
  wire                          pri_fclk90;

  wire                          pll_lock;
  
  wire                          reset_buf;
  wire                          reset_n;

  wire                          clkout;
  
  assign                        iAHB2HRDATA     = (q_convolutor_hsel) ? convolutor_hrdata     : q_reg_sel ? {31'd0, m1_im_read_en} : buf_hrdata;
  assign                        iAHB2HREADYOUT  = (  convolutor_hsel) ? convolutor_hreadyout  : !buf_read;
  assign                        iAHB2HRESP      = (  convolutor_hsel) ? convolutor_hresp      : 1'b0;   // Slave response signal  0=OKAY, 1=ERROR

  assign                        buf_sel         = oAHB2HSEL && (oAHB2HADDR[15:12] == VRAM_DATA_LOC);
  assign                        reg_sel         = oAHB2HSEL && (oAHB2HADDR[15:12] == VREG_DATA_LOC);
  assign                        buf_read        = buf_sel && (!oAHB2HWRITE);
  assign                        reg_write       = reg_sel && (oAHB2HWRITE);
  assign                        convolutor_hsel = oAHB2HSEL && (oAHB2HADDR[15:12] == CONVOLUTOR_LOC);

  assign                        clkout          = clk_40M;
  assign                        reset_buf       = rst_n;
  assign                        reset_n         = reset_buf & pll_lock;
  
  assign                        O_hpram_reset_n = 1'b1;

  assign                        SCLK            = spi_clk;
  assign                        NSS             = spi_cs_n;  
  
  always @(posedge clkout or negedge reset_n)
    begin
      if(!reset_n) 
        q_reset_n <= 0;
      else
        q_reset_n <= 1;
    end

  always @(posedge clkout or negedge reset_n)
    begin
      if(!reset_n) 
        begin
          q_reg_sel         <= 0;
          q_convolutor_hsel <= 0;
        end
      else 
        begin
          q_reg_sel         <= reg_sel;
          q_convolutor_hsel <= convolutor_hsel;      
        end
    end

  always @ (posedge clkout or negedge reset_n)
    begin
      if (!reset_n)
        m1_im_read_en <= 1'b0;
      else
      if (reg_write)
        m1_im_read_en <= oAHB2HWDATA[0];
      else
        m1_im_read_en <= m1_im_read_en;
    end

  //rPLL
  Gowin_rPLL u_Gowin_rPLL (
    .clkout   (pri_fclk   ),  //output clkout 80MHz
    .clkoutp  (pri_fclk90 ),
    .lock     (pll_lock   ),  //output lock
    .clkoutd  (XCLK       ),  //output clkoutd
    .clkin    (clk12      )   //input clkin 12MHz
  );

  //CLKDIV
  CLKDIV u_CLKDIV (
    .HCLKIN (pri_fclk ),    //80MHz
    .RESETN (pll_lock ), 
    .CALIB  (1'b0     ), 
    .CLKOUT (clk_40M  )     //40MHz
  );
  defparam u_CLKDIV.DIV_MODE = "2" ;

  //Gowin_EMPU_M1
  wire [7:0] GPIOOUT;
  wire [15:0] GPIOOUTEN;
  wire LOCKUP;

  Gowin_EMPU_M1_Top u_Gowin_EMPU_M1_Top (
    .LOCKUP         (LOCKUP),
    .GPIOIN         (16'h0000),
    .GPIOOUT        ({GPIOOUT,LED}),
    .GPIOOUTEN      (GPIOOUTEN),
    .UART0RXD       (1'b0),
    .UART0TXD       (UART0TXD),
    .SCL 			(SCL),
    .SDA			(SDA),
    .AHB1HRDATA     (iAHB2HRDATA),
    .AHB1HREADYOUT  (iAHB2HREADYOUT),
    .AHB1HRESP      (iAHB2HRESP),
    .AHB1HTRANS     (oAHB2HTRANS),
    .AHB1HBURST     (oAHB2HBURST),
    .AHB1HPROT      (oAHB2HPROT),
    .AHB1HSIZE      (oAHB2HSIZE),
    .AHB1HWRITE     (oAHB2HWRITE),
    .AHB1HMASTLOCK  (oAHB2HMASTLOCK),
    .AHB1HADDR      (oAHB2HADDR),
    .AHB1HWDATA     (oAHB2HWDATA),
    .AHB1HSEL       (oAHB2HSEL),    
    .HCLK           (clk_40M),
    .hwRstn         (reset_n)
  );
 
  //Down scaler
  wire wren;  
  wire [7:0] luma; 
  wire [15:0] addr;
   
  downscaler u_downscaler (
    .reset_n          (reset_n ),
	.PIXCLK           (PIXCLK  ),
	
	.VSYNC            (VSYNC   ),
	.HREF             (HREF    ),
	.PIXDATA          (PIXDATA ),
	
	.wren             (wren    ),
	.addr             (addr    ),
	.luma             (luma    )
  );

  //Image input buffer
  tflite_img_buf u_tflite_img_buf (
    .dout   (buf_hrdata       ),
    .clka   (PIXCLK           ),
    .cea    (wren             ),
    .reseta (1'b0             ),
    .clkb   (clkout           ),
    .ceb    (1'b1             ),
    .resetb (1'b0             ),
    .oce    (1'b1             ),
    .ada    (addr      [15:1] ),
    .din    (luma             ),
    .adb    (oAHB2HADDR[15:2] ) 
  );

  //NPU top
  NPU_Top u_NPU_Top (
    //PSRAM interface
    .pri_fclk         (pri_fclk             ),
    .pri_fclk90       (pri_fclk90           ),
    .O_psram_ck       (O_psram_ck           ),
    .O_psram_ck_n     (O_psram_ck_n         ),
    .IO_psram_rwds    (IO_psram_rwds        ),
    .IO_psram_dq      (IO_psram_dq          ),
    .O_psram_reset_n  (                     ),
    .O_psram_cs_n     (O_psram_cs_n         ),
    //SPI-Flash interface
    .spi_io           (SPI_IO               ),
    .spi_clk          (spi_clk              ),
    .spi_cs_n         (spi_cs_n             ),
    // AHB slave interface
    .HCLK             (clk_40M              ), 
    .HRESETn          (q_reset_n            ), 
    .HSELS            (convolutor_hsel      ), 
    .HADDRS           (oAHB2HADDR[11:0] & 12'h0FF), 
    .HTRANSS          (oAHB2HTRANS          ), 
    .HSIZES           (oAHB2HSIZE           ), 
    .HWRITES          (oAHB2HWRITE          ), 
    .HREADYS          (1'b1                 ), 
    .HWDATAS          (oAHB2HWDATA          ), 
    .HREADYOUTS       (convolutor_hreadyout ), 
    .HRESPS           (convolutor_hresp     ), 
    .HRDATAS          (convolutor_hrdata    )
  );


  //DVI TX
  wire clk_10bit;   // 74.25 MHz data clock
  wire bitclk;      // 371.25 MHz serializer bit clock
  wire [23:0] rgb;
  wire [15:0] fb_addr /* synthesis syn_keep=1 */;
  wire [15:0] pix_addr, line_addr;
  wire [7:0] fb_data;
  wire [23:0] pdata;
  
  //rPLL
  GW_rPLL_27 u_GW_PLL_27
  (
    .clkout(bitclk),  //output clkout
    .lock(pll_lock2), //output lock
    .clkin(clk12)     //input clkin
  );

  //RGB565 to luminance
  reg  [15:0]  q_href_cnt;
  reg  [15:0]  q_addr_cnt;
  reg  [7:0]   q_pixdata;
  wire [7:0]   q_luma;
  wire         q_wren;
  wire [14:0]  q_addr;
  
  always @(posedge PIXCLK or negedge reset_n)
  begin
    if(!reset_n) begin
         q_href_cnt <= 0;
         q_addr_cnt <= 0;
         q_pixdata  <= 0;
    end
    else begin
         q_href_cnt <=  HREF  ? q_href_cnt+1 : 0;
         q_addr_cnt <= !VSYNC ? 0 : HREF ? q_addr_cnt+1 : q_addr_cnt;
         q_pixdata  <= PIXDATA[9:2];
    end
  end
    
  assign q_wren = HREF & (!q_addr_cnt[0]);
  assign q_luma = {PIXDATA[9:5],3'b000}/3 + {PIXDATA[4:2],q_pixdata[7:5],2'b00}/2 + {q_pixdata[4:0],3'b000}/9;  //r/3 + g/2 + b/9
  assign q_addr = q_addr_cnt[15:1];
  
  //Image output buffer    
  frame_buffer u_frame_buffer (
    .douta (         ),
    .doutb (fb_data  ),
    .clka  (PIXCLK   ),
    .ocea  (1        ),
    .cea   (1        ),
    .reseta(~reset_n ),
    .wrea  (q_wren   ),
    .clkb  (clk_10bit),
    .oceb  (1        ),
    .ceb   (1        ),
    .resetb(~reset_n ),
    .wreb  (0        ),
    .ada   (q_addr   ),
    .dina  (q_luma   ),
    .adb   (fb_addr  ),
    .dinb  (8'h00    )
  );

  //Color bar generator
  colorbar_generator u_colorbar_generator (
    .clk	(clk_10bit	),
    .reset_n(reset_n	),
    .vsync	(vsync),
    .hsync	(hsync),
    .de		(de),
    .RGB	(rgb),
    .pix_addr(pix_addr),
    .line_addr(line_addr)		
  );
	
  assign fb_addr = (pix_addr[15:p_scale]<160) && (line_addr[15:p_scale]<120) ? pix_addr[15:p_scale] + (line_addr[15:p_scale]*160) : 0;
  assign pdata = (fb_addr==0) ? rgb : {fb_data,fb_data,fb_data};
    
  wire [23:0] rgb2dvi;
  reg [3:0] text_sel;
  reg text_en;
    
  always @(posedge clk_10bit or negedge reset_n) 
    if(!reset_n) begin
      text_en		<= 0; 
      text_sel	<= 0;
    end
    else begin
      text_en		<= (VREG_INFER_LOC==oAHB2HADDR[15:12]) && (8'h00==oAHB2HADDR[7:0]) && oAHB2HWRITE && oAHB2HSEL;
	  text_sel	<= text_en ? oAHB2HWDATA[3:0] : text_sel;
	end

  //Text overlay   
  text_overlay u_text_overlay (
    .clk(clk_10bit),
    .rstn(reset_n),
    // input video stream
    .hs(hsync),
    .vs(vsync),
    .de(de),
    .rgb(pdata),
    // text selector
    // 0 - empty label
    // 1 - 'Airplane'
    // 2 - 'Car'
    // 3 - 'Bird'
    // 4 - 'Cat'
    // 5 - 'Deer'
    // 6 - 'Dog'
    // 7 - 'Frog'
    // 8 - 'Horse'
    // 9 - 'Ship'
    // 10 - 'Truck'
    // 11 - 'Smile'
    // 12 - 'Person'
    // others - reserved
    .text_option(text_sel),
    // output video stream
    .hs_o(hs2dvi),
    .vs_o(vs2dvi),
    .de_o(de2dvi),
    .rgb_o(rgb2dvi) 
  );

  //DVI TX
  DVI_out u_DVI_out (
    .bitclk         (bitclk),
    .byte_clk       (clk_10bit),
	.DE		(de2dvi),
	.HSYNC	(hs2dvi),		
	.VSYNC	(vs2dvi),
	.RGB	(rgb2dvi),
    .reset_n          (reset_n),
    .dout(dout)
  );

endmodule
