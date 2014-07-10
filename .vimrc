syntax on
set laststatus=2
set number
set tabstop=4
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

if has ('win32')
    set guifont=Powerline_Consolas:h9:cANSI
else
    set guifont=Powerline\ Consolas\ 10
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'powerlineish'

if has ('win32unix') && !has('gui_running')
    let g:airline_powerline_fonts = 0
endif
