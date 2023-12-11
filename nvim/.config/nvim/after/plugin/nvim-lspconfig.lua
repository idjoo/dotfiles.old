local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig.configs")

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = "utf-8"
lspconfig.clangd.setup({
  capabilities = clangd_capabilities,
})
