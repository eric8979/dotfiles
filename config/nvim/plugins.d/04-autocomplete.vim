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
