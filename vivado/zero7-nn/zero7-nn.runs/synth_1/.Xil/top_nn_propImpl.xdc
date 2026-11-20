set_property SRC_FILE_INFO {cfile:D:/Repository/zero7-tutorial/vivado/zero7-nn/zero7-nn.srcs/constrs_1/imports/constrs/zero7.xdc rfile:../../../zero7-nn.srcs/constrs_1/imports/constrs/zero7.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl rfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl id:2 order:LATE scoped_inst:nn_0/xpm_memory_tdpram_wb unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl rfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl id:3 order:LATE scoped_inst:nn_0/xpm_memory_tdpram_k unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl rfile:C:/ProgramFiles/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl id:4 order:LATE scoped_inst:nn_0/xpm_memory_tdpram_a unmanaged:yes} [current_design]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { clk }];
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B15 IOSTANDARD LVCMOS33 } [get_ports { rst_n }];
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports { btn_start_n }];
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { led_r }];
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B10 IOSTANDARD LVCMOS33 } [get_ports { led_g }];
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports { led_b }];
current_instance nn_0/xpm_memory_tdpram_wb
set_property src_info {type:SCOPED_XDC file:2 line:3 export:INPUT save:NONE read:READ} [current_design]
set my_var [get_property dram_emb_xdc [get_cells -hier  -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}]]
current_instance
current_instance nn_0/xpm_memory_tdpram_k
set_property src_info {type:SCOPED_XDC file:3 line:3 export:INPUT save:NONE read:READ} [current_design]
set my_var [get_property dram_emb_xdc [get_cells -hier  -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}]]
current_instance
current_instance nn_0/xpm_memory_tdpram_a
set_property src_info {type:SCOPED_XDC file:4 line:3 export:INPUT save:NONE read:READ} [current_design]
set my_var [get_property dram_emb_xdc [get_cells -hier  -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}]]
