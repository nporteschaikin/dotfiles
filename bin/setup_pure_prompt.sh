#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "📺 Setting up pure prompt..."
if [ ! -d "$HOME/.zsh/pure" ]; then
  run "mkdir -p $HOME/.zsh/pure"
  run "git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure"
fi
success "📺 Done!"
