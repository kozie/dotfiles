set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	set directory=.,$TEMP " Set path where VIM can write ;)

	set rtp+=~/vimfiles/bundle/Vundle.vim
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

" Custom plugins
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'Align'

" Disabled plugins but interesting ones
" Plugin 'morhetz/gruvbox'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'Raimondi/delimitMate'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'jdonaldson/vaxe'
" Plugin 'groenewege/vim-less'
" Plugin 'tpope/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :h Vundle

" Put your non-Plugin stuff after this line
syntax on
colorscheme jellybeans

if has("gui_running")
  set background=dark
else
  set background=dark "light
endif

let mapleader=","

" Plugin configurations
let python_highlight_all = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1  
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ctrlp_working_path_mode = 'w'
let g:ack_default_options = " -H --nocolor --nogroup --column"
let g:ack_autoclose = 1
let g:PHP_outdentphpescape = 0
let g:neocomplcache_enable_at_startup = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

set encoding=utf-8
set tenc=utf-8
set laststatus=2
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set textwidth=80
set pastetoggle=<F12>
set autowrite

set t_Co=256

set number
set hidden
set linebreak
set ruler
set autoindent
set smartindent
set noexpandtab
set smarttab
set cursorline

set nohlsearch
set incsearch
set ignorecase
set smartcase

set history=200
set undolevels=200
set ttyfast

" Whitespace chars
"set listchars=tab:▸\ 
"set list!

" ctags files
set tags+=./tags;

set wildmenu
set wildmode=list:longest,full

set foldmethod=indent
set foldlevel=99

" Set gui stuff
if has("gui_running")
  " Set correct fonts. See https://github.com/powerline/fonts
  if has("win32")
    set guifont=Dejavu_Sans_Mono_for_Powerline:h9
  else " Probably MacVim ;)
    set guifont=Meslo_LG_S_DZ_Regular_for_Powerline:h11
  endif
  
  " set term=xterm-256color
  " Set window size
  set lines=59 columns=149
  
  " Remove all tool-, menu- and scrollbars -_-'
  set guioptions+=mTLlRrb
  set guioptions-=mTLlRrb
  
  " Disable that damn mouse!
  set mouse=c
  
  " sets the language of the menu (gvim) and messages / ui (vim)
  set langmenu=en_US.UTF-8
  let $LANG = 'en'
else " If no GUI
  " Enable mouse (for scrolling)
  set mouse=a
  
  " Fix block cursor thingy under screen/cygwin
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

" Custom key mappings
no <leader>n :NERDTreeFocus<cr>
no <leader>\ :NERDTreeToggle<cr>
nn <tab> :b<space>
nn <space> <c-w>
nn <leader>ev :vsplit $MYVIMRC<cr>
nn <leader>sv :source $MYVIMRC<cr>
"nm <leader>r :TagbarToggle<cr>
nm <leader>. :CtrlPTag<cr>
nn <CR> o<esc>
nn <leader><CR> O<esc>
ino <leader><Tab> <c-n>
no <F5> :Make<cr>
ino jj <Esc>
ino jk <Esc>
no j gj
no k gk

" Fix Enter key (CR) map in cli, quickfix and selection
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Set nmake for windows environment
if has("win32")
  set makeprg=mingw32-make
endif

" Function for lightline
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

if has("gui_running")
  " let llColorscheme = 'solarized_light'
  let llColorscheme = 'jellybeans'
else
  let llColorscheme = 'jellybeans'
endif

let g:lightline = {
  \ 'colorscheme': llColorscheme,
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'component_function': {
  \   'mode': 'MyMode'
  \ },
  \ 'separator': { 'left': "", 'right': "" },
  \ 'subseparator': { 'left': "", 'right': "" }
  \ }

" Python syntactic sugar
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab
