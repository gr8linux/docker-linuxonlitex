//`define USER_DEFINED
//
`include "USB2_0_Mass_Storage_define.v"
`include "static_macro_define.v"
`ifdef MSIM
module USB2_0_Mass_Storage_top
`else
module `module_name
`endif
(
     input              clk_i       
     ,input              reset_i       
 
//decive_ctr
    ,input              usb_busreset_i     
    ,input              usb_setup_active_i     
    ,input              usb_rxval_i        
    ,input              usb_rxact_i        
    ,input   [7:0]      usb_rxdat_i        
    ,input              usb_txact_i        
    ,input              usb_txpop_i        
    ,output             usb_txval_o    
    ,output             usb_txcork_o     
    ,output  [7:0]      usb_txdat_o      
    ,output  [11:0]     usb_txdat_len_o  
    ,input   [3:0]      usb_endpt_i           
    ,input              usb_txpktfin_i   

    ,output             usb_rxrdy_o       
    ,input              usb_rxpktval_i    


// w25_default_flash
`ifdef W25Q128FV
    ,input             debug
    ,input             w25_di_i
    ,output            w25_do_o 
    ,output            w25_cs_o
    ,output            w25_sclk_o
`else
    ,input               flash_rx_data_val_i       
    ,input   [7:0]       flash_rx_data_i        


    ,output              flash_tx_data_val_o      
    ,output  [7:0]       flash_tx_data_o           
    ,input               flash_write_busy_i    

    ,output  [15:0]      flash_tran_len_o                    
    ,output  [31:0]      flash_log_block_addr_o                 

    ,output              flash_rw_o            
    ,output              flash_rw_start_o          
    ,input               flash_write_finish_i    
    `endif
);

`ifdef MSIM
    USB2_0_Mass_Storage u_USB2_0_Mass_Storage
`else
    `getname(USB2_0_Mass_Storage,`module_name) u_USB2_0_Mass_Storage
`endif
    (
     .clk_i             (clk_i     )      
     ,.reset_i           (reset_i      )      
 
//decive_ctr
    ,.usb_busreset_i       (usb_busreset_i   )
    ,.usb_setup_active_i       (usb_setup_active_i   )
    ,.usb_rxval_i          (usb_rxval_i      )
    ,.usb_rxact_i          (usb_rxact_i      )
    ,.usb_rxdat_i          (usb_rxdat_i      )
    ,.usb_txact_i          (usb_txact_i      )
    ,.usb_txpop_i          (usb_txpop_i      )
    ,.usb_txval_o      (usb_txval_o    )
    ,.usb_txcork_o       (usb_txcork_o     )
    ,.usb_txdat_o        (usb_txdat_o      )
    ,.usb_txdat_len_o    (usb_txdat_len_o  )
    ,.usb_endpt_i        (usb_endpt_i      )
    ,.usb_txpktfin_i     (usb_txpktfin_i   )

    ,.usb_rxrdy_o          (usb_rxrdy_o      )    
    ,.usb_rxpktval_i       (usb_rxpktval_i   )



// w25_default_flash
`ifdef W25Q128FV
    ,.debug              ( debug         )
    ,.w25_di_i               (w25_di_i           )   
    ,.w25_do_o               (w25_do_o           )     
    ,.w25_cs_o               (w25_cs_o           )   
    ,.w25_sclk_o             (w25_sclk_o         )   

`else
    ,.flash_rx_data_val_i        (  flash_rx_data_val_i               )            //input
    ,.flash_rx_data_i            (  flash_rx_data_i               )          //input


    ,.flash_tx_data_val_o        ( flash_tx_data_val_o                )     //output
    ,.flash_tx_data_o            ( flash_tx_data_o                )    //output
    ,.flash_write_busy_i         ( flash_write_busy_i                )     //input

    ,.flash_tran_len_o           ( flash_tran_len_o                )        //output
    ,.flash_log_block_addr_o                ( flash_log_block_addr_o           )//output

    ,.flash_rw_o                 ( flash_rw_o                )         //output

    ,.flash_rw_start_o         ( flash_rw_start_o                )   //output
    ,.flash_write_finish_i( flash_write_finish_i                )      //input
    `endif
    );
endmodule