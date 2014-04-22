" == "acomment" == {{{
"
"          File:  acomment.vim
"           Url:  http://forum.ubuntu.org.cn/viewtopic.php?f=24&t=177800&p=1096267&hilit=+vim#p1096267
"          Path:  /home/a-yu/.vim/plugin
"        Author:  A-yu
"      Modified:  2009-04-04 22:20  A-yu
"   Description:  快速添加代码注释的vim插件
"
" --}}}
"
"Exit if already loaded
if exists("loaded_acomment")
   finish
endif

let loaded_acomment = "v0.98"

"脚本使用者
let s:myName = "A-yu"

"使用 tm 在代码头部添加注释
map tm <Esc>:call <SID>AddTitleComment()<Cr>
"使用 ck 在当前代码行之上注释
map ck <Esc>:call <SID>AddComment(line("."),"k")<Cr>
"使用 cj 在当前代码行之下注释
map cj <Esc>:call <SID>AddComment(line("."),"j")<Cr>
"使用 cl 在当前代码行之右注释
map cl <Esc>:call <SID>AddComment(line("."),"l")<Cr>
"使用 cc 切换注释模式
map cc <Esc>:call <SID>CComment()<Cr>

"设置缓冲区变量
let b:commentMode = 0
let b:fType = ""
let b:errNum = 0
function s:InitA()
   if (!exists("b:fType")) || (!exists("b:commentMode")) || (!exists("b:errNum"))
      let b:commentMode = 0
      let b:errNum = 0
      let b:fType = ""
   endif
endf

"设置错误信息
let s:err = "acomment.ERR"
let s:errMsg = {}
let s:errMsg[0] = "acomment 出现未知的错误"
let s:errMsg[1] = s:err."："."文件没有后缀名"
let s:errMsg[2] = s:err."："."没有定义该类型文件的注释符号"

if !exists("s:aDict")
   "定义注释符号
   let s:aDict = {}
   let s:aDict['cType'] = {}
   let s:aDict['cType'][0] = {'cLine':1,'cBegin':"",'cEnd':"",'cHead':"/* ",'cFoot':" */",'cBody':"",'cMiddle':" * "}
   let s:aDict['cType'][1] = {'cLine':3,'cBegin':"",'cEnd':"",'cHead':"/* ",'cFoot':" */",'cBody':"// ",'cMiddle':" * "}
   let s:aDict['cType'][2] = {'cLine':3,'cBegin':"<?php",'cEnd':"?>",'cHead':"/* ",'cFoot':" */",'cBody':"// ",'cMiddle':" * "}
   let s:aDict['cType'][3] = {'cLine':1,'cBegin':"",'cEnd':"",'cHead':"<!-- ",'cFoot':" -->",'cBody':"",'cMiddle':" - "}
   let s:aDict['cType'][4] = {'cLine':1,'cBegin':"\" == \"acomment\" == {{{",'cEnd':"\" --}}}",'cHead':"\"",'cFoot':"\"",'cBody':"\"",'cMiddle':"\""}

   "定义文件类型及对应的注释符号在aDict['cType']中的键序号
   "对于多类型注释符号的文件，例如php，将该语言的默认注释格式放在第一位
   let s:aDict['fType'] = {}
   let s:aDict['fType']['css'] = [0]
   let s:aDict['fType']['js'] = [1]
   let s:aDict['fType']['php'] = [2,3]
   let s:aDict['fType']['htm'] = [3]
   let s:aDict['fType']['html'] = [3]
   let s:aDict['fType']['xhtml'] = [3]
   let s:aDict['fType']['vim'] = [4]
   let s:aDict['fType']['vimrc'] = [4]
endif

"转换一般字符串
function s:StrTrim(cStr,CT)
   let cStr = a:cStr
   let CT = a:CT
   if CT == 1
      let cStr = substitute(cStr,'\s*','',"g")
   elseif CT == -1
      let cStr = substitute(cStr,'\(.\)','\1\\s\*',"g")
   elseif CT == 2
      let cStr = substitute(cStr,'\s*$','',"g")
   elseif CT == -2
      let cStr = substitute(cStr,'^\s*','',"g")
   endif
   return cStr
endf
"转换一般字符串,使之成为可用表达式的一部分，并返回转换后的字符串
function s:StrToEreg(cStr)
   let cStr = a:cStr
   let cStr = substitute(cStr,'\s*','',"g")
   let cStr = substitute(cStr,'\(\"\|\*\)','\\\1',"g")
   "返回转换后的Ereg字符串
   return cStr
endf

"获取文件类型并返回其小写的后缀名，无则返回err
function s:FType()
   call s:InitA()
   "获取文件名后缀
   let fName = expand("%")
   let fType = strridx(fName,".")
   "是否有文件名后缀
   if fType > -1
      "有文件名后缀
      let fType = strridx(fName,".") + 1
      let fType = strpart(fName,fType)
      let fType = tolower(fType)
      "是否已经定义了该类文件的注释符号
      if !has_key(s:aDict['fType'],fType)
         let fType = s:err
         let b:errNum = 2
      endif
   else
      "无
      let fType = s:err
      let b:errNum = 1
   endif
   let b:fType = fType
   return fType
