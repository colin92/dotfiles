
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGDATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/git/bin
export PATH=/usr/local/sbin:$PATH

export EDITOR=/usr/bin/vim

export NODE_ENV=development

export GOPATH=$HOME/.gocode/

alias vi=vim

# Shortcut to edit and reload bash profile
alias reloadbp='. ~/.bash_profile'
alias vibp='vi ~/.bash_profile'

# Helper to play a sound when a command finishes running
alias playdone='printf "\7"; sleep .3; printf "\7"'

# Show top ten biggest files in filesystem
alias showtopten='du -ah | sort -n -r | head -n 10'

# Found online in someone's bash profile kills all chrome helper processes
# to save memory
alias chromekill='ps ux | grep '\''[C]hrome Helper --type=renderer'\'' | grep -v extension-process | tr -s '\'' '\'' | cut -d '\'' '\'' -f2 | xargs kill'

# Start a simple httpserver in your current directory
alias http='python -m SimpleHTTPServer'

# Useful shortcuts
alias todev='cd ~/Development'
alias lala='ls -la'
alias ll='ls -l'
alias lla='ls -a'

# Access mongo database log file
alias mongolog='tail -f /usr/local/var/log/mongodb/mongo.log'

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
