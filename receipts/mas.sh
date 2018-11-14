#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing apps from App Store with mas."
echo "------------------------------"
echo ""

###############
# install app #
###############
mas install 425264550 # Blackmagic Disk Speed Test
mas install 441258766 # Magnet
mas install 497799835 # Xcode
mas install 880001334 # Reeder
