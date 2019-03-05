
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll='ls -la'
alias ..='cd ..'

alias gs='git status'
alias grm='git rebase master'
alias gpr='git pull --rebase'
alias gcb='git checkout -b'
alias gch='git checkout'
alias gsp='git stash pop'

glon() {
  lines=${1:-5} 
  git log --oneline -n $lines
}

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
