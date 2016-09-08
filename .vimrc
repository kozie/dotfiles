set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	set directory=.,$TEMP " Set path where VIM can write ;)

	"set rtp+=~/vimfiles/bundle/Vundle.vim
	"let path='~/vimfiles/bundle'
	"call vundle#begin(path)
"else
	"set rtp+=~/.vim/bundle/Vundle.vim
	"call vundle#begin()
endif

call plug#begin()

" Some base plugins
"Plug 'gmarik/Vundle.vim'
Plug 'L9'
"Plug 'Shougo/unite.vim'

" Custom plugins
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'nvie/vim-flake8'
"Plug 'Align'
"Plug 'Shougo/vinarise.vim'

if !has('nvim')
	" Requires LUA
	Plug 'Shougo/neocomplete.vim'
endif

" Disabled plugins but interesting ones
" Plug 'tpope/vim-dispatch'
" Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
" Plug 'Raimondi/delimitMate'
" Plug 'kchmck/vim-coffee-script'
" Plug 'leafgarland/typescript-vim'
" Plug 'itchyny/lightline.vim'
" Plug 'majutsushi/tagbar'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'jdonaldson/vaxe'

" All of your Plugins must be added before the following line
call plug#end()            " required
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
colorscheme jellybeans " gruvbox, jellybeans, solarized

if has("gui_running")
  set background=dark
else
  set background=light "light
endif

let mapleader=","

" Plugin configurations
let python_highlight_all = 1
let g:indentLine_color_term = 239
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = '\v[\/]node_modules$'
let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ack_autoclose = 1
let g:PHP_outdentphpescape = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans' " 'badwolf' (gruvbox), 'jellybeans', 'solarized'

" Autocomplete settings
if !has('nvim')
	let g:acp_enableAtStartup = 0
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set encoding=utf-8
set tenc=utf-8
set fenc=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
"set textwidth=80
set pastetoggle=<F12>
set autowrite

set t_Co=256

set number
set relativenumber
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

set history=10000
set undolevels=200
set ttyfast

" Whitespace chars
"set listchars=tab:▸\ 
"set list!

" ctags files
set tags+="./tags;,tags"

set wildmenu
set wildmode=list:longest,full
set wildignore+=*/node_modules/*

set foldmethod=indent
set foldlevel=99

" Set gui stuff
if has("gui_running")
  " Set correct fonts. See https://github.com/powerline/fonts
  if has("win32")
    set guifont=Fira\ Code:h9
  else " Probably MacVim ;)
    set macligatures
    set guifont=Fira\ Code:h12
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

" Italic stuff
highlight Comment gui=italic
" highlight Comment cterm=italic
highlight htmlArg gui=italic
" highlight htmlArg cterm=italic

" Custom key mappings
no <leader>n :NERDTreeFocus<cr>
no <leader>\ :NERDTreeToggle<cr>
nn <leader>r :call NumberToggle()<cr>
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

" Relative mode switching
autocmd InsertEnter * :call DisableRelNo()
autocmd InsertLeave * :call EnableRelNo()

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

" Python syntactic sugar
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab

" Function to toggle between line numbers and relativenumbers
function! NumberToggle()
	if(&relativenumber == 1)
		call DisableRelNo()
	else
		call EnableRelNo()
	endif
endfunc

function! EnableRelNo()
	set number
	set relativenumber
endfunc

function! DisableRelNo()
	set number
	set norelativenumber
endfunc
