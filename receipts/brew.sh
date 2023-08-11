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
brew install eddieantonio/eddieantonio/imgcat
brew install git
brew install git-extras
brew install git-open
brew install github/gh/gh
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
brew install --cask 1password
brew install --cask adapter
brew install --cask alfred
brew install --cask authy
brew install --cask calibre
brew install --cask charles
brew install --cask clipy
brew install --cask docker
brew install --cask dropbox
brew install --cask duet
brew install --cask ferdi
brew install --cask firefox
brew install --cask flipper
brew install --cask font-fira-code
brew install --cask gas-mask
brew install --cask google-backup-and-sync
brew install --cask google-chrome
brew install --cask hiddenbar
brew install --cask iina
brew install --cask insomnia
brew install --cask intellij-idea
brew install --cask istat-menus
brew install --cask istumbler
brew install --cask iterm2
brew install --cask kap
brew install --cask mysqlworkbench
brew install --cask ngrok
brew install --cask nosqlbooster-for-mongodb
brew install --cask notion
brew install --cask paintbrush
brew install --cask postman
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo
brew install --cask react-native-debugger
brew install --cask reactotron
brew install --cask robo-3t
brew install --cask shottr
brew install --cask sourcetree
brew install --cask stretchly
brew install --cask telegram
brew install --cask the-unarchiver
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zeplin
echo "✓ Homebrew cask install done"

# Reset launchpad order
# defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

################
# brew cleanup #
################
echo "Cleaning up brew..."
brew cleanup -s
echo "✓ Homebrew cleanup done"
