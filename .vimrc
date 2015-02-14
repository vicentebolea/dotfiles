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
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'ruby-matchit'
Plugin 'matchit.zip'
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
set term=xterm-256color

"## More options
set ruler
set number
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

"uncategorized
set exrc
set wildignore=*.o,*.class,*.pyc

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
set tags=~/.vim/tags/stl.tags
set tags+=.tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"}}}
"Key-binding {{{
" ---------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

nmap <F2> :tabprevious<Enter>
nmap <F3> :tabnext<Enter>
nmap <F4> :tabnew<Enter>
nmap <F5> :make <Enter>
nmap <F6> :set tags+=tags <Enter>
nmap <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <Enter>
nmap <F9> :NERDTreeToggle<Enter>
nmap <F8> :TagbarToggle<Enter>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>bd :bdelete<cr>
nmap <leader>ss :setlocal spell!<cr>
nnoremap <leader><space> :nohlsearch<CR>

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='powerlineish'

"}}}
"IndentLine {{{
let g:indentLine_fileType = ['html','python','xml']
let g:indentLine_char = '┊'
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
"
"}}}
" Tagbar "{{{
" ---------------------------------------------------------------------
let g:tagbar_compact = 1
let g:tagbar_width = 30
"
"}}}
"SuperTab | utisnipts {{{
let g:UltiSnipsExpandTrigger="<leader>e"
"}}}
