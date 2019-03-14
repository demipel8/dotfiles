
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll='ls -la'
alias ..='cd ..'
alias dc='docker-compose'

alias gohallo='cd ~/code/hallo-matcher'

alias gs='git status'
alias ga='git add'
alias grm='git rebase master'
alias gpr='git pull --rebase'
alias gcb='git checkout -b'
alias gch='git checkout'
alias gsp='git stash pop'
alias gc='git commit -m'
alias gcm='git checkout master'
alias gcs='git checkout stage'
alias gdc='git diff --cached'

glon() {
  lines=${1:-5} 
  git log --oneline -n $lines
}

export DOCKER_IP=0.0.0.0

alias config="/usr/bin/git --git-dir=/Users/alvaro.martinez/.cfg/ --work-tree=/Users/alvaro.martinez"

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

source ~/.bash_xing
