" Vim-Plug
call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'    
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

" Settings
set nocompatible
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed

if has('python3')
  python3 import sys
endif

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

if has('mouse')
  set mouse=a
endif

map Y y$
nnoremap <C-L> :nohl<CR><C-L>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Cursor Fix
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Moving beetween splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clipboard
vnoremap <leader>y "+y

" TeX config
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

