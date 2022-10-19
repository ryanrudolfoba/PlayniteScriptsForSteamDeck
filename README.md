# PlayniteScriptsForSteamDeck

This repository contains the scripts that I use to manage SWICD and Neptune controller.

By default the SWICD controller is ON, and the Neptune controller is hidden. This prevents double inputs in games.

The appropriate script gets executed by Playnite - a front-end for games.

## Pre-requisites - What is needed for this to run correctly?
1. Playnite
2. SWICD and its dependencies (see below)
3. VIGEM
4. HIDHIDE
5. Tetherscript

## How to Use the Scripts
1. Download and save neptune_on.ps1, swicd_on.ps1 and SystemTrayRefresh.exe to a common folder (example c:\tools\scripts)
2. Edit the script and look at the heading for ***Initialize Variables***. Edit that to reflect the correct directory.
3. Open an elevated / admin  PowerShell command prompt and execute - ***Set-ExecutionPolicy RemoteSigned*** and press Y on the prompt.
4. Configure Playnte to use the scripts.

## How to Configure Playnite to use SWICD by Default on All Games

1. Go to Playnite Desktop App
2. Go to Settings
3. Go to Scripts
4. ***Execute after exiting a game*** - enter the path where swicd_on.ps1 is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/196815483-082b3bd1-300d-490b-bb56-b8962dd8d2b7.png)

## How to Configure Playnite for a Specific Game to Use Neptune Controller Instead of SWICD

1. Go to Playnite Desktop App
2. Right click the game that will be configured for Neptune controller
3. Click Edit
4. Go to Scripts
4. ***Execute before starting a game*** - enter the path where neptune_on.ps1 is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/196815812-95f2104c-5317-4e73-a49d-f9d7c6b98d9b.png)




