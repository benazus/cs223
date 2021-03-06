# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]       
set_property IOSTANDARD LVCMOS33 [get_ports clk]  
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {reset}]     
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}] 
     
set_property PACKAGE_PIN V16 [get_ports {dd[0]}]     
    set_property IOSTANDARD LVCMOS33 [get_ports {dd[0]}] 
     
set_property PACKAGE_PIN W16 [get_ports {dd[1]}]     
    set_property IOSTANDARD LVCMOS33 [get_ports {dd[1]}]
    
set_property PACKAGE_PIN W17 [get_ports {next}]     
    set_property IOSTANDARD LVCMOS33 [get_ports {next}]


set_property PACKAGE_PIN U16 [get_ports {fsm_output[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[0]}] 
set_property PACKAGE_PIN E19 [get_ports {fsm_output[1]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[1]}] 
set_property PACKAGE_PIN U19 [get_ports {fsm_output[2]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[2]}] 
set_property PACKAGE_PIN V19 [get_ports {fsm_output[3]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[3]}] 
set_property PACKAGE_PIN W18 [get_ports {fsm_output[4]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[4]}] 
set_property PACKAGE_PIN U15 [get_ports {fsm_output[5]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[5]}] 
set_property PACKAGE_PIN U14 [get_ports {fsm_output[6]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {fsm_output[6]}] 