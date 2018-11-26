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

# Configure
for f in ~/.dotfiles/zsh/configs/*; do source $f; done

# Aliases
[[ -f ~/.dotfiles/zsh/aliases ]] && source ~/.dotfiles/zsh/aliases

# Functions
for f in ~/.dotfiles/zsh/functions/*; do source $f; done

# Override and/or add custom aliasses/functions
for f in ~/dotfiles-local/*; do source $f; done

export PATH="/usr/local/sbin:$PATH"

# miniconda - for Python development
export PATH="~/miniconda3/bin:$PATH"

# fzf - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"
