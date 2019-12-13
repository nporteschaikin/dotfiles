autoload -U colors && colors

bindkey -v

setopt auto_cd
setopt auto_pushd
setopt correct
setopt multios
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushdminus

export EDITOR="vim"
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export CODE_DIR="$HOME/Code"

source ~/aliases.zsh
source ~/bindings.zsh
source ~/completion.zsh
source ~/functions.zsh
source ~/gpg.zsh
source ~/history.zsh
source ~/prompt.zsh
source ~/rbenv.zsh
source ~/tmux.zsh
source ~/go.zsh
