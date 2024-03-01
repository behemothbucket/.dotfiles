return {
  'akinsho/toggleterm.nvim',
  event = "VeryLazy",
  version = "*",
  opts = {
    open_mapping = [[<Bslash><Bslash>]],
    shade_filetypes = {},
    direction = 'horizontal',
    autochdir = true,
    persist_mode = true,
    insert_mappings = false,
    start_in_insert = true,
    highlights = {
      FloatBorder = { link = 'FloatBorder' },
      NormalFloat = { link = 'NormalFloat' },
    },
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
