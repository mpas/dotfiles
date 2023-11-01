#!/usr/bin/env bash

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages..."
cd ~/.dotfiles/backup/brew
brew bundle
