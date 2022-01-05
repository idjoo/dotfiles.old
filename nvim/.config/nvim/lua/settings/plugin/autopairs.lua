local npairs = require("nvim-autopairs")

npairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
    fast_wrap = {},
})
