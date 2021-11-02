#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

create() {
  run "touch $1"
}

create $DOTFILES_DIR/zsh/.env.zsh
create $DOTFILES_DIR/neovim/lua/.env.lua
