`include "top_define.vh"
`include "slvs_ec_rx_define.vh"
`include "static_macro_define.vh"

module `module_name 
( 
    input                 i_clk             ,   
    output                o_clk             ,   
    input                 i_rst_n           ,   
    //Configure Register
    input         [ 7:0]  i_sync_symbol     ,
    input         [ 7:0]  i_deskew_symbol   ,
    input         [ 7:0]  i_standby_symbol  ,
    input         [ 3:0]  i_idle_code_k     ,
    input         [31:0]  i_idle_code       ,
    input         [ 7:0]  i_lane_num        ,
    input         [15:0]  i_line_length     ,
    input         [ 7:0]  i_pixel_bit       ,
    `ifdef FEC_ENABLE
    input         [ 1:0]  i_ecc_option      ,
    `endif
    input                 i_crc_option      ,
    input         [ 3:0]  i_baud_grade      ,
    input                 i_config          ,
    input                 i_standby         ,
    input                 i_setup           ,
    input                 i_phy_sync       ,       //
    //Data Input
`ifndef SIM_ENABLE
//    input         [ 1:0]  i_lane0_k     ,
`endif
    input         [87:0]  i_lane0_data     ,       //
`ifdef SLVS_EC_LANE1
    input         [87:0]  i_lane1_data     ,       //
`endif
`ifdef SLVS_EC_LANE2
    input         [87:0]  i_lane2_data     ,       //
`endif
`ifdef SLVS_EC_LANE3
    input         [87:0]  i_lane3_data     ,       //
`endif
`ifdef SLVS_EC_LANE4
    input         [87:0]  i_lane4_data     ,       //
`endif
`ifdef SLVS_EC_LANE5
    input         [87:0]  i_lane5_data     ,       //
`endif
`ifdef SLVS_EC_LANE6
    input         [87:0]  i_lane6_data     ,       //
`endif
`ifdef SLVS_EC_LANE7
    input         [87:0]  i_lane7_data     ,       //
`endif
    //Data Output
    output        [15:0]  o_pixel0         ,       //
    output        [15:0]  o_pixel1         ,       //
    output        [15:0]  o_pixel2         ,       //
    output        [15:0]  o_pixel3         ,       //
    output        [15:0]  o_pixel4         ,       //
    output        [15:0]  o_pixel5         ,       //
    output        [15:0]  o_pixel6         ,       //
    output        [15:0]  o_pixel7         ,       //
    output        [15:0]  o_pixel8         ,       //
    output        [15:0]  o_pixel9         ,       //
    output        [15:0]  o_pixel10        ,       //
    output        [15:0]  o_pixel11        ,       //
    output        [15:0]  o_pixel12        ,       //
    output        [15:0]  o_pixel13        ,       //
    output        [15:0]  o_pixel14        ,       //
    output        [15:0]  o_pixel15        ,       //
    output                o_v_sync         ,       //
    output                o_h_sync         ,       //
    output                o_d_sync         ,       //
    output        [ 7:0]  o_pixel_oe       ,       //
    output                o_link_state     ,       //
    output                o_crc_state      ,        //	

    //test
	input               SLVS_EC_XHS     ,
	input               SLVS_EC_XVS     ,
    output        [15:0]  o_line_number    ,
    output                o_line_valid_rev
);

wire[ 1:0]  w_lane0_k;
wire[15:0]  w_lane0_data;
wire[15:0]  w_lane1_data;
wire[15:0]  w_lane2_data;
wire[15:0]  w_lane3_data;
wire[15:0]  w_lane4_data;
wire[15:0]  w_lane5_data;
wire[15:0]  w_lane6_data;
wire[15:0]  w_lane7_data;

assign o_clk = i_clk;
assign w_lane0_k    = {i_lane0_data[ 8],i_lane0_data[18]};     
assign w_lane0_data = {i_lane0_data[7:0],i_lane0_data[17:10]};  
`ifdef SLVS_EC_LANE1
assign w_lane1_data = {i_lane1_data[7:0],i_lane1_data[17:10]}; 
`endif
`ifdef SLVS_EC_LANE2
assign w_lane2_data = {i_lane2_data[7:0],i_lane2_data[17:10]}; 
`endif
`ifdef SLVS_EC_LANE3
assign w_lane3_data = {i_lane3_data[7:0],i_lane3_data[17:10]}; 
`endif
`ifdef SLVS_EC_LANE4
assign w_lane4_data = {i_lane4_data[7:0],i_lane4_data[17:10]}; 
`endif
`ifdef SLVS_EC_LANE5
assign w_lane5_data = {i_lane5_data[7:0],i_lane5_data[17:10]}; 
`endif
`ifdef SLVS_EC_LANE6
assign w_lane6_data = {i_lane6_data[7:0],i_lane6_data[17:10]};  
`endif
`ifdef SLVS_EC_LANE7
assign w_lane7_data = {i_lane7_data[7:0],i_lane7_data[17:10]}; 
`endif 


