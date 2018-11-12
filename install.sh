#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
brew cleanup -s
echo "✓ Homebrew housekeeping done"

# TODO: handle $PATH setting
# Install GNU utils
# brew install coreutils

###############
# install tap #
###############
echo "Installing tap..."
brew tap beeftornado/rmtree
echo "✓ Homebrew tap install done"

#########################
# install brew formulae #
#########################
echo "Installing formulae..."
brew install cheat
brew install curl
brew install dark-mode
brew install git
brew install git-extras
brew install hub
brew install mackup
brew install mas
brew install node
brew install python
brew install rename
brew install speedtest_cli
brew install tree
brew install wget
brew install yarn
echo "✓ Homebrew install done"
