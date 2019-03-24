" Theme
highlight LineNr ctermfg=grey
highlight Search ctermfg=black ctermbg=grey cterm=none
" Change the status bar and vert split color
hi VertSplit ctermbg=8 ctermfg=8
hi StatusLine ctermbg=white ctermfg=8
hi StatusLineNC ctermbg=blue ctermfg=8
" Change popup menu color
:highlight Pmenu ctermbg=238 ctermfg=67 gui=bold
" Remove color from matching parenthesis
hi MatchParen cterm=underline ctermbg=none ctermfg=none

" GitGutter color (placed here because of clashes in order of applied colors)
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2 
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3 
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1 

