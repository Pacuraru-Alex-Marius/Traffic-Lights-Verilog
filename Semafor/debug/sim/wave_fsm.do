onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /semafor_test/i_semafor/stare1
add wave -noupdate /semafor_test/i_semafor/stare2
add wave -noupdate /semafor_test/i_semafor/stare3
add wave -noupdate /semafor_test/i_semafor/clk
add wave -noupdate /semafor_test/i_semafor/rst_n
add wave -noupdate /semafor_test/i_semafor/buton
add wave -noupdate /semafor_test/i_semafor/semafor_masini
add wave -noupdate /semafor_test/i_semafor/semafor_pietoni
add wave -noupdate /semafor_test/i_semafor/stare_prezenta
add wave -noupdate /semafor_test/i_semafor/stare_viitoare
add wave -noupdate /semafor_test/i_semafor/counter
add wave -noupdate /semafor_test/i_semafor/buton_apasat
add wave -noupdate /semafor_test/i_semafor/ok1
add wave -noupdate /semafor_test/i_semafor/ok2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ms} 0}
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
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {148600 ms} {149600 ms}
