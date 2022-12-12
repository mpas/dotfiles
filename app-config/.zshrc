# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

################################################################################
# Start of my config
################################################################################
export LC_ALL=en_US.UTF-8

################################################################################
# Pure prompt
# https://github.com/sindresorhus/pure
################################################################################
# Use pure prompt
# autoload -U promptinit; promptinit
# prompt pure

eval "$(starship init zsh)"

# source /path/to/kube-ps1.sh
# PROMPT='$(kube-ps1)'$PROMPT

################################################################################
# Editor settings
################################################################################
export EDITOR=nvim
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

# Add LunarVim to path
export PATH="$HOME/.local/bin:$PATH"

export PATH="$PATH:/usr/local/bin/"

# fix paths for brew installed packages
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

export ZK_NOTEBOOK_DIR="$HOME/Dropbox/notes/"

# Add graph-easy to path
# export PATH="$HOME/.cpan/build/Graph-Easy-0.76-0/bin:$PATH"
################################################################################
# Dotfiles
################################################################################
# Source custom aliases
source $HOME/aliases

# Source custom functions
for f in $HOME/shell-functions/*; do source $f; done

# Set JAVA_HOME for asdf java plugin
source ~/.asdf/plugins/java/set-java-home.zsh

# source carge
. "$HOME/.cargo/env"

################################################################################
# Multipass
################################################################################
PATH="$PATH:/Users/phnl310301178/Library/Application Support/multipass/bin"

################################################################################
# Kubectl Krew
################################################################################
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

################################################################################
# History
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

# Auto start tmux when launching a new terminal
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/phnl310301178/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
