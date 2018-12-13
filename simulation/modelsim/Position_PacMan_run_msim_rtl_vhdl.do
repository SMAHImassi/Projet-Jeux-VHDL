transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/UC.vhd}
vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/MULTI.vhd}
vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/compteur_generic_pos.vhd}
vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/registre_T.vhd}
vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/Bouton_P.vhd}
vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/position_pacman.vhd}

vcom -93 -work work {C:/Users/Massi/Documents/Projet-Jeux-VHDL/simulation/modelsim/Position_PacMan.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  Position_PacMan_vhd_tst

add wave *
view structure
view signals
run -all
