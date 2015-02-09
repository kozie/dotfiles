set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	set rtp+=~/vimfiles/bundle/Vundle.vim
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
" Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
" Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'jdonaldson/vaxe'
" Plugin 'leafo/moonscript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
colorscheme jellybeans
syntax on

let mapleader=","

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'component_function': {
  \   'mode': 'MyMode'
  \ },
  \ 'separator': { 'left': "", 'right': "" },
  \ 'subseparator': { 'left': "", 'right': "" }
  \ }

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2  
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ctrlp_working_path_mode = 'w'
let g:ack_default_options = " -H --nocolor --nogroup --column"
let g:PHP_outdentphpescape = 0

set encoding=utf-8
set laststatus=2
set tabstop=2
set shiftwidth=2
set background=dark
set bg=dark
set backspace=indent,eol,start
set textwidth=0
set pastetoggle=<F12>

set t_Co=256
" set term=xterm-256color

set number
set hidden
set linebreak
set ruler
set autoindent
set smartindent
set expandtab
set smarttab
set cursorline

set nohlsearch
set incsearch
set ignorecase
set smartcase

set history=200
set undolevels=200
set ttyfast 

set tags=./tags,tags;

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

" Set gui stuff
if has("gui_running")
  if has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h9
  else
    " set guifont=Meslo_LG_S_DZ_Regular_for_Powerline:h11
  endif

  set guioptions+=mTLlRrb
  set guioptions-=mTLlRrb
endif

" Custom key mappings
map <C-\> :NERDTreeToggle<cr>
map <leader>\ :NERDTree<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap <leader>r :TagbarToggle<cr>
nmap <leader>. :CtrlPTag<cr>
inoremap <leader><Tab> <c-n>
no <F5> :make<cr>
inoremap jj <Esc>
inoremap jk <Esc>

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" MyMode function for lightline
function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Set nmake for windows environment
if has("win32")
  set makeprg=mingw32-make
endif
