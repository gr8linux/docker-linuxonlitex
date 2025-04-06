`timescale 1ns / 1ps

// define stores module's name
`include "define.v"
	
module testbench();

//prarmeter  stores data
`include "parameter.v"

    integer a = $random % 2**(N-1) ; 
    integer b = $random % 2**(N-1) ; 
    integer c = $random %  2**(N-1); 
    integer d = $random %  2**(N-1); 

//ports for exemplification
reg clk;
reg start;
reg  signed [N-1:0] dividend;
reg  signed [N-1:0] divisor;
wire signed [N-1:0] quotient_out;
wire  complete;

//ports for tests
real  deviation;
reg  signed [N-1:0]  quotient;
real  dividend_golden;
real  divisor_golden;
real  true_result;
real  IP_result;
real  real_quotient;
integer file_out;

//reset the whole fpga
GSR GSR(.GSRI(1'b1));

//clock signal
always 
begin
#10 clk = ~clk;
end


always@(complete)
begin
true_result=dividend_golden/divisor_golden;
	if(dividend_golden<0&&divisor_golden>0)
	begin
	quotient[N-1]=quotient_out[N-1];		//change signal that less than 0 to Original code
	quotient[N-2:0]=~quotient_out[N-2:0]+1;
        real_quotient=quotient;
	IP_result=real_quotient/(2**Q) ;
	deviation=true_result-IP_result;
	end
	else if(dividend_golden>0&&divisor_golden>0)	
	begin
	quotient=quotient_out;
        real_quotient=quotient;
	IP_result=real_quotient/(2**Q) ;
	deviation=true_result-IP_result;
	end
	if(dividend_golden>0&&divisor_golden<0)		//change signal that less than 0 to Original code
	begin
	quotient[N-1]=quotient_out[N-1];
	quotient[N-2:0]=~quotient_out[N-2:0]+1;
        real_quotient=quotient;
	IP_result=real_quotient/(2**Q) ;
	deviation=true_result-IP_result;
	end
	else if(dividend_golden<0&&divisor_golden<0)	//change signal that less than 0 to Original code
	begin
	quotient=quotient_out;
        real_quotient=quotient;
	IP_result=real_quotient/(2**Q) ;
	deviation=true_result-IP_result;
	end

if(complete==1)
	begin
	$fdisplay (file_out,"finish\n dividend=%f divisor=%f quotient_out=%f golden_number=%f deviation=%f\n N=%d Q=%d",dividend_golden,divisor_golden,IP_result,true_result,deviation,N,Q);
	end
end

//to pick the real data for test two times
initial
begin
start= 1;
clk = 1;

//through a and b to calculate the precise result
dividend_golden=a;
divisor_golden=b;

	if(a>0&&b>0)
begin							
	dividend[N-1]=a[31];
	dividend[N-2:0]=a[N-2:0];
	divisor[N-1]=b[31];
	divisor[N-2:0]=b[N-2:0];
end
	else if(a<0&&b>0)				//change result that less than 0 back to Complement code 
begin							
	dividend[N-1]=a[31];
	dividend[N-2:0]=~a[N-2:0]+1;
	divisor[N-1]=b[31];
	divisor[N-2:0]=b[N-2:0];
end
	else if(a>0&&b<0)				//change result that less than 0 back to Complement code 
begin
	divisor[N-1]=b[31];
	divisor[N-2:0]=~b[N-2:0]+1;
	dividend[N-1]=a[31];
	dividend[N-2:0]=a[N-2:0];
end
	else if(a<0&&b<0)				//change result that less than 0 back to Complement code 
begin
	divisor[N-1]=b[31];
	divisor[N-2:0]=~b[N-2:0]+1;
	dividend[N-1]=a[31];
	dividend[N-2:0]=~a[N-2:0]+1;
end
#20 start = 0;
file_out=$fopen("../../doc/data.txt","w");  		//open file that stores results
#1500 

start= 1;
//through c and d to calculate the precise result
dividend_golden=c;
divisor_golden=d;

if(c>0&&d>0)
	begin							
	dividend[N-1]=c[31];
	dividend[N-2:0]=c[N-2:0];
	divisor[N-1]=d[31];
	divisor[N-2:0]=d[N-2:0];
	end
else if(c<0&&d>0)
	begin						//change signal that less than 0 to Original code
	dividend[N-1]=c[31];
	dividend[N-2:0]=~c[N-2:0]+1;
	divisor[N-1]=d[31];
	divisor[N-2:0]=d[N-2:0];
	end
else if(c>0&&d<0)
	begin						//change signal that less than 0 to Original code
	divisor[N-1]=d[31];
	divisor[N-2:0]=~d[N-2:0]+1;
	dividend[N-1]=c[31];
	dividend[N-2:0]=c[N-2:0];
	end
else if(c<0&&d<0)					//change signal that less than 0 to Original code
	begin
	divisor[N-1]=d[31];
	divisor[N-2:0]=~d[N-2:0]+1;
	dividend[N-1]=c[31];
	dividend[N-2:0]=~c[N-2:0]+1;
	end
#20 start = 0;

#1500
$fclose(file_out);
$finish;
end


`module_name u1(
	.dividend(dividend),
	.divisor(divisor),
	.start(start),
	.clk(clk),
	.quotient_out(quotient_out),
	.complete(complete)
);


endmodule



