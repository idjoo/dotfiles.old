local execute = vim.api.nvim_command
local fn = vim.fn

-- Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

return require("packer").startup({
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		use("windwp/nvim-autopairs")

		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/nvim-cmp")
		use("saadparwaiz1/cmp_luasnip")
		use("L3MON4D3/LuaSnip")

		use("b3nj5m1n/kommentary")
		use("mhartington/formatter.nvim")
		use("nvim-treesitter/nvim-treesitter")
		use("sheerun/vim-polyglot")
		use("norcalli/nvim-colorizer.lua")
		use("vimwiki/vimwiki")
		use({
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"akinsho/bufferline.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				"famiu/bufdelete.nvim",
			},
		})
		use("github/copilot.vim")

		-- Languages
		use("fladson/vim-kitty")

		-- Colorscheme
		use("cocatrip/idjo.nvim")

		use("tpope/vim-fugitive")
		use("ellisonleao/glow.nvim")
		use("tpope/vim-surround")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
