onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /processorstim/p/curAddress
add wave -noupdate -radix decimal /processorstim/p/nextAddress
add wave -noupdate -radix binary /processorstim/p/clk
add wave -noupdate -radix binary /processorstim/p/Instruction
add wave -noupdate -radix unsigned /processorstim/p/Rd
add wave -noupdate -radix unsigned /processorstim/p/Rn
add wave -noupdate -radix unsigned /processorstim/p/Rm
add wave -noupdate -radix decimal -childformat {{{/processorstim/p/A[63]} -radix decimal} {{/processorstim/p/A[62]} -radix decimal} {{/processorstim/p/A[61]} -radix decimal} {{/processorstim/p/A[60]} -radix decimal} {{/processorstim/p/A[59]} -radix decimal} {{/processorstim/p/A[58]} -radix decimal} {{/processorstim/p/A[57]} -radix decimal} {{/processorstim/p/A[56]} -radix decimal} {{/processorstim/p/A[55]} -radix decimal} {{/processorstim/p/A[54]} -radix decimal} {{/processorstim/p/A[53]} -radix decimal} {{/processorstim/p/A[52]} -radix decimal} {{/processorstim/p/A[51]} -radix decimal} {{/processorstim/p/A[50]} -radix decimal} {{/processorstim/p/A[49]} -radix decimal} {{/processorstim/p/A[48]} -radix decimal} {{/processorstim/p/A[47]} -radix decimal} {{/processorstim/p/A[46]} -radix decimal} {{/processorstim/p/A[45]} -radix decimal} {{/processorstim/p/A[44]} -radix decimal} {{/processorstim/p/A[43]} -radix decimal} {{/processorstim/p/A[42]} -radix decimal} {{/processorstim/p/A[41]} -radix decimal} {{/processorstim/p/A[40]} -radix decimal} {{/processorstim/p/A[39]} -radix decimal} {{/processorstim/p/A[38]} -radix decimal} {{/processorstim/p/A[37]} -radix decimal} {{/processorstim/p/A[36]} -radix decimal} {{/processorstim/p/A[35]} -radix decimal} {{/processorstim/p/A[34]} -radix decimal} {{/processorstim/p/A[33]} -radix decimal} {{/processorstim/p/A[32]} -radix decimal} {{/processorstim/p/A[31]} -radix decimal} {{/processorstim/p/A[30]} -radix decimal} {{/processorstim/p/A[29]} -radix decimal} {{/processorstim/p/A[28]} -radix decimal} {{/processorstim/p/A[27]} -radix decimal} {{/processorstim/p/A[26]} -radix decimal} {{/processorstim/p/A[25]} -radix decimal} {{/processorstim/p/A[24]} -radix decimal} {{/processorstim/p/A[23]} -radix decimal} {{/processorstim/p/A[22]} -radix decimal} {{/processorstim/p/A[21]} -radix decimal} {{/processorstim/p/A[20]} -radix decimal} {{/processorstim/p/A[19]} -radix decimal} {{/processorstim/p/A[18]} -radix decimal} {{/processorstim/p/A[17]} -radix decimal} {{/processorstim/p/A[16]} -radix decimal} {{/processorstim/p/A[15]} -radix decimal} {{/processorstim/p/A[14]} -radix decimal} {{/processorstim/p/A[13]} -radix decimal} {{/processorstim/p/A[12]} -radix decimal} {{/processorstim/p/A[11]} -radix decimal} {{/processorstim/p/A[10]} -radix decimal} {{/processorstim/p/A[9]} -radix decimal} {{/processorstim/p/A[8]} -radix decimal} {{/processorstim/p/A[7]} -radix decimal} {{/processorstim/p/A[6]} -radix decimal} {{/processorstim/p/A[5]} -radix decimal} {{/processorstim/p/A[4]} -radix decimal} {{/processorstim/p/A[3]} -radix decimal} {{/processorstim/p/A[2]} -radix decimal} {{/processorstim/p/A[1]} -radix decimal} {{/processorstim/p/A[0]} -radix decimal}} -subitemconfig {{/processorstim/p/A[63]} {-radix decimal} {/processorstim/p/A[62]} {-radix decimal} {/processorstim/p/A[61]} {-radix decimal} {/processorstim/p/A[60]} {-radix decimal} {/processorstim/p/A[59]} {-radix decimal} {/processorstim/p/A[58]} {-radix decimal} {/processorstim/p/A[57]} {-radix decimal} {/processorstim/p/A[56]} {-radix decimal} {/processorstim/p/A[55]} {-radix decimal} {/processorstim/p/A[54]} {-radix decimal} {/processorstim/p/A[53]} {-radix decimal} {/processorstim/p/A[52]} {-radix decimal} {/processorstim/p/A[51]} {-radix decimal} {/processorstim/p/A[50]} {-radix decimal} {/processorstim/p/A[49]} {-radix decimal} {/processorstim/p/A[48]} {-radix decimal} {/processorstim/p/A[47]} {-radix decimal} {/processorstim/p/A[46]} {-radix decimal} {/processorstim/p/A[45]} {-radix decimal} {/processorstim/p/A[44]} {-radix decimal} {/processorstim/p/A[43]} {-radix decimal} {/processorstim/p/A[42]} {-radix decimal} {/processorstim/p/A[41]} {-radix decimal} {/processorstim/p/A[40]} {-radix decimal} {/processorstim/p/A[39]} {-radix decimal} {/processorstim/p/A[38]} {-radix decimal} {/processorstim/p/A[37]} {-radix decimal} {/processorstim/p/A[36]} {-radix decimal} {/processorstim/p/A[35]} {-radix decimal} {/processorstim/p/A[34]} {-radix decimal} {/processorstim/p/A[33]} {-radix decimal} {/processorstim/p/A[32]} {-radix decimal} {/processorstim/p/A[31]} {-radix decimal} {/processorstim/p/A[30]} {-radix decimal} {/processorstim/p/A[29]} {-radix decimal} {/processorstim/p/A[28]} {-radix decimal} {/processorstim/p/A[27]} {-radix decimal} {/processorstim/p/A[26]} {-radix decimal} {/processorstim/p/A[25]} {-radix decimal} {/processorstim/p/A[24]} {-radix decimal} {/processorstim/p/A[23]} {-radix decimal} {/processorstim/p/A[22]} {-radix decimal} {/processorstim/p/A[21]} {-radix decimal} {/processorstim/p/A[20]} {-radix decimal} {/processorstim/p/A[19]} {-radix decimal} {/processorstim/p/A[18]} {-radix decimal} {/processorstim/p/A[17]} {-radix decimal} {/processorstim/p/A[16]} {-radix decimal} {/processorstim/p/A[15]} {-radix decimal} {/processorstim/p/A[14]} {-radix decimal} {/processorstim/p/A[13]} {-radix decimal} {/processorstim/p/A[12]} {-radix decimal} {/processorstim/p/A[11]} {-radix decimal} {/processorstim/p/A[10]} {-radix decimal} {/processorstim/p/A[9]} {-radix decimal} {/processorstim/p/A[8]} {-radix decimal} {/processorstim/p/A[7]} {-radix decimal} {/processorstim/p/A[6]} {-radix decimal} {/processorstim/p/A[5]} {-radix decimal} {/processorstim/p/A[4]} {-radix decimal} {/processorstim/p/A[3]} {-radix decimal} {/processorstim/p/A[2]} {-radix decimal} {/processorstim/p/A[1]} {-radix decimal} {/processorstim/p/A[0]} {-radix decimal}} /processorstim/p/A
add wave -noupdate -radix decimal /processorstim/p/B
add wave -noupdate -radix decimal -childformat {{{/processorstim/p/ALUOut[63]} -radix decimal} {{/processorstim/p/ALUOut[62]} -radix decimal} {{/processorstim/p/ALUOut[61]} -radix decimal} {{/processorstim/p/ALUOut[60]} -radix decimal} {{/processorstim/p/ALUOut[59]} -radix decimal} {{/processorstim/p/ALUOut[58]} -radix decimal} {{/processorstim/p/ALUOut[57]} -radix decimal} {{/processorstim/p/ALUOut[56]} -radix decimal} {{/processorstim/p/ALUOut[55]} -radix decimal} {{/processorstim/p/ALUOut[54]} -radix decimal} {{/processorstim/p/ALUOut[53]} -radix decimal} {{/processorstim/p/ALUOut[52]} -radix decimal} {{/processorstim/p/ALUOut[51]} -radix decimal} {{/processorstim/p/ALUOut[50]} -radix decimal} {{/processorstim/p/ALUOut[49]} -radix decimal} {{/processorstim/p/ALUOut[48]} -radix decimal} {{/processorstim/p/ALUOut[47]} -radix decimal} {{/processorstim/p/ALUOut[46]} -radix decimal} {{/processorstim/p/ALUOut[45]} -radix decimal} {{/processorstim/p/ALUOut[44]} -radix decimal} {{/processorstim/p/ALUOut[43]} -radix decimal} {{/processorstim/p/ALUOut[42]} -radix decimal} {{/processorstim/p/ALUOut[41]} -radix decimal} {{/processorstim/p/ALUOut[40]} -radix decimal} {{/processorstim/p/ALUOut[39]} -radix decimal} {{/processorstim/p/ALUOut[38]} -radix decimal} {{/processorstim/p/ALUOut[37]} -radix decimal} {{/processorstim/p/ALUOut[36]} -radix decimal} {{/processorstim/p/ALUOut[35]} -radix decimal} {{/processorstim/p/ALUOut[34]} -radix decimal} {{/processorstim/p/ALUOut[33]} -radix decimal} {{/processorstim/p/ALUOut[32]} -radix decimal} {{/processorstim/p/ALUOut[31]} -radix decimal} {{/processorstim/p/ALUOut[30]} -radix decimal} {{/processorstim/p/ALUOut[29]} -radix decimal} {{/processorstim/p/ALUOut[28]} -radix decimal} {{/processorstim/p/ALUOut[27]} -radix decimal} {{/processorstim/p/ALUOut[26]} -radix decimal} {{/processorstim/p/ALUOut[25]} -radix decimal} {{/processorstim/p/ALUOut[24]} -radix decimal} {{/processorstim/p/ALUOut[23]} -radix decimal} {{/processorstim/p/ALUOut[22]} -radix decimal} {{/processorstim/p/ALUOut[21]} -radix decimal} {{/processorstim/p/ALUOut[20]} -radix decimal} {{/processorstim/p/ALUOut[19]} -radix decimal} {{/processorstim/p/ALUOut[18]} -radix decimal} {{/processorstim/p/ALUOut[17]} -radix decimal} {{/processorstim/p/ALUOut[16]} -radix decimal} {{/processorstim/p/ALUOut[15]} -radix decimal} {{/processorstim/p/ALUOut[14]} -radix decimal} {{/processorstim/p/ALUOut[13]} -radix decimal} {{/processorstim/p/ALUOut[12]} -radix decimal} {{/processorstim/p/ALUOut[11]} -radix decimal} {{/processorstim/p/ALUOut[10]} -radix decimal} {{/processorstim/p/ALUOut[9]} -radix decimal} {{/processorstim/p/ALUOut[8]} -radix decimal} {{/processorstim/p/ALUOut[7]} -radix decimal} {{/processorstim/p/ALUOut[6]} -radix decimal} {{/processorstim/p/ALUOut[5]} -radix decimal} {{/processorstim/p/ALUOut[4]} -radix decimal} {{/processorstim/p/ALUOut[3]} -radix decimal} {{/processorstim/p/ALUOut[2]} -radix decimal} {{/processorstim/p/ALUOut[1]} -radix decimal} {{/processorstim/p/ALUOut[0]} -radix decimal}} -subitemconfig {{/processorstim/p/ALUOut[63]} {-radix decimal} {/processorstim/p/ALUOut[62]} {-radix decimal} {/processorstim/p/ALUOut[61]} {-radix decimal} {/processorstim/p/ALUOut[60]} {-radix decimal} {/processorstim/p/ALUOut[59]} {-radix decimal} {/processorstim/p/ALUOut[58]} {-radix decimal} {/processorstim/p/ALUOut[57]} {-radix decimal} {/processorstim/p/ALUOut[56]} {-radix decimal} {/processorstim/p/ALUOut[55]} {-radix decimal} {/processorstim/p/ALUOut[54]} {-radix decimal} {/processorstim/p/ALUOut[53]} {-radix decimal} {/processorstim/p/ALUOut[52]} {-radix decimal} {/processorstim/p/ALUOut[51]} {-radix decimal} {/processorstim/p/ALUOut[50]} {-radix decimal} {/processorstim/p/ALUOut[49]} {-radix decimal} {/processorstim/p/ALUOut[48]} {-radix decimal} {/processorstim/p/ALUOut[47]} {-radix decimal} {/processorstim/p/ALUOut[46]} {-radix decimal} {/processorstim/p/ALUOut[45]} {-radix decimal} {/processorstim/p/ALUOut[44]} {-radix decimal} {/processorstim/p/ALUOut[43]} {-radix decimal} {/processorstim/p/ALUOut[42]} {-radix decimal} {/processorstim/p/ALUOut[41]} {-radix decimal} {/processorstim/p/ALUOut[40]} {-radix decimal} {/processorstim/p/ALUOut[39]} {-radix decimal} {/processorstim/p/ALUOut[38]} {-radix decimal} {/processorstim/p/ALUOut[37]} {-radix decimal} {/processorstim/p/ALUOut[36]} {-radix decimal} {/processorstim/p/ALUOut[35]} {-radix decimal} {/processorstim/p/ALUOut[34]} {-radix decimal} {/processorstim/p/ALUOut[33]} {-radix decimal} {/processorstim/p/ALUOut[32]} {-radix decimal} {/processorstim/p/ALUOut[31]} {-radix decimal} {/processorstim/p/ALUOut[30]} {-radix decimal} {/processorstim/p/ALUOut[29]} {-radix decimal} {/processorstim/p/ALUOut[28]} {-radix decimal} {/processorstim/p/ALUOut[27]} {-radix decimal} {/processorstim/p/ALUOut[26]} {-radix decimal} {/processorstim/p/ALUOut[25]} {-radix decimal} {/processorstim/p/ALUOut[24]} {-radix decimal} {/processorstim/p/ALUOut[23]} {-radix decimal} {/processorstim/p/ALUOut[22]} {-radix decimal} {/processorstim/p/ALUOut[21]} {-radix decimal} {/processorstim/p/ALUOut[20]} {-radix decimal} {/processorstim/p/ALUOut[19]} {-radix decimal} {/processorstim/p/ALUOut[18]} {-radix decimal} {/processorstim/p/ALUOut[17]} {-radix decimal} {/processorstim/p/ALUOut[16]} {-radix decimal} {/processorstim/p/ALUOut[15]} {-radix decimal} {/processorstim/p/ALUOut[14]} {-radix decimal} {/processorstim/p/ALUOut[13]} {-radix decimal} {/processorstim/p/ALUOut[12]} {-radix decimal} {/processorstim/p/ALUOut[11]} {-radix decimal} {/processorstim/p/ALUOut[10]} {-radix decimal} {/processorstim/p/ALUOut[9]} {-radix decimal} {/processorstim/p/ALUOut[8]} {-radix decimal} {/processorstim/p/ALUOut[7]} {-radix decimal} {/processorstim/p/ALUOut[6]} {-radix decimal} {/processorstim/p/ALUOut[5]} {-radix decimal} {/processorstim/p/ALUOut[4]} {-radix decimal} {/processorstim/p/ALUOut[3]} {-radix decimal} {/processorstim/p/ALUOut[2]} {-radix decimal} {/processorstim/p/ALUOut[1]} {-radix decimal} {/processorstim/p/ALUOut[0]} {-radix decimal}} /processorstim/p/ALUOut
add wave -noupdate -radix decimal /processorstim/p/AL/slice0/a
add wave -noupdate -radix decimal /processorstim/p/AL/slice0/b
add wave -noupdate -radix decimal /processorstim/p/AL/slice0/sum
add wave -noupdate -radix decimal /processorstim/p/AL/DAddr9Extend
add wave -noupdate -radix decimal /processorstim/p/AL/ALU_Imm12Ext
add wave -noupdate -radix hexadecimal /processorstim/p/AL/muxOut
add wave -noupdate -radix binary /processorstim/p/AL/slice0/cin
add wave -noupdate -radix binary /processorstim/p/AL/slice0/cout
add wave -noupdate -radix binary /processorstim/p/AL/slice0/overflow
add wave -noupdate -radix binary /processorstim/p/AL/overflow
add wave -noupdate -radix binary /processorstim/p/AL/slice0/c
add wave -noupdate -radix decimal /processorstim/p/AL/Bfinal
add wave -noupdate -radix decimal /processorstim/p/AL/cntrl
add wave -noupdate -radix binary /processorstim/p/AL/ALU_src
add wave -noupdate -radix unsigned /processorstim/p/Dout
add wave -noupdate -radix decimal /processorstim/p/WriteData
add wave -noupdate -radix binary /processorstim/p/IA/Reg2Loc
add wave -noupdate -radix binary /processorstim/p/IA/ALUSrc
add wave -noupdate -radix binary /processorstim/p/IA/ALUImm
add wave -noupdate -radix binary /processorstim/p/IA/MemToReg
add wave -noupdate -radix binary /processorstim/p/IA/RegWrite
add wave -noupdate -radix binary /processorstim/p/IA/MemWrite
add wave -noupdate -radix binary /processorstim/p/IA/BrTaken
add wave -noupdate -radix binary /processorstim/p/TakeBranch
add wave -noupdate -radix binary /processorstim/p/IA/UncondBr
add wave -noupdate -radix binary /processorstim/p/IA/BrZero
add wave -noupdate -radix binary /processorstim/p/IA/SetFlags
add wave -noupdate -radix binary /processorstim/p/zero
add wave -noupdate -radix binary /processorstim/p/negative
add wave -noupdate -radix binary /processorstim/p/overflow
add wave -noupdate -radix binary /processorstim/p/carry_out
add wave -noupdate /processorstim/p/PC/SECondAddr19
add wave -noupdate /processorstim/p/PC/SEBrAddr26
add wave -noupdate -label R0 -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[0]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[1]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[2]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[3]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[4]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[5]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[6]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[7]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[8]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[9]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[10]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[11]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[12]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[13]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[14]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[15]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[16]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[17]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[18]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[19]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[20]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[21]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[22]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[23]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[24]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[25]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[26]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[27]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[28]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[29]/cpuReg/REGISTER}
add wave -noupdate -radix decimal {/processorstim/p/RM/registers/reg_bits_gen2[30]/cpuReg/REGISTER}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8944218 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 453
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 300
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {8522123 ps} {9542387 ps}
