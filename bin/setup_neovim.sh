#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

create_env_config() {
  if [ ! -e "$DOTFILES_DIR/neovim/lua/env.lua" ]; then
    run "echo \"-- Add env-specific Nvim configuration here.\" > $DOTFILES_DIR/neovim/lua/env.lua"
  fi
}

link_configs() {
  run "mkdir -p $HOME/.config/nvim/lua"
  pushd $DOTFILES_DIR/neovim >/dev/null
  files=$(find . -type f -maxdepth 2 -name "*.lua" | sed "s|^\./||")
  popd >/dev/null

  for file in ${files[@]}; do
    src="$DOTFILES_DIR/neovim/$file"
    target="$HOME/.config/nvim/$file"

    create_symlink $src $target
  done
}

install_solarized() {
  run "curl -sfLo $HOME/.config/nvim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim"
}

install_vim_plug() {
  run "curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}

install_plugins() {
  run "nvim +PlugInstall +qall &>/dev/null"
}

step "🔌 Setting up neovim..."
create_env_config
link_configs
install_solarized
install_vim_plug
install_plugins
success "🔌 We're set up!"
