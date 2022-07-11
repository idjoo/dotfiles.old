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

    -- lsp
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")

    -- completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
		use({'tzachar/cmp-tabnine',
			run='./install.sh',
			requires = 'hrsh7th/nvim-cmp',
		})

		use("onsails/lspkind-nvim")

    -- snippet
		use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- commenter
		use("numToStr/Comment.nvim")

    -- formatter
		use("mhartington/formatter.nvim")

    -- syntax highlight
		use("nvim-treesitter/nvim-treesitter")
		use("norcalli/nvim-colorizer.lua")
		use("nvim-orgmode/orgmode")
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

    -- ulti
		-- use("github/copilot.vim")

		-- languages
		use("lervag/vimtex")

		-- colorscheme
		use("cocatrip/idjo.nvim")

		use("tpope/vim-fugitive")
		use("lambdalisue/suda.vim")
		use("ellisonleao/glow.nvim")
		use("tpope/vim-surround")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
