-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("BufWritePre", {
--   pattern = "*",
--   command = "%s///",
-- })

vim.opt.guicursor = "n-v-c-i:block"
vim.opt.wrap = false
vim.opt.foldmethod = "marker"
vim.opt.scrolloff = 10
