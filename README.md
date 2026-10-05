# Napoleonic Wars for macOS

The Napoleonic Wars mod, running on the official OpenRA app for macOS (`playtest-20260222`).
The OpenRA app itself is not changed, so there is nothing to sign and no "damaged app" warning.
Works on Intel Macs and Apple Silicon (M1 and later), macOS 10.15 or newer.

> Put together on Windows and **not yet tested on a Mac**.

## Install

1. **Install OpenRA `playtest-20260222`.** Download [OpenRA-playtest-20260222.dmg](https://github.com/OpenRA/OpenRA/releases/download/playtest-20260222/OpenRA-playtest-20260222.dmg)
   (from the [official release page](https://github.com/OpenRA/OpenRA/releases/tag/playtest-20260222)), open it and drag **OpenRA - Red Alert** into Applications.
   Open it once so macOS asks its usual "downloaded from the internet" question, then quit it.
2. **Download this repository on the Mac**: the green **Code** button, then **Download ZIP**, and double-click the zip.
   Do the download and unzip on the Mac itself, not on Windows.
3. **Start the game**: in the unzipped folder, double-click **Play Napoleonic Wars.command**.

macOS will not open a downloaded script by double-click the first time. Any one of these gets past that:

- right-click the script and choose **Open**, then **Open** again; or
- **System Settings > Privacy & Security**, scroll down and click **Open Anyway**; or
- open **Terminal**, type `bash` and a space, drag the script into the Terminal window and press Return.
  This last way always works, including when macOS says the file "could not be executed".

## Playing

Start the game with **Play Napoleonic Wars.command** every time. It copies the mod to `/Users/Shared/NapoleonicWars` and starts OpenRA
with the mod. Starting "OpenRA - Red Alert" directly gives you plain Red Alert.

The first start may show OpenRA's content installer: the mod uses some original Red Alert files (sounds, terrain),
and the installer can download them.

## If something goes wrong

The script prints what it is doing in the Terminal window: send that text.
If the game itself crashes, its logs are in `~/Library/Application Support/OpenRA/Logs`.

## Multiplayer with Windows players

Everyone needs the same version of the mod. This build was made 2026-10-04 from the Windows copy of that day.

## What is in this repository

| Path | What it is |
|---|---|
| `Play Napoleonic Wars.command` | starts the game |
| `files/mods/napoleonic/` | the mod |
| `files/OpenRA.Mods.Napoleonic.dll` | the mod's code |
