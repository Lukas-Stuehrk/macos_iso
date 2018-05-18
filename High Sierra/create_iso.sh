#!/usr/bin/env bash

set -e

# Create empty disk
hdiutil create -o /tmp/HighSierra.cdr -size 7316m -layout SPUD -fs HFS+J
hdiutil attach /tmp/HighSierra.cdr.dmg -noverify -nobrowse -mountpoint /Volumes/install_build

asr restore -source /Applications/Install\ macOS\ High\ Sierra.app/Contents/SharedSupport/BaseSystem.dmg -target /Volumes/install_build -noprompt -noverify -erase
hdiutil detach /Volumes/OS\ X\ Base\ System
hdiutil convert /tmp/HighSierra.cdr.dmg -format UDTO -o /tmp/HighSierra.iso
mv /tmp/HighSierra.iso.cdr ./HighSierra.iso
rm /tmp/HighSierra.cdr.dmg
