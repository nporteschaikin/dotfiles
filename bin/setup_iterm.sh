#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "📺 Setting up iTerm..."
run "defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string \"$DOTFILES_DIR/iterm\""
run "defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true"
success "📺 Marvelous!"
