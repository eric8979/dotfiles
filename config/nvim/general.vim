let mapleader=" "
syntax on

" Theme
colorscheme spiderhawk
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

" Allow modifications to hidden buffers (for refactor->rename)
set hidden

" Disable mouse
set mouse=""

" Close nerdtree when opening file
let NERDTreeQuitOnOpen = 1

" Remember undo chain
set undofile
set undodir=~/.vimundo/

" Make backspace work like most other apps
set backspace=2 

" Don't show mode in status bar so that vim-go can show function signatures
set noshowmode

set autoindent
set shiftwidth=4
set tabstop=4
" set noshowmatch
set ignorecase
set hlsearch
set smartcase
set laststatus=2

" More natural splitting
set splitbelow
set splitright

" Add line numbers (relative)
:set number
:set relativenumber

" Highlight results as you search
set incsearch

