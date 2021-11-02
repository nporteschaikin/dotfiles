#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

create() {
  touch $1
  success "☀️ Created $1"
}

create $DOTFILES_DIR/zsh/.env.zsh
create $DOTFILES_DIR/neovim/lua/.env.lua