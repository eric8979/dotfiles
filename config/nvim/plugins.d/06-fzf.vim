Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Keybinds
noremap <silent> <C-p> :FZF -m<CR>
noremap <silent> <leader>b :Buffers<CR>
noremap <silent> <leader>h :History<CR>

