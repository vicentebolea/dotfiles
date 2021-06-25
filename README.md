# Vicente's dotfiles [![CI](https://github.com/vicentebolea/dotfiles/workflows/CI/badge.svg)](https://github.com/vicentebolea/dotfiles/actions?query=workflow%3ACI) [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vicentebolea/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) <a href='https://ko-fi.com/A0A5XV77' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi2.png?v=2' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

![Alt Text](https://raw.github.com/vicentebolea/dotfiles/master/.res/screenshot.gif "My personal configuration for the Linux terminal with 256 colors")

## TL;DR
__ONE LINER__ install with this single command:

```sh
git clone --recursive https://github.com/vicentebolea/dotfiles.git .dotfiles \
    && cd .dotfiles && DFM_REPO=$(pwd) .res/dfm install
```

### Features:
 - Only depends on GIT
 - It was designed having in mind being forked so that you can freely modify it.
 - As well if you are not going to modify you can just download it.
 - BASH configuration with a cool prompt and a separated file structure to ease distributing your configuratiom accross different machines.
 - VIM configuration and selection of Plugins focussed in C/C++ development.
 - GDB configuration which support C++ standard library data strutures and more fancy things.
 - SCREEN & TMUX configuration to make it more fancy and to support 256 colors with vim.
 - GIT configuration with several shortcuts, extra tools and many colors.
 - Few extras such as fonts and dircolors.
 - More..

## Install it
    
```sh
# First, make sure you have git installed, if not run the next command if you are in ubuntu:
$ sudo apt-get install git

# Then, clone the repository and install the dotfiles:
$ git clone --recursive https://github.com/vicentebolea/dotfiles.git .dotfiles && cd .dotfiles && ./.res/dfm install && vim -c 'PluginUpdate'
```

### Personal customization

__The only configuration needed for vicente's dotfiles__ should be inside of a file 
called `.bash_local` in your home directory. 

The file should contain these lines, but change my name and email for yours:

```sh
GIT_AUTHOR_NAME="Vicente Adolfo Bolea Sanchez"
GIT_AUTHOR_EMAIL="vicenolea@gmail.com"

# Also, in order to enable C++ autocomplete features you must install libclang-dev,
# in ubuntu it would be:
  
$ sudo apt-get install libclang-dev

# After that you must indicate the location of the library in the .bash_independent file
export CLANG_COMPLETE_LIB="/usr/lib/path_to_libclang.so..."
```

For more info about autocomplete in my configuration join the [conversation][conv].

### How to update it
```sh
#It will destroy any change in those files, but not in .bash_independent. Go to dotfiles directory
$ cd ~/.dotfiles && git fetch --all && git reset --hard origin/master

# This will not delete the .bash_independent file.
```
## If you enjoy this, please get me a coffee

<a href='https://ko-fi.com/A0A5XV77' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi2.png?v=2' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## Authors
 - [Vicente Adolfo Bolea Sanchez][vicente].

## Thanks to
 - [DFM][dfm]:                    a.k.a Dot Files Manager, made possible having the dotfiles in a separated directory.
 - [mathiasbynens/dotfiles][mat]: Some of the ideas are taking from this repository.

<!-- Links -->
[dfm]:     https://github.com/justone/dfm
[mat]:     https://github.com/mathiasbynens/dotfiles
[vicente]: https://github.com/vicentebolea
[dicl]:    http://dicl.unist.ac.kr
[conv]:    https://github.com/vicentebolea/dotfiles/issues/3
