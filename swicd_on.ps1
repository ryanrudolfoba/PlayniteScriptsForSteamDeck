<# 
Steam Deck powershell script by ryanrudolf.
This script is intended to be used in conjunction with Playnite.
Prerequisites - Playnite, SWICD, HIDHide, SystemTrayRefresh.
Put this script in a folder together with SystemTrayRefresh.
This script will check the status of the Neptune controller (SteamDeck built-in controller).
If the Neptune controller was previously active, the script will hide it and restart Steam;
This is to prevent double inputs and finally start SWICD.
Otherwise no change is needed. The script exits immediately.
Add this script to the global script settings of Playnite to execute after each game exit.
#>

<# Initialize variables #>

$SteamInstallLocation="C:\Program Files (x86)\Steam\Steam.exe"
$HIDHideInstallLocation="C:\Program Files\Nefarius Software Solutions\HidHide\x64\HidHideCLI.exe"
$SWICDInstallLocation="C:\Program Files\Maximilian Kenfenheuer\SWICD\swicd.exe"
$CheckNeptune=d:\1tools\scripts\checkneptune.bat
$SystemTrayRefresh="d:\1tools\scripts\SystemTrayRefresh.exe"

<# main #>

$CheckNeptune | findstr -i cloak-on

if ($LASTEXITCODE -eq 0) { 
Write-output "Neptune controller already hidden. No changes needed. Goodbye."
exit }

elseif ($LASTEXITCODE -eq 1) { 
Write-output "Neptune controller is active. Please wait applying the changes."
taskkill /f /t /im steam.exe
timeout /t 5 | out-null

Start-Process $HIDHideInstallLocation -ArgumentList "--cloak-on"
Start-Process $SWICDInstallLocation
Start-Process $SteamInstallLocation -Argumentlist "-nofriendsui -nochatui -silent" 
Start-Process $SystemTrayRefresh
exit }

exit