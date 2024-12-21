# System
alias cl='clear'
alias e='exit'

# Git
alias g='git'
alias ga='git add'
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias gb='git branch '
alias gd='git diff'
alias gco='git checkout '
alias gcob='git checkout -b '
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gm='git merge'
alias gp='git push'
alias gc='git commit -v'
alias gcm='git commit -m'

# Vim/Neovim
alias v='vim'
alias nv='nvim'

# Named directories
doc="$HOME/Documents"
dow="$HOME/Downloads"
acc="$HOME/Code/accelerator"

# Better ls
alias ls="ls --color=auto"
alias la="ls --color=auto -a"
alias ll="ls --color=auto -la"

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

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