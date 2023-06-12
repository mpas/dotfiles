#!/usr/bin/env bash

echo "Installing dotfiles..."

stow asdf
stow git
stow lazygit
stow tig
stow shell


cd ~/.dotfiles
stow app-config
