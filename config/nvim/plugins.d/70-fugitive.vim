" Git tools
"
Plug 'tpope/vim-fugitive' 

noremap <leader>s :Gstatus<CR>
noremap <leader>S :Gcommit<CR>
noremap <leader>p :Gstatus<CR>:Gpush<CR>

" q to quit all fugitive buffers
autocmd BufNewFile,BufRead fugitive://* nnoremap <silent> q :q<CR>

nnoremap <leader>gd :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>:diffupdate<CR>
nnoremap gdl :diffget //3<CR>:diffupdate<CR>
