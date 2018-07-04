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
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'SuperTab'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ctrlp.vim'
Plugin 'linediff.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
call vundle#end()
" }}}
" Main options {{{
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on

" This is VIM we don't need arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" }}}
" Interface settings {{{
"## 256 terminal
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_diffmode="high"
set background=dark
colorscheme solarized 
set term=screen-256color

"## More options
set ruler
set incsearch
set hlsearch
set wildmenu
set hidden  " Useful feature, to have multiples buffer open

"## Cursor
set cursorline
match Error /{{{\|}}}/
" }}}
" General settings {{{
"Set backup off since we are always using git :D
set noswapfile
set nobackup
set nowritebackup

"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw

"Indentation
set shiftwidth=2
set expandtab
set tabstop=2
set backspace=2
set foldmethod=marker
set cino=N-s

"uncategorized
set exrc
set wildignore=*.o,*.class,*.pyc
set mouse=a

" }}}
" filetype settings {{{
autocmd FileType html setlocal sw=2 ts=2 et smartindent
autocmd FileType Makefile setlocal sw=2 ts=2 noexpandtab
autocmd FileType java setlocal sw=4 ts=4 expandtab
autocmd FileType python setlocal sw=2 ts=2 expandtab
autocmd BufNewFile,BufRead *.log setlocal nowrap

highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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

noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>
nnoremap Q <Nop>

" Tabs
map <silent> <F2> :tabprevious<Enter>
map <silent> <F3> :tabnext<Enter>
map <silent> <F4> :tabnew<Enter>
map <silent> <F9> :NERDTreeToggle<Enter>

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
" Tagbar "{{{
" ---------------------------------------------------------------------
let g:tagbar_compact = 1
let g:tagbar_width = 30
"
"}}}
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
" gist {{{
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_post_anonymous = 0
" }}}
source ~/.vimrc.local
