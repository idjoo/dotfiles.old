local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "cssls",
  "clangd",
  "jdtls",
  "dockerls",
  "pylsp",
  "tsserver",
  "clangd",
  "groovyls",
  "jsonls",
  "sqlls",
  "bashls",
  "lemminx",
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.java_language_server.setup {
--   cmd = {"/home/vian/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh"}
-- }

lspconfig.sqlls.setup {
  filetypes = {
    "sql",
    "mysql",
    "prc",
  },
}
