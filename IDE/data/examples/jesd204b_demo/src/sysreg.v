

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: guo.zy
// 
// Create Date:    16:38:18 07/09/2018 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module apb2local
(

	input           cfg_clk_i ,
	input           cfg_rstn_i,
	input  [31:0]   cfg_addr_i,
	input           cfg_sel_i ,
	input           cfg_ena_i ,
	input           cfg_wr_i  ,
	output reg [31:0]   cfg_rdata_o,
	input  [31:0]   cfg_wdata_i,
	output reg     cfg_rdy_o,
	input  [3:0]    cfg_strb_i,
	
	output          local_wren_o,
	output [29:0]   local_addr_o,
	output [3 :0]   local_strb_o,
	output          local_rden_o,
	output [31:0]   local_wdat_o,
	input  [31:0]   local_rdat_i,
	input           local_rdat_vld_i,
    input           local_wdat_rdy_i

);
  


assign local_wren_o = cfg_ena_i & cfg_wr_i & cfg_sel_i;
assign local_addr_o = cfg_addr_i[31:2];
assign local_wdat_o = cfg_wdata_i;
assign local_rden_o = cfg_ena_i & (~cfg_wr_i) & cfg_sel_i;
assign local_strb_o = cfg_strb_i;



always @(*)
begin
    if(cfg_ena_i & (~cfg_wr_i) & cfg_sel_i)
		cfg_rdata_o = local_rdat_i ;
	else
		cfg_rdata_o = 0;
end

	
always @(*)
begin
    if(cfg_ena_i & cfg_wr_i & cfg_sel_i)
    begin
        cfg_rdy_o = local_wdat_rdy_i;
    end
	else if(cfg_ena_i & (~cfg_wr_i) & cfg_sel_i)
	begin
        cfg_rdy_o = local_rdat_vld_i;
	end
	else
	begin
		cfg_rdy_o = 0;
	end
end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: guo.zy
// 
// Create Date:    16:38:18 07/09/2018 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module local2reg
(

	input             cfg_clk_i       ,
	input             cfg_rstn_i      ,
	input             local_wren_i    ,
	input [29:0]      local_addr_i    ,
	input [3 :0]      local_strb_i    ,
	input             local_rden_i    ,
	input [31:0]      local_wdat_i    ,
	output reg [31:0] local_rdat_o    ,
	output            local_rdat_vld_o,
	output            local_wdat_rdy_o,
	
////////user signal
	
	output reg [31:0] reg0x0000,output reg [31:0] reg0x0010,input [31:0] mon0x0080,input [31:0] mon0x0090,
	output reg [31:0] reg0x0001,output reg [31:0] reg0x0011,input [31:0] mon0x0081,input [31:0] mon0x0091,
	output reg [31:0] reg0x0002,output reg [31:0] reg0x0012,input [31:0] mon0x0082,input [31:0] mon0x0092,
    output reg [31:0] reg0x0003,output reg [31:0] reg0x0013,input [31:0] mon0x0083,input [31:0] mon0x0093,
    output reg [31:0] reg0x0004,output reg [31:0] reg0x0014,input [31:0] mon0x0084,input [31:0] mon0x0094,
    output reg [31:0] reg0x0005,output reg [31:0] reg0x0015,input [31:0] mon0x0085,input [31:0] mon0x0095,
    output reg [31:0] reg0x0006,output reg [31:0] reg0x0016,input [31:0] mon0x0086,input [31:0] mon0x0096,
    output reg [31:0] reg0x0007,output reg [31:0] reg0x0017,input [31:0] mon0x0087,input [31:0] mon0x0097,
    output reg [31:0] reg0x0008,output reg [31:0] reg0x0018,input [31:0] mon0x0088,input [31:0] mon0x0098,
    output reg [31:0] reg0x0009,output reg [31:0] reg0x0019,input [31:0] mon0x0089,input [31:0] mon0x0099,
    output reg [31:0] reg0x000A,output reg [31:0] reg0x001A,input [31:0] mon0x008A,input [31:0] mon0x009A,
    output reg [31:0] reg0x000B,output reg [31:0] reg0x001B,input [31:0] mon0x008B,input [31:0] mon0x009B,
    output reg [31:0] reg0x000C,output reg [31:0] reg0x001C,input [31:0] mon0x008C,input [31:0] mon0x009C,
    output reg [31:0] reg0x000D,output reg [31:0] reg0x001D,input [31:0] mon0x008D,input [31:0] mon0x009D,
    output reg [31:0] reg0x000E,output reg [31:0] reg0x001E,input [31:0] mon0x008E,input [31:0] mon0x009E,
    output reg [31:0] reg0x000F,output reg [31:0] reg0x001F,input [31:0] mon0x008F,input [31:0] mon0x009F
);
  


