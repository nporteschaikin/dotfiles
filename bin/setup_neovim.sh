#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

ensure_config_dirs_exist() {
  mkdir -p $HOME/.config/nvim/lua
}

link_neovim_lua() {
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
  sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_plugins() {
  nvim +PlugInstall +qall >/dev/null
}

install_solarized() {
  sh -c 'curl -sfLo $HOME/.config/nvim/colors/solarized.vim --create-dirs \
    https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim'
}

step "🔌 Setting up neovim..."
ensure_config_dirs_exist
link_neovim_lua
install_vim_plug
install_plugins
install_solarized
success "🔌 We're set up!"
