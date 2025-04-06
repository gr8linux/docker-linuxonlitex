`timescale 1ns / 1ps

module VGA_640x480(
	input wire clk,
	input wire RESET,
	output HS,
	output VS,
	output [9:0]pixel,
	output [9:0]line,
	output wire video
    );
reg dclk;
reg [9:0]h_count;
reg [9:0]v_count;
always@(posedge clk or posedge RESET)begin
	if(RESET == 1)
		dclk <= 1'b1;
	else 
		dclk <= ~dclk;
end

always@(posedge dclk or posedge RESET)begin
	if(RESET == 1)
		h_count <= 10'h0;
	else if(h_count == 10'd799)
		h_count <= 10'h0;
	else
		h_count <= h_count + 10'h1;
end

assign pixel = h_count - 10'd143;
assign HS = (h_count >= 10'd96);

always@(posedge dclk or posedge RESET)begin
	if(RESET == 1)
		v_count <= 10'h0;
	else if(h_count == 10'd799)
		if(v_count == 10'd524)
			v_count <= 10'h0;
		else
		v_count <= v_count + 10'h1;
end

assign line = v_count - 10'd35;
assign VS = (v_count >= 10'd2);
assign video = (((h_count >= 10'd143)&&(h_count < 10'd783)) && ((v_count >= 10'd35) && (v_count < 10'd515)));	
	

endmodule
