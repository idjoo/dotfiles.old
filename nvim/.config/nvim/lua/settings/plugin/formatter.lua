require("formatter").setup ({
    filetype = {
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
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
                }
            end
        },
        html = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        css = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        php = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--condev-php/pearfig", "$HOME/.config/prettier/config.toml",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        typescriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = {"--edition=2018", "--emit=stdout"},
                    stdin = true
                }
            end
        },
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--config", "$HOME/.config/prettier/config.toml",
                        "--insert-pragma", "--prose-wrap=preserve",
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true,
                }
            end
        },
    }
})
