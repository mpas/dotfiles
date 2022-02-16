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

# Customize to your needs...
export LC_ALL=en_US.UTF-8

################################################################################
# Editor settings
################################################################################
export EDITOR=emacsclient
export VISUAL=$EDITOR

################################################################################
# Handy keybindings
################################################################################
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

################################################################################
# Path
################################################################################
# Add emacs to path
export PATH="$HOME/.emacs.d/bin/:$PATH"

# fix paths for brew installed packages
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

################################################################################
# Dotfiles
################################################################################
# Set location of dotfiles
export DOT=$HOME/.dotfiles

# Source custom aliases
source $DOT/zsh/aliases

# Source custom functions
for f in $DOT/zsh/functions/*; do source $f; done

################################################################################
# Asdf
################################################################################
[ -f $(brew --prefix asdf)/asdf.sh ] && source $(brew --prefix asdf)/asdf.sh

# Set JAVA_HOME for asdf java plugin
source ~/.asdf/plugins/java/set-java-home.zsh

################################################################################
# Fuzzy finder
################################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################
# Hostory
################################################################################
setopt append_history
setopt extended_history       # write the history file in the ':start:elapsed;command' format
setopt inc_append_history     # write to the history file immediately, not when the shell exits
setopt hist_expire_dups_first # expire a duplicate event first when trimming history
setopt hist_ignore_dups       # do not record an event that was just recorded again
setopt hist_ignore_all_dups   # delete an old recorded event if a new event is a duplicate
setopt hist_save_no_dups      # do not write a duplicate event to the history file
setopt hist_verify            # do not execute immediately upon history expansion
setopt share_history          # share history between all sessions
setopt HIST_IGNORE_SPACE      # space in front of command will not append to history file
HISTSIZE=4096
SAVEHIST=4096

################################################################################
# Zplug
################################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "blimmer/zsh-aws-vault"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

################################################################################
# Prompt settings
################################################################################
# ORDER
SPACESHIP_PROMPT_ORDER=(
  dir
  git
  venv
  line_sep
  char
  aws
  terraform
)

SPACESHIP_RPROMPT_ORDER=(
  time
)

SPACESHIP_TIME_SHOW="true"

# DIR
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='1' # show only last directory

# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
#
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name

# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""

# VENV
SPACESHIP_VENV_PREFIX="venv("
SPACESHIP_VENV_SUFFIX=") "

# Terraform
SPACESHIP_TERRAFORM_SYMBOL=""
SPACESHIP_TERRAFORM_PREFIX="tfw ("
SPACESHIP_TERRAFORM_SUFFIX=") "

################################################################################
# Conda
################################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/$USER/.asdf/installs/python/miniconda3-4.7.12/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/$USER/.asdf/installs/python/miniconda3-4.7.12/etc/profile.d/conda.sh" ]; then
        . "/Users/$USER/.asdf/installs/python/miniconda3-4.7.12/etc/profile.d/conda.sh"
    else
        export PATH="/Users/$USER/.asdf/installs/python/miniconda3-4.7.12/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

################################################################################
# Sdkman
################################################################################
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"
