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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/phnl310301178/.asdf/installs/python/miniconda3-4.3.30/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/phnl310301178/.asdf/installs/python/miniconda3-4.3.30/etc/profile.d/conda.sh" ]; then
        . "/Users/phnl310301178/.asdf/installs/python/miniconda3-4.3.30/etc/profile.d/conda.sh"
    else
        export PATH="/Users/phnl310301178/.asdf/installs/python/miniconda3-4.3.30/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
