# Git aliases
alias gb='git branch'
alias gck='git checkout'
alias gp='git pull'
alias gst='git status'
alias gl='git log'
alias gbc='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'


export TERM=xterm-256color
export EDITOR=vim
export DISPLAY=:0

gg() { git grep "$1"; }
hgr() { history | grep "$1"; }

# Show current Git branch on bash prompt
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
