onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/Present_state
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/PC/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MAR1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/SaE1/IR
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/SaE1/C_sign_extended
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/SaE1/RoutSignals
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/R2/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/Y/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/Y/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/Y/BusMuxIn
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ALU1/opcode
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ALU1/YdataOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ALU1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ALU1/ResultHi
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ALU1/ResultLow
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ZLow/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/ZLow/BusMuxIn
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/bus/BusMuxInZlow
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/bus/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MAR1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MAR1/q
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/R6/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/R6/BusMuxIn
add wave -noupdate -radix hexadecimal /Load_tb_Case_2/DUT/R6/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {151265 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
configure wave -valuecolwidth 88
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {211167 ps}
