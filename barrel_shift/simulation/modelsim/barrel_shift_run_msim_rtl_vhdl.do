transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Shrutika/OneDrive/Desktop/IIT Workshop/QuartusPrimeLite_Projects/Day3_IITB/barrel_shift/Gates.vhdl}
vcom -93 -work work {C:/Users/Shrutika/OneDrive/Desktop/IIT Workshop/QuartusPrimeLite_Projects/Day3_IITB/barrel_shift/DUT.vhd}
vcom -93 -work work {C:/Users/Shrutika/OneDrive/Desktop/IIT Workshop/QuartusPrimeLite_Projects/Day3_IITB/barrel_shift/mux_2to1.vhd}
vcom -93 -work work {C:/Users/Shrutika/OneDrive/Desktop/IIT Workshop/QuartusPrimeLite_Projects/Day3_IITB/barrel_shift/barrel_shift.vhd}

vcom -93 -work work {C:/Users/Shrutika/OneDrive/Desktop/IIT Workshop/QuartusPrimeLite_Projects/Day3_IITB/barrel_shift/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
