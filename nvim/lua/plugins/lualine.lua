return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- require("lualine").setup({
    --   options = {
    --     icons_enabled = false,
    --     theme = "auto",
    --     component_separators = "|",
    --     section_separators = "",
    --   },
    --   sections = {
    --     lualine_c = { { "filename", file_status = true, path = 1 } },
    --   },
    -- })

    -- Load lualine with a protected call
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      return
    end

    -- local boo_colors = {
    --   bg       = '#222827',
    --   fg       = '#bbc2cf',
    --   yellow   = '#5d6f74',
    --   cyan     = '#a9d1df',
    --   darkblue = '#5786bc',
    --   green    = '#63b0b0',
    --   orange   = '#5d6f74',
    --   violet   = '#9c75dd',
    --   magenta  = '#cd749c',
    --   blue     = '#5786bc',
    --   red      = '#ee5396',
    -- }

    local boo_colors = {
      bg = "#000000",
      fg = "#595959",
      yellow = "#6f5500",
      cyan = "#005e8b",
      darkblue = "#0000b0",
      green = "#006800",
      orange = "#813e00",
      violet = "#5317ac",
      magenta = "#721045",
      blue = "#2544bb",
      red = "#a60000"
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        component_separators = '',
        section_separators = '',
        theme = "auto",
        -- theme = {
        --   normal = { c = { fg = boo_colors.fg, bg = boo_colors.bg } },
        --   inactive = { c = { fg = boo_colors.fg, bg = boo_colors.bg } },
        -- },
      },

      -- These are to remove the defaults
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      -- These are to remove the defaults
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Begining Of The StatusLine
    -- ins_left {
    --   function()
    --     return '▎'
    --   end,
    --   color = { fg = boo_colors.blue },
    --   padding = { left = 0, right = 1 },
    -- }

    -- Icon for diffrent mode:  -- normal -- | -- insert -- | -- visual -- | -- command --
    -- ins_left {
    --   function()
    --     return '' -- 󰊠󰥓󰞇󰓥󰳉
    --   end,
    --   color = function()
    --     -- Auto change color according to neovim's mode
    --     local mode_color = {
    --       n = boo_colors.green,
    --       i = boo_colors.violet,
    --       v = boo_colors.blue,
    --       [''] = boo_colors.blue,
    --       V = boo_colors.blue,
    --       c = boo_colors.red,
    --       no = boo_colors.red,
    --       s = boo_colors.orange,
    --       S = boo_colors.orange,
    --       [''] = boo_colors.orange,
    --       ic = boo_colors.yellow,
    --       R = boo_colors.violet,
    --       Rv = boo_colors.violet,
    --       cv = boo_colors.red,
    --       ce = boo_colors.red,
    --       r = boo_colors.cyan,
    --       rm = boo_colors.cyan,
    --       ['r?'] = boo_colors.cyan,
    --       ['!'] = boo_colors.red,
    --       t = boo_colors.red,
    --     }
    --     return { fg = mode_color[vim.fn.mode()] }
    --   end,
    --   padding = { right = 1 },
    -- }

    -- File Name
    ins_left {
      'filename',
      file_status = true, -- Displays file status (readonly status, modified status)
      path = 1,           -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      shorting_target = 0, -- Shortens path to leave 40 spaces in the window
      symbols = {
        modified = '  ', -- Text to show when the file is modified.
        readonly = '  ', -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
      }
    }

    ins_left {
      "diagnostics",
      on_click = function()
        require("telescope.builtin").diagnostics()
      end,
    }
    --
    -- ins_left {
    --   "searchcount",
    --   icon = "󰍉",
    -- color = { fg = "#0031a9" }
    -- }

    -- Git Diff
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed
        }
      end
    end

    ins_right {
      'diff', source = diff_source, on_click = function()
      vim.cmd("DiffviewOpen")
    end,
    }

    -- Git Branch
    ins_right {
      'branch',
      icon = '',
      on_click = function()
        require("telescope.builtin").git_branches()
      end,
      -- icon = '',
      -- color = { fg = colors.green },
    }

    -- File Type
    ins_right {
      'filetype',
      icon_only = true,
      padding = { right = 2, left = 1 }
    }

    -- Custom components using swenv
    local env_stat =
        function()
          local swenv = require("swenv.api")
          local current_env = "[-]" -- No environment

          if swenv.get_current_venv() ~= nil then
            -- Environment loaded by swenv
            local _name = swenv.get_current_venv().name
            local _src = swenv.get_current_venv().source
            current_env = _name .. " (" .. _src .. ")"
          elseif vim.g.python3_host_prog ~= nil then
            -- Default environment from python3_host_prog
            local Path = require("plenary.path")
            local tokens = Path._split(Path:new(vim.g.python3_host_prog))

            -- Get the environment name from python3_host_prog
            if #tokens > 2 then
              -- Standard path is .../[name]/bin/python, so get the third last token
              current_env = tokens[#tokens - 2]

              -- Check if python3_host_prog is registered in swenv and get its source
              for _, v in ipairs(swenv.get_venvs()) do
                if v.name == current_env then
                  current_env = current_env .. " (" .. v.source .. ")"
                  break
                end
              end
            end
          end

          return current_env
        end

    ins_right {
      env_stat,
      icon = "󱔎",
      padding = { right = 2, left = 1 },
      on_click = function()
        require("swenv.api").pick_venv()
      end,
    }

    -- File Encoding
    ins_right {
      'o:encoding',
      cond = conditions.hide_in_width,
      padding = { right = 2 },
      -- color = { fg = colors.green, gui = 'bold' },
      -- fmt = string.upper,
    }

    -- File Format
    ins_right {
      'fileformat',
      padding = { right = 2 },
      symbols = { unix = 'unix ' },
      -- color = { fg = colors.green, gui = 'bold' },
      -- icons_enabled = false,
      on_click = function()
        vim.ui.select(
          { "unix", "mac", "dos" },
          { prompt = "Select fileformat" },
          function(ff)
            if ff ~= nil then
              vim.opt_local.fileformat = ff
            end
          end
        )
      end,
    }

    -- -- File Size
    -- ins_right {
    --   'filesize',
    --   padding = { right = 2 },
    --   cond = conditions.buffer_not_empty,
    -- }

    -- Text Progress
    -- ins_right {
    --   'progress',
    --   padding = { right = 1 },
    -- }

    -- File Location
    ins_right {
      'location',
      padding = { right = 0 },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- For lualine it's any number greater then 2
    -- ins_left {
    --   function()
    --     return '%='
    --   end,
    -- }

    -- End Of The Status Bar
    -- ins_right {
    --   function()
    --     return '▎'
    --   end,
    --   color = { fg = boo_colors.blue },
    --   padding = { left = 1, right = 0 },
    -- }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end
}
