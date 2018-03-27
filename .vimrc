set tabstop=4 autoindent shiftwidth=4 expandtab number
set smartcase ignorecase
"apply plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'jelera/vim-javascript-syntax'
call plug#end()
let g:SuperTabDefaultCompletionType = "context"
"Let's learn Vim the hard way, and disable arrow keys in COMMAND
map <up> <nop>
map <down> <nop>
map <right> <nop>
map <left> <nop>
"Custom key shortcuts
nmap <F2> :set relativenumber! <CR>
imap <F2> <Esc>:set relativenumber! <CR> i
"Experimental remap for easy navigating
nnoremap q b
nnoremap Q B
