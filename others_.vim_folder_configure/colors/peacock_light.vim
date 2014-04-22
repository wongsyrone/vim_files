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

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="peacock_light"

"hi Normal	ctermfg=White	ctermbg=black	guifg=White  guibg=grey30 "灰色
hi Normal	ctermfg=black	ctermbg=White	guifg=black  guibg=#FFFFFF "白色

" AlignCtrl default
" AlignCtrl =P0 guifg guibg gui
" Align

" highlight groups
hi Cursor       guifg=yellow         guibg=black    gui=none
hi CursorLine	guifg=NONE           guibg=#D9EEFF     gui=none
hi CursorColumn	guifg=NONE           guibg=#D9EEFF  gui=NONE
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
hi MatchParen	guifg=#FF8000        guibg=#0066CC  gui=bold
hi DiffAdd      guifg=black          guibg=wheat1
hi DiffChange   guifg=black          guibg=skyblue1
hi DiffText     guifg=black          guibg=hotpink1  gui=none
hi DiffDelete   guibg=gray45         guifg=black     gui=none



" syntax highlighting groups
hi Comment      guifg=#808080         gui=italic "注释
hi Boolean      guifg=#CE3E00         gui=none   "布尔值
hi Constant     guifg=#C600C6         gui=none   "常量，包括[hi String]
hi Identifier   guifg=#804000         gui=none   "变量
hi Function     guifg=#808000         gui=none   "函数
hi Statement    guifg=#008080         gui=none   "语句及方法名称
hi PreProc      guifg=#000080         gui=none   "方法修饰符，包括[hi Define]，如function、new、require
hi Type         guifg=#0000FF         gui=none   "类属性，如类标示符，类属性
hi Special      guifg=#FF0000         gui=none   "修饰符，如括号
hi Ignore       guifg=grey40          gui=none   "忽略
hi Todo         guifg=orangered       guibg=yellow2 gui=none
hi Number       guifg=#FF6600         gui=none   "数字
hi Float        guifg=#E300E3         gui=none   "浮点数字
hi String       guifg=#008000         gui=none   "字符串
hi Define       guifg=#AC024F         gui=none   "#define常量定义

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
