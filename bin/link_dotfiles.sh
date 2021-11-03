#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "🔗 Linking dotfiles..."
run "touch $DOTFILES_DIR/zsh/env.zsh"

files=$(find . -type f -maxdepth 2 -name ".*" -o -name "*.zsh" -o -name "*.vim" | sed "s|^\./||")

for file in ${files[@]}; do
  src="$(pwd)/$file"
  target="$HOME/$(printf "%s" "$file" | sed "s/.*\/\(.*\)/\1/g")"

  create_symlink $src $target
done

success "🔗 Linked!"
