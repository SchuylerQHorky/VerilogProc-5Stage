onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -radix decimal -noupdate /processorstim/p/curAddress
add wave -radix decimal -noupdate /processorstim/p/nextAddress
add wave -radix binary -noupdate /processorstim/p/clk
add wave -radix binary -noupdate /processorstim/p/Instruction
add wave -radix unsigned -noupdate /processorstim/p/Rd
add wave -radix unsigned -noupdate /processorstim/p/Rn
add wave -radix unsigned -noupdate /processorstim/p/Rm
add wave -radix decimal -noupdate /processorstim/p/A
add wave -radix decimal -noupdate /processorstim/p/B
add wave -radix decimal -noupdate /processorstim/p/ALUOut
add wave -radix decimal -noupdate /processorstim/p/AL/slice0/a
add wave -radix decimal -noupdate /processorstim/p/AL/slice0/b
add wave -radix decimal -noupdate /processorstim/p/AL/slice0/sum
add wave -radix hexadecimal -noupdate /processorstim/p/AL/bPrime
add wave -radix decimal -noupdate /processorstim/p/AL/DAddr9Extend
add wave -radix decimal -noupdate /processorstim/p/AL/ALU_Imm12Ext
add wave -radix hexadecimal -noupdate /processorstim/p/AL/muxOut
add wave -radix binary -noupdate /processorstim/p/AL/slice0/cin
add wave -radix binary -noupdate /processorstim/p/AL/slice0/cout
add wave -radix binary -noupdate /processorstim/p/AL/slice0/overflow
add wave -radix binary -noupdate /processorstim/p/AL/overflow
add wave -radix binary -noupdate /processorstim/p/AL/slice0/c
add wave -radix decimal -noupdate /processorstim/p/AL/Bfinal
add wave -radix decimal -noupdate /processorstim/p/AL/cntrl
add wave -radix binary -noupdate /processorstim/p/AL/ALU_src
add wave -radix unsigned -noupdate /processorstim/p/Dout
add wave -radix decimal -noupdate /processorstim/p/WriteData
add wave -radix binary -noupdate /processorstim/p/IA/Reg2Loc
add wave -radix binary -noupdate /processorstim/p/IA/ALUSrc
add wave -radix binary -noupdate /processorstim/p/IA/ALUImm
add wave -radix binary -noupdate /processorstim/p/IA/MemToReg
add wave -radix binary -noupdate /processorstim/p/IA/RegWrite
add wave -radix binary -noupdate /processorstim/p/IA/MemWrite
add wave -radix binary -noupdate /processorstim/p/IA/BrTaken
add wave -radix binary -noupdate /processorstim/p/TakeBranch
add wave -radix binary -noupdate /processorstim/p/IA/UncondBr
add wave -radix binary -noupdate /processorstim/p/IA/BrZero
add wave -radix binary -noupdate /processorstim/p/IA/SetFlags
add wave -radix binary -noupdate /processorstim/p/zero
add wave -radix binary -noupdate /processorstim/p/negative
add wave -radix binary -noupdate /processorstim/p/overflow
add wave -radix binary -noupdate /processorstim/p/carry_out
add wave -radix decimal -noupdate /processorstim/p/RM/registers/reg_bits_gen2[0]


# add wave -noupdate /processorstim/p/PC/branch2
# add wave -noupdate /processorstim/p/PC/branchNone
add wave -noupdate /processorstim/p/PC/SECondAddr19
add wave -noupdate /processorstim/p/PC/SEBrAddr26

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {500000 ps}
