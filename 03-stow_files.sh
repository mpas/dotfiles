#!/usr/bin/env bash

echo "Installing dotfiles..."

cd ~/.dotfiles
stow user-root
