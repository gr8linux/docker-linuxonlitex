
`include "static_macro_define.v"
`include "USB20_Host_Controller_define.v"


`ifdef sim
module usb_host_controller_top
`else
module `module_name
`endif
(
	input 		clk_i 
	,input 		rst_n_i                     
	
	,input 		cs_n_i                    
	,input 		rd_n_i                    
	,input 		wr_n_i                    
	,input [7:0]	addr_i 
	,input [7:0]    dat_i 
	,output [7:0]   dat_o
	,output 		dat_o_en                 
	
	,output dreq_o                    
	,input  dack_i                    
	
	,output hardware_interrupt_o      
	
               
	,output 		phy_rst_o                 
	,input  		ulpi_dir_i                
	,input  		ulpi_nxt_i	            
	,input  [7:0]	ulpi_data_out_i			
	,output [7:0]	ulpi_data_in_o	        
	,output 		ulpi_stp_o      
);



`ifdef sim
usb_host_controller
`else 
`getname(USB20_Host_Controller,`module_name)
`endif
usb_host_controller_inst
(
	
	 .clk 			(clk_i)	
	,.rst_n         (rst_n_i)
	
	,.cs_n 			(cs_n_i)
	,.rd_n           (rd_n_i)
	,.wr_n           (wr_n_i)
	,.addr           (addr_i)
	,.dat_i  		  (dat_i)
	,.dat_o 			 (dat_o)
	,.dat_o_en 		(dat_o_en)
	
	,.dreq 			 (dreq_o)
	,.dack           (dack_i)
			
	,.hardware_interrupt	(hardware_interrupt_o)
	

	,.phy_rst               (phy_rst_o)
	,.ulpi_dir_i            (ulpi_dir_i)
	,.ulpi_nxt_i	        (ulpi_nxt_i)
	,.ulpi_data_out_i       (ulpi_data_out_i)
	,.ulpi_data_in_o        (ulpi_data_in_o)
	,.ulpi_stp_o         	(ulpi_stp_o)


);












endmodule