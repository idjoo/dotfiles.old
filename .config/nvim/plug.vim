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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"""""""""""""""""""
""" colorscheme """
"""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

"""""""""""""""""""""""
""" completion-nvim """
"""""""""""""""""""""""
""" Use <Tab> and <S-Tab> to navigate through popup menu """
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""" trigger completion """
imap <Tab> <Plug>(completion_smart_tab)
imap <S-tab> <Plug>(completion_smart_s_tab)

""" completion when lsp on only """
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
""" completion for all buffer """
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_enable_snippet = 'UltiSnips'

"""""""""""""""""
""" neoformat """
"""""""""""""""""
nnoremap <leader>bf :Neoformat<CR>
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


""""""""""""""""
""" nvim-lsp """
""""""""""""""""
lua << EOF
require'lspconfig'.pyls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cssls.setup{}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
capabilities = capabilities,
}
EOF

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

"""""""""""""""""
""" ultisnips """
"""""""""""""""""
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"""""""""""""""""
""" telescope """
"""""""""""""""""
" Searches over files in a git folder. Note: This does not work outside a git repo folder.
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
" Search over files i your cwd current working directory.
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
" Search over variable references from your Language Server.
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" Find all the files in your nvim config.n
nnoremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/" }<CR>


""""""""""""""""""
""" treesitter """
""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
EOF
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()


