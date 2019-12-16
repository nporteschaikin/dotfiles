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

# step "🍺 Installing Homebrew..."
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# success "🍺 Installed Homebrew!"
#
# step "🍺 Brewing some dependencies..."
# brew bundle
# success "🍺 All brewed!"
#
# step "🔌 Installing Vim plugins..."
# vim +PlugInstall +qall > /dev/null
# success "🔌 We're plugged in!"

step "🔗 Linking dotfiles..."
link_dotfiles
success "🔗 Linked!"
#
# step "🐚 Changing shell to ZSH..."
# chsh -s /bin/zsh
# success "🐚 Shell out, you're set!"
