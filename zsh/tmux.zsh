# autoload tmux on start, if it exists

#if command -v tmux>/dev/null; then
  #[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi
