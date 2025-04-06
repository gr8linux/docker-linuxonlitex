
`timescale 1ns/100ps
module tb ;
    reg pci_clk ; 
    reg pci_rst_l ; 
    reg [3:0] pci_cbe_l ; 
    reg pci_frame_l ; 
    reg pci_irdy_l ; 
    reg pci_idsel ; 
    reg [31:0] tg_data_in ; 
    reg tg_ready_l ; 
    reg tg_stop_l ; 
    reg tg_abort_l ; 
    wire [31:0] pci_ad ; 
    wire pci_par ; 
    wire [31:0] tg_addr ; 
    wire [31:0] tg_data_out ; 
    wire [3:0] tg_cbe_l ; 
    wire [3:0] tg_cmd_o ; 
    wire [(2 - 1):0] tg_bar_hit ; 
    wire [31:0] BAR_value [(2 - 1):0] ; 
    assign BAR_value[0] = 32'b11111111111111111111111111110001 ; 
    assign BAR_value[1] = 32'b11111111111111111111111111110001 ; 
    reg pci_ad_oe, pci_par_oe ; 
    reg [31:0] pci_ad_reg ; 
    reg pci_par_reg ; 
    assign pci_ad = (pci_ad_oe ? pci_ad_reg : 32'bz) ; 
    assign pci_par = (pci_par_oe ? pci_par_reg : 1'bz) ; 
    GSR GSR (1'b1) ; 
    PCI_Target_Top pci_uut (.pci_clk(pci_clk), .pci_rst_l(pci_rst_l), .pci_ad(pci_ad), .pci_cbe_l(pci_cbe_l), .pci_par(pci_par), .pci_frame_l(pci_frame_l), .pci_trdy_l(pci_trdy_l), .pci_irdy_l(pci_irdy_l), .pci_stop_l(pci_stop_l), .pci_devsel_l(pci_devsel_l), .pci_idsel(pci_idsel), .pci_serr_l(pci_serr_l), .pci_perr_l(pci_perr_l), .tg_addr(tg_addr), .tg_data_out(tg_data_out), 
                .tg_data_in(tg_data_in), .tg_cbe_l(tg_cbe_l), .tg_ready_l(tg_ready_l), .tg_write_l(tg_write_l), .tg_read_l(tg_read_l), .tg_stop_l(tg_stop_l), .tg_abort_l(tg_abort_l), .tg_cmd_o(tg_cmd_o), .tg_bar_hit(tg_bar_hit), .tg_access(tg_access), .tg_value(tg_value)) ; 
    initial
        begin
            pci_clk = 0 ;
            forever
                #(25) pci_clk = (~pci_clk) ;
        end

    initial
        begin
            pci_rst_l = 0 ;
            #(1000) pci_rst_l = 1 ;
        end
    initial
        begin
            pci_frame_l = 1 ;
            pci_idsel = 0 ;
            pci_cbe_l = 4'bz ;
            pci_irdy_l = 1 ;
            pci_ad_oe = 0 ;
            pci_par_oe = 0 ;
            tg_ready_l = 1 ;
            tg_stop_l = 1 ;
            tg_abort_l = 1 ;
            tg_data_in = 0 ;
            #(2000) $display ("write_config and read_config start:%t",$time) ;
            write_config (32'b0100,32'b0100000000000000000000000011) ;
            read_config (32'b0100) ;
            read_config (32'b0) ;
            read_config (32'b01000) ;
            read_config (32'b0101100) ;
            write_config (32'b010000,32'b11111111111111111111111111111111) ;
            read_config (32'b010000) ;
            write_config (32'b010000,32'b010000000000000000000000010000) ;
            read_config (32'b010000) ;
            write_config (32'b010100,32'b11111111111111111111111111111111) ;
            read_config (32'b010100) ;
            write_config (32'b010100,32'b010000000000010000000000010000) ;
            read_config (32'b010100) ;
            $display ("ending:%t",$time) ;
            #(500) $display ("normal write and read:%t",$time) ;
            normal_write (32'b010000000000000000000000010000,32'b11110000111100001111000011110000,BAR_value[0][0]) ;
            normal_read (32'b010000000000000000000000010000,32'b11110000111100001111000011110000,BAR_value[0][0]) ;
            normal_write (32'b010000000000010000000000010000,32'b11110000111100001111000011110000,BAR_value[1][0]) ;
            normal_read (32'b010000000000010000000000010000,32'b11110000111100001111000011110000,BAR_value[1][0]) ;
            $display ("ending:%t",$time) ;
            #(500) $display ("burst write and read:%t",$time) ;
            burst_write (32'b010000000000000000000000010001,32'b010000000100000000000000000000,32'b010001000100010000000000000000,32'b01000100010001,BAR_value[0][0]) ;
            burst_read (32'b010000000000000000000000010001,32'b010000000100000000000000000000,32'b010001000100010000000000000000,32'b01000100010001,BAR_value[0][0]) ;
            burst_write (32'b010000000000010000000000010001,32'b010000000100000000000000000000,32'b010001000100010000000000000000,32'b01000100010001,BAR_value[1][0]) ;
            burst_read (32'b010000000000010000000000010001,32'b010000000100000000000000000000,32'b010001000100010000000000000000,32'b01000100010001,BAR_value[1][0]) ;
            $display ("ending:%t",$time) ;
            #(500) $display ("wait write and read:%t",$time) ;
            wait_write (32'b010000000000000000000000010001,32'b010000000100000001000000010000,32'b01000000010000000100000001,32'b010001000100010000000100000001,BAR_value[0][0]) ;
            wait_read (32'b010000000000000000000000010001,32'b010000000100000001000000010000,32'b01000000010000000100000001,32'b010001000100010000000100000001,BAR_value[0][0]) ;
            wait_write (32'b010000000000010000000000010001,32'b010000000100000001000000010000,32'b01000000010000000100000001,32'b010001000100010000000100000001,BAR_value[1][0]) ;
            wait_read (32'b010000000000010000000000010001,32'b010000000100000001000000010000,32'b01000000010000000100000001,32'b010001000100010000000100000001,BAR_value[1][0]) ;
            $display ("ending:%t",$time) ;
            #(500) $display ("Retry:%t",$time) ;
            retry_write (32'b010000000000000000000000010001,32'b010000000100000001000000010000,BAR_value[0][0]) ;
            retry_read (32'b010000000000000000000000010001,32'b010000000100000001000000010000,BAR_value[0][0]) ;
            retry_write (32'b010000000000010000000000010001,32'b010000000100000001000000010000,BAR_value[1][0]) ;
            retry_read (32'b010000000000010000000000010001,32'b010000000100000001000000010000,BAR_value[1][0]) ;
            $display ("ending:%t",$time) ;
            #(500) $stop  ;
        end

    always@(posedge pci_clk or negedge pci_rst_l) begin
       if(!pci_rst_l)
          pci_par_reg <= 0;
       else 
          pci_par_reg <=  (^{pci_ad_reg,pci_cbe_l}) ;

    end

    task  read_config ; 
        input [31:0] addr ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            pci_cbe_l <=  4'b1010 ;
            pci_idsel <=  1 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_frame_l <=  1 ;
            pci_ad_oe <=  0 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            pci_idsel <=  0 ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            @(posedge pci_clk);
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
        end
    endtask
    task  write_config ; 
        input [31:0] addr ; 
        input [31:0] data ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            pci_cbe_l <=  4'b1011 ;
            pci_idsel <=  1 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_frame_l <=  1 ;
            pci_ad_reg <=  data ;
            pci_idsel <=  0 ;
            pci_irdy_l <=  0 ;
            pci_cbe_l <=  4'b0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
        end
    endtask
    task  normal_write ; 
        input [31:0] addr ; 
        input [31:0] data ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            if ((BAR_val == 0)) 
                pci_cbe_l <=  4'b0111 ;
            else
                pci_cbe_l <=  4'b011 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_frame_l <=  1 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            pci_ad_reg <=  data ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_cbe_l <=  4'b1111 ;
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            tg_ready_l <=  1 ;
            @(posedge pci_clk);
        end
    endtask
    task  normal_read ; 
        input [31:0] addr ; 
        input [31:0] data ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_oe <=  1 ;
            pci_ad_reg <=  addr ;
            if ((BAR_val == 0)) 
                pci_cbe_l <=  4'b0110 ;
            else
                pci_cbe_l <=  4'b010 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_frame_l <=  1 ;
            pci_ad_oe <=  0 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            tg_data_in <=  data ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            @(posedge pci_clk);
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            tg_ready_l <=  1 ;
            tg_data_in <=  32'b0 ;
        end
    endtask
    task  burst_write ; 
        input [31:0] addr ; 
        input [31:0] data, data1, data2 ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_oe <=  1 ;
            pci_ad_reg <=  addr ;
            if ((!BAR_val)) 
                pci_cbe_l <=  4'b0111 ;
            else
                pci_cbe_l <=  4'b011 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_reg <=  data ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_ad_reg <=  data1 ;
            @(posedge pci_clk);
            pci_frame_l <=  1 ;
            pci_ad_reg <=  data2 ;
            @(posedge pci_clk);
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  1 ;
            @(posedge pci_clk);
        end
    endtask
    task  burst_read ; 
        input [31:0] addr ; 
        input [31:0] data, data1, data2 ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            if ((!BAR_val)) 
                pci_cbe_l <=  4'b0110 ;
            else
                pci_cbe_l <=  4'b010 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            tg_ready_l = 0 ;
            @(posedge pci_clk);
            tg_data_in <=  data ;
            @(posedge pci_clk);
            tg_data_in <=  data1 ;
            @(posedge pci_clk);
            tg_data_in <=  data2 ;
            pci_frame_l <=  1 ;
            @(posedge pci_clk);
            tg_data_in <=  0 ;
            pci_irdy_l <=  1 ;
            @(posedge pci_clk);
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            tg_ready_l = 1 ;
        end
    endtask
    task  wait_write ; 
        input [31:0] addr ; 
        input [31:0] data, data1, data2 ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_oe <=  1 ;
            pci_ad_reg <=  addr ;
            if ((!BAR_val)) 
                pci_cbe_l <=  4'b0111 ;
            else
                pci_cbe_l <=  4'b011 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_reg <=  data ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  0 ;
            @(negedge pci_trdy_l);
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            @(posedge pci_clk);
            pci_irdy_l <=  0 ;
            pci_ad_reg <=  data1 ;
            @(posedge pci_clk);
            pci_frame_l <=  1 ;
            pci_ad_reg <=  data2 ;
            @(posedge pci_clk);
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  1 ;
            @(posedge pci_clk);
        end
    endtask
    task  wait_read ; 
        input [31:0] addr ; 
        input [31:0] data, data1, data2 ; 
        input BAR_val ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            if ((!BAR_val)) 
                pci_cbe_l <=  4'b0110 ;
            else
                pci_cbe_l <=  4'b010 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            tg_ready_l = 0 ;
            @(posedge pci_clk);
            tg_data_in <=  data ;
            @(posedge pci_clk);
            tg_data_in <=  data1 ;
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            tg_data_in <=  data2 ;
            @(posedge pci_clk);
            pci_irdy_l <=  0 ;
            tg_data_in <=  0 ;
            pci_frame_l <=  1 ;
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l = 1 ;
        end
    endtask
    task  retry_write ; 
        input [31:0] addr ; 
        input [31:0] data ; 
        input BAR_value ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_oe <=  1 ;
            pci_ad_reg <=  addr ;
            if ((!BAR_value)) 
                pci_cbe_l <=  4'b0111 ;
            else
                pci_cbe_l <=  4'b011 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_reg <=  data ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            tg_stop_l <=  0 ;
            @(posedge pci_clk);
            tg_stop_l <=  1 ;
            @(posedge pci_clk);
            pci_frame_l <=  1 ;
            @(posedge pci_clk);
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_irdy_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            @(posedge pci_clk);
            @(posedge pci_clk);
            @(posedge pci_clk);
            tg_ready_l <=  1 ;
            @(posedge pci_clk);
        end
    endtask
    task  retry_read ; 
        input [31:0] addr ; 
        input [31:0] data ; 
        input BAR_value ; 
        begin
            @(posedge pci_clk);
            pci_frame_l <=  0 ;
            pci_ad_reg <=  addr ;
            pci_ad_oe <=  1 ;
            if ((!BAR_value)) 
                pci_cbe_l <=  4'b0110 ;
            else
                pci_cbe_l <=  4'b010 ;
            @(posedge pci_clk);
            pci_par_oe <=  1 ;
            pci_ad_oe <=  0 ;
            pci_ad_reg <=  0 ;
            pci_cbe_l <=  4'b0 ;
            pci_irdy_l <=  0 ;
            @(posedge pci_clk);
            pci_par_oe <=  0 ;
            tg_stop_l <=  0 ;
            @(posedge pci_clk);
            tg_stop_l <=  1 ;
            @(posedge pci_clk);
            tg_data_in <=  data ;
            @(posedge pci_clk);
            tg_data_in <=  0 ;
            pci_frame_l <=  1 ;
            pci_cbe_l <=  4'bz ;
            @(posedge pci_clk);
            pci_irdy_l <=  1 ;
            @(posedge pci_clk);
        end
    endtask
endmodule


