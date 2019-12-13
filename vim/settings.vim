syntax on                           " turn on syntax highlighting
filetype plugin indent on           " load file type plugins, indentation
silent! colorscheme solarized       " use solarized color scheme

set background=dark                 " dark?
set hidden                          " allow buffers to be hidden
set history=1024                    " history can eat up memory
set number                          " show line numbers
set ruler                           " show column numbers
set list                            " show invisible characters
set listchars=tab:»·,trail:·        " show tabs and trailing whitespace only
set nowrap                          " turn off line wrap
set tabstop=2 shiftwidth=2          " tab = two columns
set expandtab                       " spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode
set autoindent                      " Indent lists
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " case insensitive...
set smartcase                       " ...unless there's a capital letter
set autoread                        " auto-refresh files changed outside of vim
set showcmd                         " display incomplete commands
set scrolloff=3                     " show three lines around cursor
set splitright                      " open new vertical buffers on the right...
set splitbelow                      " ...and below
set ttimeoutlen=100                 " set a timeout?
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set ttyfast                         " redraw quickly
set ttyscroll=3                     " scroll less lines at a time
set lazyredraw                      " redraw lazily
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set clipboard=unnamed               " use system clipboard
set cursorcolumn

let g:airline_powerline_fonts = 0   " don't use powerline fonts
let g:ctrlp_show_hidden = 1         " show hidden files in Ctrl-P
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let NERDTreeShowHidden = 1          " show hidden files in NERDtree
let g:prettier#autoformat = 0       " auto-format compatible code
autocmd BufWritePre *.ts,*.tsx,*.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
