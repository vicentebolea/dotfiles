## vim: ft=sh :

function help_dotfiles
{
echo \
"
Prompt cheatsheet:
=================
  - [${green}+${reset}]: Uncomitted changes
  - [${green}!${reset}]: Unstaged changes
  - [${green}\$${reset}]: check for stashed files

Readline shortcuts:
===================
  - [${orange}C-q${reset}] -> Quick call to ls command
  - [${orange}C-t${reset}] -> Show the PATH env variable in a pretty form
  - [${orange}C-l${reset}] -> Clear the terminal screen
  - [${orange}C-s${reset}] -> forward history search
  - [${orange}gg${reset}]  -> On command mode, go to the beggining of history
  - [${orange}G${reset}]   -> On command mode, go to the end of history
"
}

function pretty-path {
  echo -e ${PATH//:/\\n}
}

bind '"\C-h":"help_dotfiles\n"'
bind '"\C-q":"ls \n"'
bind '"\C-t":"pretty-path\n"'