endf

"设置注释符号,成功则返回文件类型，否则返回err
function s:SetComment(num)
   let fType = s:FType()
   if fType == s:err
      return s:err
   else
      let b:cLine = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cLine']
      let b:cBegin = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cBegin']
      let b:cEnd = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cEnd']
      let b:cHead = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cHead']
      let b:cFoot = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cFoot']
      let b:cBody = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cBody']
      let b:cMiddle = s:aDict['cType'][s:aDict['fType'][fType][a:num]]['cMiddle']
      return fType
   endif
endf

"切换注释模式
function s:CComment()
   let fType = s:FType()
   if fType == s:err
      echo s:errMsg[b:errNum]
   else
      if (len(s:aDict['fType'][fType]) - 1) > b:commentMode
         let b:commentMode = b:commentMode + 1
      else
         let b:commentMode = 0
      endif
      if len(s:aDict['fType'][fType]) > 1
         echo "注释模式已切换为[\'".fType."\'][".b:commentMode."]  cType:".s:aDict['fType'][fType][b:commentMode]
      else
         echo "保持模式"."[\'".fType."\'][".b:commentMode."]  cType:".s:aDict['fType'][fType][b:commentMode]." !当前文件类型只有一个注释模式!"
      endif
   endif
endf

"代码头部注释
function s:AddTitleComment()
   call s:InitA()
   "代码头部注释始终使用第一种注释类型
   let setComment = s:SetComment(0)
   if setComment == s:err
      echo s:errMsg[b:errNum]
      return 0
   endif
   let myName = s:myName

   let cBegin = b:cBegin
   let cEnd = b:cEnd
   let cHead = b:cHead
   let cFoot = b:cFoot
   let cBody = b:cBody
   let cMiddle = b:cMiddle
   if cHead != "" && cMiddle != "" && cHead != cMiddle
      let cHead = s:StrTrim(cHead,2).s:StrTrim(cMiddle,-2)
   endif
   if cBegin == "" && cHead != ""
      let cBegin = cHead
      let cHead = cMiddle
   endif
   if cEnd == "" && cFoot != ""
      let cEnd = cFoot
      let cFoot = cMiddle
   endif
   "保存当前光标的位置
   let savePos = getpos(".")
   "返回第一行行首
   normal ggO
   "添加部分头部注释，7行
   call setline(1,cBegin)
   call append(1,cHead)
   call append(2,cMiddle."          File:  " . expand("%"))
   call append(3,cMiddle."          Path:  " . getcwd())
   call append(4,cMiddle."        Author:  " . myName)
   call append(5,cMiddle."      Modified:  " . strftime("%Y-%m-%d %H:%M") . "  " . myName)   
   call append(6,cMiddle."   Description:  ")
   "定义相关变量，设置为不存在:[旧的注释、当前编写者所作注释、作者姓名、描述内容]
   let oldComment = "N"
   let myOldComment = "N"
   let authorName = "N"
   let descriptionText = "N"
   "若代码行数大于16行；16行是指旧注释9行（如果存在） 加 新增部分注释7行
   if line("$") >= 16
      "若存在旧的注释
      if ((s:StrTrim(getline(8),1) ==? s:StrTrim(cBegin,1)) && (s:StrTrim(getline(9),1) ==? s:StrTrim(cHead,1)) && (s:StrTrim(getline(15),1) ==? s:StrTrim(cFoot,1)) && (s:StrTrim(getline(16),1) ==? s:StrTrim(cEnd,1)))
         let oldComment = "Y"
         "若存在原作者姓名
         if (substitute(s:StrTrim(getline(12),1),'\c^.*Author:',"","") !=? substitute(s:StrTrim(getline(5),1),'\c^.*Author:',"","")) && (match(substitute(s:StrTrim(getline(12),1),'\c^.*Author:',"",""),'^\s*$') == -1)
            let authorName = "Y"
         endif
         "若为当前编写者所作注释
         if (match(s:StrTrim(getline(13),1),'\c.*'.s:StrToEreg(myName).'$') != -1)
            let myOldComment = "Y"
         endif
         "若存在描述内容
         if (s:StrTrim(getline(14),1) !=? s:StrTrim(getline(7),1))
            let descriptionText = "Y"
         endif
      endif
   endif
   "是否存在旧的注释
   if oldComment == "Y"
      "存在旧的注释
      "若存在原作者姓名
      if authorName == "Y"
         "取得原作者姓名并保留在新的头部注释中
         let authorName = substitute(getline(12),'\c^.*'.s:StrTrim("Author:",-1),"","")
         let authorName = substitute(getline(5),'\c'.s:StrTrim(myName,-1).'$',"","") . authorName
         call setline(5,authorName)
      endif
      "若为当前编写者所作注释
      if myOldComment == "Y"
         "是否存在描述内容
         if descriptionText == "Y"
            "存在描述内容
            "取得描述内容并保留在新的头部注释中
            let descriptionText = substitute(getline(14),'\c^.*'.s:StrTrim("Description:",-1),"","")
            let descriptionText = getline(7).descriptionText         
            call setline(7,descriptionText)
            "完成头部注释
            call append(7,cFoot)
            call append(8,cEnd)
            normal 10gg9dd$
            "回到光标原来所在的位置
            call setpos(".",savePos)
            redraw
            echo "（".strftime("%H:%M")."）"."头部注释已更新"
         else
            "不存在描述内容
            "完成头部注释
            call append(7,cFoot)
            call append(8,cEnd)
            normal 10gg9dd7gg$
            redraw
            echo "（".strftime("%H:%M")."）"."头部注释已更新；缺少描述！"
         endif
      else
         "完成头部注释
         call append(7,cFoot)
         call append(8,cEnd)
         normal 7gg$
         redraw
         echo "（".strftime("%H:%M")."）"."头部注释已创建；缺少描述！"
      endif
   else
      "不存在旧的注释
      "完成头部注释
      call append(7,cFoot)
      call append(8,cEnd)
      normal 7gg$
      redraw
      echo "头部注释已创建；缺少描述!"
   endif
