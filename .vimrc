" vim : foldmethod=marker :
" AUTHOR: Vicente Adolfo Bolea Sanchez
"
" Bundle {{{
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'SuperTab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'ruby-matchit'
Plugin 'matchit.zip'
Plugin 'bruno-/vim-ruby-fold'
Plugin 'Rip-Rip/clang_complete'
call vundle#end()
" }}}
" Main options {{{
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on
" }}}
" Interface settings {{{
"## 256 terminal
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme badwolf
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
let g:clang_complete_auto   = 0
let g:clang_snippets        = 1
let g:clang_snippets_engine = 'ultisnips'
"}}}
"Key-binding {{{
" ---------------------------------------------------------------------
let mapleader = ","

nnoremap <silent> <F2> :tabprevious<Enter>
nnoremap <silent> <F3> :tabnext<Enter>
nnoremap <silent> <F4> :tabnew<Enter>
nnoremap <F5> :make <Enter>
nnoremap <silent> <F9> :NERDTreeToggle<Enter>
nnoremap <silent> <F8> :TagbarToggle<Enter>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap Q <Nop>

"Great map which saves the file in sudo mode, something like `sudo !!`
cnoremap w!! w !sudo tee >/dev/null % 

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif 

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
"let g:airline#extensions#tabline#enabled = 1
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
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"}}}
"Syntastic {{{
noremap <Leader>t :SyntasticCheck<CR>
nnoremap <Leader>T :SyntasticToggleMode<CR>

"Java options
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <Leader>t :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"C++ options
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 '
" }}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
"
" lets try
"
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
