return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		{
			"nvimtools/none-ls.nvim",
			config = function(plugin, opts)
				local null_ls = require("null-ls")

				null_ls.setup({
					sources = {
						-- lua
						null_ls.builtins.formatting.stylua,

						-- groovy
						null_ls.builtins.formatting.npm_groovy_lint,
					},
				})
			end,
		},
	},
	opts = {
		ensure_installed = {
			"yamlfmt",
		},
		automatic_installation = true,
		handlers = {},
	},
}
