" Vim syntax file
" Language:	Microsoft ASP ( /w JScript)
" Maintainer:   Robert Melton <rmelton@metacosm.dhs.org>
" URL:		http://fastfoodsoftware.com/aspjscript.zip
" Last Change:	2004 May 28

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'jscript'
endif

if version < 600
  so <sfile>:p:h/xhtml.vim
  syn include @AspJScriptScript <sfile>:p:h/jscript.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
  syn include @AspJScriptScript syntax/jscript.vim
endif

syn cluster htmlPreproc add=AspJScriptScriptInsideHtmlTags

syn region  AspJScriptScriptInsideHtmlTags keepend matchgroup=Delimiter start=+<%=\=+ skip=+".*%>.*"+ end=+%>+ contains=@AspJScriptScript
syn region  AspJScriptScriptInsideHtmlTags keepend matchgroup=Delimiter start=+<script\s\+language="\=jscript"\=[^>]*>+ end=+</script>+ contains=@AspJScriptScript

let b:current_syntax = "aspjscript"
