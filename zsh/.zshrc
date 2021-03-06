#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export LC_ALL=en_US.UTF-8

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

# Add emacs to path
export PATH="$HOME/.emacs.d/bin/:$PATH" 

# fzf - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
[ -f $(brew --prefix asdf)/asdf.sh ] && source $(brew --prefix asdf)/asdf.sh

# Override and/or add custom aliasses/functions
# for f in ~/dotfiles-local/*; do source $f; done
export PATH="/usr/bin:/usr/local/sbin:$PATH"

# Set JAVA_HOME for asdf java plugin
. ~/.asdf/plugins/java/set-java-home.zsh

# Configure prompt
. ~/prompt/.spaceship

# Go 
export GOPATH=~/Development/go

# fix paths for brew installed packages
export PATH="/usr/local/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/phnl310301178/.asdf/installs/python/miniconda3-4.7.12/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/phnl310301178/.asdf/installs/python/miniconda3-4.7.12/etc/profile.d/conda.sh" ]; then
        . "/Users/phnl310301178/.asdf/installs/python/miniconda3-4.7.12/etc/profile.d/conda.sh"
    else
        export PATH="/Users/phnl310301178/.asdf/installs/python/miniconda3-4.7.12/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
