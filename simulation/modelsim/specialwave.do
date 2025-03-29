onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SpecialDatapath_tb/Rout
add wave -noupdate /SpecialDatapath_tb/HIout
add wave -noupdate /SpecialDatapath_tb/LOout
add wave -noupdate /SpecialDatapath_tb/Zhighout
add wave -noupdate /SpecialDatapath_tb/Zlowout
add wave -noupdate /SpecialDatapath_tb/PCout
add wave -noupdate /SpecialDatapath_tb/MDRout
add wave -noupdate /SpecialDatapath_tb/InPortout
add wave -noupdate /SpecialDatapath_tb/Cout
add wave -noupdate /SpecialDatapath_tb/MARin
add wave -noupdate /SpecialDatapath_tb/PCin
add wave -noupdate /SpecialDatapath_tb/MDRin
add wave -noupdate /SpecialDatapath_tb/IRin
add wave -noupdate /SpecialDatapath_tb/Yin
add wave -noupdate /SpecialDatapath_tb/CONin
add wave -noupdate /SpecialDatapath_tb/CONread
add wave -noupdate /SpecialDatapath_tb/Gra
add wave -noupdate /SpecialDatapath_tb/Grb
add wave -noupdate /SpecialDatapath_tb/Grc
add wave -noupdate /SpecialDatapath_tb/Rin
add wave -noupdate /SpecialDatapath_tb/Read
add wave -noupdate /SpecialDatapath_tb/we
add wave -noupdate /SpecialDatapath_tb/IncPC
add wave -noupdate /SpecialDatapath_tb/HIin
add wave -noupdate /SpecialDatapath_tb/LOin
add wave -noupdate /SpecialDatapath_tb/ZhighIn
add wave -noupdate /SpecialDatapath_tb/ZlowIn
add wave -noupdate /SpecialDatapath_tb/BAout
add wave -noupdate /SpecialDatapath_tb/clock
add wave -noupdate /SpecialDatapath_tb/clear
add wave -noupdate /SpecialDatapath_tb/Present_state
add wave -noupdate -radix hexadecimal /SpecialDatapath_tb/DUT/R2/q
add wave -noupdate -radix hexadecimal /SpecialDatapath_tb/DUT/LO/q
add wave -noupdate -radix hexadecimal /SpecialDatapath_tb/DUT/R3/q
add wave -noupdate -radix hexadecimal /SpecialDatapath_tb/DUT/HI/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {499371 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 239
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
WaveRestoreZoom {0 ps} {315543 ps}
