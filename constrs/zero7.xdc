# https://www.lsi-contest.com/ZERO7FPGA_Connection-table_261109_001.pdf

# Clock 20M
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name clk -period 50.000 -waveform {0.000 25.000} [get_ports { clk }];

# Stop Button B15 (active-low)
set_property -dict { PACKAGE_PIN B15 IOSTANDARD LVCMOS33 } [get_ports { rst_n }];

# Red LED B11
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { led }];
