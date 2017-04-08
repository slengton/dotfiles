set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'
call plug#end()

" general
set tabstop=2
set shiftwidth=2
set expandtab
set number
syntax on

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" color scheme
colorscheme Tomorrow-Night-Bright

" supertab
let g:SuperTabDefaultCompletionType = "context"

" set default clipboard register to use same as OSX
set clipboard=unnamed
