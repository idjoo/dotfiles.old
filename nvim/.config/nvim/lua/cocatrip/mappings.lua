vim.keymap.set('n', 'x', '"_x')

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<c-a>", "gg<s-v>G")

-- Bufferline
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { silent = true, noremap = true })

-- Bufdelete
vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", { silent = true, noremap = true })

-- vim-fugitive
vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>")
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //3<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<cr>")

-- glow
vim.keymap.set("n", "<leader>mp", "<cmd>Glow<cr>")
