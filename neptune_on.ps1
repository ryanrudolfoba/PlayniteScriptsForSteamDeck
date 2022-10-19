<# 
Steam Deck powershell script by ryanrudolf.
This script is intended to be used in conjunction with Playnite.
Prerequisites - Playnite, SWICD, HIDHide and SystemTrayRefresh.
Put this script in the same folder together with SystemTrayRefresh.
This script will check if Steam Deck is running in handheld mode or docked mode.
If running in handheld mode the script will enable the Neptune controller and restart Steam.
It will then terminate SWICD to prevent double inputs, and then run SystemTrayRefresh to cleanup up the systemtray.
Otherwise the Steam Deck is running in docked mode and no changes are needed. Script will exit immediately.
Add this script to each game in Playnite that will use Neptune controller instead of SWICD.
#>

<# Initialize variables #>
$CheckNeptune=& "c:\Program Files\Nefarius Software Solutions\HidHide\x64\HidHideCLI.exe" --cloak-state
$SteamInstallLocation="C:\Program Files (x86)\Steam\Steam.exe"
$HIDHideInstallLocation="C:\Program Files\Nefarius Software Solutions\HidHide\x64\HidHideCLI.exe"
$SystemTrayRefresh="d:\1tools\scripts\systemtrayrefresh.exe"

<# main #>
$CheckNeptune | findstr -i cloak-off
if ($LASTEXITCODE -eq 0) { 
Write-output "Neptune controller already enabled. No changes needed. Goodbye."
exit }

$GetDisplayConnected=Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams | measure
if ($GetDisplayConnected.count -eq 2) { 
Write-output "Steam Deck is running in docked mode. No changes needed. Goodbye."
exit }

elseif ($GetDisplayConnected.count -eq 1) {
Write-output "Steam Deck is running in handheld mode. Please wait applying the changes."
taskkill /f /t /im steam.exe
taskkill /f /t /im swicd.exe
timeout /t 5 | out-null

Start-Process $HIDHideInstallLocation -ArgumentList "--cloak-off"
Start-Process $SteamInstallLocation -ArgumentList "-nofriendsui -nochatui -silent" 
start-Process $SystemTrayRefresh
exit }

exit