#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

link_neovim_lua() {
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

install_vim_plug() {
  run "curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}

install_plugins() {
  run "nvim +PlugInstall +qall"
}

install_solarized() {
  run "curl -sfLo $HOME/.config/nvim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim"
}

step "🔌 Setting up neovim..."
link_neovim_lua
install_vim_plug
install_plugins
install_solarized
success "🔌 We're set up!"
