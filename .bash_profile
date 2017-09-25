
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGDATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/git/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/utilities

export PYTHONPATH=$PYTHONPATH:/Users/colinmeret/anaconda/lib/python2.7/site-packages
export PYTHONSTARTUP=$HOME/.startup_script.py


export EDITOR=/usr/bin/vim

export NODE_ENV='local'

export GOPATH=$HOME/.gocode/

if [ -f ~/.bash_variables ]; then
  source ~/.bash_variables
fi

alias vi=vim

# Shortcut to edit and reload bash profile
alias rlbp='. ~/.bash_profile'
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
alias llaa='ls -la'
alias ll='ls -l'
alias lla='ls -a'
alias kc='kubectl'
alias prettyclipboard='pbpaste > .tmp.json; prettyjson .tmp.json | pbcopy; rm .tmp.json'
alias undep='rm -r ./ && kubectl container clusters delete test_project'
alias resetdocker='docker-machine rm default && docker-machine create --driver virtualbox default && eval $(docker-machine env default)'
# Access mongo database log file
alias mongolog='tail -f /usr/local/var/log/mongodb/mongo.log'
alias b64d='pbpaste | base64 --decode | pbcopy'
alias b64e='pbpaste | base64 | pbcopy'

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

if [ -f ~/.gcloud-aliases ]; then
  source ~/.gcloud-aliases
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

PS1="\\[$(tput setaf 5)\]\u \\[$(tput setaf 11)\]\W \\[$(tput setaf 6)\](\$(if findgit; then git symbolic-ref --short HEAD;fi;)) \\[$(tput setaf 10)\]$ "

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/colinmeret/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/colinmeret/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/colinmeret/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/colinmeret/Downloads/google-cloud-sdk/completion.bash.inc'
fi

# added by Anaconda3 4.2.0 installer
export PATH="/Users/colinmeret/anaconda/bin:$PATH"

# Start up docker-machine on startup
# if not docker variable, start up docker-machine restart default, then eval $(docker-machine env)
