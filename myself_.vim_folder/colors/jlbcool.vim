" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "jlbcool"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

"highlight Visual     guifg=NONE         guibg=SeaGreen	gui=NONE
"#80a0ff

" GUI                      Green
highlight Normal	guifg=Grey80	guibg=Black
highlight Search	guifg=NONE	guibg=NONE	gui=reverse
highlight IncSearch	guifg=red	guibg=NONE	gui=bold
highlight ErrorMsg	gui=NONE	guifg=#FFFF00	guibg=#B22222
highlight Visual	guifg=NONE	guibg=NONE	gui=reverse
highlight Cursor	guifg=NONE	guibg=NONE	gui=reverse
highlight CursorIM	guifg=GREEN	guibg=NONE	gui=NONE
highlight lCursor	guifg=NONE	guibg=#00FF00	gui=NONE
highlight Special	guifg=Orange
highlight Comment	guifg=#666666
highlight StatusLine	guifg=Gray	guibg=DarkBlue	gui=NONE
highlight StatusLineNC	guifg=DarkGray	guibg=#101010   gui=NONE
highlight VertSplit	guifg=DarkGray	guibg=#101010   gui=NONE
highlight Statement	guifg=Yellow			gui=NONE
highlight FoldColumn	guifg=Green	guibg=Black	gui=NONE
highlight Folded	guifg=blue	guibg=Gray	gui=NONE
highlight NonText	guifg=Blue	guibg=#060606	gui=NONE
highlight MoreMsg	guifg=SeaGreen	guibg=Black	gui=NONE
highlight ModeMsg	guifg=Green			gui=NONE
highlight Question	guifg=Red	guibg=Black	gui=NONE
highlight LineNr	guifg=Red	guibg=Black	gui=NONE
highlight cursorline	guifg=NONE	guibg=NONE	gui=undercurl	guisp=red
highlight cursorcolumn	guifg=NONE	guibg=NONE	gui=undercurl   guisp=red
highlight Type						gui=NONE

" Console
highlight Normal	ctermfg=yellow	ctermbg=black
highlight Search	ctermfg=NONE	ctermbg=NONE	cterm=reverse
highlight Visual	ctermfg=NONE	ctermbg=NONE	cterm=reverse
highlight Cursor	ctermfg=NONE	ctermbg=NONE	cterm=reverse
highlight Special	ctermfg=cyan
highlight Comment	ctermfg=darkgray
highlight StatusLine    ctermfg=gray ctermbg=darkblue	cterm=NONE
highlight StatusLineNC	cterm=bold,reverse
highlight VertSplit	ctermfg=DarkGray	ctermbg=gray   cterm=NONE
highlight Statement	ctermfg=Yellow			cterm=NONE
highlight FoldColumn	ctermfg=Green	ctermbg=Black	cterm=NONE
highlight NonText	ctermfg=Blue	ctermbg=Darkgray	cterm=NONE
highlight MoreMsg	ctermfg=Green	ctermbg=Black	cterm=NONE
highlight ModeMsg	ctermfg=Green			cterm=NONE
highlight LineNr	ctermfg=Red	ctermbg=Black	cterm=NONE
highlight Question	ctermfg=Red	ctermbg=Black	cterm=NONE
highlight Type						cterm=NONE

highlight IncSearch	ctermfg=red	ctermbg=NONE	cterm=bold
highlight ErrorMsg	cterm=NONE	ctermfg=white	ctermbg=red
highlight CursorIM	ctermfg=NONE	ctermbg=NONE	cterm=reverse
highlight lCursor	ctermfg=NONE	ctermbg=Gray	cterm=NONE
highlight Folded	ctermfg=blue	ctermbg=yellow	cterm=NONE
highlight cursorline	ctermfg=NONE	ctermbg=NONE	cterm=undercurl	
highlight cursorcolumn	ctermfg=NONE	ctermbg=NONE	cterm=undercurl

"highlight Normal     ctermfg=LightGrey	ctermbg=Black
"highlight Search     ctermfg=NONE	ctermbg=NONE	cterm=reverse
"highlight Visual     ctermfg=NONE	ctermbg=DarkGray
"highlight Cursor     ctermfg=NONE 	ctermbg=NONE	cterm=reverse
"highlight Special    ctermfg=Brown
"highlight Comment    ctermfg=Blue
"highlight StatusLine ctermfg=Red 	ctermbg=DarkGray cterm=NONE
"highlight StatusLineNC ctermfg=Gray	ctermbg=DarkGray cterm=NONE
"highlight VertSplit ctermfg=Gray	ctermbg=DarkGray cterm=NONE
"highlight Statement  ctermfg=Yellow			cterm=NONE
"highlight FoldColumn ctermfg=Green      ctermbg=Black	cterm=NONE
"highlight NonText    ctermfg=Blue 	ctermbg=DarkGray cterm=NONE
"highlight MoreMsg    ctermfg=Green 	ctermbg=Black	cterm=NONE
"highlight ModeMsg    ctermfg=Green     		      	cterm=NONE
"highlight LineNr     ctermfg=Red 	ctermbg=Black	cterm=NONE
"highlight Question   ctermfg=Red       	ctermbg=Black	cterm=NONE
"highlight Type						cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif