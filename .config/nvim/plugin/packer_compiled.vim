" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/cocatrip/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cocatrip/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cocatrip/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cocatrip/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cocatrip/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/cocatrip/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
