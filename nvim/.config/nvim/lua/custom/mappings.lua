---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>b"] = "",
		["<leader>fw"] = "",
		["<C-/>"] = "",
	},
	v = {
		["<C-/>"] = "",
	},
}

M.general = {
	n = {
		["<leader>bn"] = { "<cmd>enew<CR>", "new buffer" },
		["<leader>bf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"formatting",
		},
	},
	v = {
		["<leader>64"] = { "c<c-r>=system('base64 --decode', @\")<cr><esc>", "base64 decode" },
		["_c"] = { "<cmd>center<cr>", "align center" },
	},
  i = {
     ["kj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

M.telescope = {
	n = {
		["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "live grep" },
	},
}

M.comment = {
	n = {
		["gcc"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["gc"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

M.lspconfig = {}

return M
