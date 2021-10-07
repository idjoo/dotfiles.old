require("map-to-lua").setup {
    default_formatter = "mapper"
}

vim.api.nvim_set_keymap("n", "<leader>ml", '<cmd>lua require("map-to-lua").convert_line()<cr>', { })
