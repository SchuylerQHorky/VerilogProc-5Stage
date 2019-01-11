onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /processorstim/p/curAddress
add wave -noupdate -radix decimal /processorstim/p/nextAddress
add wave -noupdate -radix binary /processorstim/p/clk
add wave -noupdate -radix binary /processorstim/p/Instruction
add wave -noupdate -radix unsigned /processorstim/p/Rd
add wave -noupdate -radix unsigned /processorstim/p/Rn
add wave -noupdate -radix unsigned /processorstim/p/Rm
add wave -noupdate -radix decimal /processorstim/p/A
add wave -noupdate -radix decimal /processorstim/p/B
add wave -noupdate -radix decimal /processorstim/p/ALUOut
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
add wave -noupdate /processorstim/p/RM/registers/OutputBus
add wave -noupdate /processorstim/p/RM/registers/Input
add wave -noupdate /processorstim/p/RM/registers/InputSelect
add wave -noupdate /processorstim/p/RM/registers/Clk
add wave -noupdate /processorstim/p/RM/registers/RegWrite
add wave -noupdate /processorstim/p/RM/registers/ZeroReg
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
WaveRestoreZoom {9318295 ps} {9818295 ps}
