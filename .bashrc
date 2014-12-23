shopt -s histappend
shopt -s checkwinsize
if [ $BASH_VERSINFO -ge 4 ]; then
  shopt -s globstar
  shopt -s autocd
fi 
set -o vi
stty -ixon                                              # Set forward searching

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.exports ] && . ~/.exports                       # Order matters
[ -f ~/.bash_prompt ] && . ~/.bash_prompt
[ -f ~/.bash_independent ] && . ~/.bash_independent

function help_dotfiles {
  printf "\n"
  printf "Prompt cheatsheet:\n"
  printf "  - [+]: Uncomitted changes \n"
  printf "  - [!]: Unstaged changes \n"
  printf "  - [$]: check for stashed files \n"
  printf "\n"
  printf "Readline shortcuts:\n"
  printf "  - [C-l] -> Clear the terminal screen\n"
  printf "  - [gg]  -> On command mode, go to the beggining of history\n"
  printf "  - [G]   -> On command mode, go to the end of history\n"
}

bind '"\C-h":"help_dotfiles\n"'
