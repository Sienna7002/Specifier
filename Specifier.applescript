-- Specifier 2.1 
-- Compiled @ 28/4/2024
-- By 7002_
set verString to "v2.1"
beep
set buttonReturned to button returned of ¬
	(display alert "Welcome to Specifier " & verString & "!" message "What would you like to do? (Note that displaying full specs can take a bit to appear on some systems)" buttons {"Quit", "Run Specifier Configuration", "Display all specs"})
if buttonReturned is "Display all specs" then
	set cpuModel to do shell script "sysctl -n machdep.cpu.brand_string"
	set gpuModel to do shell script "system_profiler SPDisplaysDataType | grep 'Chipset Model:' | awk '{print $3,$4,$5,$6,$7}'"
	set osVersion to do shell script "sw_vers -productVersion"
	set macModel to do shell script "system_profiler SPHardwareDataType | grep 'Model Identifier:' | awk '{print $3}'"
	set macProcessor to do shell script "system_profiler SPHardwareDataType | grep 'Processor Name:' | awk '{print $3}'"
	set macMemory to do shell script "system_profiler SPHardwareDataType | grep 'Memory:' | awk '{print $2}'"
	set macDisplay to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution:' | head -1 | awk '{print $2,$3,$4,$5,$6}'"
	set macStorage to do shell script "system_profiler SPStorageDataType | grep 'Capacity:' | head -1 | awk '{print $2}'"
	set message to "Specifier reported your Mac's specs as:" & return & return & "macOS: " & osVersion & return & "Model: " & macModel & return & "Processor: " & macProcessor & return & "Memory: " & macMemory & "GB" & return & "Display " & macDisplay & return & "Storage: " & macStorage & "GB Capacity" & return & "CPU model: " & cpuModel & return & "GPU model(s): " & gpuModel
	beep
	display dialog message with title "Specifier - " & verString with icon note buttons {"Quit"} default button 1
else if buttonReturned is "Run Specifier Configuration" then
	script utilities
		on fileExists(filePath)
			set posixPath to POSIX path of filePath
			do shell script "[ -e " & quoted form of posixPath & " ] && echo 'true' || echo 'false'"
			if result is "true" then
				return true
			else
				return false
			end if
		end fileExists
		on readFile(filePath)
			set posixPath to POSIX path of filePath
			do shell script "cat " & quoted form of posixPath
		end readFile
		on displayDialog(message)
			display dialog message with title "Specifier - " & verString with icon stop buttons {"Quit"} default button 1
		end displayDialog
	end script
	set configFilePath to (path to applications folder as text) & "specifierconf.txt"
	if not utilities's fileExists(configFilePath) then
		utilities's displayDialog("Error Code 01" & return & "The Specifier configuration file specifierconf.txt does not exist in the Applications folder. To get started, create or add the specifierconf.txt file in your Applications folder. For further help with this feature, check the Specifier GitHub readme for the config syntax.")
	else
		set configFileContent to utilities's readFile(configFilePath)
		
		if configFileContent does not contain "ConfType= Specifier2.1+" then
			utilities's displayDialog("Error Code 02" & return & "The Specifier configuration file is not in the correct format. For further help with this feature, check the Specifier GitHub readme for the config syntax.")
		else
			if configFileContent does not contain "SpecifierArguments:" then
				utilities's displayDialog("Error Code 03" & return & "The Specifier configuration file is incomplete, please provide arguments. For further help with this feature, check the Specifier GitHub readme for the config syntax.")
			else
				set cpuModelExists to 0
				set gpuModelExists to 0
				set osVersionExists to 0
				set macModelExists to 0
				set macProcessorExists to 0
				set macMemoryExists to 0
				set macDisplayExists to 0
				set macStorageExists to 0
				repeat with lineText in paragraphs of configFileContent
					if lineText starts with "CPUModel=" then
						set cpuModelExists to 1
					else if lineText starts with "GPUModel=" then
						set gpuModelExists to 1
					else if lineText starts with "OSVersion=" then
						set osVersionExists to 1
					else if lineText starts with "MacModel=" then
						set macModelExists to 1
					else if lineText starts with "MacProcessor=" then
						set macProcessorExists to 1
					else if lineText starts with "MacMemory=" then
						set macMemoryExists to 1
					else if lineText starts with "MacDisplay=" then
						set macDisplayExists to 1
					else if lineText starts with "MacStorage=" then
						set macStorageExists to 1
					end if
				end repeat
				set message to "Specifier reported your Mac's specs as:" & return & return
				if osVersionExists is equal to 1 then
					set osVersion to do shell script "sw_vers -productVersion"
					set message to message & "macOS: " & osVersion & return
				end if
				if macModelExists is equal to 1 then
					set macModel to do shell script "system_profiler SPHardwareDataType | grep 'Model Identifier:' | awk '{print $3}'"
					set message to message & "Model: " & macModel & return
				end if
				if macProcessorExists is equal to 1 then
					set macProcessor to do shell script "system_profiler SPHardwareDataType | grep 'Processor Name:' | awk '{print $3}'"
					set message to message & "Processor: " & macProcessor & return
				end if
				if macMemoryExists is equal to 1 then
					set macMemory to do shell script "system_profiler SPHardwareDataType | grep 'Memory:' | awk '{print $2}'"
					set message to message & "Memory: " & macMemory & "GB" & return
				end if
				if macDisplayExists is equal to 1 then
					set macDisplay to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution:' | head -1 | awk '{print $2,$3,$4,$5,$6}'"
					set message to message & "Display: " & macDisplay & return
				end if
				if macStorageExists is equal to 1 then
					set macStorage to do shell script "system_profiler SPStorageDataType | grep 'Capacity:' | head -1 | awk '{print $2}'"
					set message to message & "Storage: " & macStorage & "GB Capacity" & return
				end if
				if cpuModelExists is equal to 1 then
					set cpuModel to do shell script "sysctl -n machdep.cpu.brand_string"
					set message to message & "CPU model: " & cpuModel & return
				end if
				if gpuModelExists is equal to 1 then
					set gpuModel to do shell script "system_profiler SPDisplaysDataType | grep 'Chipset Model:' | awk '{print $3,$4,$5,$6,$7}'"
					set message to message & "GPU model(s): " & gpuModel & return
				end if
				beep
				utilities's displayDialog(message)
			end if
		end if
	end if
end if
