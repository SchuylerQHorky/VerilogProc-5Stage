onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datamem_testbench/address
add wave -noupdate /datamem_testbench/write_enable
add wave -noupdate /datamem_testbench/read_enable
add wave -noupdate /datamem_testbench/write_data
add wave -noupdate /datamem_testbench/clk
add wave -noupdate /datamem_testbench/xfer_size
add wave -noupdate /datamem_testbench/read_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1000 ps} 0}
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
WaveRestoreZoom {0 ps} {120000000 ps}
