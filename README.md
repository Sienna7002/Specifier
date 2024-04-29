# <img src="https://github.com/Sienna7002/Specifier/assets/97623785/f0e561de-e492-47e0-b617-5635ef7edb5e" width="64px"/></img> <br> Specifier <br> <img src="https://img.shields.io/github/languages/top/Sienna7002/Specifier?style=for-the-badge"> <br> <img src="https://img.shields.io/github/v/release/Sienna7002/Specifier?style=for-the-badge">
Welcome to Specifier! This simple application, written **100% in AppleScript** aims to provide a more robust and detailed way to display your Mac's specs! This application will show information that the stock About this Mac will not, such as your full CPU model information, (one of the reasons why this inspired me to create Specifier).
<br>
<br>
Specifier uses shell commands to grab your Mac's specs, so editing and adding more options to Specifier is easy!
<br>
<br> 
Specifier also (as of v2.1) has custom config support, making Specifier more configurable and powerful. To learn how to make Specifier configs + the syntax, jump [here](#specifier-configuration-files)
<br>
<br>
Due to not having the means of signing Specifier, you might encounter the error when downloading `“Specifier” is damaged and can’t be opened. You should move it to the Bin.`, The app should be perfectly fine however, as running the command `xattr -cr /Applications/Specifier.app in Terminal.app` generally fixes the problem
# Screenshots
## Menu UI
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/3cae5638-9be9-4c94-a748-8b61fc45556b" alt="specifier-menu" width="300"></img>
## Display all specs
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/95036d93-a2fe-4f55-9f51-90fd87601f81" alt="specifier-allspecs-menu" width="400"></img>
## Custom config file option
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/4fd3442e-1e0d-4934-b26a-c86ec8c004b0" alt="example-specifier-config" width="400"/>
<img src="https://github.com/Sienna7002/Specifier/assets/97623785/d82ac20b-00e4-4bd7-9b24-30e47aadcc5c" alt="specifier-configversion-menu" width="400"/>

# Specifier configuration files
Specifier config files adds more customization to the application, as they allow Specifier to show what specs you need, removing the clutter!
### How to get started
- First of all, create a text file named `specifierconf.txt` in the macOS Applications folder
- Then use the following syntax
```
ConfType= Specifier2.1+
SpecifierArguments:
{Your arguments go here}
```
Specifer currently supports these arguments `cpuModel`, `gpuModel`, `osVersion`, `macModel`, `macProcessor`, `macMemory`, `macDisplay`, `macStorage` and `topString=`
<br>
So therefore an example valid configuration would be
```
ConfType= Specifier2.1+
SpecifierArguments:
cpuModel
gpuModel
osVersion
macModel
macMemory
macStorage
```
- Add your desired arguments to the config file and save
- Run Specifier and choose <img width="200" alt="button" src="https://github.com/Sienna7002/Specifier/assets/97623785/420f0608-b09d-43dd-8920-4944225f274c"></img> from the menu
- If all went well, your custom config will display like this! <br><img width="532" alt="image" src="https://github.com/Sienna7002/Specifier/assets/97623785/4b0141c7-3cd5-4523-8970-86432735793f"></img>
## Optional Headers + Report String
With v2.2, new headers (`ConfDev=` , `ConfVer=`, `ConfName=` and `ConfDesignedFor=`) and report string modification support (`topString=`) was added, to use the new About Config feature, you need `ConfDesignedFor=`  below "ConfType=" in the config file, for an example this is a 2.2 compliant config.
```
ConfType= Specifier2.1+
ConfDesignedFor= Specifier2.2
ConfDev= "7002"
ConfVer= "1.0"
ConfName= "Simplicity"
SpecifierArguments:
topString= "Here is the info about your Macintosh:"
cpuModel
gpuModel
osVersion
macModel
macMemory
macStorage
```
These new features allow creators to identify their configs, and also do more!
Here is what these new options look like when displayed on Specifer.
<br>
<img width="400" alt="image" src="https://github.com/Sienna7002/Specifier/assets/97623785/d7575313-7631-4643-8380-3536faf67e21">
<img width="400" alt="image" src="https://github.com/Sienna7002/Specifier/assets/97623785/19e81d41-c7e4-4265-9962-bdcb0ff5b171">
</img>
<br>
Here is a bit more info on how to use these new features
<br>
- `topString=` allows the config developer to change the `Specifier reported your Mac's specs as:` to whatever they desire, a correct use of this would be `topString= "Here are your tech specs!"`
- `ConfDev=` is a piece of metadata that contains the config developer, so it can be displayed on the About Config feature, a correct use of this would be `ConfDev= "Liam C."`
- `ConfVer=` is a piece of metadata that contains the config version, so it can be displayed on the About Config feature, a correct use of this would be `ConfVer= "3.5"`
- `ConfName=` is a piece of metadata that contains the config name, so it can be displayed on the About Config feature, a correct use of this would be `ConfName= "MegaConf!"`
- `ConfDesignedFor=` is a piece of metadata that contains the Specifier version a config is designed for, so it can be displayed on the About Config feature, `ConfDesignedFor=` is also required to use the About Config feature, otherwise, you will get an Error Code 04. A correct use of this would be `ConfDesignedFor= Specifier2.2`. _**Do not change this if a sub update is released, for example, do not change `ConfDesignedFor= Specifier2.3` if Specifer 2.3.1 releases, change it when Specifier 2.4 releases.**_
