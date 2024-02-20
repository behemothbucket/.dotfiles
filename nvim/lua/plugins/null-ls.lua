return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.xmlformat,
        -- null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnostics.cpplint.with({
        --   diagnostic_config = {
        --     signs = true,
        --     update_in_insert = false,
        --     severity_sort = true,
        --   }
        -- }),
      },
    })
  end,
}
