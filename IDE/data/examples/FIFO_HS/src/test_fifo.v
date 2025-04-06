`timescale 1ns/1ps
module test_fifo(
                    clk,
                    rst_n,
                    error,w_en,r_en
                    );

parameter           WRDEPTH          =  1024;                   //write depth
parameter           WRSIZE           =  32;                     //write size
parameter           RDDEPTH          = 512;                    //read  depth//equal_mode = 1024; small_mode = 2048; big mode = 512;
parameter           RDSIZE           =  WRDEPTH*WRSIZE/RDDEPTH; //read  size
parameter           WNSIZE           =  $clog2(WRDEPTH);        //wnum  size 
parameter           RNSIZE           =  $clog2(RDDEPTH);        //rnum  size
parameter           CYC_TIMES        =  15;                     //WRITE FULL READ EMPTY TIMES
parameter           seed             =  8'b00110101;            //random seed

input               clk;
output              rst_n;
output              error;
output w_en;
output r_en;

//Please Config parameter and define before simulate or boardtest

//----Either option must be selected
`define normal_mode
//`define fwft_mode

//----One of the three options must be selected
//`define equal_mode    //write depth = read depth
//`define small_mode    //write depth < read depth
`define big_mode      //write depth > read depth
/////////////////////////////////////////////////////////////////
reg    [10:0]        curr_state;
reg    [10:0]        next_state;
reg    [5:0]        start_cnt;
reg    [6:0]        cyc_cnt;
reg    [6:0]        alt_times;
reg                 w_en;
reg                 r_en;
reg                 r_en_d; 
reg    [10:0]       write_cnt;
reg    [9:0]        ALT_CNT;
reg    [RDSIZE-1:0] check_data0;
reg    [RDSIZE-1:0] check_data1;
reg    [RDSIZE-1:0] check_data2;
reg                 error0;
reg                 error1;
reg                 error2;
reg    [WRSIZE-1:0] w_data;
reg    [1:0]        ALT_CNT_d;
reg    [7:0]        rand_num;
reg    [9:0]        rand_cnt;
reg    [11:0]       start_rdmck;
reg                 fifo_empty_d;
wire    [WRSIZE-1:0] w_data_d/* synthesis syn_keep=1 */;
wire                load;
wire   [RDSIZE-1:0] r_data;
wire   [WNSIZE:0]   w_num;
wire   [RNSIZE:0]   r_num;
wire                fifo_full;
wire                fifo_empty;
wire                fifo_alempty;
//test state machine
localparam          IDLE                  = 11'b00000000001;
localparam          START_WAITE           = 11'b00000000010;
localparam          WRITE_FULL            = 11'b00000000100;
localparam          READ_EMPTY            = 11'b00000001000;
localparam          FULL_EMPTY_WAIT       = 11'b00000010000;
localparam          FULL_EMPTY_DONE       = 11'b00000100000;
localparam          WRITE_READ_ALT        = 11'b00001000000;
localparam          WRITE_READ_ALT_DONE   = 11'b00010000000;
localparam          WRITE_READ_RANDOM_WAIT= 11'b00100000000;
localparam          WRITE_READ_RANDOM     = 11'b01000000000;
localparam          TEST_DONE             = 11'b10000000000;
`ifdef small_mode
localparam          wait_time             = 'd2048;
`else
localparam          wait_time             = 'd7;
`endif

wire gvio_test;
wire rst_nn;

assign rst_n = rst_nn & !gvio_test;

rstn_gen rstn_gen(
    .clk(clk),
    .rstn(rst_nn)
);

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        curr_state <= IDLE;
    else 
        curr_state <= next_state;