/////////////////////////////////////
//user design
/////////////////////////////////////

always @(posedge cfg_clk_i)
    if(local_wren_i && local_wdat_rdy_o)
    begin
        case(local_addr_i[7:0])  
        8'h00: reg0x0000 <= local_wdat_i ;
        8'h01: reg0x0001 <= local_wdat_i ;
        8'h02: reg0x0002 <= local_wdat_i ;
        8'h03: reg0x0003 <= local_wdat_i ;
        8'h04: reg0x0004 <= local_wdat_i ;
        8'h05: reg0x0005 <= local_wdat_i ;
        8'h06: reg0x0006 <= local_wdat_i ;
        8'h07: reg0x0007 <= local_wdat_i ;
        8'h08: reg0x0008 <= local_wdat_i ;
        8'h09: reg0x0009 <= local_wdat_i ;
        8'h0A: reg0x000A <= local_wdat_i ;
        8'h0B: reg0x000B <= local_wdat_i ;
        8'h0C: reg0x000C <= local_wdat_i ;
        8'h0D: reg0x000D <= local_wdat_i ;
        8'h0E: reg0x000E <= local_wdat_i ;
        8'h0F: reg0x000F <= local_wdat_i ;
        8'h10: reg0x0010 <= local_wdat_i ;
        8'h11: reg0x0011 <= local_wdat_i ;
        8'h12: reg0x0012 <= local_wdat_i ;
        8'h13: reg0x0013 <= local_wdat_i ;
        8'h14: reg0x0014 <= local_wdat_i ;
        8'h15: reg0x0015 <= local_wdat_i ;
        8'h16: reg0x0016 <= local_wdat_i ;
        8'h17: reg0x0017 <= local_wdat_i ;
        8'h18: reg0x0018 <= local_wdat_i ;
        8'h19: reg0x0019 <= local_wdat_i ;
        8'h1A: reg0x001A <= local_wdat_i ;
        8'h1B: reg0x001B <= local_wdat_i ;
        8'h1C: reg0x001C <= local_wdat_i ;
        8'h1D: reg0x001D <= local_wdat_i ;
        8'h1E: reg0x001E <= local_wdat_i ;
        8'h1F: reg0x001F <= local_wdat_i ;	
        endcase
    end


assign local_wdat_rdy_o = 1;


reg r_local_rden;
reg [9:0]r_dat_trig;

always @(posedge cfg_clk_i)
begin
    if(~cfg_rstn_i)
    begin
        r_local_rden <= 0;
        r_dat_trig <= 0;  
    end
    else
    begin
        r_local_rden <= local_rden_i;
        r_dat_trig[0]  <= (~r_local_rden) & local_rden_i;
        r_dat_trig[9:1] <= r_dat_trig[8:0];
   end
end




