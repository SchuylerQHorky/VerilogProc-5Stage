# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./Processor.v"
vlog "./carryselectadder64bit.v"
vlog "./mux_8_64bit.v"
vlog "./ALU.v"
vlog "./datamem.sv"
vlog "./program_counter.v"
vlog "./BranchSignalMux.v"
vlog "./mux_2_64bit.v"
vlog "./mux_2.v"
vlog "./instructmem.sv"
vlog "./instructionAdapter.v"
vlog "./math.sv"
vlog "./decoder_2x4.v"
vlog "./decoder_3x8.v"
vlog "./decoder_5x32.v"
vlog "./mux_2.v"
vlog "./mux_4.v"
vlog "./mux_16.v"
vlog "./mux_32.v"
vlog "./regfile.v"
vlog "./register.v"
vlog "./registerArray.v"
vlog "./Mux_64x32Array.v"
vlog "./D_FF.v"
vlog "./processorstim.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
# vsim -voptargs="+acc" -t 1ps -lib work instructmem_testbench
# vsim -voptargs="+acc" -t 1ps -lib work datamem_testbench
vsim -voptargs="+acc" -t 1ps -lib work processorstim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
# do runlab_instmem.do
#do runlab_datamem.do
do runlab_processor.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
