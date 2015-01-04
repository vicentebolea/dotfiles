#BASH ALIASES-----------------------------------------------
# enable color support of ls and also add handy aliases
if [[ "$TERM" =~ .*256color ]]; then
  alias ls='ls -hXF --color=tty'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias tree='tree -C'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias myip="lynx -dump checkip.dyndns.org"

alias s='sudo '
alias se='sudo -e'

alias df='df -H'
alias du='du -ch'

alias ua='update-alternatives'
alias uac='update-alternatives --config'

#Add git -> g alias and enable complete for it
alias g='git '
complete -o default -o nospace -F _git g
# vim: ft=sh :
