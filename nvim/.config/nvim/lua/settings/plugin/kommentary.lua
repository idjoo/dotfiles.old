vim.g.kommentary_create_default_mappings = false
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

require('kommentary.config').configure_language("helm", {
    single_line_comment_string = "#",
    multi_line_comment_strings = {"", ""},
})
