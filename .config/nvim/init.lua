require('plugins')
require('mappings')
require('options')
require('lsp')

-- plugin config
require('plugin_config.nvim-compe')
require('plugin_config.nerd-commenter')
require('plugin_config.formatter-nvim')
require('plugin_config.nvim-map-to-lua')

-- lsp
require('lsp.python_ls')
require('lsp.clangd_ls')
