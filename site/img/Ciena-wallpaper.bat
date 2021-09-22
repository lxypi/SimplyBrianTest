@echo off

:: Ciena-Wallpaper.bat
:: This is in order to set clear Vz-branded wallpaper on VDI desktop, so that users
:: can never get confused about which Desktop they're on. 
:: This will help ensure Ciena IPr is never inadvertently saved to Vz VDI.
:: Be sure to customise path with correct username.

:: If the wallpaper is not copied to this machine, download it using python urllib.request.urlretrieve
:: https://raw.githubusercontent.com/lxypi/SimplyBrianTest/main/site/img/vz-wallpaper1366x768.jpg
if not exist C:\Users\Public\Pictures\vz-wallpaper1366x768.jpg echo Wallpaper not found, downloading...
if not exist C:\Users\Public\Pictures\vz-wallpaper1366x768.jpg "C:\Program Files\Python39\python.exe" -c "import urllib; import urllib.request; urllib.request.urlretrieve('https://raw.githubusercontent.com/lxypi/SimplyBrianTest/main/site/img/vz-wallpaper1366x768.jpg', 'c:/Users/Public/Pictures/vz-wallpaper1366x768.jpg')"

:: Set the reg keys to use C:\Users\Public\Pictures\vz-wallpaper1366x768.jpg
echo Changing wallpaper
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\Users\Public\Pictures\vz-wallpaper1366x768.jpg /f
:: reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\Users\Public\Pictures\Brian-test.jpg /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 22 /f

:: Wallpaper Style Code:
::   "Fill"   {"10"}
::   "Fit"     {"6"}
::   "Stretch" {"2"}
::   "Tile"    {"0"}
::  "Center"  {"0"}
::   "Span"   {"22"}

reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper
pause

:: Update the user environment, no logout required
:: 		RUNDLL32 is kind of wonky, as it works but only sometimes
%Systemroot%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1, True
