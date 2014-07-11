set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set laststatus=2
set number
set tabstop=4
set background=dark
set backspace=indent,eol,start
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

"if has ('win32')
"    set guifont=Powerline_Consolas:h9:cANSI
"else
"    set guifont=Powerline\ Consolas\ 10
"endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'powerlineish'

if has ('win32unix') && !has('gui_running')
    let g:airline_powerline_fonts = 0
endif
