onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Store_tb/Present_state
add wave -noupdate -radix hexadecimal /Store_tb/DUT/R3/q
add wave -noupdate -radix hexadecimal /Store_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /Store_tb/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Store_tb/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Store_tb/DUT/MDR1/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Store_tb/DUT/SaE1/IR
add wave -noupdate -radix hexadecimal /Store_tb/DUT/SaE1/Ra
add wave -noupdate -radix hexadecimal /Store_tb/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Store_tb/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Store_tb/DUT/ram1/we
add wave -noupdate -radix hexadecimal /Store_tb/DUT/ram1/addr
add wave -noupdate -radix hexadecimal /Store_tb/DUT/ram1/data_in
add wave -noupdate -radix hexadecimal {/Store_tb/DUT/ram1/mem[52]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {141955 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
WaveRestoreZoom {6177 ps} {242823 ps}
