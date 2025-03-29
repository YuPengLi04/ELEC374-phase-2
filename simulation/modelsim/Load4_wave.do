onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/Present_state
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/PC/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/MAR1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/SaE1/Gra
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/SaE1/Grb
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/SaE1/C_sign_extended
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/SaE1/opcode
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/ALU1/YdataOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/ALU1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/ALU1/ResultLow
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/R4/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/R6/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/R6/BusMuxIn
add wave -noupdate -radix hexadecimal /Load_tb_Case_3_4/DUT/R6/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {165211 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {96150 ps} {256406 ps}
