return {
  'vidocqh/auto-indent.nvim',
  config = function()
    require("auto-indent").setup({
      lightmode = true,     -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
      indentexpr = nil,     -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
      ignore_filetype = {}, -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
    })
  end
}
