#!/usr/bin/env bash

# Install brew
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages..."
cd ~/.dotfiles/app-preferences/brew
brew bundle
