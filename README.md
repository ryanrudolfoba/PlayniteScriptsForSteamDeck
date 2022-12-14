# PlayniteScriptsForSteamDeck

## Whats New ???
v0.2 - added scripts to set TDP level - 3W, 7W, 10W, 15W

v0.1 - initial release - SWICD and Neptune Controller scripts


## About
This repository contains the scripts that I use to manage SWICD, Neptune controller, and for setting the TDP.

By default the SWICD controller is ON, and the Neptune controller is hidden. This prevents double inputs in games.

TDP can be set on a global level or per game basis. Set TPD to 7W on a global level, and then for games that run slow / have performance issues it can be set to 10W or 15W on a per-game basis.

The appropriate script gets executed by Playnite - a front-end for games.

## Pre-requisites - What is needed for this to run correctly?
1. Playnite - [click here for more details](https://playnite.link)
2. SWICD - [click here for more details](https://github.com/mKenfenheuer/steam-deck-windows-usermode-driver) And mostly the dependencies needed by SWICD - [MS Visual C++ Redistributable Package](https://aka.ms/vs/17/release/vc_redist.x64.exe), [VIGEM](https://github.com/ViGEm/ViGEmBus), [HIDHIDE](https://github.com/ViGEm/HidHide), and [Tetherscript](https://tetherscript.com/hid-driver-kit-download/).
3. Initial HIDHIDE configuration.
4. RyzenAdj - [click here for details](https://github.com/FlyGoat/RyzenAdj)

## How to Use the Scripts
1. Download and extract the zip archive to a common folder (example c:\tools\scripts)
2. Edit the script and look at the heading for ***Initialize Variables***. Edit that to reflect the correct directory.
3. Open an elevated / admin  PowerShell command prompt and execute - ***Set-ExecutionPolicy RemoteSigned*** and press Y on the prompt.
4. Configure Playnite to use the scripts.

## How to Configure HIDHIDE
1. Once HIDHIDE is installed, open the HIDHIDE desktop shortcut.
2. Put a checkmark on ***Inverse Application Cloak***.
3. Press the **+** sign, and then browse to where Steam is installed. Usually this is C:\Program Files (x86)\Steam
4. Select Steam.exe and press Open.
5. Press the **+** sign again and add GameOverlayUI.exe and Streaming_Client.exe
6. Click the ***Devices*** tab.
7. Uncheck ***Gaming devices only***.
8. Put a checkmark on ***Valve Software Steam Deck Controller***
9. Put a checkmark on ***Enable device hiding***
10. Once done, close HIDHIDE.

### Screenshot for reference
![image](https://user-images.githubusercontent.com/98122529/197060273-a189677e-70bc-4757-9ee1-335d18df12eb.png)
![image](https://user-images.githubusercontent.com/98122529/197060313-cb45dcdf-7f1f-4be2-a189-4ea06f1acf31.png)


## How to Configure Playnite to use SWICD by Default on All Games

1. Go to Playnite Desktop App
2. Go to Settings
3. Go to Scripts
4. ***Execute after exiting a game*** - enter the path where swicd_on.ps1 is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/196815483-082b3bd1-300d-490b-bb56-b8962dd8d2b7.png)

## How to Configure Playnite to Use Neptune Controller on a Per-Game Basis

1. Go to Playnite Desktop App
2. Right click the game that will be configured for Neptune controller
3. Click Edit
4. Go to Scripts
4. ***Execute before starting a game*** - enter the path where neptune_on.ps1 is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/197358185-e290635b-2208-42bb-a244-08b454924101.png)

## How to Configure Playnite to Use 7W TDP on All Games
1. Go to Playnite Desktop App
2. Go to Settings
3. Go to Scripts
4. ***Execute before starting a game*** - enter the path where tdp_7w.ps1 is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/197357966-a29f0dd1-84db-4202-8ce1-2f04bff992c1.png)


## How to Configure Playnite to Use a Different TDP on a Per-Game Basis

1. Go to Playnite Desktop App
2. Right click the game that will be configured to use a differnt TDP
3. Click Edit
4. Go to Scripts
4. ***Execute before starting a game*** - enter the path where tdp_10w.ps1 (or tdp_15w.ps1, tdp_3w.ps1) is located

### Screenshot for reference -
![image](https://user-images.githubusercontent.com/98122529/197358343-7b924ce4-8fc1-4b86-ac32-ca6ab8c529e4.png)


**NOTE1:** There are several scripts that set TDP - tdp_3w.ps1, tdp_7w.ps1, tdp_10w.ps1 and tdp_15w.ps1.

**NOTE2:** The TDP scripts will only get executed when Steam Deck is running on battery.

**NOTE3:** RyzenAdj needs admin rights. UAC prompt will appear when the script runs - press YES when the UAC prompt appears.

**NOTE4:** UAC prompts can get annoying. Disable UAC prompts if needed.

