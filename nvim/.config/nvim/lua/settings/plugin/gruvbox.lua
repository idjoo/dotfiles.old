vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

vim.cmd([[
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lum"
    endif

    set background=dark
]])
