onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Load_tb/Present_state
add wave -noupdate -radix hexadecimal /Load_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb/DUT/IR/q
add wave -noupdate -radix hexadecimal /Load_tb/DUT/SaE1/Ra
add wave -noupdate -radix hexadecimal /Load_tb/DUT/SaE1/OrInputRa
add wave -noupdate -radix hexadecimal /Load_tb/DUT/SaE1/DecoderInput
add wave -noupdate -radix hexadecimal /Load_tb/DUT/SaE1/C_sign_extended
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MAR1/addr
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/MDR_reg
add wave -noupdate -radix hexadecimal /Load_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb/DUT/R4/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {230000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
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
WaveRestoreZoom {0 ps} {218840 ps}