`getname(slvs_ec_rx_wrapper,`module_name) slvs_ec_rx_wrapper_inst
//slvs_ec_rx_wrapper slvs_ec_rx_wrapper_inst
( 
    .i_clk              (i_clk            )  
    ,.i_rst_n           (i_rst_n          )
    ,.i_sync_symbol     (i_sync_symbol    )
    ,.i_deskew_symbol   (i_deskew_symbol  )
    ,.i_standby_symbol  (i_standby_symbol )
    ,.i_idle_code_k     (i_idle_code_k    )
    ,.i_idle_code       (i_idle_code      )
    ,.i_crc_option      (i_crc_option     )
    `ifdef FEC_ENABLE                     
    ,.i_ecc_option      (i_ecc_option     )
    `endif                                
    ,.i_lane_num        (i_lane_num       )
    ,.i_line_length     (i_line_length    )
    ,.i_pixel_bit       (i_pixel_bit      )

    ,.i_config          (i_config         )
    ,.i_standby         (i_standby        )
    ,.i_setup           (i_setup          )
    ,.i_phy_sync        (i_phy_sync       )
    ,.i_lane0_k         (w_lane0_k        ) 
    ,.i_lane0_data      (w_lane0_data     )        
    `ifdef SLVS_EC_LANE1
    ,.i_lane1_data      (w_lane1_data     ) 
    `endif
    `ifdef SLVS_EC_LANE2
    ,.i_lane2_data      (w_lane2_data     ) 
    `endif
    `ifdef SLVS_EC_LANE3
    ,.i_lane3_data      (w_lane3_data     ) 
    `endif
    `ifdef SLVS_EC_LANE4
    ,.i_lane4_data      (w_lane4_data     ) 
    `endif
    `ifdef SLVS_EC_LANE5
    ,.i_lane5_data      (w_lane5_data     ) 
    `endif
    `ifdef SLVS_EC_LANE6
    ,.i_lane6_data      (w_lane6_data     ) 
    `endif
    `ifdef SLVS_EC_LANE7
    ,.i_lane7_data      (w_lane7_data     ) 
    `endif
    ,.o_pixel0          (o_pixel0         ) 
    ,.o_pixel1          (o_pixel1         ) 
    ,.o_pixel2          (o_pixel2         ) 
    ,.o_pixel3          (o_pixel3         ) 
    ,.o_pixel4          (o_pixel4         ) 
    ,.o_pixel5          (o_pixel5         ) 
    ,.o_pixel6          (o_pixel6         ) 
    ,.o_pixel7          (o_pixel7         ) 
    ,.o_pixel8          (o_pixel8         ) 
    ,.o_pixel9          (o_pixel9         ) 
    ,.o_pixel10         (o_pixel10        ) 
    ,.o_pixel11         (o_pixel11        ) 
    ,.o_pixel12         (o_pixel12        ) 
    ,.o_pixel13         (o_pixel13        ) 
    ,.o_pixel14         (o_pixel14        ) 
    ,.o_pixel15         (o_pixel15        ) 
    ,.o_v_sync          (o_v_sync         ) 
    ,.o_h_sync          (o_h_sync         ) 
    ,.o_d_sync          (o_d_sync         ) 
    ,.o_phy_standby_dect(                 )
    ,.o_pixel_oe        (o_pixel_oe       ) 
    ,.o_crc_state       (o_crc_state      ) 

    //test
    ,.SLVS_EC_XHS       (SLVS_EC_XHS    )
    ,.SLVS_EC_XVS       (SLVS_EC_XVS    )
    ,.o_line_number     (o_line_number     )
    ,.o_line_valid_rev  (o_line_valid_rev    ) 
);


    
endmodule

