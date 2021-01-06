" Minimal vim config for remote servers
set tabstop=4 autoindent shiftwidth=4 expandtab
set smartcase ignorecase
set incsearch
nnoremap q b
nnoremap Q B
vnoremap q b
vnoremap Q B
" Make comments visible in Putty
set background=dark
hi Visual term=reverse cterm=reverse guibg=Grey
colorscheme desert

"Easy quotes life
inoremap "" ""<left>
inoremap '' ''<left>
inoremap () ()<left>
inoremap {} {}<left>
inoremap [] []<left>
inoremap <> <><left>
inoremap <C-a> <right>
nmap <Leader>' ysiw'
nmap <Leader>" ysiw"

" Alt esc
imap jk <Esc>
imap kj <Esc>

" Alt leader to space
let mapleader = " "
