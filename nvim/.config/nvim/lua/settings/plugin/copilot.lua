vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

-- vim.cmd(let g:copilot_no_tab_map = v:true)
-- vim.cmd(let g:copilot_filetypes = {'*': v:false})
vim.g['copilot_no_tab_map'] = true
vim.g['copilot_filetypes'] = {
    ['*'] = false,
}
