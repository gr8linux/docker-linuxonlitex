//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.7.02Beta
//Part Number: GW1N-LV2LQ144XC7/I6
//Device: GW1N-2
//Created Time: Fri Apr 02 09:58:34 2021

module Gowin_OSC (oscout, oscen);

output oscout;
input oscen;

OSCO osc_inst (
    .OSCOUT(oscout),
    .OSCEN(oscen)
);

defparam osc_inst.FREQ_DIV = 10;
defparam osc_inst.REGULATOR_EN = 1'b0;

endmodule //Gowin_OSC
