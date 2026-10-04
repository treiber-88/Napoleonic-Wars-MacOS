#!/bin/bash
# Napoleonic Wars - first time setup on a Mac.
# The app is the official OpenRA Red Alert app with the Napoleonic Wars mod added, so Apple's original
# signature no longer matches and macOS refuses to open it until it is signed again on this Mac.
cd "$(dirname "$0")"
APP="Napoleonic Wars.app"
if [ ! -d "$APP" ]; then
	echo "Put this file in the same folder as '$APP' and run it again."
	read -r -p "Press Return to close." _
	exit 1
fi
echo "Removing the download quarantine flag..."
xattr -cr "$APP"
echo "Signing the app for this Mac (ad hoc)..."
codesign --force --deep --sign - "$APP" || echo "Signing failed; trying to open it anyway."
echo "Opening Napoleonic Wars..."
open "$APP"
echo "Done. From now on just double-click '$APP' (you can move it to Applications)."
