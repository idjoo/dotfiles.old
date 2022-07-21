-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })

-- Bufferline
vim.api.nvim_set_keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", { silent = true, noremap = true })

-- Bufdelete
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>Bdelete<cr>", { silent = true, noremap = true })

-- vim-fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>G<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>diffget //3<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>diffget //2<cr>", {})

-- glow
vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>Glow<cr>", {})