always @(posedge cfg_clk_i)
    if(~cfg_rstn_i)
    begin
        local_rdat_o <= 32'h0;
    end
    else
    begin
        case(local_addr_i[13:0])
		//read and write	
        8'h00: local_rdat_o <= reg0x0000 ;
        8'h01: local_rdat_o <= reg0x0001 ;
        8'h02: local_rdat_o <= reg0x0002 ;
        8'h03: local_rdat_o <= reg0x0003 ;
        8'h04: local_rdat_o <= reg0x0004 ;
        8'h05: local_rdat_o <= reg0x0005 ;
        8'h06: local_rdat_o <= reg0x0006 ;
        8'h07: local_rdat_o <= reg0x0007 ;
        8'h08: local_rdat_o <= reg0x0008 ;
        8'h09: local_rdat_o <= reg0x0009 ;
        8'h0A: local_rdat_o <= reg0x000A ;
        8'h0B: local_rdat_o <= reg0x000B ;
        8'h0C: local_rdat_o <= reg0x000C ;
        8'h0D: local_rdat_o <= reg0x000D ;
        8'h0E: local_rdat_o <= reg0x000E ;
        8'h0F: local_rdat_o <= reg0x000F ;

        8'h10: local_rdat_o <= reg0x0010 ;
        8'h11: local_rdat_o <= reg0x0011 ;
        8'h12: local_rdat_o <= reg0x0012 ;
        8'h13: local_rdat_o <= reg0x0013 ;
        8'h14: local_rdat_o <= reg0x0014 ;
        8'h15: local_rdat_o <= reg0x0015 ;
        8'h16: local_rdat_o <= reg0x0016 ;
        8'h17: local_rdat_o <= reg0x0017 ;
        8'h18: local_rdat_o <= reg0x0018 ;
        8'h19: local_rdat_o <= reg0x0019 ;
        8'h1A: local_rdat_o <= reg0x001A ;
        8'h1B: local_rdat_o <= reg0x001B ;
        8'h1C: local_rdat_o <= reg0x001C ;
        8'h1D: local_rdat_o <= reg0x001D ;
        8'h1E: local_rdat_o <= reg0x001E ;
        8'h1F: local_rdat_o <= reg0x001F ;

        8'h80: local_rdat_o <= mon0x0080 ;
        8'h81: local_rdat_o <= mon0x0081 ;
        8'h82: local_rdat_o <= mon0x0082 ;
        8'h83: local_rdat_o <= mon0x0083 ;
        8'h84: local_rdat_o <= mon0x0084 ;
        8'h85: local_rdat_o <= mon0x0085 ;
        8'h86: local_rdat_o <= mon0x0086 ;
        8'h87: local_rdat_o <= mon0x0087 ;
        8'h88: local_rdat_o <= mon0x0088 ;
        8'h89: local_rdat_o <= mon0x0089 ;
        8'h8A: local_rdat_o <= mon0x008A ;
        8'h8B: local_rdat_o <= mon0x008B ;
        8'h8C: local_rdat_o <= mon0x008C ;
        8'h8D: local_rdat_o <= mon0x008D ;
        8'h8E: local_rdat_o <= mon0x008E ;
        8'h8F: local_rdat_o <= mon0x008F ;

        8'h90: local_rdat_o <= mon0x0090 ;
        8'h91: local_rdat_o <= mon0x0091 ;
        8'h92: local_rdat_o <= mon0x0092 ;
        8'h93: local_rdat_o <= mon0x0093 ;
        8'h94: local_rdat_o <= mon0x0094 ;
        8'h95: local_rdat_o <= mon0x0095 ;
        8'h96: local_rdat_o <= mon0x0096 ;
        8'h97: local_rdat_o <= mon0x0097 ;
        8'h98: local_rdat_o <= mon0x0098 ;
        8'h99: local_rdat_o <= mon0x0099 ;
        8'h9A: local_rdat_o <= mon0x009A ;
        8'h9B: local_rdat_o <= mon0x009B ;
        8'h9C: local_rdat_o <= mon0x009C ;
        8'h9D: local_rdat_o <= mon0x009D ;
        8'h9E: local_rdat_o <= mon0x009E ;
        8'h9F: local_rdat_o <= mon0x009F ;

	
		default:
		        begin
		            local_rdat_o <= 0;
		        end			
        endcase
    end


assign local_rdat_vld_o = r_dat_trig[1];


/////////////////////////////////////







endmodule
