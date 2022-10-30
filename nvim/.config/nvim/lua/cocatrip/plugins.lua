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
    use("kyazdani42/nvim-web-devicons") -- file icons
    use("windwp/nvim-autopairs") -- autopairs
    use("nvim-lualine/lualine.nvim") -- statusline
    use("norcalli/nvim-colorizer.lua") -- colorizer

    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = {
        "famiu/bufdelete.nvim",
      },
    })

    -- telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-lua/plenary.nvim")

    -- lsp
    use("onsails/lspkind-nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("glepnir/lspsaga.nvim")

    -- snippet
    use("L3MON4D3/LuaSnip")

    -- completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use({ 'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp',
    })

    -- syntax highlighting
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    -- commenter
    use("numToStr/Comment.nvim")

    -- ulti
    -- use("github/copilot.vim")

    -- languages
    use("lervag/vimtex")

    -- colorscheme
    use("cocatrip/idjo.nvim")

    use("ellisonleao/glow.nvim") -- markdown preview
    use("tpope/vim-surround") -- surround word using pair
    use("kdheepak/lazygit.nvim") -- lazygit
    use("tpope/vim-fugitive") -- git helper
    use("folke/lsp-colors.nvim") -- highlight for lsp color
    use("ThePrimeagen/refactoring.nvim")
  end,

  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
