local execute = vim.api.nvim_command
local fn = vim.fn

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
  use 'hrsh7th/nvim-compe'
  use 'sainnhe/everforest'
  use 'KKPMW/sacredforest-vim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'preservim/nerdcommenter'
  use 'thugcee/nvim-map-to-lua'
  use 'mhartington/formatter.nvim'
  use 'fladson/vim-kitty'
end)

