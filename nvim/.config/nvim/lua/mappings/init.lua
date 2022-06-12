-- Formatter
vim.api.nvim_set_keymap("n", "<leader>bf", "<cmd>Format<CR>", { silent = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })

-- Bufferline
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCyclePrev<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "]b", ":BufferLineCycleNext<CR>", { silent = true, noremap = true })

-- Bufdelete
vim.api.nvim_set_keymap("n", "<leader>bd", ":Bdelete<CR>", { silent = true, noremap = true })

-- vim-fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //3<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":diffget //2<CR>", {})

-- glow
vim.api.nvim_set_keymap("n", "<leader>mp", ":Glow<CR>", {})
