" Vim-Plug
call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'    
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'tmhedberg/SimpylFold'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'nvie/vim-flake8'
    
    " Nerd Tree and its plugin
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/nerdtree-project-plugin'
    Plug 'PhilRunninger/nerdtree-buffer-ops'

    Plug 'lilydjwg/colorizer'
    Plug 'dylanaraps/wal.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

colorscheme wal

" Settings
set encoding=utf-8
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
set foldmethod=indent
set foldlevel=99
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on

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

" Mapping
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <leader>f :Prettier<CR>
vmap <leader>ff <Plug>(coc-format-selected)
nmap <leader>ff <Plug>(coc-format-selected)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

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

"" Plugin config
" TeX config
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" SimpylFold
let g:SimpylFold_docstring_preview=1

" Coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" fzf
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
