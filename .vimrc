" --------------------------------------------------------------------------------
" .vimrc
" Brenton Morris
" --------------------------------------------------------------------------------

" vundle stuff
" --------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'bling/vim-airline'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Bundle 'Shougo/neocomplcache'
Plugin 'digitaltoad/vim-jade'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
" don't map keys for dwm
let g:dwm_map_keys = 0
" Plugin 'spolu/dwm.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" --------------------------------------------------------------------------------

" General settings (indenting etc)
" --------------------------------------------------------------------------------
let mapleader=","
syntax on

" Mail app bundle location
let MailApp_bundle = '~/.vim/bundle/MailApp/MailApp.bundle/'

" Close nerdtree when opening file
let NERDTreeQuitOnOpen = 1

" enable powerline
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" remember undo chain
set undofile
set undodir=~/.vimundo/

set backspace=2 " make backspace work like most other apps

set autoindent
set shiftwidth=4
set tabstop=4
set showmatch
set ignorecase
set hlsearch
set smartcase
set laststatus=2

" more natural splitting
set splitbelow
set splitright

" Remove search higligting
noremap gn :noh<CR>

" Add line numbers (relative)
:set number
:set relativenumber

" Highlight results as you search
set incsearch

" put useful info in status bar
silent! call fugitive#statusline()
if exists("*fugitive#statusline")
	set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
endif
" --------------------------------------------------------------------------------

" Colors
" --------------------------------------------------------------------------------
" theme
color spiderhawk

" improve tab bar color
:hi TabLineFill ctermfg=8 ctermbg=8

" improve popup menu color
:highlight Pmenu ctermbg=238 ctermfg=67 gui=bold

" line number colors
:highlight LineNr ctermfg=grey

" Change seach term highlight color
highlight Search ctermfg=black ctermbg=grey cterm=none

" Change the status bar and vert split color
hi VertSplit ctermbg=8 ctermfg=8
hi StatusLine ctermbg=white ctermfg=8
hi StatusLineNC ctermbg=blue ctermfg=8

" remove color from matching parenthesis
hi MatchParen cterm=underline ctermbg=none ctermfg=none
" --------------------------------------------------------------------------------

" Omnicomplete and supertab options
" --------------------------------------------------------------------------------
" This makes the enter key get insert the current selection
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>""

" Less invasive, enter key just inserts a newline and closes the suggestion popup
inoremap <expr> <CR> pumvisible() ? "\<C-g>u\<CR>" : "\<C-g>u\<CR>""
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview " Disable the omnicomplete windows

" Enable neocompletecache on startup and set some options
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Supertab options
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" --------------------------------------------------------------------------------

" autocmd listeners
" --------------------------------------------------------------------------------
" Remove trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

" change current line color when in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertEnter * hi CursorLine cterm=NONE ctermbg=236 ctermfg=none guibg=black guifg=NONE
autocmd InsertLeave * set nocursorline

" Close the autocompeltion preview window after you are finished with it
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set tab size for javascript, html and json
autocmd FileType html setlocal sw=2 sts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd FileType json setlocal sw=2 sts=2 et
" --------------------------------------------------------------------------------

" filetype specific settings
" --------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.txt 	set ft=text
autocmd BufRead,BufNewFile *.md 	set ft=markdown

autocmd FileType text,markdown set wrap linebreak nolist textwidth=0 wrapmargin=0
" --------------------------------------------------------------------------------

" keybindings
" --------------------------------------------------------------------------------
" no arrowkeys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" toggle ctags tagbar
nnoremap gt :TagbarToggle<CR>

" resize windows
nnoremap <C-w>+ :res +10<CR>
nnoremap <C-w>- :res -10<CR>
nnoremap <C-w>> :vertical resize +10<CR>
nnoremap <C-w>< :vertical resize -10<CR>

" tab navigation
nnoremap <leader>t :tabn<CR>
nnoremap <leader>T :tabp<CR>
nnoremap <C-t> :tabnew<CR>

" moving up and down but keeping centered
nnoremap J jzz
nnoremap K kzz

" center screen when searching for next match
nnoremap n nzz
nnoremap N Nzz

