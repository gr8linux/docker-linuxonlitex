
## part 1: new lib
vlib work
vmap work work

## part 2: load design
vlog -sv ../../tb/prim_sim.v
vlog -sv ../../FileName.vo
vlog -sv ../../tb/SPDIF_TX_tb.v 
vlog +incdir+ ../../temp/SPDIF_TX/spdif_tx_defines.v
vlog +incdir+ ../../temp/SPDIF_TX/spdif_tx_name.v

## part 3: sim design
vsim  -novopt work.tb

## part 4: add signals
add wave -position insertpoint sim:/tb/*

## part 5: show ui 
view wave
view structure
view signals

## part 6: run 
run -all
