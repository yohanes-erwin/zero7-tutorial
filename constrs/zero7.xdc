# https://www.lsi-contest.com/ZERO7FPGA_Connection-table_261109_001.pdf

# Clock 20M
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name clk -period 50.000 -waveform {0.000 25.000} [get_ports { clk }];

# Stop Button B15 (active-low)
set_property -dict { PACKAGE_PIN B15 IOSTANDARD LVCMOS33 } [get_ports { btn_stop_n }];

# Start Button C14 (active-low)
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports { btn_start_n }];

# Run Button C13 (active-low)
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS33 } [get_ports { btn_run_n }];

# Red LED B11 (active-high)
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { led_r }];

# Green LED B10 (active-high)
set_property -dict { PACKAGE_PIN B10 IOSTANDARD LVCMOS33 } [get_ports { led_g }];

# Blue LED A10 (active-high)
set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports { led_b }];