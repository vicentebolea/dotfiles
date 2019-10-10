" vim : foldmethod=marker :
" AUTHOR: Vicente Adolfo Bolea Sanchez
" Dependencies:
"  - It requires to have the following env variables:
"    1. $CLANG_COMPLETE_LIB
"    2. $GIT_AUTHOR_NAME
" Bundle {{{
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'SuperTab'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ctrlp.vim'
Plugin 'chriskempson/base16-vim'
call vundle#end()

" }}}
" Essentials {{{
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on

" We drink from the defaults of vim
source $VIMRUNTIME/defaults.vim

" Add optional packages.
" The matchit plugin makes the % command work better, but it is not
" backwards compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" This is VIM we don't need arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" }}}
" Interface settings {{{
"## COLORSCHEME
"## 256 terminal
set t_Co=256
set term=screen-256color
set background=dark
"## SOLARIZED
"let g:solarized_termcolors=256 " uses terminal color
"let g:solarized_diffmode="high"
"let g:solarized_termtrans = 1
"## BASE16
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme base16-default-dark

"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw

"## More options
set ruler
set incsearch
set hlsearch
set wildmenu
set wildignore=*.o,*.class,*.pyc
set path+=**
set hidden  " Useful feature, to have multiples buffer open
set mouse=a

"## Cursor
set cursorline
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

" }}}
" filetype settings {{{
autocmd FileType html setlocal sw=2 ts=2 noexpandtab autoindent
autocmd FileType Makefile setlocal sw=2 ts=2 noexpandtab
autocmd FileType java setlocal sw=4 ts=4 expandtab
autocmd FileType Makefile setlocal sw=2 ts=2 noexpandtab
autocmd FileType Python setlocal sw=2 ts=2 expandtab

highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd FileType html,markdown,rst,txt,tex setlocal textwidth=80 colorcolumn=81 spell
autocmd BufEnter,BufNew *.log setlocal nowrap

" }}}
" Gvim {{{
if has('gui_running')
  set guifont=Monaco\ 11
  set linespace=2    "Better line-height
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif
" }}}
"Autocomplete  {{{
set dictionary+=/usr/share/dict/words
set tags+=.tags
set completeopt=menuone,menu,longest

" clang_complete
" ----------------------------------------------------
if empty($CLANG_COMPLETE_LIB) 
  let g:clang_complete_loaded = 1
endif

let g:clang_library_path    = $CLANG_COMPLETE_LIB
let g:clang_auto_select     = 1
let g:clang_complete_auto   = 0
let g:clang_snippets        = 1
let g:clang_snippets_engine = 'ultisnips'
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
map <silent> <F2> :tabprevious<Enter>
map <silent> <F3> :tabnext<Enter>
map <silent> <F4> :tabnew<Enter>
map <silent> <F5> :!ctags -f .tags -R -Q **/*.c **/*.cpp **/*.h<Enter>
map <silent> <F9> :NERDTreeToggle<Enter>
call togglebg#map("<F7>")

"Customized shortcuts
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <leader>e :Gstatus<CR>
nnoremap <silent> <leader>E :bd .git/index<CR>
nnoremap <silent> <leader>a :copen<CR>
nnoremap <silent> <leader>A :cclose<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>

"Great map which saves the file in sudo mode, something like `sudo !!`
cnoremap w!! w !sudo tee >/dev/null % 

ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab WQA wqa
ab Wqa wqa
"}}}
"vim-airline {{{
set laststatus=2
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='powerlineish'

"}}}
"NERDTree "{{{
" ---------------------------------------------------------------------
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
" }}}
"SuperTab | utisnipts {{{
let g:UltiSnipsExpandTrigger        = "<c-j>"
let g:UltiSnipsJumpForwardTrigger   = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:SuperTabDefaultCompletionType = "<C-n>"
"}}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
" Fugitive {{{
set diffopt+=vertical
set updatetime=250
" }}}
source ~/.vimrc.local
