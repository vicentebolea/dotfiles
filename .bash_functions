## vim: ft=sh :

function help_dotfiles {
  printf "\n"
  printf "Prompt cheatsheet:\n"
  printf "  - [+]: Uncomitted changes \n"
  printf "  - [!]: Unstaged changes \n"
  printf "  - [$]: check for stashed files \n"
  printf "\n"
  printf "Readline shortcuts:\n"
  printf "  - [C-l] -> Clear the terminal screen\n"
  printf "  - [C-s] -> forward history search\n"
  printf "  - [gg]  -> On command mode, go to the beggining of history\n"
  printf "  - [G]   -> On command mode, go to the end of history\n"
}

bind '"\C-h":"help_dotfiles\n"'
