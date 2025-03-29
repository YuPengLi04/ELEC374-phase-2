onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /JumpDatapath_tb/Rout
add wave -noupdate /JumpDatapath_tb/HIout
add wave -noupdate /JumpDatapath_tb/LOout
add wave -noupdate /JumpDatapath_tb/Zhighout
add wave -noupdate /JumpDatapath_tb/Zlowout
add wave -noupdate /JumpDatapath_tb/PCout
add wave -noupdate /JumpDatapath_tb/MDRout
add wave -noupdate /JumpDatapath_tb/InPortout
add wave -noupdate /JumpDatapath_tb/Cout
add wave -noupdate /JumpDatapath_tb/MARin
add wave -noupdate /JumpDatapath_tb/PCin
add wave -noupdate /JumpDatapath_tb/MDRin
add wave -noupdate /JumpDatapath_tb/IRin
add wave -noupdate /JumpDatapath_tb/Yin
add wave -noupdate /JumpDatapath_tb/CONin
add wave -noupdate /JumpDatapath_tb/CONread
add wave -noupdate /JumpDatapath_tb/Gra
add wave -noupdate /JumpDatapath_tb/Grb
add wave -noupdate /JumpDatapath_tb/Grc
add wave -noupdate /JumpDatapath_tb/Rin
add wave -noupdate /JumpDatapath_tb/Read
add wave -noupdate /JumpDatapath_tb/we
add wave -noupdate /JumpDatapath_tb/IncPC
add wave -noupdate /JumpDatapath_tb/HIin
add wave -noupdate /JumpDatapath_tb/LOin
add wave -noupdate /JumpDatapath_tb/ZhighIn
add wave -noupdate /JumpDatapath_tb/ZlowIn
add wave -noupdate /JumpDatapath_tb/BAout
add wave -noupdate /JumpDatapath_tb/clock
add wave -noupdate /JumpDatapath_tb/clear
add wave -noupdate /JumpDatapath_tb/Present_state
add wave -noupdate -radix hexadecimal /JumpDatapath_tb/DUT/R8/q
add wave -noupdate -radix hexadecimal /JumpDatapath_tb/DUT/PC1/q
add wave -noupdate -radix hexadecimal /JumpDatapath_tb/DUT/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {192280 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
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
WaveRestoreZoom {0 ps} {276160 ps}
