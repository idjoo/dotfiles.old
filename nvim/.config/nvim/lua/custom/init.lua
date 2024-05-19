local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufReadPost","FileReadPost"}, {
  pattern = "*",
  command = "normal zR",
})

vim.opt.foldmethod="expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.opt.guicursor = "n-v-c-i:block"
vim.opt.wrap = false
vim.opt.scrolloff = 10

vim.cmd([[packadd justify]])
