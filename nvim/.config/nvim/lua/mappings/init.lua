-- COK SAMPAH
-- vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>e', ':Lexplore<CR>', { noremap = true, silent = true })
-- save file as root
-- :w !sudo tee %
vim.api.nvim_set_keymap("c", "w!!", "<cmd>w !doas tee % > /dev/null<CR>", { silent = true })

-- Formatter
vim.api.nvim_set_keymap("n", "<leader>bf", "<cmd>Format<CR>", { silent = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })

-- Kommentary
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default<ESC>", {})

-- Bufferline
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCyclePrev<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "]b", ":BufferLineCycleNext<CR>", { silent = true, noremap = true })

-- Bufdelete
vim.api.nvim_set_keymap("n", "<leader>bd", ":Bdelete<CR>", { silent = true, noremap = true })

-- Windows
vim.api.nvim_set_keymap("n", "<C-o>", "<cmd>vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>split<CR>", { noremap = true })

-- vim-fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //3<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":diffget //2<CR>", {})

-- glow
vim.api.nvim_set_keymap("n", "<leader>mp", ":Glow<CR>", {})
