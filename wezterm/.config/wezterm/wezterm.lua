local wezterm = require 'wezterm';

return {
  use_fancy_tab_bar = false,

  tab_bar_at_bottom = true,

  font = wezterm.font_with_fallback({
    "Dank Mono",
  }),

  font_size = 11.5,

  harfbuzz_features = {"zero"},

  colors = {
    foreground = "#c5cac5",
    background = "#293329",

    ansi = {
      "#60695f",
      "#e29288",
      "#a4cc78",
      "#dbb66d",
      "#7eb9d0",
      "#c08da4",
      "#71ca98",
      "#c6cac4"
    },

    brights = {
      "#60795f",
      "#e2a288",
      "#a4dc78",
      "#dbc66d",
      "#7ec9d0",
      "#c09da4",
      "#71da98",
      "#c6dac4"
    },

    tab_bar = {
      background = "#1f281f",

      active_tab = {
        bg_color = "#445444",
        fg_color = "#c0c0c0",

        intensity = "Normal",

        underline = "None",

        italic = false,

        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#313E31",
        fg_color = "#808080",
      },

      inactive_tab_hover = {
        bg_color = "#445444",
        fg_color = "#909090",
        italic = true,
      },

      new_tab = {
        bg_color = "#313E31",
        fg_color = "#808080",
      },
      new_tab_hover = {
        bg_color = "#445444",
        fg_color = "#909090",
        italic = true,
      }
    },
  }
}
