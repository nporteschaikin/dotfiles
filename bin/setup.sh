#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

if [[ $(command -v brew) == "" ]]; then
  step "🍺 Installing Homebrew..."
  run "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  success "🍺 Installed Homebrew!"
else
  step "🍺 Updating Homebrew..."
  run "brew update"
  success "🍺 Updated Homebrew!"
fi

sh -c $DOTFILES_DIR/bin/bundle_brewfile.sh
sh -c $DOTFILES_DIR/bin/install_npm_dependencies.sh
sh -c $DOTFILES_DIR/bin/create_env_files.sh
sh -c $DOTFILES_DIR/bin/link_dotfiles.sh
sh -c $DOTFILES_DIR/bin/setup_iterm.sh
sh -c $DOTFILES_DIR/bin/setup_neovim.sh

step "🐚 Changing shell to ZSH..."
run "chsh -s /bin/zsh"
success "🐚 Shell out, you're set!"
