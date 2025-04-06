
//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    GW_rPLL_27 your_instance_name(
        .clkout(clkout_o), //output clkout
        .lock(lock_o), //output lock
        .clkin(clkin_i) //input clkin
    );

//--------Copy end-------------------
