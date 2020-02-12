#!/usr/bin/env bash

echo "Installing dotfiles..."
cd ~/.dotfiles
stow asdf
stow prezto
stow tig
stow ranger
stow tmux
stow vim
stow conda
