onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Rout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/HIout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/LOout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Zhighout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Zlowout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/PCout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/MDRout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/InPortout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Cout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/MARin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/PCin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/MDRin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/IRin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Yin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Gra
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Grb
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Grc
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Rin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/CONin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/CONout
add wave -noupdate /BranchDatapath_tb/DUT/con_ff/CONread
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/Read
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/we
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/IncPC
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/HIin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/LOin
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/ZhighIn
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/ZlowIn
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/BAout
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/clock
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/clear
add wave -noupdate -radix binary /BranchDatapath_tb/Present_state
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/PC1/q
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/R1/q
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/IR/q
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/Y/q
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/ZLow/q
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/con_ff/decoder
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/con_ff/s5
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/con_ff/branch_output
add wave -noupdate /BranchDatapath_tb/DUT/SaE1/opcode
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/SaE1/C_sign_extended
add wave -noupdate -radix hexadecimal /BranchDatapath_tb/DUT/MDR1/MDR_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {330820 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 320
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
WaveRestoreZoom {0 ps} {293071 ps}
