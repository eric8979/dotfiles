Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-snippets']

" Keybinds
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>j <Plug>(coc-implementation)
nmap <silent> <F2> <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

