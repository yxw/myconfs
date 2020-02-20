# .bashrc

 # Source global definitions
 if [ -f /etc/bashrc ]; then
     . /etc/bashrc
 fi

 # Uncomment the following line if you don't like systemctl's auto-paging feature:
 # export SYSTEMD_PAGER=

 # User specific aliases and functions
 alias cd.='cd ..'
 alias cd..='cd ..'
 alias l='ls -alF'
 alias ll='ls -l'

 export PLATFORM=$(uname -s)

 ### git-prompt
 __git_ps1() { :;}
 if [ -e ~/.git-prompt.sh ]; then
 source ~/.git-prompt.sh
 fi

 if [ "$PLATFORM" = Linux ]; then
   PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
   PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]"
 else
   PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
 fi