always@(*)begin
    next_state = curr_state;
    case(curr_state)
        IDLE: 
            next_state = START_WAITE;
        
        START_WAITE: 
            if(start_cnt  == 'd63)
                next_state = WRITE_FULL;
        
        WRITE_FULL:
            if(w_num == 'd1022) 
            next_state = READ_EMPTY;
        
        READ_EMPTY: 
            if(fifo_alempty == 1'b1)
                next_state = FULL_EMPTY_WAIT;
        
        FULL_EMPTY_WAIT:
            if(cyc_cnt == CYC_TIMES)
            next_state = FULL_EMPTY_DONE;
            else
            next_state = WRITE_FULL;

        FULL_EMPTY_DONE:      
            next_state = WRITE_READ_ALT;

        WRITE_READ_ALT:
            if(ALT_CNT == 'd1023)
            next_state = WRITE_READ_ALT_DONE;

        WRITE_READ_ALT_DONE:
            if(alt_times == CYC_TIMES)
            next_state = WRITE_READ_RANDOM_WAIT;
            else
            next_state = WRITE_READ_ALT;
        WRITE_READ_RANDOM_WAIT:
            if(start_rdmck == wait_time)
            next_state = WRITE_READ_RANDOM;
        WRITE_READ_RANDOM:
            if(rand_cnt == 10'd1023)
            next_state = TEST_DONE;
                   
        default: next_state = TEST_DONE;
       endcase
      end

/////////////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
    if(!rst_n)
     start_cnt <= 6'b0;
    else if(start_cnt  == 'd63)
     start_cnt <= start_cnt;
    else if(curr_state ==  START_WAITE)
     start_cnt <= start_cnt + 1'b1;


always@(posedge clk or negedge rst_n)
    if(!rst_n)
     cyc_cnt <= 6'b0;
    else if(cyc_cnt == CYC_TIMES)
     cyc_cnt <= cyc_cnt;
    else if(curr_state == FULL_EMPTY_WAIT)
     cyc_cnt <= cyc_cnt + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     ALT_CNT <= 10'b0;
    else if(curr_state == WRITE_READ_ALT)
     ALT_CNT <= ALT_CNT + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     alt_times <= 6'b0;
    else if(alt_times == CYC_TIMES)
     alt_times <= alt_times;
    else if(ALT_CNT == 'd1023)
     alt_times <= alt_times + 1'b1;

//write full read empty
`ifdef equal_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    else if(curr_state == WRITE_FULL)
     begin
        w_data <= w_data + write_cnt;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && ALT_CNT[8])
     begin
        w_data <= w_data + 1'b1;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && !ALT_CNT[8])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[6] && !fifo_full)
     begin
        w_data <= w_data + 1'b1;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_RANDOM) && !rand_num[6])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else 
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      write_cnt <= 'b1;
    else if(curr_state == FULL_EMPTY_WAIT)
      write_cnt <= write_cnt + 1'b1;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
        r_en   <= 1'b0;   
    else if(curr_state == READ_EMPTY)
        r_en   <= 1'b1;  
    else if( ALT_CNT_d[1])  
        r_en   <= 1'b1;
    else if(curr_state == WRITE_READ_RANDOM_WAIT)
        r_en   <= 1'b1;
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[7])
        r_en   <= 1'b1;
    else 
        r_en   <= 1'b0; 
`endif

`ifdef small_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    else if(curr_state == WRITE_FULL)
     begin
        w_data <= w_data + 'd2;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && ALT_CNT[8])
     begin
        w_data <= w_data + 'd2;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && !ALT_CNT[8])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[6] && !fifo_full)
     begin
        w_data <= w_data + 'd2;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_RANDOM) && !rand_num[6])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else 
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      write_cnt <= 'd2;
    else if(curr_state == FULL_EMPTY_WAIT)
      write_cnt <= write_cnt + 1'b1;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
        r_en   <= 1'b0;   
    else if(curr_state == READ_EMPTY)
        r_en   <= 1'b1;  
    else if( ALT_CNT_d[1])  
        r_en   <= 1'b1;
    else if(curr_state == WRITE_READ_RANDOM_WAIT)
        r_en   <= 1'b1;
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[7] && !fifo_empty_d)
        r_en   <= 1'b1;
    else 
        r_en   <= 1'b0; 
`endif

`ifdef big_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    else if(curr_state == WRITE_FULL)
     begin
        w_data <= w_data + write_cnt;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && ALT_CNT[8])
     begin
        w_data <= w_data + 1'b1;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_ALT) && !ALT_CNT[8])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[6] && !fifo_full)
     begin
        w_data <= w_data + 1'b1;
        w_en   <= 1'b1;
     end
    else if((curr_state == WRITE_READ_RANDOM) && !rand_num[6])
     begin
        w_data <= w_data ;
        w_en   <= 1'b0;
     end
    else 
     begin
        w_data <= 'b0;
        w_en   <= 1'b0;
     end
    
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      write_cnt <= 'b1;
    else if(curr_state == FULL_EMPTY_WAIT)
      write_cnt <= write_cnt + 1'b1;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
        r_en   <= 1'b0;   
    else if(curr_state == READ_EMPTY)
        r_en   <= 1'b1;  
    else if( ALT_CNT_d[1])  
        r_en   <= 1'b1;
    else if(curr_state == WRITE_READ_RANDOM_WAIT)
        r_en   <= 1'b1;
    else if((curr_state == WRITE_READ_RANDOM) && rand_num[7])
        r_en   <= 1'b1;
    else 
        r_en   <= 1'b0; 
`endif

`ifdef equal_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     ALT_CNT_d <= 2'b00;
    else 
     ALT_CNT_d <= {ALT_CNT_d[0], ALT_CNT[9]};
`endif

`ifdef small_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     ALT_CNT_d <= 2'b00;
    else 
     ALT_CNT_d <= {ALT_CNT_d[0],(ALT_CNT[7] || ALT_CNT[8] || ALT_CNT[9])};
`endif

`ifdef big_mode
always @ (posedge clk or negedge rst_n)
    if(!rst_n)
     ALT_CNT_d <= 2'b00;
    else 
     ALT_CNT_d <= {ALT_CNT_d[0],(ALT_CNT[7] &&  ALT_CNT[9])};
`endif

///////////////////////////////////////////////////////////////////
//ins fifo
`ifdef equal_mode
assign w_data_d = w_data;
`endif

`ifdef small_mode
 `ifdef normal_mode
  assign w_data_d = {w_data[15:0] + 1'b1,w_data[15:0]};
 `else
  assign w_data_d = {w_data[15:0],w_data[15:0] - 1'b1};
 `endif
`endif

`ifdef big_mode
assign w_data_d = w_data;
`endif

FIFO_HS_Top u_fifo_hs_top(      
                          .Data(w_data_d),
                          .WrClk(clk),
                          .RdClk(clk),
                          .WrEn(w_en),
                          .RdEn(r_en),
						  .WrReset(!rst_n), //input WrReset
		                  .RdReset(!rst_n), //input RdReset
                          .Wnum(w_num),
                          .Rnum(r_num),
                          .Almost_Empty(fifo_alempty),
                          .Almost_Full(),
                          .Q(r_data),
                          .Empty(fifo_empty),
                          .Full(fifo_full)
                          );

///////////////////////////////////////////////////////////////////
//check rd data

  assign error = error0 || error1 || error2;

  always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        fifo_empty_d <= 1'b0;
     else
        fifo_empty_d <= fifo_empty;

  always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        r_en_d <= 1'b0;
     else
        r_en_d <= r_en;
//equal mode check-----------------------------------------------
`ifdef equal_mode
 `ifdef normal_mode    
  always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 1'b1 : 'b0;
     else
        check_data0 <= 'b0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en_d &&  curr_state == READ_EMPTY)
      error0 <= ((check_data0*write_cnt) == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

 always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(check_data1 == 'd512)
        check_data1 <= 'd0;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 1'b1 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en && (w_num <= 'd255) && (curr_state == WRITE_READ_ALT) && !fifo_empty)
      error1 <= (check_data1 == r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 1'b1 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty && !fifo_empty_d)
      error2 <= (check_data2 == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
`endif

`ifdef fwft_mode
always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 1'b1 : 1'b0;
     else
        check_data0 <= 'd0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en &&  curr_state == READ_EMPTY)
      error0 <= (((check_data0 + 1'b1) *write_cnt) == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(check_data1 == 'd511)
        check_data1 <= 'd0;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 1'b1 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_ALT) && !fifo_empty)
      error1 <= ((check_data1 + 1'b1) == r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 1'b1 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty)
      error2 <= ((check_data2 +1'b1) == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
 `endif
`endif
//small mode check------------------------------------------------------------
`ifdef small_mode
 `ifdef normal_mode  
  always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 1'b1 : 1'b0;
     else
        check_data0 <= 'd0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en_d && curr_state == READ_EMPTY)
      error0 <= ((check_data0 + 1'b1) == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

 always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(check_data1 == 'h400)
        check_data1 <= 'd1;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 1'b1 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en &&  (curr_state == WRITE_READ_ALT) && !fifo_empty_d)
      error1 <= ((check_data1 + 1'b1)== r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 1'b1 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en_d  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty && !fifo_empty_d)
      error2 <= ((check_data2 + 1'b1) == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
`endif

`ifdef fwft_mode
always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
     else if(curr_state == WRITE_FULL)
        check_data0 <= 'd1;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 1'b1 : check_data0;
     else
        check_data0 <= 'd0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en  && curr_state == READ_EMPTY)
      error0 <= (check_data0 == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(curr_state == FULL_EMPTY_DONE)
        check_data1 <= 'd1;
     else if(check_data1 == 'h400 && r_en)
        check_data1 <= 'd1;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 1'b1 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_ALT) && !fifo_empty)
      error1 <= (check_data1 == r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 1'b1 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty)
      error2 <= ((check_data2 +1'b1) == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
 `endif
`endif
//big mode check-----------------------------------------------------
`ifdef big_mode
 `ifdef normal_mode
  always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 'd2 : 1'b0;
     else
        check_data0 <= 'd0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en_d &&  curr_state == READ_EMPTY)
      error0 <= (({check_data0[31:0]*write_cnt,(check_data0[31:0] - 1'b1)*write_cnt}) == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

 always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(check_data1 == 'd512)
        check_data1 <= 'd0;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 'd2 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en_d && (curr_state == WRITE_READ_ALT) && !fifo_empty)
      error1 <= ({check_data1[31:0],(check_data1[31:0] - 1'b1)} == r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 'd2 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty_d)
      error2 <= ({check_data2[31:0],(check_data2[31:0] - 1'b1)} == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
`endif

`ifdef fwft_mode
always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data0 <= 'd0;
      else if(curr_state == WRITE_FULL)
        check_data0 <= 'd1;
     else if(curr_state == READ_EMPTY)
        check_data0 <= r_en ? check_data0 + 'd2 : check_data0;
     else
        check_data0 <= 'd0;

 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error0 <= 1'b0;
    else if(r_en  && curr_state == READ_EMPTY)
      error0 <= (({(check_data0[31:0] + 1'b1)*write_cnt,check_data0[31:0]*write_cnt}) == r_data) ? 1'b0 : 1'b1;
    else
      error0 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data1 <= 'd0;
     else if(curr_state == FULL_EMPTY_DONE)
        check_data1 <= 'd1;
     else if( check_data1 == 'h1ff && r_en)
        check_data1 <= 'd1;
     else if((curr_state == WRITE_READ_ALT || curr_state == WRITE_READ_ALT_DONE) && !fifo_empty)
        check_data1 <= r_en ? check_data1 + 'd2 : check_data1;
    
 
 always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error1 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_ALT) && !fifo_empty)
      error1 <= (({(check_data1[31:0] + 1'b1),check_data1[31:0]}) == r_data) ? 1'b0 : 1'b1;
    else
      error1 <= 0;

always @ (posedge clk or negedge rst_n)
     if(!rst_n)
        check_data2 <= 'd0;
     else if(curr_state == WRITE_READ_RANDOM_WAIT)
        check_data2 <= 'd1;
     else if((curr_state == WRITE_READ_RANDOM) && !fifo_empty)
        check_data2 <= r_en ? check_data2 + 'd2 : check_data2;

always @ (posedge clk or negedge rst_n)
    if(!rst_n)
      error2 <= 1'b0;
    else if(r_en  && (curr_state == WRITE_READ_RANDOM) && !fifo_empty)
      error2 <= (({(check_data2[31:0] + 1'b1),check_data2[31:0]}) == r_data) ? 1'b0 : 1'b1;
    else
      error2 <= 0;
 `endif
`endif

///////////////////////////////////////////////////////////////////
//random write read gen

assign load = (curr_state == WRITE_READ_ALT_DONE);

always@(posedge clk or negedge rst_n)  
begin  
    if(!rst_n)  
        rand_num        <= 8'b0;  
    else if(load)  
        rand_num        <= seed;      
    else if(curr_state == WRITE_READ_RANDOM) 
        begin  
            rand_num[0] <= rand_num[7];  
            rand_num[1] <= rand_num[0];  
            rand_num[2] <= rand_num[1];  
            rand_num[3] <= rand_num[2];  
            rand_num[4] <= rand_num[3]^rand_num[7];  
            rand_num[5] <= rand_num[4]^rand_num[7];  
            rand_num[6] <= rand_num[5]^rand_num[7];  
            rand_num[7] <= rand_num[6];  
        end  
                
end

always@(posedge clk or negedge rst_n)  
    if(!rst_n)
        rand_cnt <= 'd0;
    else if(curr_state == WRITE_READ_RANDOM)
        rand_cnt <= rand_cnt + 1'b1;

always@(posedge clk or negedge rst_n)  
    if(!rst_n)
        start_rdmck <= 'd0;
    else if(start_rdmck == wait_time)
        start_rdmck <= start_rdmck;
    else if(curr_state == WRITE_READ_RANDOM_WAIT)
        start_rdmck <= start_rdmck + 1'b1;
///////////////////////////////////////////////////////////////////
endmodule
