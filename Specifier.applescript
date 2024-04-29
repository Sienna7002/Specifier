-- Specifier 2.2 
-- Compiled @ 29/4/2024
-- By 7002_
set verString to "v2.2.1"
set longVer to "Specifier2.2"
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
	end script
	set configFilePath to (path to applications folder as text) & "specifierconf.txt"
	if not utilities's fileExists(configFilePath) then
		display dialog "Error Code 01" & return & "The Specifier configuration file specifierconf.txt does not exist in the Applications folder. To get started, create or add the specifierconf.txt file in your Applications folder. For further help with this feature, check the Specifier GitHub readme for the config syntax." with title "Specifier - " & verString with icon stop buttons {"Quit"} default button 1
	else
		set configFileContent to utilities's readFile(configFilePath)
		
		if configFileContent does not contain "ConfType= Specifier2.1+" then
			display dialog "Error Code 02" & return & "The Specifier configuration file is not in the correct format. For further help with this feature, check the Specifier GitHub readme for the config syntax." with title "Specifier - " & verString with icon stop buttons {"Quit"} default button 1
		else
			if configFileContent does not contain "SpecifierArguments:" then
				display dialog "Error Code 03" & return & "The Specifier configuration file is incomplete, please provide arguments. For further help with this feature, check the Specifier GitHub readme for the config syntax." with title "Specifier - " & verString with icon stop buttons {"Quit"} default button 1
			else
				set cpuModelExists to 0
				set gpuModelExists to 0
				set osVersionExists to 0
				set macModelExists to 0
				set macProcessorExists to 0
				set macMemoryExists to 0
				set macDisplayExists to 0
				set macStorageExists to 0
				set aboutCompat to 0
				set isConfVerCurrent to 0
				set topString to "Specifier reported your Mac's specs as:"
				set confDev to "Unknown"
				set confVer to "Unknown"
				set confName to "Untitled Configuration"
				repeat with lineText in paragraphs of configFileContent
					if lineText starts with "CPUModel=" or lineText starts with "CPUModel" then
						set cpuModelExists to 1
					else if lineText starts with "GPUModel=" or lineText starts with "GPUModel" then
						set gpuModelExists to 1
					else if lineText starts with "OSVersion=" or lineText starts with "OSVersion" then
						set osVersionExists to 1
					else if lineText starts with "MacModel=" or lineText starts with "MacModel" then
						set macModelExists to 1
					else if lineText starts with "MacProcessor=" or lineText starts with "MacProcessor" then
						set macProcessorExists to 1
					else if lineText starts with "MacMemory=" or lineText starts with "MacMemory" then
						set macMemoryExists to 1
					else if lineText starts with "MacDisplay=" or lineText starts with "MacDisplay" then
						set macDisplayExists to 1
					else if lineText starts with "MacStorage=" or lineText starts with "MacStorage" then
						set macStorageExists to 1
					else if lineText starts with "ConfDesignedFor=" then
						set aboutCompat to 1
					else if configFileContent contains "ConfDesignedFor= " & longVer then
						set isConfVerCurrent to 1
					end if
					if lineText contains "topString=" then
						set {TID, text item delimiters} to {text item delimiters, "\""}
						set textItems to text items of lineText
						if (count of textItems) > 1 then
							set topString to item 2 of textItems
						end if
						set text item delimiters to TID
					end if
					if lineText contains "ConfDev=" then
						set {TID, text item delimiters} to {text item delimiters, "\""}
						set textItems to text items of lineText
						if (count of textItems) > 1 then
							set confDev to item 2 of textItems
						end if
						set text item delimiters to TID
					end if
					if lineText contains "ConfVer=" then
						set {TID, text item delimiters} to {text item delimiters, "\""}
						set textItems to text items of lineText
						if (count of textItems) > 1 then
							set confVer to item 2 of textItems
						end if
						set text item delimiters to TID
					end if
					if lineText contains "ConfName=" then
						set {TID, text item delimiters} to {text item delimiters, "\""}
						set textItems to text items of lineText
						if (count of textItems) > 1 then
							set confName to item 2 of textItems
						end if
						set text item delimiters to TID
					end if
				end repeat
				set message to topString & return & return
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
				if isConfVerCurrent = 0 then
					set aboutCurrent to "This config is not designed for Specifier " & verString & ", but ran correctly due to backwards compatibilty with v2.1 and later."
				else if isConfVerCurrent = 1 then
					set aboutCurrent to "This config is designed for Specifier " & verString & "!"
				end if
				beep
				set buttonReturnedConf to button returned of ¬
					(display dialog message with title "Specifier - " & verString with icon note buttons {"Quit", "About Config"} default button 1)
				if buttonReturnedConf is "About Config" then
					if aboutCompat = 0 then
						display dialog "Error Code 04" & return & "The config has no about metadata! For further help with this feature, check the Specifier GitHub readme for the config additional features" with title "Specifier - " & verString with icon stop buttons {"Quit"} default button 1
					else if aboutCompat = 1 then
						display dialog "About Config" & return & "Support Status: " & aboutCurrent & return & "Config Name: " & confName & return & "Config Developer: " & confDev & return & "Config Version: " & confVer with title "Specifier - " & verString with icon note buttons {"Quit"} default button 1
					end if
				end if
			end if
		end if
	end if
end if
