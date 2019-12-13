local error() {
  printf "\e[0;31m$1\e[0m\n"
}

local warn() {
  printf "\e[0;33m$1\e[0m\n"
}

g() {
  if [ $# -gt 0 ]; then
    git $@
  else
    git status
  fi
}

code() {
  cd $CODE_DIR/$1
}

ghc() {
  p=$CODE_DIR/$1
  if [ ! -d $p ]; then
    git clone git@github.com:$1 $p
  fi
  code $1
}

npc() {
  ghc nporteschaikin/$1
}

work() {
  if [ "$1" = "t" ]; then
    ghc codeclimate-testing/$2
  else
    ghc codeclimate/$1
  fi
}
