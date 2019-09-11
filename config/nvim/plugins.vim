" load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

" Plugins that don't need extra config
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'diepm/vim-rest-console'

" Plugins that are neater in their own file
for f in split(glob('~/.config/nvim/plugins.d/*.vim'), '\n')
    exe 'source' f
endfor

call plug#end()

" Evaluate post load plugin code (calling plugin functions etc)
for f in split(glob('~/.config/nvim/plugins.post.d/*.vim'), '\n')
    exe 'source' f
endfor

