set nu
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'taglist-plus'
Plugin 'AutoComplPop'
Plugin 'scrooloose/nerdtree'
call vundle#end()

set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

if has("syntax")	
    syntax on
endif

let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_dynamic_files = 1

function! InsertTabWrapper()
    let col=col('.')-1
    if !col||getline('.')[col-1]!~'\k'
        return "\<TAB>"
    else
        if pumvisible()
            return "\<C-N>"
        else
            return "\<C-N>\<C-P>"
        end 
    endif
endfunction

nmap <F9> :NERDTree<CR>
nmap <F8> :TlistToggle<CR>

let Tlist_Use_Right_Window = 1

inoremap <TAB> <c-r>=InsertTabWrapper()<cr>
hi Pmenu ctermbg=blue
hi PmenuSel ctermbg=yellow ctermbg=black
hi PmenuSbar ctermbg=blue

set tags=/home/jhlee/workspace/git/private-hdac/tags

"ctags macro setting
if version >= 500
func! Sts()
let st = expand("<cword>") 
  exe "sts ".st 
endfunc
nmap ,st :call Sts()<cr> 

func! Tj()
let tj = expand("<cword>")
  exe "tj ".tj
endfunc
nmap ,tj :call Tj()<cr>

func! PO()
  exe "po"
endfunc
nmap ,b :call PO()<cr>
endif

set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add ./cscope.out
endif
set csverb


func! Css()
let css = expand("<cword>")
new
    exe "cs find s ".css
       if getline(1) == ""
	     exe "q!"
		endif
		 endfunc
		 nmap ,css :call Css()<cr>

		func! Csc()
let csc = expand("<cword>")
new
    exe "cs find c ".csc
       if getline(1) == ""
	     exe "q!"
		endif
		endfunc
		nmap ,csc :call Csc()<cr>

		func! Csd()
let csd = expand("<cword>")
new
  exe "cs find d ".csd
     if getline(1) == ""
	    exe "q!"
	       endif
	       endfunc
	       nmap ,csd :call Csd()<cr>

	       func! Csg()
let csg = expand("<cword>")
new
   exe "cs find g ".csg
      if getline(1) == ""
	    exe "q!"
	       endif
	       endfunc
	       nmap ,csg :call Csg()<cr>
