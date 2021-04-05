" Remove whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter * :highlight Normal ctermbg=NONE
