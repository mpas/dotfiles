#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Dotfiles
export DOT=$HOME/.dotfiles

# Configure
for f in $DOT/zsh/configs/*; do source $f; done

# Aliases
[[ -f $DOT/zsh/aliases ]] && source $DOT/zsh/aliases

# Functions
for f in $DOT/zsh/functions/*; do source $f; done

# Override and/or add custom aliasses/functions
# for f in ~/dotfiles-local/*; do source $f; done

export PATH="/usr/local/sbin:$PATH"

# miniconda - for Python development
export PATH="~/miniconda3/bin:$PATH"

# fzf - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
[ -f $(brew --prefix asdf)/asdf.sh ] && source $(brew --prefix asdf)/asdf.sh
# Set JAVA_HOME for asdf java plugin
. ~/.asdf/plugins/java/set-java-home.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"
