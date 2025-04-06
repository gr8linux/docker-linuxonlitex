`timescale 1ns / 1ps

module draw_demon1(
	input clk,				
	input [9:0]h_count,	
	input [9:0]v_count,	
	input video,
	input jump,				
	input clr,
	input reset,			
	input shut,				
	input clk_1ms, 		
	input clk_5ms,
	input clk_01ms,
	input clk_100ms,
	input clk_10ms,
	output  reg red,
	output  reg green,
	output  reg blue
    );

reg [10:0]x,y;
reg collision,collision1;				
parameter x1 = 11'd120,x2 = 11'd180;			
parameter y1 = 10'd270,y2 = 10'd330;			
parameter V0 = 7'd82,delta = 7'd1;			
parameter X_over = 10'd120;
parameter Y_over = 10'd130;					
parameter Y_ground1 = 10'd267,Y_ground2 = 10'd310,Y_tree1 = 10'd250,Y_tree2 = 10'd268;
integer count,diff,count1;			
reg[6:0]V;
reg[10:0]X_tree1,X_tree2,X_cloud1,X_cloud2,X_cloud3,ground,tree1;
reg [10:0] Y, S,high_ground1,high_ground2,x_t1,y_t1,x_c1,x_c2,x_c3,y_c1,y_c2,y_c3,x_t2,y_t2,x_v,y_v;
reg [11:0] addr;
reg high,mode,draw_demon1,draw_demon2,in_ground1,in_ground2,in_tree1,in_tree2,in_cloud,in_cloud2,in_over;//in_cloud3;
wire [0:0] color1/*synthesis syn_keep=1*/;

wire [0:0] color_ground1,color_ground2,color_tree1,color_tree2,color_cloud,color_cloud2,color_over;//color_cloud3;
wire [15:0] show_ground1,show_ground2;
reg [14:0]show_over;
reg [15:0] show_tree1,show_tree2;
reg[12:0] show_cloud,show_cloud2;
reg clk_game;
wire[7:0] Y_cloud1,Y_cloud2;
assign Y_cloud1 = 50;
assign Y_cloud2 = 110;
initial begin
Y = y1;
V = 0;
mode = 0;
count = 0;
draw_demon1 = 0;
ground = 0;
X_tree1 = 1200;
X_tree2 = 900;
collision = 0;
collision1 = 0;

X_cloud1 = 500;

X_cloud2 = 100;
diff = 60;
count = 0;
count1 = 0;
end

assign 	color_ground2=^h_count;
Demon1   Rom1(.clka(clk),.addra(h_count[3:0]),.din(addr),.douta(color1));												
Demon1 	 Rom3(.clka(clk),.addra(h_count[3:0]),.din(show_ground1[11:0]),.douta(color_ground1));	
Demon1 	 Rom5(.clka(clk),.addra(h_count[7:4]),.din(show_tree1[11:0]),.douta(color_tree1));		
Demon1 	 Rom6(.clka(clk),.addra(h_count[7:4]),.din(show_cloud[11:0]),.douta(color_cloud));		
Demon1 	 Rom9(.clka(clk),.addra(h_count[7:4]),.din(show_tree2[11:0]),.douta(color_tree2));		
Demon1   Rom10(.clka(clk_10ms),.addra(h_count[3:0]),.din(show_over[11:0]),.douta(color_over));		

always@(posedge clk_100ms)begin
	if(shut == 1 || collision1 == 1) 
		mode = mode;
	else mode = ~mode;
end

always@(posedge clk_01ms)begin
	count = count + 1;
	if(count >= diff)begin
		count  = 0;
		clk_game = 1;
	end
	else begin
		clk_game = 0;
	end
end

always@(posedge clk_100ms)begin 
	count1 = count1 + 1;			 
	if(reset == 1)begin
		diff = 60;
	end else
	if(count1 >= 50)begin
		count1 = 0;
		if(diff > 20)
			diff = diff - 4;
		else diff = diff;
	end
end

always@(posedge clk_game)begin
if(clr == 1)begin					
		ground = 0;
		X_tree1 = 1200;
		X_tree2 = 900;
	end
else begin
	if(shut == 1 || collision1 == 1)begin   
		ground = ground;
	end else if(reset == 1)begin
		ground = 64;
	end
	else if(ground <= 576)						
		ground = ground + 1'b1;
	else ground = 64;
	
	if(reset == 1)
		X_tree1 = 1200;
	else if(shut == 1 || collision1 == 1)begin		
		X_tree1 = X_tree1;
	end
	else if(X_tree1 > 0 )
		X_tree1 = X_tree1 -1'b1;								
	else X_tree1 = 1200;
	
	 if(reset == 1)										
		X_tree2 = 900;
	else if(shut == 1 || collision1 == 1)begin		
		X_tree2 = X_tree2;
	end
	else if(X_tree2 > 0 )
		X_tree2 = X_tree2 -1'b1;
	else X_tree2 = 900;
	
	if(reset == 1)begin									
		X_cloud1 = 800;
		X_cloud2 = 700;
	end else
	if(shut == 1 || collision1 == 1)begin			
		X_cloud1 = X_cloud1;
		X_cloud2 = X_cloud2;
		
	end 
	else begin
		if(X_cloud1 > 0 )
			X_cloud1 = X_cloud1 -1'b1;						
		else X_cloud1 = 800;
		if(X_cloud2 > 0)
			X_cloud2 = X_cloud2 - 1'b1;
		else X_cloud2 = 700;
		
	end
end
end

assign show_ground1 = (high_ground1 + (ground+h_count)%512);			
assign show_ground2 = (high_ground2 + (ground+h_count)%512);


always@(posedge clk_5ms)begin 
if(h_count >= x1 && h_count < x2 && v_count >= Y && v_count < Y+60)begin
		y = v_count - Y;
		x = h_count - x1;
		addr = y  + x;
		if(mode == 1 || high == 1)begin
			draw_demon1 = 1;
			draw_demon2 = 0;
		end 
		else begin
			draw_demon2 = 1;
			draw_demon1 = 0;
		end
end
else begin
	draw_demon1 = 0;						
	draw_demon2 = 0;
end

if(v_count >= Y_ground1 && v_count < Y_ground1+60 && h_count >= 1 && h_count <= 640)begin
	in_ground1 = 1;
	in_ground2 = 0;
	high_ground1 = v_count - Y_ground1;			
    high_ground2 = v_count + Y_ground1;			
end
else begin
	in_ground1 = 0;
	in_ground2 = 1;
end


if(v_count >= Y_tree1 && v_count <Y_tree1+100 && h_count >= X_tree1 && h_count <= X_tree1+70 && h_count >= 1 && h_count <= 640)begin
	in_tree1= 1;
	x_t1 = h_count - X_tree1;
	y_t1 = v_count - Y_tree1;
	show_tree1   = (y_t1  + x_t1);		
end
else begin
	in_tree1 = 0;
end

if(v_count >= Y_tree2 && v_count <Y_tree2+60 && h_count >= X_tree2 && h_count <= X_tree2+70 && h_count >= 1 && h_count <= 640)begin
	in_tree2= 1;
	x_t2 = h_count - X_tree2;
	y_t2 = v_count - Y_tree2;
	show_tree2  = (y_t2  + x_t2);		
end
else begin
	in_tree2 = 0;
end


if(v_count >= Y_cloud1 && v_count < Y_cloud1 +70 && h_count >= X_cloud1 && h_count < X_cloud1+100 && h_count >= 1 && h_count <= 640)begin
	in_cloud = 1;
	x_c1 = h_count - X_cloud1;
	y_c1 = v_count - Y_cloud1;
	show_cloud = (y_c1+ x_c1);		
end else
if(v_count >= Y_cloud2 && v_count < Y_cloud2 +70 && h_count >= X_cloud2 && h_count < X_cloud2+100 && h_count >= 1 && h_count <= 640)begin
	in_cloud = 1;
	x_c2 = h_count - X_cloud2;
	y_c2 = v_count - Y_cloud2;
	show_cloud = (y_c2  + x_c2);		
end
else begin
	in_cloud = 0;
end


if(v_count >= Y_over && v_count < Y_over+70 && h_count >= X_over && h_count < X_over+400)begin
	in_over = 1;
	x_v = h_count - X_over;
	y_v = v_count - Y_over;
	show_over = y_v  + x_v;				
end
else in_over = 0;

red = 0;blue = 0;green = 0;					
 
if(video == 1) begin
	red = 1;
	green = 1;
	blue = 1;
end


if(in_tree1 == 1)begin							
	if(color_tree1[0] == 0)begin				
		red =0;
		green =0;
		blue = 0;
	end 
end else if(in_tree2 == 1)begin
	if(color_tree2[0] == 0)begin
		red = 0;green = 0;blue= 0;
	end
end

if(draw_demon1 == 1 )begin							
		if(color1[0] == 0)begin						
				red = 0;
				green = 0;
				blue = 0;
		end
end else if(draw_demon2 == 1  )begin
			if(color1[0] == 0) begin
						red = 0;
						green = 0;
						blue =0;
					end
end

if(in_ground1 == 1)begin							
	if(color_ground1[0] == 0)begin			
		red = color_ground1[0];
		green = color_ground1[0];
		blue = color_ground1[0];
	end
end else if(in_ground2 == 1)begin
	if(color_ground2[0] == 0)begin
		red = color_ground2[0];
		green = color_ground2[0];
		blue = color_ground2[0];
	end
end

if(in_cloud == 1)begin							
	if(color_cloud[0] ==0)begin				
		red = 0;green = 0;blue = 0;
	end
end

if((x1+53 >= X_tree1 + 20) &&( x1 + 53 <= X_tree1 +53) &&( Y + 17 >= Y_tree1 + 14))
		collision1 = 1;
else if((Y +57 >= Y_tree1 + 14) && (x1 + 35 <= X_tree1 +53 )&& (x1 +35 >= X_tree1 + 20))
		collision1 = 1;
else if	((Y + 57>= Y_tree1 + 14) && (x1 + 19 <= X_tree1 +53 )&&( x1+ 19 >= X_tree1 + 20))
		collision1 = 1;
else if ((Y + 36>= Y_tree1 + 14) && (x1 + 8  <= X_tree1 +53 )&& (x1 +8  >= X_tree1 + 20))
	collision1 = 1;
else if(  (Y + 37 >= Y_tree1 + 14) && (x1 + 21 <= X_tree1 + 53) && (x1 + 21 >= X_tree1 + 20))
	collision1 = 1;
else if( (Y + 17 >= Y_tree2 + 7 ) && (x1 + 53 >= X_tree2 + 11) && (x1 + 53 <= X_tree2 + 57))
	collision1 = 1;
else if( (Y+57 >= Y_tree2 + 7) && (x1 + 35 >= X_tree2 + 11 ) && (x1 + 35 <= X_tree2 + 57))
	collision1 = 1;
else if( (Y+57 >= Y_tree2 + 7) && (x1 + 19 >= X_tree2 + 11 ) && (x1 + 19 <= X_tree2 + 57))
	collision1 = 1;
else if( (Y+36 >= Y_tree2 + 7) && (x1 + 8 >= X_tree2  + 11)  && (x1 + 8 <= X_tree2 + 57))
	collision1 = 1;
else if( (Y+37 >= Y_tree2 + 7) && (x1 + 21 >= X_tree2 + 11) && (x1 + 21 <= X_tree2 + 57))
	collision1 = 1;
else collision1 = 0;

if(collision1 == 1)begin		
	if(in_over == 1)begin
		red = color_over[0];
		blue = color_over[0];
		green = color_over[0];
	end
end


if(((h_count >= 0 && h_count <= 64 )||(h_count >= 576 && h_count <= 640))&& v_count >= 0 && v_count <= 480 )begin
	red = 0;
	green = 0;
	blue = 0;
end


end



always@(posedge clk_5ms)begin
if(clr == 1)begin				  
	V = 0;
	Y = y1;
end
else begin
	if(jump == 1)begin
		if(Y == y1)begin
			V = V0;
			high = 1;
		end
	end
	else if(Y == y1 && V == 0)
		high = 0;
		
		
	if(high == 1)begin
		if(reset == 1)begin
			V = 0;
			Y = y1;
		end else
		if(shut == 1 || collision1 == 1)begin		
			S = S;
			Y = Y;
			V = V;
		end 
		else if(V > -V0)begin
			S = V0*V0 - V*V0;							
			Y = y1 - S;
			V = V - delta;
		end
		else begin
			V = 0;
			Y = y1;
		end
	end
end
end


endmodule