" center screen when jumping to last position
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Exit visual mode
" vnoremap kj <Esc> " lags out visual mode too much
" vnoremap jk <Esc> " lags out visual mode too much
vnoremap <C-c> <Esc>

" Exit insert mode
inoremap kj <Esc>
inoremap jk <Esc>
inoremap <C-c> <Esc>

" Switching between buffers
noremap gh <C-w>h
noremap gj <C-w>j
noremap gk <C-w>k
noremap gl <C-w>l

" Autocomplete buffer name with tab
" set wildchar=<Tab> wildmenu wildmode=full

" rotate windows
" nmap gr <C-w>r

" save current buffer
nmap gs :w<CR>

" quit buffer
" nnoremap gq :q<CR>

" paste mode
nmap gp :set paste<CR>
nmap gP :set nopaste<CR>

" comment around current paragraph
nmap ga gcap

" open nerd tree
map ge :NERDTreeToggle<CR>
" map ge <C-w>:e.<CR>

" go to matching parenthesis
" noremap gm %

" open last buffer
noremap gb :b#<CR>

" start jump to buffer command
noremap go :b<space>

" open vimrc
nnoremap <leader>e :call EditVimrc()<CR>

" source vimrc
nnoremap <leader>s :so $MYVIMRC<CR>

" yank into clipboard
noremap gy "+y

" Enter hex mode
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" Toggle colorscheme
nnoremap <C-\> :Togglecolors<CR>

" dwm keybindings
" nnoremap gr :call DWM_Rotate(0)<CR>
" nnoremap gR :call DWM_Rotate(1)<CR>
" nnoremap <C-W> :call DWM_New()<CR>
nnoremap gv <C-w>v
nnoremap g- <C-w>s
" nnoremap gq :q<CR>:call DWM_Focus()<CR>
nnoremap gq :q<CR>
" nnoremap gm :call DWM_Focus()<CR>
" nnoremap <C-d> :call DWM_GrowMaster()<CR>
" nnoremap <C-a> :call DWM_ShrinkMaster()<CR>
" --------------------------------------------------------------------------------

" Utility functions
" --------------------------------------------------------------------------------
" command to open vimrc
function! EditVimrc()
	if bufname('%') == '' &&  line('$') == 1 && getline(1) == ''
		" buffer is empty and is unnamed, open in current window
		:e $MYVIMRC
	else
		" check window dimensions
		let l:height = winheight(0) * 2
		let l:width = winwidth(0)
		if (l:height > l:width)
			:split $MYVIMRC
		else
			:vsplit $MYVIMRC
		endif
	endif
endfunction

function! PrintColors()
	:vnew<CR>
	let num = 255
	while num >= 0
		exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
		exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
		call append(0, 'ctermbg='.num.':....')
		let num = num - 1
	endwhile
endfunction

" add command for toggling colorschemes
command! -bar Togglecolors call ToggleColors()
" helper function to toggle colors
function! ToggleColors ()
	autocmd InsertEnter * hi CursorLine cterm=NONE ctermbg=white ctermfg=none guibg=white guifg=none
	hi VertSplit ctermbg=none ctermfg=none
endfunction

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()
" helper function to toggle hex mode
function! ToggleHex()
	" hex mode should be considered a read-only operation
	" save values for modified and read-only for restoration later,
	" and clear the read-only flag for now
	let l:modified=&mod
	let l:oldreadonly=&readonly
	let &readonly=0
	let l:oldmodifiable=&modifiable
	let &modifiable=1
	if !exists("b:editHex") || !b:editHex
		" save old options
		let b:oldft=&ft
		let b:oldbin=&bin
		" set new options
		setlocal binary " make sure it overrides any textwidth, etc.
		silent :e " this will reload the file without trickeries
		"(DOS line endings will be shown entirely )
		let &ft="xxd"
		" set status
		let b:editHex=1
		" switch to hex editor
		%!xxd
	else
		" restore old options
		let &ft=b:oldft
		if !b:oldbin
			setlocal nobinary
		endif
		" set status
		let b:editHex=0
		" return to normal editing
		%!xxd -r
	endif
	" restore values for modified and read only state
	let &mod=l:modified
	let &readonly=l:oldreadonly
	let &modifiable=l:oldmodifiable
endfunction
" --------------------------------------------------------------------------------
