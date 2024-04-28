# <img src="https://github.com/Sienna7002/Specifier/assets/97623785/f0e561de-e492-47e0-b617-5635ef7edb5e" width="64px"/></img> <br> Specifier
Welcome to Specifier! This simple application, written **100% in AppleScript** aims to provide a more robust and detailed way to display your Mac's specs! This application will show information than the stock About this Mac will not, such as your full CPU model information, (one of the reasons why this inspired me to create Specifier).
<br>
<br>
Specifier uses shell commands to grab your Mac's specs, so editing and adding more options to Specifier is easy!
<br>
<br> 
Specifier also (as of v2.1) has custom config support, making Specifer more configurable and powerful. To learn how to make Specifier configs + the syntax, jump [here](#specifier-configuration-files)
# Screenshots
## Menu UI
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/3cae5638-9be9-4c94-a748-8b61fc45556b" alt="specifier-menu" width="300"></img>
## Display all specs
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/95036d93-a2fe-4f55-9f51-90fd87601f81" alt="specifier-allspecs-menu" width="400"></img>
## Custom config file option
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/4fd3442e-1e0d-4934-b26a-c86ec8c004b0" alt="example-specifier-config" width="400"/>
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/d82ac20b-00e4-4bd7-9b24-30e47aadcc5c" alt="specifier-configversion-menu" width="400"/>

# Specifier configuration files
Specifier config files add more support and customization to the application
### How to get started
- First of all, create a text file named `specifierconf.txt` in the macOS Applications folder
- Then use the following syntax
```
ConfType= Specifier2.1+
SpecifierArguments:
{Your arguments go here}
```
Specifer currently supports these arguments `cpuModel=`, `gpuModel=`, `osVersion=`, `macModel=`, `macProcessor=`, `macMemory=`, `macDisplay=`, `macStorage=`
<br>
So therefore an example valid configuration would be
```
ConfType= Specifier2.1+
SpecifierArguments:
cpuModel=
gpuModel=
osVersion=
macModel=
macMemory=
macStorage=
```
- Add your desired arguments to the config file and save
- Run Specifier and choose <img width="200" alt="button" src="https://github.com/Sienna7002/Specifier/assets/97623785/420f0608-b09d-43dd-8920-4944225f274c"></img> from the menu
- If all went well, your custom config will display like this! <br><img width="532" alt="image" src="https://github.com/Sienna7002/Specifier/assets/97623785/4b0141c7-3cd5-4523-8970-86432735793f"></img>

