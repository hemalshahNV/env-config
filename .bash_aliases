
# Git aliases
alias gb='git branch'
alias gck='git checkout'
alias gp='git pull'
alias gst='git status'
alias gl='git log'
alias gbc='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias glg='git log --graph --decorate --pretty=oneline --abbrev-commit'

# Convenience aliases
alias o="xdg-open" # o stands for open

export TERM=xterm-256color
export EDITOR=vim
export DISPLAY=:0

gg() { git grep "$1"; }
hgr() { history | grep "$1"; }

# Show current Git branch on bash prompt
# Requires git bash completion to be setup.

if [ ! -f ~/.git-prompt.sh ]; then
    curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

source ~/.git-prompt.sh

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
WHITE=$(tput setaf 7)
RESET=$(tput setaf 0)
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

# Environment-specific overrides.
BASH_ENVS=~/.bash_env_*
for f in $BASH_ENVS; do
  if [ -f "$f" ]; then
    source "$f"
  fi
done
