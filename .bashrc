shopt -s histappend
shopt -s checkwinsize
if [ $BASH_VERSINFO -ge 4 ]; then
  shopt -s globstar
  shopt -s autocd
fi
set -o vi
stty -ixon                                     # Set forward searching

[ -f ~/.bash_exports ] && . ~/.bash_exports              # Order matters
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_prompt ] && . ~/.bash_prompt
[ -f ~/.bash_functions ] && . ~/.bash_functions
[ -f ~/.bash_independent ] && . ~/.bash_independent
