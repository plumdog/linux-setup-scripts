#!/bin/bash

# switch to debian testing
sudo sed -i -e 's/ \(stable\|wheezy\)/ testing/ig' /etc/apt/sources.list

# system update
sudo apt-get update
sudo apt-get upgrade

# install some packages
sudo apt-get install xmonad zsh emacs vcsh feh gmrun slock keepassx xmobar


# change to use zshell
sudo chsh -s /usr/bin/zsh andrew

# install my dotfiles with vcsh so things feel homely
vcsh clone https://github.com/plumdog/dotemacs emacs
vcsh clone https://github.com/plumdog/dotzshrc zshrc
vcsh clone https://github.com/plumdog/dotgit git
vcsh clone https://github.com/plumdog/dotxmonad xmonad
vcsh clone https://github.com/plumdog/dotxinitrc xinitrc

# recompile xmonad setup with new dotfiles
xmonad --recompile
