local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

-- mappings
vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
end)

vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")

vim.keymap.set("n", "<leader>fb", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

