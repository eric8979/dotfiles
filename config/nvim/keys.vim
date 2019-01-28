" Saving
noremap gs :w<CR>

" Searching
nnoremap <leader>g :Ag<space>
nnoremap <silent> <leader>c :copen<CR>

" Fuzzy finder
noremap <silent> <C-p> :FZF -m<CR>
noremap <silent> <leader>b :Buffers<CR>
noremap <silent> <leader>h :History<CR>

" Remove search higligting
noremap gn :noh<CR>

" Navigation
map ge :NERDTreeToggle<CR>
noremap gb :b#<CR>

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

