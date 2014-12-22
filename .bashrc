shopt -s histappend
shopt -s checkwinsize
if [ $BASH_VERSINFO -ge 4 ]; then
  shopt -s globstar
  shopt -s autocd
fi 
set -o vi
stty -ixon

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_prompt ] && . ~/.bash_prompt
[ -f ~/.exports ] && . ~/.exports
[ -f ~/.bash_independent ] && . ~/.bash_independent
