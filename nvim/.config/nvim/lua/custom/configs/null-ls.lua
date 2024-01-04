local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "yaml", "json" },
  },

  b.formatting.stylua,
  b.formatting.stylua,
  b.formatting.autopep8,

  b.formatting.clang_format,

  b.formatting.prettierd,

  b.formatting.npm_groovy_lint.with {
    filetypes = {"groovy", "Jenkinsfile"}
  },
  b.formatting.google_java_format,

  b.diagnostics.hadolint,

  b.formatting.sql_formatter,

  b.formatting.shfmt,

  b.formatting.xmlformat,

  b.formatting.nginx_beautifier,

  b.formatting.gofmt,
  b.formatting.goimports,
  b.formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
