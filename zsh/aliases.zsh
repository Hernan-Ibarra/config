# System
alias cl='clear'
alias e='exit'

# Git
alias g='git'
alias ga='git add'
alias gf='git fetch'
alias gs='git status'
alias gl='git pull'
alias glo='git log'
alias gb='git branch'
alias gd='git diff'
alias gdt='git difftool'
alias gco='git checkout'
alias gm='git merge'
alias gp='git push'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gsw='git switch'
alias gswc='git switch -c'
alias gr='git restore'

# Vim/Neovim
alias v='vim'
alias nv='nvim'
alias view='nvim -R'

# Named directories
doc="$HOME/Documents"
dow="$HOME/Downloads"
acc="$HOME/code/accelerator"

alias conf="cd $XDG_CONFIG_HOME"

# Better ls
alias ls="ls --color=auto"
alias la="ls --color=auto -a"
alias ll="ls --color=auto -lah"

## a quick way to get out of current directory ##
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias ............='cd ../../../../../../../../../../../'
alias .............='cd ../../../../../../../../../../../../'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# mkdir creates intermediate directories as needed.
alias mkdir='mkdir -pv'

# mcd creates a directory and then cd's into it
mcd () {
    mkdir -p "$1"
    cd "$1"
}

alias python='python3'

# slides
slides () {
    export COLUMNS="$(tput columns)"
    export LINES="$(tput lines)"
    command slides $@
}

