`include "pci_to_ethernet_name.v"
module `module_name (
        pci_clk               ,
        tg_addr               ,  
        tg_data_out           , 
        tg_data_in            , 
        tg_cbe_l              , 
        tg_ready_l            , 
        tg_write_l            , 
        tg_read_l             , 
        tg_stop_l             , 
        tg_abort_l            , 
        tg_cmd_o              , 
        tg_bar_hit            , 
        tg_access             ,
        tg_value              ,
 
        gtx_clk               ,
        speedis1000           ,
        speedis10             ,
        duplex_status         ,
        pci_reset_l           ,
        rx_mac_clk            ,
        rx_mac_valid          ,
        rx_mac_data           ,
        rx_mac_last           ,
        rx_mac_error          ,                         
        tx_mac_clk            ,
        tx_mac_valid          ,
        tx_mac_data           ,
        tx_mac_last           ,
        tx_mac_error          ,
        tx_mac_ready          ,
        tx_collision          ,
        tx_retransmit         ,
        rx_fcs_fwd_ena        ,
        rx_jumbo_ena          ,
        rx_statistics_valid   ,
        rx_statistics_vector  ,
        rx_pause_req          ,
        rx_pause_val          ,
        tx_pause_req          ,
        tx_pause_val          ,
        tx_pause_source_addr  ,
        tx_ifg_delay_ena      ,
        tx_ifg_delay          ,
        tx_fcs_fwd_ena        ,
        tx_statistics_valid   ,
        tx_statistics_vector  ,
        clk                   ,
        miim_phyad            ,
        miim_regad            ,
        miim_wrdata           ,
        miim_wren             ,
        miim_rden             ,
        miim_rddata           ,
        miim_rddata_valid     ,
        miim_busy             
         
);
            input                  pci_clk;
            input                  gtx_clk;
            input   [31:0]         tg_addr; 
            input   [3:0]          tg_cbe_l;
            input                  tg_read_l;
            output                 tg_stop_l;
            output                 tg_abort_l;
            output  [31:0]         tg_data_in;
            output                 tg_ready_l;
            input   [3:0]          tg_cmd_o;
            input                  tg_bar_hit;
            input                  tg_access;
            input                  tg_value;
            input   [31:0]         tg_data_out;
            input                  tg_write_l;
  
            input                  rx_mac_clk;
            input                  rx_mac_valid;
            input   [7:0]          rx_mac_data;
            input                  rx_mac_last;
            input                  rx_mac_error;
            input                  pci_reset_l;        
            input                  rx_pause_req;
            input   [15:0]         rx_pause_val;
            input                  rx_statistics_valid; 
            input   [26:0]         rx_statistics_vector;
            input                  tx_mac_clk;             //Eth clk
            output                 tx_mac_valid;           //user design send data enable to Eth
            output  [7:0]          tx_mac_data;            //user design send data to Eth
            output                 tx_mac_last;            //if assert , it is indicates user will send last data
            output                 tx_mac_error;           //send data error
            input                  tx_mac_ready;           //if assert , it is indicates user's data has successfully send
            input                  tx_collision;     
            input                  tx_retransmit;   
            input                  tx_statistics_valid;
            input   [28:0]         tx_statistics_vector;
            output                 tx_pause_req;   
            output  [15:0]         tx_pause_val;         
            output  [47:0]         tx_pause_source_addr; 
            output  [4:0]          miim_phyad;
            output  [4:0]          miim_regad;
            output  [15:0]         miim_wrdata;
            output                 miim_wren;
	          output                 miim_rden;
            output                 speedis1000;
            output                 speedis10;
            output                 duplex_status;
            input                  clk;
            input   [15:0]         miim_rddata;
	          input                  miim_rddata_valid;
	          input                  miim_busy;
            
            output                 rx_fcs_fwd_ena;
            output                 rx_jumbo_ena;
            output                 tx_ifg_delay_ena;
            output                 tx_ifg_delay;
            output                 tx_fcs_fwd_ena;

`getname(PCI_to_Ethernet,`module_name) u_PCI_to_Ethernet(
        .pci_clk               (pci_clk               ),
        .tg_addr               (tg_addr               ),  
        .tg_data_out           (tg_data_out           ), 
        .tg_data_in            (tg_data_in            ), 
        .tg_cbe_l              (tg_cbe_l              ), 
        .tg_ready_l            (tg_ready_l            ), 
        .tg_write_l            (tg_write_l            ), 
        .tg_read_l             (tg_read_l             ), 
        .tg_stop_l             (tg_stop_l             ), 
        .tg_abort_l            (tg_abort_l            ), 
        .tg_cmd_o              (tg_cmd_o              ), 
        .tg_bar_hit            (tg_bar_hit            ), 
        .tg_access             (tg_access             ),
        .tg_value              (tg_value              ),
 
        .gtx_clk               (gtx_clk               ),
        .speedis1000           (speedis1000           ),
        .speedis10             (speedis10             ),
        .duplex_status         (duplex_status         ),
        .pci_reset_l           (pci_reset_l           ),
        .rx_mac_clk            (rx_mac_clk            ),
        .rx_mac_valid          (rx_mac_valid          ),
        .rx_mac_data           (rx_mac_data           ),
        .rx_mac_last           (rx_mac_last           ),
        .rx_mac_error          (rx_mac_error          ),                         
        .tx_mac_clk            (tx_mac_clk            ),
        .tx_mac_valid          (tx_mac_valid          ),
        .tx_mac_data           (tx_mac_data           ),
        .tx_mac_last           (tx_mac_last           ),
        .tx_mac_error          (tx_mac_error          ),
        .tx_mac_ready          (tx_mac_ready          ),
        .tx_collision          (tx_collision          ),
        .tx_retransmit         (tx_retransmit         ),
        .rx_fcs_fwd_ena        (rx_fcs_fwd_ena        ),
        .rx_jumbo_ena          (rx_jumbo_ena          ),
        .rx_statistics_valid   (rx_statistics_valid   ),
        .rx_statistics_vector  (rx_statistics_vector  ),
        .rx_pause_req          (rx_pause_req          ),
        .rx_pause_val          (rx_pause_val          ),
        .tx_pause_req          (tx_pause_req          ),
        .tx_pause_val          (tx_pause_val          ),
        .tx_pause_source_addr  (tx_pause_source_addr  ),
        .tx_ifg_delay_ena      (tx_ifg_delay_ena      ),
        .tx_ifg_delay          (tx_ifg_delay          ),
        .tx_fcs_fwd_ena        (tx_fcs_fwd_ena        ),
        .tx_statistics_valid   (tx_statistics_valid   ),
        .tx_statistics_vector  (tx_statistics_vector  ),
        .clk                   (pci_clk               ),
        .miim_phyad            (miim_phyad            ),
        .miim_regad            (miim_regad            ),
        .miim_wrdata           (miim_wrdata           ),
        .miim_wren             (miim_wren             ),
        .miim_rden             (miim_rden             ),
        .miim_rddata           (miim_rddata           ),
        .miim_rddata_valid     (miim_rddata_valid     ),
        .miim_busy             (miim_busy             )

);

endmodule
