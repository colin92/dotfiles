# Separate bash history for each new session
[[ -d ~/.history ]] || mkdir --mode=0700 ~/.history
[[ -d ~/.history ]] && chmod 0700 ~/.history
HISTFILE=~/.history/history.$$
# close any old history file by zeroing HISTFILESIZE  
HISTFILESIZE=0  
# then set HISTFILESIZE to a large value
HISTFILESIZE=4096  
HISTSIZE=4096  
