-- Default options:
-- require('kanagawa').setup({
--   compile = false,  -- enable compiling the colorscheme
--   undercurl = true, -- enable undercurls
--   commentStyle = { italic = true },
--   functionStyle = {},
--   keywordStyle = { italic = false },
--   statementStyle = { bold = true },
--   typeStyle = {},
--   transparent = true,    -- do not set background color
--   dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
--   terminalColors = true, -- define vim.g.terminal_color_{0,17}
--   theme = "dragon",      -- Load "wave" theme when 'background' option is not set
--   background = {         -- map the value of 'background' option to a theme
--     dark = "dragon",     -- try "dragon" !
--   },
-- })

-- vim.cmd("colorscheme kanagawa")

-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   -- light_style = "day",    -- The theme is used when the background is set to light
--   transparent = true,     -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark",              -- style for sidebars, see below
--     floats = "dark",                -- style for floating windows
--   },
--   sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   -- day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false,             -- dims inactive windows
--   lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
-- })

-- setup must be called before loading
-- vim.cmd("colorscheme tokyonight-night")

-- Nord colorscheme options
-- vim.g.nord_contrast = true
-- vim.g.nord_disable_background = true
-- vim.g.nord_cursorline_transparent = false
-- vim.g.nord_borders = true
-- vim.g.nord_uniform_diff_background = false
-- vim.g.nord_italic = false

-- Load nord colorscheme with A protected call
-- require('rose-pine').setup({
-- disable_background = true
-- })

-- require("modus-themes").setup({
--   transparent = false,
--   dim_inactive = false,
--   styles = {
--     comments = { italic = true },
--     keywords = { italic = false },
--   },
-- })

-- function ApplyTheme(color)
-- color = color or "modus_operandi"
-- vim.cmd.colorscheme(color)

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- end

-- ApplyTheme()

-- vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = "#B4BEFE" })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = "#B4BEFE" })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = "#B4BEFE", underline = false })


-- Default options:
require('kanagawa').setup({
  compile = false,   -- enable compiling the colorscheme
  undercurl = false, -- enable undercurls
  commentStyle = { italic = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },

  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}

  theme = "dragon",      -- Load "wave" theme when 'background' option is not set
  background = {         -- map the value of 'background' option to a theme
    dark = "dragon",     -- try "dragon" !
    light = "lotus"
  },

  overrides = function(colors)
    local theme = colors.theme
    return {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },

      -- Save an hlgroup with dark background and dimmed foreground
      -- so that you can use it where your still want darker windows.
      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

      -- Popular plugins that open floats will link to NormalFloat by default;
      -- set their background accordingly if you wish to keep them dark and borderless
      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
  end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
