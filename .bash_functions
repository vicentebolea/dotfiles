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
  - [${orange}C-l${reset}] -> Clear the terminal screen
  - [${orange}C-s${reset}] -> forward history search
  - [${orange}gg${reset}]  -> On command mode, go to the beggining of history
  - [${orange}G${reset}]   -> On command mode, go to the end of history
"
}

bind '"\C-h":"help_dotfiles\n"'
bind '"\C-q":"ls -ltrach\n"'
