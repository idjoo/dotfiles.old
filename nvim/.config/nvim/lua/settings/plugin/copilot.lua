vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

vim.cmd([[let g:copilot_no_tab_map = v:true]])
