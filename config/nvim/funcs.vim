" Open vimrc
function! EditVimrc()
	if bufname('%') == '' &&  line('$') == 1 && getline(1) == ''
		" Buffer is empty and is unnamed, open in current window
		:e $MYVIMRC
	else
		" Check window dimensions
		let l:height = winheight(0) * 2
		let l:width = winwidth(0)
		if (l:height > l:width)
			:split $MYVIMRC
		else
			:vsplit $MYVIMRC
		endif
	endif
endfunction

