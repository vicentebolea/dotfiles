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
" Quick Predefined leader Maps
" ============================
"
" [a] -> :A
" [s] -> :Git
" [d] -> :Gvdiffsplit
" [t] -> :tabnew
" [T] -> :tabdel

" Essentials {{{
filetype plugin indent on
syntax on

" The matchit plugin makes the % command better, but it is not backwards compatible.
packadd matchit
packadd shellmenu

" This is VIM we don't need arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" }}}
" Interface settings {{{
"## COLORSCHEME
set background=dark

"## BASE16
try
  let g:solarized_use16 = 1
  colorscheme solarized8_high
catch
endtry

set belloff=all

" More options
set hlsearch
set ignorecase
set wildignore=*.o,*.class,*.pyc
set path+=**
set hidden  " Useful feature, to have multiples buffer open
set mouse=a
"set cursorline
set exrc
set secure

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
set backspace=indent,eol,start
set foldmethod=marker
set cino=N-s
set breakindent

" }}}
" filetype settings {{{
augroup vimrc
autocmd!
autocmd FileType html setlocal sw=2 ts=2 noexpandtab autoindent
autocmd FileType make setlocal sw=2 ts=2 noexpandtab
autocmd FileType java setlocal sw=4 ts=4 expandtab
autocmd FileType sh,bash,csh setlocal makeprg=shellcheck\ -f\ gcc\ %

" PEP8 compliant
autocmd FileType python setlocal sw=4 ts=4 sts=4 expandtab textwidth=100 fileformat=unix autoindent makeprg=flake8\ %

" Vue development
autocmd FileType typescript setlocal makeprg=npx\ eslint\ -f\ unix\ %
autocmd FileType vue setlocal makeprg=npx\ eslint\ -f\ unix\ %

" Technical writting
autocmd FileType html,markdown,rst,txt,tex setlocal textwidth=79 colorcolumn=80 spell
autocmd BufEnter *.log setlocal nowrap

" Spec development
autocmd FileType spec setlocal makeprg=spec-cleaner\ -i\ %
autocmd FileType changes setlocal textwidth=67 colorcolumn=67 spell

" Tabs policy
autocmd BufEnter *.tsv setlocal noexpandtab tabstop=6 sw=6

" Highlight fold markers and trailing whitespace, once per window
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd VimEnter,WinNew,BufWinEnter * if !exists('w:vimrc_match') |
      \ let w:vimrc_match = [matchadd('Error', '{{{\|}}}'), matchadd('BadWhitespace', '\s\+$')] |
      \ endif
augroup END

" Disable Copilot by default
let g:copilot_enabled = 0
if has('patch-9.0.0185')
  packadd copilot.vim
endif

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
"}}}
"Key-binding {{{
" ---------------------------------------------------------------------
let mapleader = " "

nnoremap Q <Nop>

" Tabs
nnoremap <silent> <F2> :tabprevious<Enter>
nnoremap <silent> <F3> :tabnext<Enter>
nnoremap <silent> <F4> :tabnew<Enter>
nnoremap <silent> <F5> :make
nnoremap <silent> <F9> :NERDTreeToggle<Enter>
nnoremap <silent> <F7> :let &background = &background == 'dark' ? 'light' : 'dark'<Enter>
"Copilot
imap <S-Down> <Plug>(copilot-dismiss)
imap <S-Right> <Plug>(copilot-next)
imap <S-Left> <Plug>(copilot-previous)
imap <S-Up> <Plug>(copilot-suggest)

"Customized shortcuts
nnoremap <silent><leader>a :A<CR>
nnoremap <silent><leader>d :Gvdiffsplit<CR>
nnoremap <silent><leader>T :tabclose<CR>
nnoremap <silent><leader>t :tabnew<CR>

"Great map which saves the file in sudo mode, something like `sudo !!`
cnoremap w!! w !sudo tee >/dev/null %

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev WQA wqa
cnoreabbrev Wqa wqa
cnoreabbrev E e
cnoreabbrev Copen copen
cnoreabbrev Cclose cclose

"}}}
"vim-airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled = 0
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
" Fugitive {{{
set diffopt+=vertical
" }}}
" CtrlP {{{
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_case_sensitive = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_mruf_relative = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|osc|venv|claude)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

" }}}
" Local Config {{{
if filereadable($HOME . "/.vimrc.local")
  autocmd BufLeave .vimrc.local normal! mV
  source $HOME/.vimrc.local
endif
" }}}
