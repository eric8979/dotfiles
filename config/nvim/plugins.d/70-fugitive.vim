" Git tools
"
Plug 'tpope/vim-fugitive' 

noremap <leader>s :Gstatus<CR>
noremap <leader>S :Gcommit<CR>
noremap <leader>p :Gstatus<CR>:Gpush<CR>

" q to quit all fugitive buffers
autocmd BufNewFile,BufRead fugitive://* nnoremap <silent> q :q<CR>

