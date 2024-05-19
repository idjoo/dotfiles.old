return {
	"neovim/nvim-lspconfig",
	config = function() end,
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{
			"williamboman/mason.nvim",
			config = function(plugin, opts)
				local on_attach = require("plugins.configs.lspconfig").on_attach
				local capabilities = require("plugins.configs.lspconfig").capabilities

				local lspconfig = require("lspconfig")

				-- List of servers to install
				local servers = {
					"dockerls",
					"groovyls",
					"yamlls",
					"vimls",
				}

				require("mason").setup(opts)

				require("mason-lspconfig").setup({
					ensure_installed = servers,
				})

				require("mason-lspconfig").setup_handlers({
					function(server_name)
						lspconfig[server_name].setup({
							on_attach = function(client, bufnr)
								on_attach(client, bufnr)
							end,
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function() end,
					["yamlls"] = function()
						lspconfig.yamlls.setup({
							settings = {
								yaml = {
									format = {
										enable = true,
									},
									validate = true,
									hover = true,
									completion = true,
									schemas = {
										["https://json.schemastore.org/mason-registry.json"] = "/packages/**/package.yaml",
									},
								},
							},
						})
					end,
				})
			end,
		},
		"williamboman/mason-lspconfig.nvim",
	},
}
