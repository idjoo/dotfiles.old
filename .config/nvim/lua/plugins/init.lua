local execute = vim.api.nvim_command
local fn = vim.fn

-- Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'kabouzeid/nvim-lspinstall'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'b3nj5m1n/kommentary'
    use 'thugcee/nvim-map-to-lua'
    use 'mhartington/formatter.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sheerun/vim-polyglot'
    use 'norcalli/nvim-colorizer.lua'
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'akinsho/bufferline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'famiu/bufdelete.nvim'
        }
    }

    -- Languages
    use 'fatih/vim-go'
    use 'fladson/vim-kitty'

    -- Colorscheme
    use 'cocatrip/onedark.nvim'
end)
