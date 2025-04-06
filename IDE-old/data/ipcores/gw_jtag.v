module GW_JTAG (
    tck_pad_i,
    tms_pad_i,
    tdi_pad_i,
    tdo_pad_o,
    tck_o,                //DRCK_IN
    tdi_o,                //TDI_IN
    test_logic_reset_o,   //RESET_IN
    run_test_idle_er1_o,   
    run_test_idle_er2_o,   
    shift_dr_capture_dr_o,//SHIFT_IN|CAPTURE_IN
    pause_dr_o,     
    update_dr_o,          //UPDATE_IN
    enable_er1_o,         //SEL_IN
    enable_er2_o,         //SEL_IN
    tdo_er1_i,            //TDO_OUT
    tdo_er2_i             //TDO_OUT
    )/* synthesis syn_black_box  */;

  input tck_pad_i;
  input tms_pad_i;
  input tdi_pad_i;
  output tdo_pad_o;
  input tdo_er1_i;
  input tdo_er2_i;
  output tck_o;
  output tdi_o;
  output test_logic_reset_o;
  output run_test_idle_er1_o;
  output run_test_idle_er2_o;
  output shift_dr_capture_dr_o;
  output pause_dr_o;
  output update_dr_o;
  output enable_er1_o;
  output enable_er2_o;

endmodule
