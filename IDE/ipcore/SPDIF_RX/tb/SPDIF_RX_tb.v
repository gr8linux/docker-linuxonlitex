`timescale 1ns / 1ps
`include "spdif_rx_name.v"
`include "spdif_rx_defines.v"
 module tb();
 
//Interface for TX_IP
reg tx_clk;          
reg rst_n;
reg [23:0] I_audio_d=0; 
reg I_validity_bit;
reg I_user_bit;
reg I_chan_status_bit;
wire O_audio_d_req;
wire O_validity_bit_req;
wire O_user_bit_req;
wire O_chan_status_bit_req;
wire O_block_start_TX_flag;
wire O_sub_frame0_TX_flag;
wire O_sub_frame1_TX_flag;
wire O_Spdif_tx_data;

//Interface for RX_IP
reg rx_clk;
wire [`SPDIF_DATA_WIDTH-1:0] O_audio_d;
wire O_validity_bit;
wire O_user_bit;
wire O_chan_status_bit;
wire O_spdif_data_en;
wire O_block_start_RX_flag;
wire O_sub_frame0_RX_flag;
wire O_sub_frame1_RX_flag;
wire O_parity_check_error;
wire O_lock_flag;



//reset the IP
GSR GSR (.GSRI(1'b1)) ;
		
always #1000 tx_clk=~tx_clk;
always #100 rx_clk=~rx_clk;

initial 
    begin
tx_clk=0;
rx_clk=0;
rst_n=0;

#2000
rst_n=1; 
    end

//load data for input
always@(posedge tx_clk)
    begin
	
	I_audio_d={$random}%16777216;
	
    end

always@(negedge O_validity_bit_req)	
I_validity_bit=0;

always@(negedge O_user_bit_req)	
I_user_bit=1;

always@(negedge O_chan_status_bit_req)	
I_chan_status_bit=0;



//Instantiation
SPDIF_TX_Top u1
(
	.I_rst_n(rst_n),
	.I_clk(tx_clk),    
	.I_audio_d(I_audio_d),
	.I_validity_bit(I_validity_bit),
	.I_user_bit(I_user_bit),
	.I_chan_status_bit(I_chan_status_bit),
	.O_audio_d_req(O_audio_d_req),
	.O_validity_bit_req(O_validity_bit_req),
	.O_user_bit_req(O_user_bit_req),
	.O_chan_status_bit_req(O_chan_status_bit_req),
	.O_block_start_flag(O_block_start_TX_flag),
	.O_sub_frame0_flag(O_sub_frame0_TX_flag),
	.O_sub_frame1_flag(O_sub_frame1_TX_flag),
	.O_Spdif_tx_data(O_Spdif_tx_data)

);	

`module_name_rx u2
(
    .I_clk(rx_clk),
	.I_rst_n(rst_n),
	.I_spdif_rx_data(O_Spdif_tx_data),
	.O_audio_d(O_audio_d),
	.O_validity_bit(O_validity_bit),
	.O_user_bit(O_user_bit),
	.O_chan_status_bit(O_chan_status_bit),
	.O_spdif_data_en(O_spdif_data_en),
	.O_block_start_flag(O_block_start_RX_flag),
	.O_sub_frame0_flag(O_sub_frame0_RX_flag),
	.O_sub_frame1_flag(O_sub_frame1_RX_flag),
	.O_parity_check_error(O_parity_check_error),
	.O_lock_flag(O_lock_flag)
	
);

 initial begin

#35000000;
$stop;
end

     endmodule	
	