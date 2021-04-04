""""""""""""""""
""" vim-plug """
""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'dylanaraps/wal.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neovim/nvim-lspconfig'
    Plug 'tpope/vim-commentary'
    Plug 'nvim-lua/completion-nvim'
    Plug 'sbdchd/neoformat'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

let mapleader = " "

"""""""""""""""""""""""
""" completion-nvim """
"""""""""""""""""""""""
""" Use <Tab> and <S-Tab> to navigate through popup menu """
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""" trigger completion """
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

""" completion when lsp on only """
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
""" completion for all buffer """
autocmd BufEnter * lua require'completion'.on_attach()

"""""""""""""""""
""" neoformat """
"""""""""""""""""
nnoremap <leader>bf :Neoformat<CR>


""""""""""""""""
""" nvim-lsp """
""""""""""""""""
lua << EOF
require'lspconfig'.pyls.setup{}
require'lspconfig'.clangd.setup{}
EOF
" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc







