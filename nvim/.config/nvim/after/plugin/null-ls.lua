local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- diagnostics
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
    -- null_ls.builtins.diagnostics.pylint,

    -- formatting
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.xmlformat,
    null_ls.builtins.formatting.nginx_beautifier,
    -- null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.yapf,
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),

    -- code actions
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.shellcheck,

    -- completion
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.completion.spell,
    null_ls.builtins.completion.tags,
  },
})
