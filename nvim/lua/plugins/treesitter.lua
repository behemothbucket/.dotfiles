return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "python", "javascript", "html", "sql", "json5", "comment", "regex", "markdown", "markdown_inline" },
      highlight = {
        enable = true,
      },
    }
  end
}
