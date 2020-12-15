[ -z "$PS1" ] && return

shopt -s histappend                            # Add history from all the terminal opened
shopt -s checkwinsize                          # Keep checking terminal size
if [ $BASH_VERSINFO -ge 4 ]; then
  shopt -s globstar                            # ** enabled
  shopt -s autocd                              # Type the directory name and cd it
fi
set -o vi                                      # VI mode readline
stty -ixon                                     # Set forward searching

# File loading (Order matters) :ARCANE:
for file in `cat <&10`; do
  [ -f ~/.bash_${file} ] && . ~/.bash_${file}
done 10<<< "exports aliases prompt functions local"

# Git configuration
if [[ -z "$(git config --get user.name)" || -z "$(git config --get user.email)" ]]; then
  git config -f ~/.gitconfig.local user.name "$GIT_AUTHOR_NAME"
  git config -f ~/.gitconfig.local user.email "$GIT_AUTHOR_EMAIL"
fi
