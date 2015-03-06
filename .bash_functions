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
bind '"\C-q":"ls -ltrach\n"'
bind '"\C-t":"pretty-path\n"'

# Script to get all the PPA installed on a system
function ppa-print
{
  echo -e "\nPPA from launchpad"
  echo "------------------"
  for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
    HOST=`echo $ENTRY | cut -d/ -f3`
    USER=`echo $ENTRY | cut -d/ -f4`
    PPA=`echo $ENTRY | cut -d/ -f5`
    #echo sudo apt-add-repository ppa:$USER/$PPA
    if [ "ppa.launchpad.net" = "$HOST" ]; then
      echo ppa:$USER/$PPA
    fi
  done
done

echo -e "\nOthers"
echo "------------------"
for APT in `find /etc/apt/ -name \*.list`; do
  grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
  if [ "ppa.launchpad.net" != "$HOST" ]; then
    echo $ENTRY
  fi
done
done
}
