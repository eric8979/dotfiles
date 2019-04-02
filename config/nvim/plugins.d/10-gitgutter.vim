Plug 'airblade/vim-gitgutter'

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-^'
let g:gitgutter_sign_modified_removed = '-~'

" Refresh GitGutter after save
:autocmd BufWritePost * :GitGutter

" Keybinds
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

