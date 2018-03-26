set tabstop=4 autoindent shiftwidth=4 expandtab number

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
call plug#end()
let g:SuperTabDefaultCompletionType = "context"
