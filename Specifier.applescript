set cpuModel to do shell script "sysctl -n machdep.cpu.brand_string"
set gpuModel to do shell script "system_profiler SPDisplaysDataType | grep 'Chipset Model:' | awk '{print $3,$4,$5,$6,$7}'"
set osVersion to do shell script "sw_vers -productVersion"
set macModel to do shell script "system_profiler SPHardwareDataType | grep 'Model Identifier:' | awk '{print $3}'"
set macProcessor to do shell script "system_profiler SPHardwareDataType | grep 'Processor Name:' | awk '{print $3}'"
set macMemory to do shell script "system_profiler SPHardwareDataType | grep 'Memory:' | awk '{print $2}'"
set macDisplay to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution:' | head -1 | awk '{print $2}'"
set macStorage to do shell script "system_profiler SPStorageDataType | grep 'Capacity:' | head -1 | awk '{print $2}'"

set message to "You are running macOS " & osVersion & "." & return & return & "Your Mac's specifications are:" & return & "Model: " & macModel & return & "Processor: " & macProcessor & return & "Memory: " & macMemory & "GB" & return & "Display: " & macDisplay & "MB" & return & "Storage: " & macStorage & "GB Formatted" & return & "CPU model: " & cpuModel & return & "GPU model: " & gpuModel
display dialog message with title "Specifier" with icon caution buttons {"Quit"} default button 1