endf

"进行注释动作
"@num lNum 当前行
"@str cPos 注释位置
function s:AddComment(lNum,cPos)
   call s:InitA()
   let setComment = s:SetComment(b:commentMode)
   if setComment == s:err
      echo s:errMsg[b:errNum]
      return 0
   endif
   let lNum = a:lNum
   let cPos = a:cPos
   let cLine = b:cLine
   let cHead = b:cHead
   let cFoot = b:cFoot
   let cBody = b:cBody
   let cMiddle = b:cMiddle
   if cPos != "l" && cLine >= 2
      if cHead != "" && cMiddle != "" && cHead != cMiddle
         let cHead = s:StrTrim(cHead,2).s:StrTrim(cMiddle,-2)
      endif
   endif
   "相应的注释动作
   if cPos == "k"
      normal O
      if cLine > 2
         call setline(lNum,cHead)
         "保存当前光标位置
         let savePos = getpos(".")
         call append(lNum,cFoot)
         let iNum = cLine - 2
         "循环加入注释行
         while (iNum > 0)
            call append(lNum,cMiddle)
            let iNum = iNum - 1
         endw
         "回到已保存光标位置
         call setpos(".",savePos)
         "循环格式化加入的行
         while cLine > 0
            normal ==
            let cLine = cLine -1
            if cLine > 0
               normal j
            endif
         endw
         "回到已保存光标位置
         call setpos(".",savePos)
         "光标移到下一行的结尾
         normal j$
      elseif cLine == 1
         "单行注释时使用头尾注释符号或单行注释符号，例如<!---->或//
         let strc = (cBody=="")?(cHead.cFoot):(cBody)
         call setline(lNum,strc)
         normal ==$
         "若使用单行注释符号
         if b:cBody == ""
            let lenCFoot = len(cFoot)
            while lenCFoot > 0
               normal h
               let lenCFoot = lenCFoot - 1
            endw
         endif
      endif
   elseif cPos == "j"
      let lNum = lNum + 1
      normal o   
      if cLine > 2
         call setline(lNum,cHead)
         "保存当前光标位置
         let savePos = getpos(".")
         call append(lNum,cFoot)
         let iNum = cLine -2
         "循环加入注释行
         while (iNum > 0)
            call append(lNum,cMiddle)
            let iNum = iNum - 1
         endw
         "回到已保存光标位置
         call setpos(".",savePos)
         "循环格式化加入的行
         while cLine > 0
            normal ==
            let cLine = cLine -1
            if cLine > 0
               normal j
            endif
         endw
         "回到已保存光标位置
         call setpos(".",savePos)
         normal j$
      elseif cLine == 1
         "单行注释时使用头尾注释符号或单行注释符号，例如<!---->或//
         let strc = (cBody=="")?(cHead.cFoot):(cBody)
         call setline(lNum,strc)
         normal ==$
         "若使用单行注释符号
         if b:cBody == ""
            let lenCFoot = len(cFoot)
            while lenCFoot > 0
               normal h
               let lenCFoot = lenCFoot - 1
            endw
         endif
      endif   
   elseif cPos == "l"
      "单行注释时使用头尾注释符号或单行注释符号，例如<!---->或//
      let strc = (cBody=="")?(cHead.b:cFoot):(cBody)
      call append(lNum,strc)
      normal J$
      "若使用单行注释符号
      if b:cBody == ""
         let lenCFoot = len(cFoot)
         while lenCFoot > 0
            normal h
            let lenCFoot = lenCFoot - 1
         endw
      endif
   endif
   redraw
   echo "已添加注释符号，按a键输入注释内容"
endf

"=========================================================
"vim相应配置
"编辑php文件时设置GVIM下不折行，显示水平滚动条
if (has("gui_running") && (s:FType() ==? "php" || s:FType() ==? "vim"))
   set nowrap
   set guioptions+=b
endif
"---------------------------------------------------------
