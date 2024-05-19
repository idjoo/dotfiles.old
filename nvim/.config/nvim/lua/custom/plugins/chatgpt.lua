return {
  "jackMort/ChatGPT.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup {
      -- api_key_cmd = "pass show openai/token",
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
