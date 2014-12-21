set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'chriskempson/base16-vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
"Plugin 'FuzzyFinder'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
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
colorscheme jellybeans " solarized
syntax on

set encoding=utf-8
set laststatus=2
set tabstop=2
set shiftwidth=2
set background=dark
set backspace=indent,eol,start

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

set textwidth=0
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set guifont=Meslo_LG_S_DZ_Regular_for_Powerline:h11
set guioptions-=R
set guioptions-=L

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish' " 'solarized'

" Set terminal
if !has("gui_running")
  set t_Co=256
  set term=screen-256color
endif

" Custom key mappings
map <C-\> :NERDTreeToggle<CR>

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
