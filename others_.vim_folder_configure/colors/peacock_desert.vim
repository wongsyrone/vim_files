" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="peacock_desert"

"hi Normal	ctermfg=White	ctermbg=black	guifg=White  guibg=grey30 "灰色
"hi Normal	ctermfg=White	ctermbg=black	guifg=White  guibg=#0c1021 "深蓝偏黑
hi Normal	ctermfg=White	ctermbg=black	guifg=White  guibg=#213449 "Ruby

" AlignCtrl default
" AlignCtrl =P0 guifg guibg gui
" Align

" highlight groups
hi Cursor       guifg=black          guibg=yellow   gui=none
hi CursorLine	guifg=NONE           guibg=NONE     gui=underline,bold
hi CursorColumn	guifg=NONE           guibg=gray40   gui=NONE
hi ErrorMsg     guifg=white          guibg=red      gui=none
hi VertSplit    guifg=gray40         guibg=gray40   gui=none
hi Folded       guifg=DarkSlateGray3 guibg=grey30   gui=none
hi FoldColumn   guifg=tan            guibg=grey30   gui=none
hi IncSearch    guifg=#b0ffff        guibg=#2050d0
hi LineNr	guibg=grey20         guifg=burlywood3  gui=bold
hi ModeMsg      guifg=SkyBlue        gui=none
hi MoreMsg      guifg=SeaGreen       gui=none
hi NonText      guifg=cyan           gui=none
hi Question     guifg=springgreen    gui=none
hi Search       guifg=#CE6700        guibg=#AEDCE1  gui=bold
hi SpecialKey   guifg=cyan           gui=none
hi StatusLine   guifg=black          guibg=#c2bfa5  gui=bold
hi StatusLineNC guifg=grey           guibg=gray40   gui=none
hi Title        guifg=indianred      gui=none
hi Visual       guifg=gray17         guibg=tan1     gui=none
hi WarningMsg   guifg=salmon         gui=none
hi Pmenu        guifg=white          guibg=#445599  gui=none
hi PmenuSel     guifg=#445599        guibg=gray
hi WildMenu     guifg=gray           guibg=gray17   gui=none
hi MatchParen	guifg=#FF8000        guibg=#FFFFB5  gui=bold
hi DiffAdd      guifg=black          guibg=wheat1
hi DiffChange   guifg=black          guibg=skyblue1
hi DiffText     guifg=black          guibg=hotpink1  gui=none
hi DiffDelete   guibg=gray45         guifg=black     gui=none



" syntax highlighting groups
hi Comment      guifg=#B4A078         gui=italic "注释
hi Boolean      guifg=#80FFFF         gui=none   "布尔值
hi Constant     guifg=#dca3a3         gui=none   "常量，包括[hi String]
hi Identifier   guifg=Skyblue         gui=none   "变量
hi Function     guifg=lightgoldenrod2 gui=none   "函数
hi Statement    guifg=#C6BC06         gui=none   "语句及方法名称
hi PreProc      guifg=PaleVioletRed2  gui=none   "方法修饰符，包括[hi Define]，如function、new、require
hi Type         guifg=tan1            gui=none   "类属性，如类标示符，类属性
hi Special      guifg=#EE6F9E         gui=none   "修饰符，如括号
hi Ignore       guifg=grey40          gui=none   "忽略
hi Todo         guifg=orangered       guibg=yellow2 gui=none
hi Number       guifg=#FF6600         gui=none   "数字
hi Float        guifg=#E300E3         gui=none   "浮点数字
hi String       guifg=#B5FFB5         gui=none   "字符串
hi Define       guifg=#79F05B         gui=none   "#define常量定义

" color terminal definitions
hi SpecialKey   ctermfg=darkgreen
hi NonText      cterm=bold           ctermfg=darkblue
hi Directory    ctermfg=darkcyan
hi ErrorMsg     cterm=bold           ctermfg=7        ctermbg=1
hi IncSearch    cterm=NONE           ctermfg=yellow   ctermbg=green
hi Search       cterm=NONE           ctermfg=grey     ctermbg=blue
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE           ctermfg=brown
hi LineNr       ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=5
hi Visual       cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0            ctermbg=3
hi Folded       ctermfg=darkgrey     ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey     ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=bold           ctermfg=4        ctermbg=6
hi DiffText     cterm=bold           ctermbg=1
hi Comment      ctermfg=darkcyan
hi Constant     ctermfg=brown
hi Special      ctermfg=5
hi Identifier   ctermfg=6
hi Statement    ctermfg=3
hi PreProc      ctermfg=5
hi Type         ctermfg=2
hi Underlined   cterm=underline      ctermfg=5
hi Ignore       ctermfg=darkgrey
hi Error        cterm=bold           ctermfg=7        ctermbg=1
