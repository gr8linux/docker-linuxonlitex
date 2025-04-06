`timescale 1ns / 1ps

module clk_1ms(
	input clk,
	input reset,
	output clk_1ms
    );
reg[20:0] count;
reg second_m;

initial count <= 0;

	always@(posedge clk)begin
		if(reset || (count == 49999))begin
			count <= 0;
			second_m <= 1;
		end
		else begin
			count <= count + 1'b1;
			second_m <= 0;
			end
		end
assign clk_1ms = second_m;

endmodule
