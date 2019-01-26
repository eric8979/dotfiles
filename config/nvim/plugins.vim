" load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'davidhalter/jedi-vim'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
if !exists("autocommand_gobuild")
	let autocommand_gobuild = 1
	autocmd BufWritePre *.go :GoBuild
endif

" Autocompletion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" This makes deoplete work with vim-go etc
	Plug 'zchee/deoplete-go', { 'do': 'make'}
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	" This makes deoplete work with vim-go etc
	Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#enable_at_startup = 1

if !exists("autocommand_insertleave")
	let autocommand_insertleave = 1
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

call plug#end()
