
`include "pci_to_can_name.v"
module `module_name_pci(
     pci_clk,
	   pci_rst_l,
	   
     cpu_read,
     cpu_write,
     cpu_cs,
 	   cpu_addr,
	   cpu_wdat,
	   cpu_rdat,
     cpu_ack,
     cpu_err,
     int_o,

	   tg_addr,
	   tg_data_out,
	   tg_cbe_l,
	   tg_read_l,
	   tg_write_l,
	   tg_bar_hit,
	   tg_access,
	   tg_value,
     tg_cmd_o,
 
	   tg_int_l,
	   tg_data_in,
	   tg_ready_l,
	   tg_stop_l,
	   tg_abort_l

);


     input                       pci_clk;
     input                       pci_rst_l;
	   input        [31:0]         tg_addr;
	   input        [31:0]         tg_data_out;
	   input        [3:0]          tg_cbe_l;
	   input                       tg_read_l;
	   input                       tg_write_l;
	   input                       tg_bar_hit;
	   input                       tg_access;
	   input                       tg_value;
     input        [3:0]          tg_cmd_o;

	   output                      tg_int_l;
	   output       [31:0]         tg_data_in;
	   output                      tg_ready_l;
	   output                      tg_stop_l;
	   output                      tg_abort_l;
	   
	   output       [31:0]         cpu_addr;
	   output       [31:0]         cpu_wdat;
	   input        [31:0]         cpu_rdat;
     input                       cpu_ack;
     input                       cpu_err;
     input                       int_o;
     output                      cpu_read;
     output                      cpu_write;
     output                      cpu_cs;

`getname(Bridge,`module_name_pci) Bridge_init0 (
     .clk        (pci_clk),
	   .rst_n      (pci_rst_l),
	   
     .cpu_read_0  (cpu_read),
     .cpu_write_0 (cpu_write),
     .cpu_cs_0    (cpu_cs),
 	   .cpu_addr_0  (cpu_addr),
	   .cpu_wdat_0  (cpu_wdat),
	   .cpu_rdat_0  (cpu_rdat),
     .cpu_ack_0   (cpu_ack),
     .cpu_err_0   (cpu_err),
     .int_o_0     (int_o),
     .tg_addr    (tg_addr),
	   .tg_data_out(tg_data_out),
	   .tg_read_l  (tg_read_l),
	   .tg_write_l (tg_write_l),
	   .tg_bar_hit (tg_bar_hit),
	   .tg_access  (tg_access),
	   .tg_value   (tg_value),
	   .tg_cmd_o   (tg_cmd_o),
     .tg_cbe_l   (tg_cbe_l),     

	   .tg_int_l   (tg_int_l),
	   .tg_data_in (tg_data_in),
	   .tg_ready_l (tg_ready_l),
	   .tg_stop_l  (tg_stop_l),
	   .tg_abort_l (tg_abort_l)
	   
);


endmodule
