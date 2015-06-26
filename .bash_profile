
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGDATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/git/bin
export PATH=/usr/local/sbin:$PATH

export EDITOR=/usr/bin/vi

export NODE_ENV=development

export GOPATH=$HOME/.gocode/

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
