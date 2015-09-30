
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGDATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/git/bin
export PATH=/usr/local/sbin:$PATH

export EDITOR=/usr/bin/vim

export NODE_ENV=development

export GOPATH=$HOME/.gocode/

alias vi=vim
alias reloadbp='. ~/.bash_profile'
alias vibp='vi ~/.bash_profile'

findgit()
{
  n=$(pwd)
  while [ $n != '/' ]
  do
  if [ -d $n/.git ]
  then
  return 0
  fi
  n=$(dirname $n)
  done
  return 1
}

PS1="\\[$(tput setaf 5)\]\u \\[$(tput setaf 9)\]\W \\[$(tput setaf 6)\](\$(if findgit; then git symbolic-ref --short HEAD;fi;)) \\[$(tput setaf 9)\]$ "

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
