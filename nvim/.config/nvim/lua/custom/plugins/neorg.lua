return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
    { "folke/zen-mode.nvim" },
  },
  cmd = "Neorg",
  ft = "norg",
  keys = {
    { "<leader>nn", "<cmd>Neorg workspace notes<cr>", desc = "Open notes" },
    { "<leader>np", "<cmd>Neorg presenter start<cr>", desc = "Start presenter" },
  },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            folds = false,
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.keybinds"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "Neorg",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
