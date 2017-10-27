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

# --------------------------------------------------------------------------------
# Custom settings for shell
# --------------------------------------------------------------------------------

#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------
#
USER=phnl310301178

setopt clobber

# SSH Settings
alias compile-ssh-config='echo -n > ~/.ssh/config && cat ~/.ssh/*.config > ~/.ssh/config'
alias ssh='compile-ssh-config && ssh'

# VIM Settings
alias vim='/usr/local/bin/vim'

# Development settings
export DEV_RESOURCE_HOME=/Users/$USER/Development/resources
export DEV_RESOURCE_LIB=$DEV_RESOURCE_HOME/libraries

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home

# MAVEN settings
export MAVEN_HOME=/Users/$USER/.sdkman/candidates/maven/current
export M2_HOME=/Users/$USER/.sdkman/candidates/maven/current

# GROOVY
export GROOVY_HOME=/Users/$USER/.sdkman/candidates/groovy/current

# GRAILS
export GRAILS_HOME=/Users/$USER/.sdkman/candidates/grails/current

# PACKER
export PACKER_HOME=/Users/$USER/Development/resources/packer/current

# CONSUL
export CONSUL_HOME=/Users/$USER/Development/resources/consul/current

# GO
export GOPATH=/Users/$USER/Development/go

# NOMAD
export NOMAD_HOME=/Users/$USER/Development/resources/nomad/current

# ELIXIR
export ELIXIR_HOME=/usr/local/bin/elixir

# PATH settings
PATH=$PATH:/usr/local/sbin:/usr/local/bin:$MAVEN_HOME/bin:$JAVA_HOME/bin:$PACKER_HOME:/usr/local/go/bin:$GOPATH/bin:$CONSUL_HOME:$NOMAD_HOME:$ELIXIR_HOME/bin

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/bin/nano

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias l="ls -al"
alias h=history
alias lp="ls -p"
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='atom'                           # edit:         Opens any file in text editor
alias e='atom'                              # edit:         Opens any file in text editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -a'                       # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

# Meld
alias meld="/Applications/Meld.app/Contents/MacOS/Meld"

# Sourcetree
alias stree='open -a SourceTree'

# Path Finder
pf () { open -a "Path Finder.app" $1; }

# Docker
docker-clean-images() { docker rmi -f $(docker images -q -a -f dangling=true) }
docker-clean-containers() { docker rm $(docker ps -a -q) }
alias dc="docker-compose $1"
alias docker-run-it="docker run -it --rm ${1} /bin/bash"
alias docker-run="docker run ${1}"

# ECR Login
alias ecr='eval "$(aws ecr get-login --no-include-email --region us-east-1)"'

# Git
alias gs="git status"
alias gac="git commit -am ${1}"
alias gpl="git pull"
alias gps="git push"
alias gpsa="git push --all"
alias gpst="git push --tags"
alias gco="git checkout ${1}"
alias po="remote prune origin"

# Groovy
alias gconsole="groovyConsole"

# Terraform
alias tf="terraform"
alias tfg="terraform get --update"
alias tfp="terraform plan"
alias tfa="terraform apply"

#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------
# alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
# alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
# alias editHosts='sudo nano /etc/hosts'                  # editHosts:        Edit /etc/hosts file
# alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
# alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
# httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


#   ---------------------------------------
#   8.  VI KEYBINDINGS FOR THE SHELL
#   ---------------------------------------
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Enable direnv into bash/zsh
eval "$(direnv hook bash)"
eval "$(direnv hook zsh)"
