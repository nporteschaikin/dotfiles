#!/bin/bash

DOTFILES_DIR="$(realpath $(dirname $0)/../)"

step() {
  printf "$1\n"
}

success() {
  printf "\e[0;32m$1\e[0m\n\n"
}

error() {
  printf "\e[0;31m$1\e[0m\n"
}

warn() {
  printf "\e[0;33m$1\e[0m\n"
}

create_symlink() {
  src=$1
  target=$2

  if [ -e "$target" ]; then
    if [ "$(readlink "$target")" = "$src" ]; then
      warn "$src is already linked to $target!"
    else
      error "$src could not be linked to $target: target exists!"
    fi
  else
    ln -fs $src $target
    success "$src → $target"
  fi
}
