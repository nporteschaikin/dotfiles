#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "🍺 Brewing some dependencies..."
run "brew bundle --file $DOTFILES_DIR/Brewfile --quiet"
success "🍺 All brewed!"
