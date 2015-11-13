#**************************************************************
# Altera DE1-SoC SDC settings
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "24 MHz"  -name clock_24 [get_ports CLOCK_24_0]

# For some reason this can't be matched to a port
create_clock -period "27 MHz" -name clock_27 [get_ports CLOCK_27_0]

# Include this if building with UseICEDebugger
create_clock -period "16 MHz"  -name clock_avr {bbc_micro_core:bbc_micro|clock_avr}


create_generated_clock -source {pll|altpll_component|pll|inclk[0]} -divide_by 3 -multiply_by 4 -duty_cycle 50.00 -name clock_32 {pll|altpll_component|pll|clk[0]}

	
#**************************************************************
# Create Generated Clock
#**************************************************************

# Doing this manually above so we can name the clock
#derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
#derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************
# Board Delay (Data) + Propagation Delay - Board Delay (Clock)

#**************************************************************
# Set Output Delay
#**************************************************************
# max : Board Delay (Data) - Board Delay (Clock) + tsu (External Device)
# min : Board Delay (Data) - Board Delay (Clock) - th (External Device)




#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group {clock_32} -group {clock_24}

set_clock_groups -asynchronous -group {clock_32} -group {clock_27}

set_clock_groups -asynchronous -group {clock_32} -group {clock_avr}

set_clock_groups -asynchronous -group {clock_avr} -group {clock_32}

#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************

