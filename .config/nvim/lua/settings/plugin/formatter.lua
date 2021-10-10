require("formatter").setup ({
    filetype = {
        lua = {
            function()
                return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                }
            end
        },
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                }
            end
        },
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style='{IndentWidth: 4}'",
                        "--assume-filename",
                        vim.api.nvim_buf_get_name(0)
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