import catppuccin

config.load_autoconfig()

catppuccin.setup(c, 'mocha', True)

config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')

config.set("colors.webpage.preferred_color_scheme", "dark")

config.set("fonts.default_family", "DankMono Nerd Font Mono")
