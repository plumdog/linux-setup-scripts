#!/bin/bash

# install some packages
sudo pacman -Syu \
    xmonad \
    xmonad-contrib \
    zsh \
    emacs \
    feh \
    dmenu \
    slock \
    keepassx \
    keepass \
    xmobar \
    wmctrl \
    wget \
    openssh

wget https://raw.githubusercontent.com/plumdog/linux-setup-scripts/master/arch/aur.sh -O ~/aur.sh
chmod a+x ~/aur.sh

~/aur.sh \
    vcsh \
    google-chrome \
    dropbox \
    silver-searcher-git

sudo ln -s /usr/bin/google-chrome-stable /usr/bin/google-chrome

# ... openssh-server? ag?

# sudo systemctl enable dhcpcd
# sudo systemctl enable dropbox@$USER

# change to use zshell
sudo chsh -s /usr/bin/zsh $USER

# install my dotfiles with vcsh so things feel homely
vcsh clone https://github.com/plumdog/dotemacs emacs
vcsh clone https://github.com/plumdog/dotzshrc zshrc
vcsh clone https://github.com/plumdog/dotgit git
vcsh clone https://github.com/plumdog/dotxmonad xmonad
vcsh clone https://github.com/plumdog/dotxinitrc xinitrc

# recompile xmonad setup with new dotfiles
xmonad --recompile
