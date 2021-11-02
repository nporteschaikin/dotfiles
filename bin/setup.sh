#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

if [[ $(command -v brew) == "" ]]; then
  step "🍺 Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    < /dev/null
  success "🍺 Installed Homebrew!"
else
  step "🍺 Updating Homebrew..."
  brew update
  success "🍺 Updated Homebrew!"
fi

sh -c $DOTFILES_DIR/bin/bundle_brewfile.sh
sh -c $DOTFILES_DIR/bin/create_env_files.sh
sh -c $DOTFILES_DIR/bin/link_dotfiles.sh
sh -c $DOTFILES_DIR/bin/setup_neovim.sh

step "💻 Installing pure prompt..."
npm install --global --silent pure-prompt &>/dev/null
success "💻 Hello world!"

step "🐚 Changing shell to ZSH..."
chsh -s /bin/zsh
success "🐚 Shell out, you're set!"
