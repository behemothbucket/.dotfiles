return {
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup({
      indent = { char = "┊" },
    })
  end,
}

