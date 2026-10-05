#!/bin/bash
# Napoleonic Wars for macOS.
# Starts the official, unmodified OpenRA app with the Napoleonic Wars mod loaded from outside the app,
# so nothing has to be signed and macOS has nothing to object to.
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="/Users/Shared/NapoleonicWars"
ENGINE="playtest-20260222"

pause() { echo; read -r -p "Press Return to close this window." _; }

APP=""
for c in "/Applications/OpenRA - Red Alert.app" "$HOME/Applications/OpenRA - Red Alert.app" "$HERE/OpenRA - Red Alert.app" "$HOME/Desktop/OpenRA - Red Alert.app" "$HOME/Downloads/OpenRA - Red Alert.app"; do
	if [ -d "$c" ]; then APP="$c"; break; fi
done

if [ -z "$APP" ]; then
	echo "OpenRA is not installed yet."
	echo
	echo "Download OpenRA $ENGINE for macOS:"
	echo "  https://github.com/OpenRA/OpenRA/releases/download/playtest-20260222/OpenRA-playtest-20260222.dmg"
	echo "Open the .dmg, drag 'OpenRA - Red Alert' into Applications, open it once, quit it, then run this again."
	pause
	exit 1
fi

VERSION="$(cat "$APP/Contents/Resources/VERSION" 2>/dev/null)"
if [ "$VERSION" != "$ENGINE" ]; then
	echo "Warning: this mod was built for OpenRA $ENGINE, but '$APP' is version '$VERSION'."
	echo "It may not start. Install OpenRA $ENGINE from https://github.com/OpenRA/OpenRA/releases/tag/playtest-20260222"
	echo
fi

if [ ! -f "$HERE/files/OpenRA.Mods.Napoleonic.dll" ] || [ ! -d "$HERE/files/mods/napoleonic" ]; then
	echo "The 'files' folder is missing. Keep this script in the folder it came in."
	pause
	exit 1
fi

echo "Installing the mod files to $DEST ..."
mkdir -p "$DEST" || { echo "Could not create $DEST"; pause; exit 1; }
rm -rf "$DEST/mods"
cp -R "$HERE/files/mods" "$DEST/mods" && cp "$HERE/files/OpenRA.Mods.Napoleonic.dll" "$DEST/OpenRA.Mods.Napoleonic.dll" || { echo "Copying the mod files failed."; pause; exit 1; }
xattr -cr "$DEST" 2>/dev/null

echo "Starting Napoleonic Wars with $APP ..."
open -n "$APP" --args "Engine.ModSearchPaths=$APP/Contents/Resources/mods,$DEST/mods" "Game.Mod=napoleonic" || { echo "macOS could not open OpenRA."; pause; exit 1; }
echo "Started. You can close this window."
