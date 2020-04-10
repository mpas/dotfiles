#!/usr/bin/env zsh

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd ~/.zprezto
git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib
