set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'   " solarized theme
Plugin 'vim-airline/vim-airline'            " a popular status bar
Plugin 'kien/ctrlp.vim'                     " fuzzy file finder
Plugin 'scrooloose/nerdtree'                " tree explorer
Plugin 'scrooloose/nerdcommenter'           " easy commenting of code
Plugin 'rking/ag.vim'                       " ack in vim
Plugin 'tpope/vim-fugitive'                 " git wrapper
Plugin 'DataWraith/auto_mkdir'              " create files in directories which do not exist
Plugin 'slim-template/vim-slim.git'         " slim syntax highlighting
Plugin 'leafgarland/typescript-vim'         " TypeScript syntax highlighting
Plugin 'peitalin/vim-jsx-typescript'        " .tsx (TypeScript + JSX) syntax highlighting
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'junegunn/vim-easy-align'

call vundle#end()
