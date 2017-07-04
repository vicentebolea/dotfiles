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
Plugin 'godlygeek/tabular'
Plugin 'SuperTab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ctrlp.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'Chiel92/vim-autoformat'
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
"set number
set incsearch
set hlsearch
set wildmenu

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

"Deal with html
autocmd FileType html setlocal sw=2 ts=2 et smartindent
autocmd FileType python,Makefile setlocal sw=2 ts=2 noexpandtab
autocmd FileType java setlocal sw=4 ts=4 expandtab
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
let g:clang_library_path    = $CLANG_COMPLETE_LIB
let g:clang_auto_select     = 1
let g:clang_complete_auto   = 0
let g:clang_snippets        = 1
let g:clang_snippets_engine = 'ultisnips'
"}}}
"Key-binding {{{
" ---------------------------------------------------------------------
let mapleader = ","

noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>
nnoremap Q <Nop>

" Tabs
map <silent> <F2> :tabprevious<Enter>
map <silent> <F3> :tabnext<Enter>
map <silent> <F4> :tabnew<Enter>
map <F5> :make <Enter>
map <silent> <F9> :NERDTreeToggle<Enter>
map <silent> <F8> :TagbarToggle<Enter>

"Customized shortcuts
nnoremap <silent> <space>w :w!<cr>
nnoremap <silent> <space>q :q<cr>
nnoremap <silent> <space>s :Gstatus<CR>
nnoremap <silent> <space>S :bd .git/index<CR>
nnoremap <silent> <space>d :Gdiff<CR>
nnoremap <silent> <space>a :copen<CR>
nnoremap <silent> <space>A :cclose<CR>
nnoremap <silent> <space>g :GitGutterToggle<CR>
nnoremap <silent> <space>t :SyntasticCheck<CR>
nnoremap <silent> <space>T :SyntasticReset<CR>
nnoremap <silent> <space>r :SyntasticToggleMode<CR>
nnoremap <silent> <space>/ :nohlsearch<CR>
nnoremap <silent> <space>u :ClearCtrlPCache<CR>

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
"IndentLine {{{
let g:indentLine_fileType = ['html','python','xml']
let g:indentLine_char = "'"
let g:html_indent_inctags = "html,body,head,tbody"
let g:rehash256 = 1
"}}}
"NERDTree "{{{
" ---------------------------------------------------------------------
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
" }}}
" Easy Motion "{{{
" ---------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
"}}}
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
let g:SuperTabDefaultCompletionType = "<C-X><C-U>"
"}}}
"Syntastic {{{

"Java options
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <Leader>t :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"C++ options
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['g++', 'cpplint']
" }}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
" Fugitive {{{
set diffopt+=vertical
set updatetime=250
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_enabled = 0
" }}}
" gist {{{
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
" }}}
" autoformat {{{
" }}}
source ~/.vimrc.local
