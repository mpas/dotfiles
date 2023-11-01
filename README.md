# dotfiles

Dotfiles managed with gnu stow, a free, portable, lightweight symlink farm manager. This allows you to keep a versioned directory of all config files that are virtually linked into place via a single command. This makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.

## Requirements

* Git installed

## Install

Clone onto your laptop:

`git clone git@github.com:mpas/dotfiles.git ~/.dotfiles`

## Using

After the dotfiles repo is checkout into your home folder navigate to one of the packages for example `vim`.

* cd ~\.dotfiles
* stow user-root

To delete the stowed links use `stow -D user-root`

## Install all

- Execute the setup script
    - `$ ~/.dotfiles/setup.sh`

## Addons

- Little Snitch
