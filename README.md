# What is it?
Set of fixes and workarounds for [Prototype (2009)](https://store.steampowered.com/app/10150/Prototype/) game.
These fixes are needed due to the age of the game. With them, you can get a much better gaming experience 
than without them.

# Setup
1. Clone repo to C drive:
```powershell
PS C:\> git clone https://github.com/flexxxxer/prototype-fixes
```

2. Paste this to **General: LAUNCH OPTIONS** at Steam:
```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -NoProfile -File "C:\prototype-fixes\RunPrototype.ps1" -GameExe %COMMAND%
```
![example-launch-options](https://github.com/flexxxxer/prototype-fixes/blob/master/imgs/launch-options-example.png)

3. Copy from **prototype-fixes/modified-prototypeenginef** to game folder with replacement one of **prototypeenginef.dll**.
For AMD cards look for folder **amd (disabled shadow filtering)**, for intel and nvidia look for
**other (enabled shadow filtering)**.

4. Copy from **prototype-fixes/directinput-fps-fix** to game folder **dinput8.dll**.

Enjoy!

# What fixes were made?
Most of the fixes were taken from https://www.pcgamingwiki.com/wiki/Prototype. I just merged
AMD shadow missing fix with custom FOV and wrote a script for Steam Launch Options.

Here is the list:
- No shadows with AMD/ATI graphics cards (https://www.pcgamingwiki.com/wiki/Prototype#No_shadows_with_AMD.2FATI_graphics_cards).
I just patch dlls from this archive (https://yadi.sk/d/B5SksXiOsZ3p9) for different FOV values.
- Low FPS fixed using DirectInput FPS Fix (https://community.pcgamingwiki.com/files/file/789-directinput-fps-fix/),
automatic shutdown of HID devices when starting the game using a script (and turning it back on after exiting the game).
- Resolution stuck at 1280x800 fixed using https://community.pcgamingwiki.com/files/file/1486-prototype-resolution-and-fov-fix/ (dll replacement) - now the render resolution 
is automatically set to the same resolution as the monitor the game is running on.
- Crash after starting or loading a game - fixed in the script by setting cpu-affinity to 6 threads for 12 thread processors and 8 threads for those processors with more than 8 threads
(16-21 lines of [RunPrototype.ps1](https://github.com/flexxxxer/prototype-fixes/blob/master/RunPrototype.ps1)).

# For dessert: increase FPS using DXVK
You can use https://github.com/doitsujin/dxvk for improve game performance. How to install it?
1. Download latest version from [Releases page](https://github.com/doitsujin/dxvk/releases).
2. Extract files from x32 folder in archive to Prototype (2009) game folder.
3. Enjoy! (not really... at the first start, shaders will be compiled, I recommend running around the city, destroying a couple of military bases so that all shaders
are compiled and there are no friezes in the future.)

![fps-dx9](https://github.com/flexxxxer/prototype-fixes/blob/master/imgs/dx9-fps.png)

![fps-dxvk](https://github.com/flexxxxer/prototype-fixes/blob/master/imgs/dxvk-fps.jpg)

# License
prototype-fixes is Copyright © 2023 flexxxxer Aleksandr under the [Apache License, Version 2.0](https://github.com/flexxxxer/prototype-fixes/blob/master/LICENSE.txt).