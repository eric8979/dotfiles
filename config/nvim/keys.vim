" Saving
noremap gs :w<CR>

" Searching
nnoremap <leader>a :Ag<space>
nnoremap <silent> <leader>c :copen<CR>

" Remove search higligting
noremap gn :noh<CR>

" Navigate wrapped lines
nnoremap j gj
nnoremap k gk

" Exit insert mode
inoremap kj <Esc>
inoremap jk <Esc>
inoremap <C-c> <Esc>

" Quit buffer
nnoremap gq :q<CR>

" Open vimrc
nnoremap <leader>e :call EditVimrc()<CR>

" Yank into clipboard
noremap gy "+y

