-- Formatter
vim.api.nvim_set_keymap("n", "<leader>bf", "<cmd>Format<cr>", { silent = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })

-- Bufferline
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCyclePrev<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "]b", ":BufferLineCycleNext<cr>", { silent = true, noremap = true })

-- Bufdelete
vim.api.nvim_set_keymap("n", "<leader>bd", ":Bdelete<cr>", { silent = true, noremap = true })

-- vim-fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //3<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":diffget //2<cr>", {})

-- glow
vim.api.nvim_set_keymap("n", "<leader>mp", ":Glow<cr>", {})
