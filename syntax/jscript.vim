" Vim syntax file
" Language:	Microsoft JScript 
" Maintainer:	Robert Melton <rmelton@metacosm.dhs.org>
" URL:		http://fastfoodsoftware.com/aspjscript.zip
" Last Change:	2004 May 28

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'jscript'
endif


syn match   javaScriptLineComment      "\/\/.*$"
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptCommentString    start=+"+  skip=+\\\\\|\\"+  end=+"+ end=+\*/+me=s-1,he=s-1 contains=javaScriptSpecial,javaScriptCommentSkip,@htmlPreproc
syn region  javaScriptComment2String   start=+"+  skip=+\\\\\|\\"+  end=+$\|"+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptComment          start="/\*"  end="\*/" contains=javaScriptCommentString,javaScriptCharacter,javaScriptNumber
syn match   javaScriptSpecial          "\\\d\d\d\|\\."
syn region  javaScriptStringD          start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS          start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber           "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword javaScriptConditional      if else
syn keyword javaScriptRepeat           while for
syn keyword javaScriptBranch           break continue switch case default eval
syn keyword javaScriptOperator         new in try catch finally 
syn keyword javaScriptType             this var
syn keyword javaScriptStatement        return with

" Asp objects
syn keyword javaScriptStatement         Request Response Session Server Application 
" Asp Object methods 
syn keyword javaScriptFunction         write form querystring contenttype flush redirect execute move movenext movefirst end open close timeout
syn keyword javaScriptFunction         begintrans committrans rollbacktrans replace


syn keyword javaScriptFunction         function language jscript string

syn keyword javaScriptBoolean          true false null eof
syn match   javaScriptBraces           "[{}]"

" catch errors caused by wrong parenthesis
" syn match   javaScriptInParen     contained "[{}]"  (broken)
 syn region  javaScriptParen       transparent start="(" end=")" contains=javaScriptParen,javaScript.*
 syn match   javaScrParenError  ")"

if main_syntax == "jscript"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jscript_syn_inits")
  if version < 508
    let did_jscript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment           Comment
  HiLink javaScriptLineComment       Comment
  HiLink javaScriptSpecial           Special
  HiLink javaScriptStringS           String
  HiLink javaScriptStringD           String
  HiLink javaScriptCharacter         Character
  HiLink javaScriptSpecialCharacter  javaScriptSpecial
  HiLink javaScriptNumber            javaScriptValue
  HiLink javaScriptConditional       Conditional
  HiLink javaScriptRepeat            Repeat
  HiLink javaScriptBranch            Conditional
  HiLink javaScriptOperator          Operator
  HiLink javaScriptType              Type
  HiLink javaScriptStatement         Statement
  HiLink javaScriptFunction          Function
  HiLink javaScriptBraces            Function
  HiLink javaScriptError             Error
  HiLink javaScrParenError           javaScriptError
  HiLink javaScriptInParen           javaScriptError
  HiLink javaScriptBoolean           Boolean
  delcommand HiLink
endif

let b:current_syntax = "jscript"
if main_syntax == 'jscript'
  unlet main_syntax
endif

" vim: ts=8


