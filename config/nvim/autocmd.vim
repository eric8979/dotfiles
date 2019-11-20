" Set tab size for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.toml set filetype=config
autocmd BufNewFile,BufRead *.yml.j2 set filetype=yaml
autocmd BufNewFile,BufRead *.md,*.txt set linebreak

" q to quit all fugitive buffers
autocmd BufNewFile,BufRead fugitive://* nnoremap <silent> q :q<CR>

