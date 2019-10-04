
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Git aliases
alias gb='git branch'
alias gck='git checkout'
alias gp='git pull'
alias gst='git status'
alias gl='git log'
alias gbc='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# Convenience aliases
alias o="xdg-open" # o stands for open

export TERM=xterm-256color
export EDITOR=vim
export DISPLAY=:1

gg() { git grep "$1"; }
hgr() { history | grep "$1"; }

# Show current Git branch on bash prompt
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

# Environment-specific overrides.
BASH_ENVS=~/.bash_env_*
for f in $BASH_ENVS; do
  if [ -f "$f" ]; then
    . "$f"
  fi
done


