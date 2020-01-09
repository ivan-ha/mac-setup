#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing Homebrew with formulae and apps."
echo "------------------------------"
echo ""

# Check for Homebrew, and install if not exist
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "✓ Homebrew is installed"
fi

# Update homebrew recipes
echo "Housekeeping homebrew..."
brew update
brew upgrade --all
echo "✓ Homebrew housekeeping done"

# TODO: handle $PATH setting
# Install GNU utils
# brew install coreutils

###############
# install tap #
###############
echo "Installing tap..."
brew tap beeftornado/rmtree
brew tap homebrew/cask-fonts
echo "✓ Homebrew tap install done"

#########################
# install brew formulae #
#########################
echo "Installing brew formulae..."
brew install autojump
brew install awscli
brew install curl
brew install git
brew install git-extras
brew install git-open
brew install hub
brew install mackup
brew install mas
brew install python
brew install rename
brew install Schniz/tap/fnm
brew install speedtest_cli
brew install tldr
brew install tree
brew install wget
brew install yarn
brew install zsh-autosuggestions
echo "✓ Homebrew install done"

#####################
# install cask apps #
#####################
echo "Installing brew cask..."
brew cask install 1password
brew cask install adapter
brew cask install alfred
brew cask install authy
brew cask install calibre
brew cask install charles
brew cask install cheatsheet
brew cask install clipy
brew cask install docker
brew cask install dozer
brew cask install dropbox
brew cask install duet
brew cask install evernote
brew cask install firefox
brew cask install font-fira-code
brew cask install gas-mask
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install insomnia
brew cask install istat-menus
brew cask install istumbler
brew cask install iterm2
brew cask install kap
brew cask install mplayerx
brew cask install ngrok
brew cask install nosqlbooster-for-mongodb
brew cask install paintbrush
brew cask install postman
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo
brew cask install react-native-debugger
brew cask install reactotron
brew cask install robo-3t
brew cask install sourcetree
brew cask install station
brew cask install stretchly
brew cask install telegram
brew cask install the-unarchiver
brew cask install tunnelblick
brew cask install visual-studio-code
brew cask install vlc
brew cask install vmware-fusion
brew cask install zeplin
echo "✓ Homebrew cask install done"

# Reset launchpad order
# defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

################
# brew cleanup #
################
echo "Cleaning up brew..."
brew cleanup -s
echo "✓ Homebrew cleanup done"
