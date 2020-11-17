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
inoremap <C-c> <Esc>

" Quit buffer
nnoremap gq :q<CR>

" Open vimrc
nnoremap <leader>ee :call EditVimrc()<CR>

" Open snippet file
nnoremap <leader>es :CocCommand snippets.editSnippets<CR>


" Yank into clipboard
noremap gy "+y

