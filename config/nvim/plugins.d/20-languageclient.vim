Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"   set cacheDirectory to /var/cquery may cause permission problem on linux
"   set it to /tmp/cquery/ can fix it
let g:LanguageClient_serverCommands = {
			\ 'go': ['gopls'],
			\ 'cpp': ['~/Software/cquery/build/cquery', 
			\   '--log-file=/tmp/cq.log', 
			\   '--init={"cacheDirectory":"/tmp/cquery/"}'
			\ ],
			\ 'c': ['~/Software/cquery/build/cquery', 
			\   '--log-file=/tmp/cq.log', 
			\   '--init={"cacheDirectory":"/tmp/cquery/"}'
			\ ],
			\ 'typescript': ['javascript-typescript-stdio'],
			\ 'javascript': ['javascript-typescript-stdio'],
			\ }

" Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = '/home/yourusername/.config/nvim/settings.json'

" Allow modifications to hidden buffers (for refactor->rename)
set hidden

" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" Keybinds 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

