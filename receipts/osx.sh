#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Setting up OSX \`defaults\` config."
echo "------------------------------"
echo ""

#################################
# general                       #
#################################

# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Enable FileVault
sudo fdesetup enable

# Install Xcode command line tools
xcode-select --install

# enable dark theme for dock and menu bar
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Enable Tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set trackpad and mouse speed
defaults write -g com.apple.trackpad.scaling 1.5
defaults write -g com.apple.mouse.scaling 2.5

################################
# screen                       #
################################

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Save screenshots to the desktop
# TODO: cam remove seems this is default now?
# defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

################################
# Finder                       #
################################

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Set default finder location to home folder
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

##############################
# Dock, Dashboard            #
##############################

# Set Dock icons sizes
# defaults write com.apple.dock tilesize -int 22
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 115

# Enable Dock icons magnification
# defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock magnification -bool false

# Set Dock to left
defaults write com.apple.dock orientation left

# Set Dock autohide and animation
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don't show recent apps in dock
defaults write com.apple.dock show-recents -bool false

################################
# Safari                       #
################################

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

##############################
# Mail                       #
##############################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
