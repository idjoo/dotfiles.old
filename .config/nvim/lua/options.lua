local o, bo, wo = vim.o, vim.bo, vim.wo

vim.cmd([[
    colorscheme green
    filetype plugin on
    set termguicolors
]])

-- global options
o.hlsearch = false
o.hidden = true
o.writebackup = false
o.incsearch = true
o.scrolloff = 10
o.showmode = false
o.completeopt = "menuone,noinsert,noselect"
o.colorcolumn = '80'
o.signcolumn = 'yes'
o.cmdheight = 2
o.updatetime = 50
o.shortmess = 'actIoOsT'
o.clipboard = 'unnamedplus'
o.mouse = 'nicr'

-- window-local options
wo.number = true
wo.relativenumber = true
wo.wrap = false

-- buffer-local options
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.smartindent = true
bo.swapfile = false

-- netrw options
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
