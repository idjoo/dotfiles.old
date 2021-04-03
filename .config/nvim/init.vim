set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set incsearch
"set termguicolors
set scrolloff=8
set noshowmode
"set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c
set clipboard=unnamed
set mouse=nicr
if has('mouse')
    set mouse=a
endif

" Remove whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Vim-Plug
call plug#begin('~/.vim/plugged')
    Plug 'dylanaraps/wal.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tweekmonster/startuptime.vim'
call plug#end()

colorscheme wal

let mapleader = " "
vnoremap <leader>y "+y




