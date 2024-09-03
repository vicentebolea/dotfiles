" vim : foldmethod=marker :
"
" BSD 4-Clause License
"
" Copyright (c) 2022, Vicente Adolfo Bolea Sanchez <vicente.bolea@gmail.com>
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"
" 1. Redistributions of source code must retain the above copyright notice, this
"    list of conditions and the following disclaimer.
"
" 2. Redistributions in binary form must reproduce the above copyright notice,
"    this list of conditions and the following disclaimer in the documentation
"    and/or other materials provided with the distribution.
"
" 3. All advertising materials mentioning features or use of this software must
"    display the following acknowledgement:
"      This product includes software developed by Vicente Adolfo Bolea Sanchez.
"
" 4. Neither the name of the copyright holder nor the names of its
"    contributors may be used to endorse or promote products derived from
"    this software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY COPYRIGHT HOLDER "AS IS" AND ANY EXPRESS OR
" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
" MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
" EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
" SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
" PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
" OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
" OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
" ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
" Requirements:
"  - It requires to have the following env variables:
"    1. $CLANG_COMPLETE_LIB
"    2. $GIT_AUTHOR_NAME
"
" Quick Predefined leader Maps
" ============================
"
" [a] -> :A
" [s] -> :Git
" [d] -> :Gdiff
" [t] -> :tabnew
" [T] -> :tabdel

" Bundle {{{
set nocp

" Legacy options for version before Vim 8
let b:legacy_file = $HOME . "/.vimrc.legacy"
if filereadable(b:legacy_file)
  execute "source" . b:legacy_file
endif

" }}}
" Essentials {{{
" We drink from the defaults of vim
if filereadable($VIMRUNTIME . "/defaults.vim")
  source $VIMRUNTIME/defaults.vim
else
  set incsearch showcmd wildmenu
endif

" The matchit plugin makes the % command better, but it is not backwards compatible.
if v:version >= 800 && has('syntax') && has('eval')
  packadd matchit
  packadd shellmenu
endif

" This is VIM we don't need arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" }}}
" Interface settings {{{
"## COLORSCHEME
set term=screen-256color
set background=dark

"## BASE16
try
  let g:solarized_contrast = "high"
  colorscheme solarized
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  hi Folded ctermbg=16
endif
catch
endtry

"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set lazyredraw

" More options
set hlsearch
set wildignore=*.o,*.class,*.pyc
set path+=**
set hidden  " Useful feature, to have multiples buffer open
set mouse=a
"set cursorline
match Error /{{{\|}}}/
set exrc

"Long wrapped line
set showbreak=↳\  

"Set backup off since we are always using git :D
set noswapfile
set nobackup
set nowritebackup

"Indentation
set shiftwidth=2
set expandtab
set tabstop=2
set backspace=2
set foldmethod=marker
set cino=N-s

if v:version >= 800
  set breakindent
endif

" }}}
" filetype settings {{{
autocmd FileType html setlocal sw=2 ts=2 noexpandtab autoindent
autocmd FileType Makefile setlocal sw=2 ts=2 noexpandtab
autocmd FileType java setlocal sw=4 ts=4 expandtab
autocmd FileType sh,bash,csh setlocal makeprg=shellcheck\ %

" PEP8 compliant
autocmd! FileType python setlocal sw=4 ts=4 sts=4 expandtab textwidth=100 fileformat=unix autoindent makeprg=flake8\ %

" Vue development
autocmd! FileType typescript setlocal makeprg=npx\ eslint\ -f\ unix\ %
autocmd! FileType vue setlocal makeprg=npx\ eslint\ -f\ unix\ %

" Technical writting
autocmd FileType html,markdown,rst,txt,tex setlocal textwidth=79 colorcolumn=80 spell
autocmd BufEnter,BufNew *.log setlocal nowrap

" Spec development
autocmd FileType spec setlocal makeprg=spec-cleaner\ -i\ %
autocmd FileType changes setlocal textwidth=67 colorcolumn=67 spell

augroup tabsPolicy
  autocmd!
  autocmd BufEnter,BufNew *.tsv setlocal noexpandtab tabstop=6 sw=6
  autocmd BufEnter,BufNew *.tsv,Makefile,*.make,*.html :let b:SuperTabDisabled=1
  autocmd BufEnter,BufNew *.tsv,Makefile,*.make,*.html :silent! iunmap <Tab>
augroup end

highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/

" Disable Copilot by default
au BufNewFile,BufRead * Copilot disable

" }}}
" Gvim {{{
if has('gui_running')
  set guifont=Source\ Code\ Pro\ Semi-Bold\ 11
  set linespace=2    "Better line-height
  "set guioptions-=m  "remove menu bar
  "set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif
" }}}
"Autocomplete  {{{
set dictionary+=/usr/share/dict/words
set completeopt=menuone,menu,preview,longest

" clang_complete
" ----------------------------------------------------
if empty($CLANG_COMPLETE_LIB)
  let g:clang_complete_loaded = 1
endif

let g:clang_library_path    = $CLANG_COMPLETE_LIB
let g:clang_auto_select     = 1
let g:clang_complete_auto   = 0
let g:clang_snippets        = 0
"}}}
"Key-binding {{{
" ---------------------------------------------------------------------
let mapleader = " "

" This is VIM we don't need arrow keys
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>
nnoremap Q <Nop>

" Tabs
nnoremap <silent> <F2> :tabprevious<Enter>
nnoremap <silent> <F3> :tabnext<Enter>
nnoremap <silent> <F4> :tabnew<Enter>
nnoremap <silent> <F5> :make
nnoremap <silent> <F8> :TagbarToggle<Enter>
nnoremap <silent> <F9> :NERDTreeToggle<Enter>
try
  call togglebg#map("<F7>")
catch
endtry

"Copilot
imap <C-Down> <Plug>(copilot-dismiss)
imap <C-Right> <Plug>(copilot-next)
imap <C-Left> <Plug>(copilot-previous)
imap <C-Up> <Plug>(copilot-suggest)

"Customized shortcuts
nnoremap <silent><leader>a :A<CR>
nnoremap <silent><leader>d :Gdiff<CR>
nnoremap <silent><leader>T :tabclose<CR>
nnoremap <silent><leader>t :tabnew<CR>

"Great map which saves the file in sudo mode, something like `sudo !!`
cnoremap w!! w !sudo tee >/dev/null %

ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab WQA wqa
ab Wqa wqa
ab E e
ab Copen copen
ab Cclose cclose

"}}}
"vim-airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_skip_empty_sections = 1
let g:airline_section_y = 0
let g:airline#extensions#whitespace#enabled = 0

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"}}}
"NERDTree "{{{
" ---------------------------------------------------------------------
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
" }}}
"SuperTab | utisnipts {{{
let g:UltiSnipsExpandTrigger        = "<C-j>"
let g:UltiSnipsJumpForwardTrigger   = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger  = "<C-M-k>"
let g:SuperTabDefaultCompletionType = "<C-P>"
"}}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
" Fugitive {{{
set diffopt+=vertical
" }}}
" CtrlP {{{
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_case_sensitive = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMixed'
" }}}
" Local Config {{{
if filereadable($HOME . "/.vimrc.local")
  autocmd BufLeave .vimrc.local normal! mV
  source $HOME/.vimrc.local
endif
" }}}
