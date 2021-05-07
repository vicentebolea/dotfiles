" Copyright (c) 1998-2006
" Vicente Adolfo Bolea Sanchez <vicente.bolea@gmail.com>
"
" We grant permission to use, copy modify, distribute, and sell this
" software for any purpose without fee, provided that the above copyright
" notice and this text are not removed. We make no guarantee about the
" suitability of this software for any purpose and we are not liable
" for any damages resulting from its use. Further, we are under no
" obligation to maintain or extend this software. It is provided on an
" "as is" basis without any expressed or implied warranty.

function! SetCurrentClass()
  let @a = expand('%:t:r')
endfunction

function! JumpToParentClass()
  let l:currentClass = expand('%:t:r')
  let l:query = 'class\s\w*\s\?' . l:currentClass . '\(<.*>\)\?\s\?:\s\?\(public\|private\|protected\)\s\(.*\)\(\s{\)\?$'
  let l:isFoundParent = search(l:query, "nw")

  " Try alternate file
  if l:isFoundParent == 0
    execute ":silent! A"
    let l:isFoundParent= search(l:query, "nw")
    if l:isFoundParent == "0"
      echoerr "Could not find parent class"
      return
    endif

    execute '%s/' . l:query . '/\=setreg("t", submatch(3))/n'
  endif

  execute '%s/' . l:query . '/\=setreg("t", submatch(3))/n'
  let l:parentClass = @t

  execute ":silent! tag " . l:parentClass

  if expand('%:e') != ".h" || expand('%:e') != ".hh"
    execute ":silent! A"
  endif

  let @t = ""
endfunction

function! CurrentLineAndFileToClip()
  let @+=expand("%") . ":" . line('.')
endfunction

autocmd BufEnter,BufNew *.cpp,*.cxx,*.h :silent! call SetCurrentClass()

noremap <leader>q :call JumpToParentClass()<CR>

command! Parent call JumpToParentClass()
command! ToClip call CurrentLineAndFileToClip()
command! Z call CurrentLineAndFileToClip()
