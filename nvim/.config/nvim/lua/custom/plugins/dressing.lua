return {
  "stevearc/dressing.nvim",
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.select(...)
    end
  end,
  opts = {
    input = {
      enabled = false,
    },
    select = {
      enabled = true,
    },
  },
}
