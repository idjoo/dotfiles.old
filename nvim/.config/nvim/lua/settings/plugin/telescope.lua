local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    defaults = {
        find_files = {
            hidden = true,
        },
        vimgrep_arguments = {
            'rg', '--hidden', '--color=never', '--no-heading',
            '--with-filename', '--line-number', '--column', '--smart-case'
        },
    },
}
