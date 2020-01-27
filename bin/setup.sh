#!/bin/bash
set -e

step() {
  printf "$1\n"
}

success() {
  printf "\e[0;32m$1\e[0m\n\n"
}

error() {
  printf "\e[0;31m$1\e[0m\n"
}

warn() {
  printf "\e[0;33m$1\e[0m\n"
}

link_dotfiles() {
  files=$(find . -type f -maxdepth 2 -name ".*" -o -name "*.zsh" -o -name "*.vim" | sed "s|^\./||")

  for file in ${files[@]}; do
    src="$(pwd)/$file"
    target="$HOME/$(printf "%s" "$file" | sed "s/.*\/\(.*\)/\1/g")"

    if [ -e "$target" ]; then
      if [ "$(readlink "$target")" = "$src" ]; then
        warn "$src is already linked to $target!"
      else
        error "$src could not be linked to $target: target exists!"
      fi
    else
      ln -fs $src $target
      success "$src → $target"
    fi
  done
}

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

step "🍺 Brewing some dependencies..."
brew bundle
success "🍺 All brewed!"

step "🔌 Installing Vim plugins..."
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall >/dev/null
success "🔌 We're plugged in!"

if [[ ! -f zsh/env.zsh ]]; then
  cp zsh/env.zsh.example zsh/env.zsh
  chmod +x zsh/env.zsh
  success "☀️ Created zsh/env.zsh."
fi

step "🔗 Linking dotfiles..."
link_dotfiles
success "🔗 Linked!"

step "🐚 Changing shell to ZSH..."
chsh -s /bin/zsh
success "🐚 Shell out, you're set!"
