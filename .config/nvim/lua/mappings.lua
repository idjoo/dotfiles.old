vim.g.mapleader = ' '
-- vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<c-h>', '<c-W>h', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<c-j>', '<c-W>j', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<c-k>', '<c-W>k', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<c-l>', '<c-W>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':Lexplore<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>bf', ':Format<CR>', { silent = true })

vim.api.nvim_set_keymap('n','<leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>fb', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>fh', ':Telescope help_tags<CR>', {noremap = true})

vim.cmd([[
autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufNewFile *.go 0r ~/.config/nvim/templates/skeleton.go
]])
