set tabstop=4 autoindent shiftwidth=4 expandtab number
set smartcase ignorecase
set incsearch
"Apply plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" C Plugins
Plug 'Valloric/YouCompleteMe/'
call plug#end()
let g:SuperTabDefaultCompletionType = "context"
"source ~/.vim/plugged/vim-ipython/ftplugin/python/ipy.vim
"Let's learn Vim the hard way, and disable arrow keys in NORMAL mode
nmap <up> <nop>
nmap <down> <nop>
nmap <right> <nop>
nmap <left> <nop>
"Custom key shortcuts
nmap <F2> :call ToggleNumbers() <CR>

function! ToggleNumbers()
    if (&relativenumber == 1 && &number == 1)
        let &relativenumber = 0
        let &number = 0
    elseif (&relativenumber == 0 && &number == 1)
        let &relativenumber = 1
    elseif (&relativenumber == 0 && &number == 0)
        let &number = 1
    endif
endfunction

nmap <F3> :set invnumber<CR>
imap <F3> <Esc>:set invnumber <CR>

nmap <c-o> :NERDTreeToggle <CR>
"Experimental remap for easy navigating
nnoremap q b
nnoremap Q B
vnoremap q b
vnoremap Q B

nnoremap dq db
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
noremap <Leader>/ :Commentary<cr>
set backspace=indent,eol,start

"Code folding
" set foldmethod=indent

" C Autocomplete
set pumheight=20             " so the complete menu doesn't get too big
set completeopt=menu,longest " menu, menuone, longest and preview
let g:SuperTabDefaultCompletionType='context'
let g:clang_complete_auto=0  " I can start the autocompletion myself, thanks..
let g:clang_snippets=1       " use a snippet engine for placeholders
let g:clang_snippets_engine='ultisnips'
let g:clang_auto_select=2    " automatically select and insert the first match
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
