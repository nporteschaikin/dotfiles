setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

autoload -U compinit && compinit

compdef g=git
compdef "_path_files -/ -W $CODE_DIR" code
compdef "_path_files -/ -W $CODE_DIR/nporteschaikin" npc
compdef "_path_files -/ -W $CODE_DIR/codeclimate" work
