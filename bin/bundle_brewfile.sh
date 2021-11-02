#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "🍺 Brewing some dependencies..."
brew bundle --file $DOTFILES_DIR/Brewfile
success "🍺 All brewed!"
