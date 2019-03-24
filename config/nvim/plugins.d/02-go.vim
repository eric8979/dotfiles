Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if !exists("autocommand_gobuild")
	let autocommand_gobuild = 1
	autocmd BufWritePre *.go :GoBuild
endif

" Don't show mode in status bar so that vim-go can show function signatures
set noshowmode

