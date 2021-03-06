#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Copying config files from templates."
echo "------------------------------"
echo ""

# copy all templates to home directory, retain folder structure
ditto templates/ ~/
