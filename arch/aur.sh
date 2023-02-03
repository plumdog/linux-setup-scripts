#!/bin/bash -ex
package="$1"
d=~/aurbuild
mkdir -p "$d"
(
  cd "$d"
  curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$package.tar.gz" | tar xz
  cd "$package"
  makepkg -si --noconfirm
)
