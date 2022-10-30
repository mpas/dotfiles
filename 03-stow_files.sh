#!/usr/bin/env bash

echo "Installing dotfiles..."
cd ~/.dotfiles
stow app-config
stow lazygit -t ~/Library/Application\ Support/lazygit
