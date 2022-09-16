set nocompatible              " be iMproved, required
filetype off                  " required

if has("win32")
    set directory=.,$TEMP " Set path where VIM can write ;)
else
    set directory=~/.vim/tmp//
endif

" fzf runtime path
set rtp+=/usr/local/opt/fzf

call plug#begin()

" Custom plugins
if !has("win32")
    Plug 'junegunn/fzf', { 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " ga<obj><target>
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'tpope/vim-fugitive' ", { 'on': 'Gblame' }
Plug 'tpope/vim-surround' " {c|d|y}s<obj><char>
Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion' " <leader><leader><motion>
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'nelsyeung/twig.vim', { 'for': 'twig' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'xml']}
"Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'php'] } " <c-y>,
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
Plug 'scrooloose/nerdcommenter'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['sass', 'scss', 'less', 'css'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['sass', 'scss', 'less', 'css'] }
Plug 'groenewege/vim-less', { 'for': ['less'] } 
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterEnable' }
" Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
" Plug 'dag/vim-fish'
Plug 'mileszs/ack.vim'
" Plug 'ludovicchabant/vim-gutentags'

" Autocompletion (https://thevaluable.dev/vim-php-ide/)
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

"if !has('nvim') && !has("gui_running")
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
"elseif has("nvim")
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    
    "set termguicolors
"endif

" Disabled plugins but interesting ones
"Plug 'joonty/vdebug'
"Plug 'itchyny/calendar.vim'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'floobits/floobits-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'pangloss/vim-javascript' " Replaced by othree/yajs.vim
"Plug 'isRuslan/vim-es6'
"Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' }
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
"Plug 'leafgarland/typescript-vim'
"Plug 'itchyny/lightline.vim'
"Plug 'majutsushi/tagbar'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

call plug#end()            " required
filetype plugin indent on  " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

if !exists("g:colors_name")
    syntax on

    let g:seoul256_background = 235
    colo seoul256 " jellybeans, gruvbox, solarized

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
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { "mode": "passive" }
let g:PHP_outdentphpescape = 0
"let g:acp_enableAtStartup = 0
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
let g:notes_path = "~/Documents/notes.txt"
"let g:indentLine_color_term = 239
"let g:ctrlp_working_path_mode = 'w'
"let g:ctrlp_custom_ignore = '\v[\/]node_modules$'
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'base16' " gruvbox, badwolf (gruvbox), solarized

" Xdebug settings
let g:vdebug_options = {}
"let g:vdebug_options["path_maps"] = {"/data/web/public": "/Users/koos/Development/vandyck"}
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options["watch_window_style"] = "compact"
"let g:vdebug_options["server"] = "172.28.128.3"
let g:vdebug_options["port"] = 9000
let g:vdebug_options["ide_key"] = "VIM"

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Search Ag withouth using .gitignore
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-U', {}, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Gfind call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

if executable('ag')
    " let g:ackprg = 'ag --nogroup --nocolor --column'
    let g:ackprg = 'ag --vimgrep'
endif

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.lock set syntax=json

if !has('nvim')
    set encoding=utf-8
endif

set tenc=utf-8
set fenc=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
"set textwidth=80
set colorcolumn=80,120
set pastetoggle=<F12>
set lazyredraw
set virtualedit=block
set foldmethod=indent
set foldlevel=99
set completeopt=noinsert,menuone,noselect " menuone,preview
set nrformats=hex
set nostartofline

set number
set relativenumber
set numberwidth=2
set hidden
set linebreak
set ruler
set autoindent
set smartindent " Possibly disable?
set expandtab
set smarttab
set nocursorline " Let's try without this
set scrolloff=5
set history=10000
set undolevels=200

set nohlsearch
set incsearch
set ignorecase
set smartcase

" Whitespace chars
set listchars=tab:▸\ 
set list!

" ctags files
set tags=tags;

set wildmenu
set wildmode=list:longest,full
set wildignore+=*/node_modules/*

set undofile
set undodir=~/.vim/undodir
set clipboard=unnamed

set autoread autowrite
au FocusGained * :checktime

" Set wrap options
set nowrap
au FileType markdown setlocal wrap
au FileType html setlocal wrap

" Set gui stuff
if has("gui_running")
    " Set correct fonts. See https://github.com/powerline/fonts
    if has("win32")
        set guifont=Hack:h8
    else " Probably MacVim ;)
        set macligatures
        set guifont=SF\ Mono\ Medium:h12
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

" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
silent! if emoji#available()
let s:ft_emoji = map({
            \ 'c':          'baby_chick',
            \ 'clojure':    'lollipop',
            \ 'coffee':     'coffee',
            \ 'cpp':        'chicken',
            \ 'css':        'art',
            \ 'scss':       'purse',
            \ 'eruby':      'ring',
            \ 'gitcommit':  'soon',
            \ 'haml':       'hammer',
            \ 'help':       'angel',
            \ 'html':       'herb',
            \ 'php':        'elephant',
            \ 'xml':        'page_with_curl',
            \ 'java':       'older_man',
            \ 'javascript': 'monkey',
            \ 'make':       'seedling',
            \ 'markdown':   'book',
            \ 'perl':       'camel',
            \ 'python':     'snake',
            \ 'ruby':       'gem',
            \ 'scala':      'barber',
            \ 'sh':         'shell',
            \ 'slim':       'dancer',
            \ 'text':       'books',
            \ 'vim':        'poop',
            \ 'vim-plug':   'electric_plug',
            \ 'yaml':       'yum',
            \ 'yaml.jinja': 'yum',
            \ 'fish':       'fish'
            \ }, 'emoji#for(v:val)')

function! S_filetype()
    if empty(&filetype)
        return emoji#for('grey_question')
    else
        return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
endfunction

function! S_modified()
    if &modified
        return emoji#for('kiss').' '
    elseif !&modifiable
        return emoji#for('construction').' '
    else
        return ''
    endif
endfunction

function! S_fugitive()
    if !exists('g:loaded_fugitive')
        return ''
    endif
    let head = FugitiveHead()
    if empty(head)
        return ''
    else
        return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
endfunction

let s:braille = split('"⠉⠒⠤⣀', '\zs')
function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
endfunction

hi def link User1 TablineFill
let s:cherry = emoji#for('cherry_blossom')
function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    "return s:cherry.' [%n] %01.40f %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
    return s:cherry.' [%n] %{pathshorten(expand(''%:f''))} %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
endfunction

" Note that the "%!" expression is evaluated in the context of the
" current window and buffer, while %{} items are evaluated in the
" context of the window that the statusline belongs to.
set statusline=%!MyStatusLine()
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
imap jj <Esc>
no <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
no <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nn <tab> :Buffers<cr>
nn <C-p> :GFiles<cr>
nn <leader>p :Files<cr>
nn <space> <c-w>
nn <leader>ev :vsplit $MYVIMRC<cr>
nn <leader>sv :source $MYVIMRC<cr>
nn <leader>f :echo @%<cr>
nn <leader>ms :mks! .project<cr>
nn <leader>ss :source .project<cr>
nn <leader>/ /function.*
"nn zz :update<cr>
no <leader>o <c-i>
"nn <leader>r :TagbarToggle<cr>
"nm <leader>. :CtrlPTag<cr>
"ino <leader><Tab> <c-n>
"no <F5> :Make<cr>

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

command! Notes call Notes()
function! Notes()
    execute 'e' g:notes_path
endfun
