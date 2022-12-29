set cpuModel to do shell script "sysctl -n machdep.cpu.brand_string"
set gpuModel to do shell script "system_profiler SPDisplaysDataType | grep 'Chipset Model:' | awk '{print $3,$4,$5,$6,$7}'"
set osVersion to do shell script "sw_vers -productVersion"
set macModel to do shell script "system_profiler SPHardwareDataType | grep 'Model Identifier:' | awk '{print $3}'"
set macProcessor to do shell script "system_profiler SPHardwareDataType | grep 'Processor Name:' | awk '{print $3}'"
set macMemory to do shell script "system_profiler SPHardwareDataType | grep 'Memory:' | awk '{print $2}'"
set macDisplay to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution:' | head -1 | awk '{print $2,$3,$4,$5,$6}'"
set macStorage to do shell script "system_profiler SPStorageDataType | grep 'Capacity:' | head -1 | awk '{print $2}'"
set message to "Specifier reported your Mac's specs as:" & return & return & "macOS: " & osVersion & return & "Model: " & macModel & return & "Processor: " & macProcessor & return & "Memory: " & macMemory & "GB" & return & "Display " & macDisplay & return & "Storage: " & macStorage & "GB Capacity" & return & "CPU model: " & cpuModel & return & "GPU model(s): " & gpuModel
if macProcessor = " " then set macProcessor to "Cannot determine Processor Info" and play beep
if cpuModel = " " then set macProcessor to "Cannot determine CPU Model" and play beep
if osVersion = " " then set macProcessor to "Cannot determine macOS version" and play beep
if macMemory = " " then set macProcessor to "Cannot determine Memory" and play beep
if macModel = " " then set macProcessor to "Cannot determine Mac Identifier" and play beep
if macDisplay = " " then set macProcessor to "Cannot determine Display resolution" and play beep
if macStorage = " " then set macProcessor to "Cannot determine Storage" and play beep
beep
display dialog message with title "Specifier - v1.1" with icon note buttons {"Quit"} default button 1