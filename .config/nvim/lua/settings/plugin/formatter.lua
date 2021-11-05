require("formatter").setup ({
    filetype = {
        cpp = {
            function()
                return {
                    exe = "uncrustify",
                    args = {
                        "-c", "$HOME/.config/uncrustify/config.cfg",
                        "-f", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                }
            end
        },
        c = {
            function()
                return {
                    exe = "uncrustify",
                    args = {
                        "-c", "$HOME/.config/uncrustify/config.cfg",
                        "-f", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                }
            end
        },
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {
                        -- "--aggressive", "--aggressive",
                        "--experimental",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                }
            end
        }
    }
})
