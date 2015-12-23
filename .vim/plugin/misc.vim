" vim : foldmethod=manual :
func! DeleteTrailingsWS()
  execute "normal! mz"
  %s/\s\+$//ge
  execute "normal! 'z"
endfunc


func! MethodDefinition()
  let pattern  =  '^\s*\(\w\+\)\s\+\(\w\+\)\s*(\([^)]*\)).*;$'
  let output   =  matchlist(getline('.'), pattern)
  let file_to_mod = expand("%")
  let file_to_read = expand("%:r") . ".hh"

  execute ":w"
  execute ":buffer " . file_to_read
  let [lnum, col] = searchpos('^class\s\?\w*', 'n') 
  let class_name =  matchlist(getline(lnum), '^class\s\(\w*\)')[1]
  execute ":buffer " . file_to_mod

  if len(output) < 3
    echom "The function looks odd for me"
    return 
  endif

  let f_return =  output[1]
  let f_name   =  output[2]
  let f_args   =  output[3]
  let c_name   =  expand("%:t:r")
  let f_sign   = "". f_return ." ". class_name ."::". f_name ." (". f_args. ")"

  execute "normal! S". f_sign ." {"
  execute "normal! O// " . f_name . " {{{"
  execute "normal! jo}\<ESC>o// }}}"
endfunc

nnoremap <Leader>c :call MethodDefinition()<Enter>
