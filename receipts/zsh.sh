#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing oh-my-zsh."
echo "------------------------------"
echo ""

#####################
# install oh-my-zsh #
#####################
if [[ -d ~/.oh-my-zsh ]]; then
  echo "✓ oh-my-zsh is already installed"
else
  # stop oh-my-zsh to change shell
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
fi

#################
# install theme #
#################

# 1. download cobalt2 theme to ~/.oh-my-zsh/themes/
curl https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme -o ~/.oh-my-zsh/themes/cobalt2.zsh-theme
# 2. replace theme `robbyrussell` to `cobalt2`
sed -i '' -e 's/^\(ZSH_THEME=\).*$/\1"cobalt2"/' ~/.zshrc
# 3. install powerline
sudo easy_install pip
pip install --user powerline-status
# 4. install necessary theme
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
