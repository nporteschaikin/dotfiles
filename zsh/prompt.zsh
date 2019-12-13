prompt_dir() {
  echo "%1~%f "
}

prompt_git_branch() {
  if [ -d .git ]; then
    p="git:"
    ref=$(git symbolic-ref --quiet HEAD 2>/dev/null)
    if [ -z "$ref" ]; then
      p="$p$(git rev-parse --short HEAD 2>/dev/null)"
    else
      p="$p$(echo $ref | cut -d '/' -f3-)"
    fi

    echo "$p "
  fi
}

prompt_rbenv_version() {
  version=$(rbenv local 2>/dev/null)
  if [ ! -z "$version" ]; then
    echo "ruby:$version "
  fi
}

PROMPT="%F{white}\$(prompt_dir)%f%F{blue}\$(prompt_git_branch)\$(prompt_rbenv_version)%f"
