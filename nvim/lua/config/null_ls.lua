local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.stylua.with {
      extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
    },
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.cpplint.with({
      diagnostic_config = {
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      }
    })
  },
}
