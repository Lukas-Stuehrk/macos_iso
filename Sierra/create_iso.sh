#!/usr/bin/env bash
set -e
hdiutil attach "/Applications/Install macOS Sierra.app/Contents/SharedSupport/InstallESD.dmg" -noverify -nobrowse -mountpoint /Volumes/esd
hdiutil create -o sierra.cdr -size 7316m -layout SPUD -fs HFS+J
hdiutil attach sierra.cdr.dmg -noverify -nobrowse -mountpoint /Volumes/iso
asr restore -source /Volumes/esd/BaseSystem.dmg -target /Volumes/iso -noprompt -noverify -erase
rm /Volumes/OS\ X\ Base\ System/System/Installation/Packages 
cp -rp /Volumes/esd/Packages /Volumes/OS\ X\ Base\ System/System/Installation
cp -rp /Volumes/esd/BaseSystem.chunklist /Volumes/OS\ X\ Base\ System/
cp -rp /Volumes/esd/BaseSystem.dmg /Volumes/OS\ X\ Base\ System/
hdiutil detach /Volumes/esd
hdiutil detach /Volumes/OS\ X\ Base\ System
hdiutil convert sierra.cdr.dmg -format UDTO -o sierra.iso
rm sierra.cdr.dmg
mv sierra.iso.cdr sierra.iso
