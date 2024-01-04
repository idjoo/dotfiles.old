---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = {},

  hl_override = highlights.override,
  hl_add = highlights.add,

  changed_themes = {
    catppuccin = {
      base_30 = {
        white = "#abb2bf",
        darker_black = "#202a21",
        black = "#293329",
        black2 = "#353f35",
        one_bg = "#3d473d",
        one_bg2 = "#454f45",
        one_bg3 = "#495349",
        grey = "#5a695a",
        grey_fg = "#6d7d6d",
        grey_fg2 = "#8a998a",
        light_grey = "#8a998a",
        red = "#b85e5e",
        baby_pink = "#DE8C92",
        pink = "#ff75a0",
        line = "#424f42",
        green = "#95c95e",
        vibrant_green = "#7eca9c",
        nord_blue = "#81A1C1",
        blue = "#62a0e0",
        yellow = "#d8b85a",
        sun = "#EBCB8B",
        purple = "#c678dd",
        dark_purple = "#be5e9e",
        teal = "#4baeae",
        orange = "#fca2aa",
        cyan = "#56b6c2",
        statusline_bg = "#3b473b",
        lightbg = "#354135",
        pmenu_bg = "#62a0e0",
        folder_bg = "#62a0e0",
      },
      base_16 = {
        base00 = "#293329",
        base01 = "#3e4d3e",
        base02 = "#4b5e4b",
        base03 = "#5f6d5f",
        base04 = "#738b73",
        base05 = "#8ca68c",
        base06 = "#a0b5a0",
        base07 = "#b4ccb4",
        base08 = "#b85e5e",
        base09 = "#d19a66",
        base0A = "#d8b85a",
        base0B = "#95c95e",
        base0C = "#4baeae",
        base0D = "#62a0e0",
        base0E = "#c678dd",
        base0F = "#be5046",
      },
    },
  },
  statusline = {
    separator_style = "block",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
