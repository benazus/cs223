# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.cache/wt} [current_project]
set_property parent.project_path {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/SevSeg_4digit.sv}
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/DotMatrix.sv}
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/MatrixDriver.sv}
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/ControllerFSM.sv}
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/inputConverterV1.sv}
  {D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/sources_1/imports/morsedecoder/Main.sv}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/constrs_1/imports/morsedecoder/const.xdc}}
set_property used_in_implementation false [get_files {{D:/CS/CS223-224/223/Course Project/demos/final demo 24.12.2016 15.13/eski versiyon/project_decoder.srcs/constrs_1/imports/morsedecoder/const.xdc}}]


synth_design -top Main -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Main.dcp

catch { report_utilization -file Main_utilization_synth.rpt -pb Main_utilization_synth.pb }