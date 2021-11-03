autoload -U colors && colors
autoload -U promptinit; promptinit

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
source ~/rbenv.zsh
source ~/go.zsh
source ~/env.zsh

eval "$(nodenv init -)"

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
