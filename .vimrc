set tabstop=4 autoindent shiftwidth=4 expandtab number
set smartcase ignorecase
set incsearch
set backspace=indent,eol,start
set listchars=tab:▸\ ,trail:·
set list

" Fix plug on new system
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

" Apply plugins
autocmd FileType vim let b:vcm_tab_complete = 'vim'
call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
" Plug 'davidhalter/jedi-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe/'
Plug 'christoomey/vim-tmux-navigator'
Plug 'stevearc/vim-arduino'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
" Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()
let g:SuperTabDefaultCompletionType = "context"
let g:go_fmt_command = "goimports"

"Let's learn Vim the hard way, and disable arrow keys in NORMAL mode
nmap <up> <nop>
nmap <down> <nop>
nmap <right> <nop>
nmap <left> <nop>

"Custom key shortcuts
nmap <F2> :call ToggleNumbers() <CR>
let &relativenumber = 1
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

" Alt esc
imap jk <Esc>
imap kj <Esc>

" Alt leader to space
let mapleader = " "

" Jump definition and references
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>

"Jump previous location
nnoremap <Leader>b <c-o>
nnoremap <Leader>n <c-i>

nnoremap <F3> :set invnumber<CR>
imap <F3> <Esc>:set invnumber <CR>
nnoremap <c-o> :NERDTreeToggle <CR>

" Annoying :Wq issue
command Wq :wq <CR>

"Jump next tab
map <c-i> :tabn<CR>

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

" C Compile and run
" map <F5> :w <CR> :!gcc % -o %< && ./%< <CR>

" Redraw screen
" map <F5> :redraw! <CR>
" Execute on ESP32
map <F5> :!rshell -p /dev/ttyUSB0 cp % /pyboard/ && rshell -p /dev/ttyUSB0 repl<CR>

" Theme
autocmd vimenter * colorscheme gruvbox
let &background="dark"
nmap <Leader>bg :call ToggleBackground() <CR>
function! ToggleBackground()
    if (&background == "dark")
        let &background = "light"
    else
        let &background = "dark"
    endif
endfunction
