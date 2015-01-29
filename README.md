# Vicente's dotfiles [![Build Status](https://travis-ci.org/vicentebolea/dotfiles.svg?branch=master)](https://travis-ci.org/vicentebolea/dotfiles)

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vicentebolea/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Overview

![Alt Text](https://raw.github.com/vicentebolea/dotfiles/master/screenshot.gif "ScreenShot")
My personal configuration for the Linux terminal with 256 colors.

###Features:
 - It was designed having in mind being forked so that you can freely modify it.
 - As well if you are not going to modify you can just download it.
 - BASH configuration with a cool prompt and a separated file structure to ease distributing your configuratiom accross different machines.
 - VIM configuration and selection of Plugins focussed in C/C++ development.
 - GDB configuration which support C++ standard library data strutures and more fancy things.
 - SCREEN & TMUX configuration to make it more fancy and to support 256 colors with vim.
 - GIT configuration with several shortcuts, extra tools and many colors.
 - Few extras such as fonts and dircolors.
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

The only configuration needed for vicente's dotfiles should be inside of a file 
called .bash_independent in your home directory. That file will be called from 
bashrc and will override any other configuration made by default.

The file should contain these lines, but change my name and email for yours:

    GIT_AUTHOR_NAME="Vicente Adolfo Bolea Sanchez"
    GIT_AUTHOR_EMAIL="vicenolea@gmail.com"

###How to update it
It will destroy any change in those files, but not in .bash_independent. Go to dotfiles directory

    $ cd ~/.dotfiles
    $ git fetch --all
    $ git reset --hard origin/master

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
