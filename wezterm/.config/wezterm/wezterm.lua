local wezterm = require("wezterm")
local config = {}

config.default_domain = "local"

config.enable_wayland = false

config.color_scheme = "Catppuccin Mocha"

config.colors = {
	foreground = "#c5cac5",
	background = "#293329",
}

config.window_padding = {
	left = 6,
	right = 6,
	top = 6,
	bottom = 6,
}

config.font = wezterm.font_with_fallback({
	"DankMono Nerd Font Mono",
	"FiraCode Nerd Font Mono",
})

config.font_size = 12.0
config.line_height = 1.0
config.cell_width = 1.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.audible_bell = "Disabled"

-- config.background = {
-- 	{
-- 		source = { File = "~/Pictures/rain.gif" },
-- 		hsb = { brightness = 0.25 },
-- 		-- attachment  = "Scroll",
-- 		-- vertical_align = "Bottom",
-- 		-- horizontal_align = "Left",
-- 	},
-- }

return config
