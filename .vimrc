set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	set directory=.,$TEMP " Set path where VIM can write ;)

	"set rtp+=~/vimfiles/bundle/Vundle.vim
	"let path='~/vimfiles/bundle'
	"call vundle#begin(path)
else
    set directory=~/.vim/tmp//,$TEMP
	"set rtp+=~/.vim/bundle/Vundle.vim
	"call vundle#begin()
endif

" fzf runtime path
set rtp+=/usr/local/opt/fzf

call plug#begin()

" Some base plugins
"Plug 'gmarik/Vundle.vim'
Plug 'L9'
"Plug 'Shougo/unite.vim'

" Custom plugins
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " ga<obj><target>
Plug 'junegunn/vim-emoji'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion' " <leader><leader><motion>
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'edkolev/tmuxline.vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim' " <c-y>,
Plug 'tpope/vim-surround' " {c|d|y}s<obj><char>
Plug 'tpope/vim-abolish'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'

if !has('nvim')
	" Requires LUA
	Plug 'Shougo/neocomplete.vim'
endif

" Disabled plugins but interesting ones
"Plug 'morhetz/gruvbox'
"Plug 'nvie/vim-flake8'
"Plug 'chriskempson/base16-vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'Yggdroot/indentLine'
"Plug 'neomake/neomake'
"Plug 'elentok/plaintasks.vim'
"Plug 'Shougo/vinarise.vim'
"Plug 'tpope/vim-dispatch'
"Plug 'nanotech/jellybeans.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'Raimondi/delimitMate'
"Plug 'kchmck/vim-coffee-script'
"Plug 'leafgarland/typescript-vim'
"Plug 'itchyny/lightline.vim'
"Plug 'majutsushi/tagbar'
"Plug 'mustache/vim-mustache-handlebars'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line

if !exists("g:colors_name")
	syntax on
	colorscheme seoul256 " jellybeans, gruvbox, solarized

	if has("gui_running")
		set background=dark
	else
		set background=dark " light for jellybeans
	endif
endif

let mapleader=","

" Plugin configurations
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"
let base16colorspace=256
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
let g:airline_theme = 'base16' " gruvbox, badwolf (gruvbox), solarized
let g:seoul256_background = 234

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

if !has('nvim')
	set encoding=utf-8
endif

set tenc=utf-8
set fenc=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
"set textwidth=80
set colorcolumn=80,120
set pastetoggle=<F12>
set autowrite

set number
set relativenumber
set hidden
set linebreak
set ruler
set autoindent
"set smartindent
set expandtab
set smarttab
set cursorline

set nohlsearch
set incsearch
set ignorecase
set smartcase

set history=10000
set undolevels=200
"set ttyfast
"set t_Co=256

" Whitespace chars
"set listchars=tab:▸\ 
"set list!

" ctags files
"set tags+="./tags;,tags"

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
"highlight Comment cterm=italic
highlight htmlArg gui=italic
"highlight htmlArg cterm=italic

" Custom key mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap Y y$
no <leader>n :NERDTreeFocus<cr>
no <leader>\ :NERDTreeToggle<cr>
nn <tab> :Buffers<cr>
nn <space> <c-w>
nn <leader>ev :vsplit $MYVIMRC<cr>
nn <leader>sv :source $MYVIMRC<cr>
"nm <leader>r :TagbarToggle<cr>
"nm <leader>. :CtrlPTag<cr>
ino <leader><Tab> <c-n>
"no <F5> :Make<cr>
"ino jj <Esc>
"ino jk <Esc>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Insert mode movement
ino <C-k> <Up>
ino <C-j> <Down>
ino <C-h> <Left>
ino <C-l> <Right>

" Relative mode switching
autocmd InsertEnter * :call DisableRelNo()
autocmd InsertLeave * :call EnableRelNo()

" Fix Enter key (CR) map in cli, quickfix and selection
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Disable arrow keys (hardcore)
"map  <up>    <nop>
"imap <up>    <nop>
"map  <down>  <nop>
"imap <down>  <nop>
"map  <left>  <nop>
"imap <left>  <nop>
"map  <right> <nop>
"imap <right> <nop>

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
