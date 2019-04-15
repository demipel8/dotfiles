
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll='ls -la'
alias ..='cd ..'
alias dc='docker-compose'

alias gohallo='cd ~/code/hallo-matcher'

alias gs='git status'
alias ga='git add .'
alias grm='git rebase master'
alias gpr='git pull --rebase'
alias gcb='git checkout -b'
alias gch='git checkout'
alias gsp='git stash pop'
alias gc='git commit -m'
alias gcm='git checkout master'
alias gcs='git checkout stage'
alias gcan='git commit --amend --no-edit'
alias gdc='git diff --cached'
alias ggpush='git push origin $(current_branch)'

glon() {
  lines=${1:-5} 
  git log --oneline -n $lines
}

export DOCKER_IP=0.0.0.0

alias config="/usr/bin/git --git-dir=/Users/alvaro.martinez/.cfg/ --work-tree=/Users/alvaro.martinez"

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

source ~/.bash_xing
