" Vim color file
" Maintainer: Art Cowles
" Last Change: 2008-07-17

set background=dark
hi clear
if exists ("syntax_on")
  syntax reset
endif
let g:colors_name="peacock"

" General colors
highlight Normal	guifg=#ffffff	guibg=#000000	gui=none
highlight FoldColumn	guifg=#ffffff	guibg=#333333	gui=none
highlight Folded	guifg=#ffffff	guibg=#333333	gui=italic
highlight CursorLine	guifg=NONE	guibg=NONE	gui=underline,bold
highlight CursorColumn	guifg=NONE	guibg=#666666	gui=NONE

" Syntax highlighting
highlight Comment	guifg=PaleGreen3	gui=italic

