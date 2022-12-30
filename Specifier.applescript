set verString to "v2.0"
beep
set buttonReturned to button returned of Â
	(display alert "Welcome to Specifier " & verString & "!" message "What would you like to do? (Note that the Display Specs & macOS Version option can take a bit to appear on some systems.)" buttons {"Quit", "Display macOS Version", "Display Specs & macOS Version"})
if buttonReturned is "Display Specs & macOS Version" then
	set cpuModel to do shell script "sysctl -n machdep.cpu.brand_string"
	if cpuModel is equal to " " then set cpuModel to "Cannot determine CPU Model" and play beep
	set gpuModel to do shell script "system_profiler SPDisplaysDataType | grep 'Chipset Model:' | awk '{print $3,$4,$5,$6,$7}'"
	set osVersion to do shell script "sw_vers -productVersion"
	if osVersion = " " then set osVersion to "Cannot determine macOS version" and play beep
	set macModel to do shell script "system_profiler SPHardwareDataType | grep 'Model Identifier:' | awk '{print $3}'"
	if macModel = " " then set macModel to "Cannot determine Mac Identifier" and play beep
	set macProcessor to do shell script "system_profiler SPHardwareDataType | grep 'Processor Name:' | awk '{print $3}'"
	if macProcessor = " " then set macProcessor to "Cannot determine Processor Info" and play beep
	set macMemory to do shell script "system_profiler SPHardwareDataType | grep 'Memory:' | awk '{print $2}'"
	if macMemory = " " then set macMemory to "Cannot determine Memory" and play beep
	set macDisplay to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution:' | head -1 | awk '{print $2,$3,$4,$5,$6}'"
	if macDisplay = " " then set macDisplay to "Cannot determine Display resolution" and play beep
	set macStorage to do shell script "system_profiler SPStorageDataType | grep 'Capacity:' | head -1 | awk '{print $2}'"
	if macStorage = " " then set macStorage to "Cannot determine Storage" and play beep
	set message to "Specifier reported your Mac's specs as:" & return & return & "macOS: " & osVersion & return & "Model: " & macModel & return & "Processor: " & macProcessor & return & "Memory: " & macMemory & "GB" & return & "Display " & macDisplay & return & "Storage: " & macStorage & "GB Capacity" & return & "CPU model: " & cpuModel & return & "GPU model(s): " & gpuModel
	beep
	display dialog message with title "Specifier - " & verString with icon note buttons {"Quit"} default button 1
else if buttonReturned is "Display macOS Version" then
	set osVersion to do shell script "sw_vers -productVersion"
	if osVersion = " " then set osVersion to "Cannot determine macOS version" and play beep
	set message to "Specifier reported your Mac's OS Version as:" & return & return & "macOS: " & osVersion
	beep
	display dialog message with title "Specifier - " & verString with icon note buttons {"Quit"} default button 1
end if