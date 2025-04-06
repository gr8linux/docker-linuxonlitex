
`include "uac_define.v"
`include "static_macro_define.v"
`ifdef MSIM
module USB_Audio_Class_Top
`else
module `module_name
`endif
(
     input          i_clk60        
    ,input          i_clk98304      
      
    ,input          i_reset    
    ,input          i_usb_busreset  
//====================descriptor==============================            
    ,input  [15:0]  i_desc_raddr        
    ,output [ 7:0]  o_desc_rdat         
    ,input  [ 7:0]  i_desc_index        
    ,input  [ 7:0]  i_desc_type          
    ,output [15:0]  o_desc_dev_addr        
    ,output [15:0]  o_desc_dev_len         
    ,output [15:0]  o_desc_qual_addr       
    ,output [15:0]  o_desc_qual_len        
    ,output [15:0]  o_desc_fscfg_addr      
    ,output [15:0]  o_desc_fscfg_len       
    ,output [15:0]  o_desc_hscfg_addr      
    ,output [15:0]  o_desc_hscfg_len       
    ,output [15:0]  o_desc_hidrpt_addr     
    ,output [15:0]  o_desc_hidrpt_len      
    ,output [15:0]  o_desc_oscfg_addr      
    ,output [15:0]  o_desc_strlang_addr    
    ,output [15:0]  o_desc_strvendor_addr  
    ,output [15:0]  o_desc_strvendor_len   
    ,output [15:0]  o_desc_strproduct_addr 
    ,output [15:0]  o_desc_strproduct_len  
    ,output [15:0]  o_desc_strserial_addr  
    ,output [15:0]  o_desc_strserial_len   
    ,output         o_desc_have_strings
//========================USB==============================      
    ,input          i_usb_setup     
    ,input  [3:0]   i_usb_endpt_sel  
    ,input          i_usb_sof

    ,input          i_usb_txact        
    ,input          i_usb_txpop  
    ,output         o_usb_txval
    ,output [ 7:0]  o_usb_txdat
    ,output [11:0]  o_usb_txdat_len
    ,input          i_usb_txpktfin
    ,output         o_usb_txcork  

    ,input          i_usb_rxact        
    ,input          i_usb_rxval 
    ,input          i_usb_rxpktval  
    ,output         o_usb_rxrdy    
    ,input  [7:0]   i_usb_rxdat       
 
    ,input  [7:0]   i_interface_alter
    ,output [7:0]   o_interface_alter
    ,input  [7:0]   i_interface_sel    
    ,input          i_interface_update 
//====================audio_tx==============================
`ifdef ENABLE_SPEAKER1
    `ifdef SPEAKER1_IIS
    ,output wire    o_spk_iis_bclk_1
    ,output wire    o_spk_iis_lrck_1
    ,output wire    o_spk_iis_data_1
    `endif
    `ifdef SPEAKER1_PCM
    ,output wire    o_spk_pcm_bclk_1 
    ,output wire    o_spk_pcm_lrck_1  
    ,output wire    o_spk_pcm_data_1  
    `endif
    `ifdef SPEAKER1_DSD
    ,output wire    o_spk_dsd_clk_1   
    ,output wire    o_spk_dsd_data1_1 
    ,output wire    o_spk_dsd_data2_1 
    `endif
    `ifdef SPEAKER1_PCM_32
    ,output [31:0]  o_spk_l_pcm_data_1
    ,output [31:0]  o_spk_r_pcm_data_1
    `endif
`endif

`ifdef ENABLE_SPEAKER2
    `ifdef SPEAKER2_IIS
    ,output wire    o_spk_iis_bclk_2
    ,output wire    o_spk_iis_lrck_2
    ,output wire    o_spk_iis_data_2
    `endif
    `ifdef SPEAKER2_PCM
    ,output wire    o_spk_pcm_bclk_2 
    ,output wire    o_spk_pcm_lrck_2  
    ,output wire    o_spk_pcm_data_2  
    `endif
    `ifdef SPEAKER2_DSD
    ,output wire    o_spk_dsd_clk_2   
    ,output wire    o_spk_dsd_data1_2 
    ,output wire    o_spk_dsd_data2_2 
    `endif
    `ifdef SPEAKER2_PCM_32
    ,output [31:0]  o_spk_l_pcm_data_2
    ,output [31:0]  o_spk_r_pcm_data_2
    `endif
`endif

`ifdef ENABLE_SPEAKER3
    `ifdef SPEAKER3_IIS
    ,output wire    o_spk_iis_bclk_3
    ,output wire    o_spk_iis_lrck_3
    ,output wire    o_spk_iis_data_3
    `endif
    `ifdef SPEAKER3_PCM
    ,output wire    o_spk_pcm_bclk_3 
    ,output wire    o_spk_pcm_lrck_3  
    ,output wire    o_spk_pcm_data_3  
    `endif
    `ifdef SPEAKER3_DSD
    ,output wire    o_spk_dsd_clk_3   
    ,output wire    o_spk_dsd_data1_3 
    ,output wire    o_spk_dsd_data2_3 
    `endif
    `ifdef SPEAKER3_PCM_32
    ,output [31:0]  o_spk_l_pcm_data_3
    ,output [31:0]  o_spk_r_pcm_data_3
    `endif
`endif

//====================audio_rx==============================   
`ifdef OUTSIDE_CLK
`ifdef ENABLE_MIC1
    ,input  wire	i_mic_iis_bclk_1 
    ,input  wire	i_mic_iis_lrck_1 
    ,input  wire	i_mic_iis_data_1 
`endif
`ifdef ENABLE_MIC2
    ,input  wire	i_mic_iis_bclk_2 
    ,input  wire	i_mic_iis_lrck_2 
    ,input  wire	i_mic_iis_data_2 
`endif
`ifdef ENABLE_MIC3
    ,input  wire	i_mic_iis_bclk_3 
    ,input  wire	i_mic_iis_lrck_3 
    ,input  wire	i_mic_iis_data_3 
`endif
`else
`ifdef ENABLE_MIC1
    ,output wire	o_mic_iis_bclk_1 
    ,output wire	o_mic_iis_lrck_1 
    ,input  wire	i_mic_iis_data_1 
`endif
`ifdef ENABLE_MIC2
    ,output wire	o_mic_iis_bclk_2 
    ,output wire	o_mic_iis_lrck_2 
    ,input  wire	i_mic_iis_data_2 
`endif
`ifdef ENABLE_MIC3
    ,output wire	o_mic_iis_bclk_3 
    ,output wire	o_mic_iis_lrck_3 
    ,input  wire	i_mic_iis_data_3 
`endif
`endif
);

        parameter VENDORID       = 16'h33AA;
        parameter PRODUCTID      = 16'h0204;
        parameter VERSIONBCD     = 16'h0116;

`ifdef MSIM
    USB_Audio_Class 
#(
     .VENDORID               (VENDORID[15:0])
    ,.PRODUCTID              (PRODUCTID[15:0])
    ,.VERSIONBCD             (VERSIONBCD[15:0])
)u_USB_Audio_Class
`else
    `getname(USB_Audio_Class,`module_name) 
#(
     .VENDORID               (VENDORID[15:0])
    ,.PRODUCTID              (PRODUCTID[15:0])
    ,.VERSIONBCD             (VERSIONBCD[15:0])
)u_USB_Audio_Class
`endif
 (
     .i_clk60               (i_clk60                )
    ,.i_clk98304            (i_clk98304             )

    ,.i_reset               (i_reset                )
    ,.i_usb_busreset        (i_usb_busreset         )
//====================descriptor==============================
    ,.i_desc_raddr          (i_desc_raddr           )
    ,.o_desc_rdat           (o_desc_rdat           )
    ,.i_desc_index          (i_desc_index            )
    ,.i_desc_type           (i_desc_type            )
    ,.o_desc_dev_addr       (o_desc_dev_addr        )
    ,.o_desc_dev_len        (o_desc_dev_len         )
    ,.o_desc_qual_addr      (o_desc_qual_addr       )
    ,.o_desc_qual_len       (o_desc_qual_len        )
    ,.o_desc_fscfg_addr     (o_desc_fscfg_addr      )
    ,.o_desc_fscfg_len      (o_desc_fscfg_len       )
    ,.o_desc_hscfg_addr     (o_desc_hscfg_addr      )
    ,.o_desc_hscfg_len      (o_desc_hscfg_len       )
    ,.o_desc_hidrpt_addr    (o_desc_hidrpt_addr     )
    ,.o_desc_hidrpt_len     (o_desc_hidrpt_len      )
    ,.o_desc_oscfg_addr     (o_desc_oscfg_addr      )
    ,.o_desc_strlang_addr   (o_desc_strlang_addr    )
    ,.o_desc_strvendor_addr (o_desc_strvendor_addr  )
    ,.o_desc_strvendor_len  (o_desc_strvendor_len   )
    ,.o_desc_strproduct_addr(o_desc_strproduct_addr )
    ,.o_desc_strproduct_len (o_desc_strproduct_len  )
    ,.o_desc_strserial_addr (o_desc_strserial_addr  )
    ,.o_desc_strserial_len  (o_desc_strserial_len   )
    ,.o_desc_have_strings   (o_desc_have_strings    )
//========================USB==============================
    ,.i_usb_setup           (i_usb_setup            )
    ,.i_usb_endpt_sel       (i_usb_endpt_sel        )

    ,.i_usb_sof             (i_usb_sof              )

    ,.i_usb_txact           (i_usb_txact            )
    ,.i_usb_txpop           (i_usb_txpop            )
    ,.o_usb_txval           (o_usb_txval            )
    ,.o_usb_txdat           (o_usb_txdat            )
    ,.o_usb_txdat_len       (o_usb_txdat_len        )
    ,.i_usb_txpktfin        (i_usb_txpktfin         )
    ,.o_usb_txcork          (o_usb_txcork           )

    ,.i_usb_rxact           (i_usb_rxact            )
    ,.i_usb_rxval           (i_usb_rxval            )
    ,.i_usb_rxpktval        (i_usb_rxpktval         )
    ,.o_usb_rxrdy           (o_usb_rxrdy            )//no care
    ,.i_usb_rxdat           (i_usb_rxdat            )

    ,.i_interface_alter     (i_interface_alter      )
    ,.o_interface_alter     (o_interface_alter      )
    ,.i_interface_sel       (i_interface_sel        )
    ,.i_interface_update    (i_interface_update     )

//====================audio_tx==============================
`ifdef ENABLE_SPEAKER1
    `ifdef SPEAKER1_IIS
    ,.o_spk_iis_bclk_1      (o_spk_iis_bclk_1)
    ,.o_spk_iis_lrck_1      (o_spk_iis_lrck_1)
    ,.o_spk_iis_data_1      (o_spk_iis_data_1)
    `endif
    `ifdef SPEAKER1_PCM
    ,.o_spk_pcm_bclk_1      (o_spk_pcm_bclk_1) 
    ,.o_spk_pcm_lrck_1      (o_spk_pcm_lrck_1)  
    ,.o_spk_pcm_data_1      (o_spk_pcm_data_1)  
    `endif
    `ifdef SPEAKER1_DSD
    ,.o_spk_dsd_clk_1       (o_spk_dsd_clk_1)   
    ,.o_spk_dsd_data1_1     (o_spk_dsd_data1_1) 
    ,.o_spk_dsd_data2_1     (o_spk_dsd_data2_1) 
    `endif
    `ifdef SPEAKER1_PCM_32
    ,.o_spk_l_pcm_data_1    (o_spk_l_pcm_data_1)
    ,.o_spk_r_pcm_data_1    (o_spk_r_pcm_data_1)
    `endif
`endif

`ifdef ENABLE_SPEAKER2
    `ifdef SPEAKER2_IIS
    ,.o_spk_iis_bclk_2      (o_spk_iis_bclk_2)
    ,.o_spk_iis_lrck_2      (o_spk_iis_lrck_2)
    ,.o_spk_iis_data_2      (o_spk_iis_data_2)
    `endif
    `ifdef SPEAKER2_PCM
    ,.o_spk_pcm_bclk_2      (o_spk_pcm_bclk_2) 
    ,.o_spk_pcm_lrck_2      (o_spk_pcm_lrck_2)  
    ,.o_spk_pcm_data_2      (o_spk_pcm_data_2)  
    `endif
    `ifdef SPEAKER2_DSD
    ,.o_spk_dsd_clk_2       (o_spk_dsd_clk_2)   
    ,.o_spk_dsd_data1_2     (o_spk_dsd_data1_2) 
    ,.o_spk_dsd_data2_2     (o_spk_dsd_data2_2) 
    `endif
    `ifdef SPEAKER2_PCM_32
    ,.o_spk_l_pcm_data_2    (o_spk_l_pcm_data_2)
    ,.o_spk_r_pcm_data_2    (o_spk_r_pcm_data_2)
    `endif
`endif

`ifdef ENABLE_SPEAKER3
    `ifdef SPEAKER3_IIS
    ,.o_spk_iis_bclk_3      (o_spk_iis_bclk_3)
    ,.o_spk_iis_lrck_3      (o_spk_iis_lrck_3)
    ,.o_spk_iis_data_3      (o_spk_iis_data_3)
    `endif
    `ifdef SPEAKER3_PCM
    ,.o_spk_pcm_bclk_3      (o_spk_pcm_bclk_3) 
    ,.o_spk_pcm_lrck_3      (o_spk_pcm_lrck_3)  
    ,.o_spk_pcm_data_3      (o_spk_pcm_data_3)  
    `endif
    `ifdef SPEAKER3_DSD
    ,.o_spk_dsd_clk_3       (o_spk_dsd_clk_3)   
    ,.o_spk_dsd_data1_3     (o_spk_dsd_data1_3) 
    ,.o_spk_dsd_data2_3     (o_spk_dsd_data2_3) 
    `endif
    `ifdef SPEAKER3_PCM_32
    ,.o_spk_l_pcm_data_3    (o_spk_l_pcm_data_3)
    ,.o_spk_r_pcm_data_3    (o_spk_r_pcm_data_3)
    `endif
`endif
//====================audio_rx==============================
`ifdef OUTSIDE_CLK
`ifdef EP1_IN_EN
    ,.i_mic_iis_bclk_1        (i_mic_iis_bclk_1     )
    ,.i_mic_iis_lrck_1        (i_mic_iis_lrck_1     )
    ,.i_mic_iis_data_1        (i_mic_iis_data_1     )
`endif
`ifdef EP2_IN_EN
    ,.i_mic_iis_bclk_2        (i_mic_iis_bclk_2     )
    ,.i_mic_iis_lrck_2        (i_mic_iis_lrck_2     )
    ,.i_mic_iis_data_2        (i_mic_iis_data_2     )
`endif
`ifdef EP3_IN_EN
    ,.i_mic_iis_bclk_3        (i_mic_iis_bclk_3     )
    ,.i_mic_iis_lrck_3        (i_mic_iis_lrck_3     )
    ,.i_mic_iis_data_3        (i_mic_iis_data_3     )
`endif
`else
`ifdef EP1_IN_EN
    ,.o_mic_iis_bclk_1        (o_mic_iis_bclk_1     )
    ,.o_mic_iis_lrck_1        (o_mic_iis_lrck_1     )
    ,.i_mic_iis_data_1        (i_mic_iis_data_1     )
`endif
`ifdef EP2_IN_EN
    ,.o_mic_iis_bclk_2        (o_mic_iis_bclk_2     )
    ,.o_mic_iis_lrck_2        (o_mic_iis_lrck_2     )
    ,.i_mic_iis_data_2        (i_mic_iis_data_2     )
`endif
`ifdef EP3_IN_EN
    ,.o_mic_iis_bclk_3        (o_mic_iis_bclk_3     )
    ,.o_mic_iis_lrck_3        (o_mic_iis_lrck_3     )
    ,.i_mic_iis_data_3        (i_mic_iis_data_3     )
`endif

`endif
);



endmodule