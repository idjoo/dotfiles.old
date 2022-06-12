vim.cmd([[
    filetype plugin on
]])

-- global options
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.writebackup = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.completeopt = "menuone,noselect"
vim.o.colorcolumn = '80'
vim.o.signcolumn = 'yes'
vim.o.cmdheight = 1
vim.o.updatetime = 50
vim.o.shortmess = 'actIoOsT'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'nicr'
vim.o.laststatus = 3

-- window-local options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

-- buffer-local options
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.swapfile = false

vim.opt.list = false
vim.opt.listchars = {
}
