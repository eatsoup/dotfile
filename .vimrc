set tabstop=2 autoindent shiftwidth=2 expandtab number
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
call plug#end()
