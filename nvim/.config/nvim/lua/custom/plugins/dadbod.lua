return {
  "tpope/vim-dadbod",
  config = function()
    require("custom.configs.dadbod").setup()
  end,
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = {
    "DBUIToggle",
    "DBUI",
    "DBUIAddConnection",
    "DBUIFindBuffer",
    "DBUIRenameBuffer",
    "DBUILastQueryInfo",
  },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
    { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find buffer" },
    { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename buffer" },
    { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last query info" },
    { "<leader>q", "<Plug>(DBUI_ExecuteQuery)", mode = {"n","v"}, desc = "Execute query" },
  },
}
