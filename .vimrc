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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'SuperTab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'majutsushi/tagbar'
call vundle#end()

" }}}
" Essentials {{{
" We drink from the defaults of vim
if filereadable($VIMRUNTIME . "/defaults.vim")
  source $VIMRUNTIME/defaults.vim
else
  set incsearch showcmd wildmenu
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
"let g:clang_snippets_engine = 'ultisnips'
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
nnoremap <silent> <F5> :!ctags -f .tags -R -Q **/*.c **/*.cpp **/*.h<Enter>
nnoremap <silent> <F8> :TagbarToggle<Enter>
nnoremap <silent> <F9> :NERDTreeToggle<Enter>
try
call togglebg#map("<F7>")
catch
endtry

"Customized shortcuts
nnoremap <silent> <leader>s :Gstatus<CR>
nnoremap <silent> <leader>d :Gdiff<CR>

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
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_skip_empty_sections = 1
let g:airline_section_y = 0
let g:airline_extensions = []
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
let g:SuperTabDefaultCompletionType = "<C-n>"
"}}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
" Fugitive {{{
set diffopt+=vertical
set updatetime=250
" }}}
" Local Config {{{
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
" }}}
