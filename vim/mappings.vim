let mapleader = "\<Space>"

" shortcut for toggling nerdtree
nnoremap <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" shortcut for toggling CtrlP
nnoremap <leader>f :CtrlP<cr>

" shortcut for searching for word under cursor w/ Ag
nnoremap ,a :Ag<CR>

" shortcut for splitting pane vertically
nnoremap <Leader>v :vs<cr>

" shortcut for displaying git status
nnoremap <Leader>g :Gstatus<CR>

" shortcuts for switching between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
