<# 
Steam Deck powershell script by ryanrudolf.
This script is intended to be used in conjunction with Playnite.
Prerequisites - Playnite and RyzenAdj.
Put this script in a folder together with RyzenAdj.
The script will check if Steam Deck is plugged in to charger or running on battery.
If Steam Deck is running on battery, the script will set the TDP to 10W.
Otherwise the Steam Deck is connected to charger. No action needed the script exits immediately.
To set as the default TDP for all games - Add this script to the global script settings of Playnite - "execute before starting a game"
To set as TDP on a per-game basis - Add this script to the specific game in Playnite - "execute after starting a game"
#>

<# Initialize variables #>

$RyzenAdjInstallLocation="d:\1tools\scripts\ryzenadj\ryzenadj.exe"


<# main #>
Get-WmiObject Win32_Battery | findstr -i BatteryStatus | findstr 2
if ($LASTEXITCODE -eq 0) { 
Write-output "Steam Deck is connected to charger. No changes needed. Goodbye."
exit }

elseif ($LASTEXITCODE -eq 1) { 
Write-output "Steam Deck is running on battery. Setting TDP to 10W. Please wait"
Start-Process $RyzenAdjInstallLocation -ArgumentList "--stapm-limit=1000 --slow-limit=10000 --fast-limit=10000" -Verb runas
exit }

exit