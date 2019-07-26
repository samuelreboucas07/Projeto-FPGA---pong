## Clock signal
## The next line specify the clock (50 MHz / 20 ns)
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports { "CLOCK_50" }];
