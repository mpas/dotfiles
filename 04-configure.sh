#!/usr/bin/env bash

# Install fzf
echo "Installing fzf..."
cd ~
$(brew --prefix)/opt/fzf/install --all
cd -

# Install asdf plugins
echo "Installing asf plugins..."
cd ~
asdf plugin-add python
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add maven
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf plugin-add terraform-validator https://github.com/looztra/asdf-terraform-validator
asdf plugin-add yarn
asdf plugin-add crystal https://github.com/asdf-community/asdf-crystal.git
asdf plugin-add micronaut https://github.com/weibemoura/asdf-micronaut.git

# Install asdf versions
asdf install
cd -
