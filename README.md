# Vicente's dotfiles

## Overview

![Alt Text](https://raw.github.com/vicentebolea/dotfiles/master/screenshot.gif "ScreenShot")
My personal configuration for the Linux terminal with 256 colors.

###Features:
 - BASH configuration with a cool prompt and a separated file structure to ease distributing your configuratiom accross different machines.
 - VIM configuration and selection of Plugins focussed in C/C++ development.
 - GDB configuration which support C++ standard library data strutures and more fancy things.
 - SCREEN & TMUX configuration to make it more fancy and support 256 colors with vim.
 - GIT configuration with several shortcuts and colors.
 - More..

###Requirements:
Virtually every modern Linux system with GIT installed must be enought.

## Install it
First, make sure you have git installed, if not run the next command if you are in ubuntu:

    $ sudo apt-get install git

Then, clone the repository and install the dotfiles:

    $ git clone --recursive git@github.com:vicentebolea/dotfiles.git .dotfiles
    $ cd .dotfiles
    $ ./bin/dfm install

Launch the vim editor and then run the second command in the command mode:

    $ vim
    $ :PluginInstall

###Personal costumization

You can create a file called *.bash_independent* in your home directory which will be called in the last line of the .bashrc file.

###How to update it
Go to dotfiles directory

    $ cd ~/.dotfiles
    $ git pull --rebase

This will not delete the .bash_independent file.

## Authors
 - __AUTHOR:__ [Vicente Adolfo Bolea Sanchez] [vicente].

## Thanks to...
 - [DFM] [dfm]:                    a.k.a Dot Files Manager, made possible having the dotfiles in a separated directory.
 - [mathiasbynens/dotfiles] [mat]: Some of the ideas are taking from this repository.


<!-- Links -->
[dfm]:     https://github.com/justone/dfm
[mat]:     https://github.com/mathiasbynens/dotfiles
[vicente]: https://github.com/vicentebolea
[dicl]:    http://dicl.unist.ac.kr
