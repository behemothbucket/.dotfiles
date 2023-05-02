local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { "nvim-tree/nvim-web-devicons" }

  use { "nvim-lua/plenary.nvim" }

  use { "stevearc/dressing.nvim" }

  use { "sindrets/diffview.nvim" }

  use { "tpope/vim-surround" }

  use {
    'behemothbucket/gruber-darker-theme.nvim',
    config = function()
      require('gruber-darker').setup()
    end
  }

  -- use { 'toppair/reach.nvim',
  --   config = function()
  --     require('reach').setup({
  --       notifications = true
  --     })
  --     local options = {
  --       handle = 'bufnr',
  --       modified_icon = '•',
  --       previous = {
  --
  --         depth = 1,
  --       },
  --       actions = {
  --         split = 's',
  --         vertsplit = 'v',
  --         tabsplit = 't',
  --         delete = '<Space>',
  --         priority = '=',
  --       },
  --     }
  --     -- require('reach').buffers(options)
  --     vim.keymap.set('n', '<Tab><Tab>', function() require('reach').buffers(options) end, {})
  --   end,
  -- }

  -- use { 'matbme/JABS.nvim',
  --
  --   config = function()
  --     require 'jabs'.setup {
  --       position = { "center", "center" },
  --       border = "single",
  --       preview = {
  --         border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
  --       },
  --       -- Keymaps
  --       -- keymap = {
  --       --     close = "<c-d>", -- Close buffer. Default D
  --       --     jump = "<space>", -- Jump to buffer. Default <cr>
  --       --     h_split = "h", -- Horizontally split buffer. Default s
  --       --     v_split = "v", -- Vertically split buffer. Default v
  --       --     preview = "p", -- Open buffer preview. Default P
  --       -- },
  --     }
  --   end,
  -- }

  use { 'shadowofseaice/yabs.nvim',
    config = function()
      require 'yabs'.setup {
        position = { 'C' }, -- {'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW', 'N', 'C'}
        settings = {
          { 'name' },
          { 'icon', 'bufnr', 'bufname', 'lnum', 'line' },
          { 'path', 'name',  'bufid' },
        },
        keymap = {
          close    = "D",    -- Close buffer. Default D
          jump     = "<CR>", -- Jump to buffer. Default <cr>
          h_split  = "s",    -- Horizontally split buffer. Default s
          v_split  = "v",    -- Vertically split buffer. Default v
          pinning  = "p",    -- Open buffer preview. Default p
          cycset   = ">",    -- Cycle through settings, Default ]
          rcycset  = "<",    -- Reverse cycle through settings, Default [
          cycpos   = "}",    -- Cycle through settings, Default >
          rcycpos  = "{",    -- Reverse cycle through panel placement, Default <
          cycname  = "]",    -- Cycle through file name type, Default }
          rcycname = "[",    -- Reverse cycle through file name type, Default {
          cychdr   = "T",    -- Cycle through group header options, Default H
          sortpath = "P",    -- Sort by file path. Default P
          sortext  = "e",    -- Sort by file extension (type), Default t
          sortused = "l",    -- Sort by last used, Default u
          sortbuf  = "x",    -- Sort clear = sort by buffer #, default c
          sortbase = "b",    -- Sort by file base name #, default f
          sortfull = "f",    -- Sort by full file name #, default F
          sortinit = "i",    -- Sort by file name initial #, default i
        },
        rnu = false,
        border = "rounded",
        -- symbols = {
        -- at most two of these icons can be shown for a given buffer
        -- current   = "C", -- default 
        -- split     = "S", -- default 
        -- alternate = "A", -- default 
        -- unloaded  = "H", -- default
        -- locked    = "L", -- default 
        -- ro        = "R", -- default 
        -- edited    = "E", -- default 
        -- terminal  = "T", -- default 
        -- more      = ">", -- default "", when the panel size is too small for file name
        -- grphead   = "-", -- default " ",
        -- grptop    = "+", -- default "╭",
        -- grpmid    = "|", -- default "│",
        -- grpbot    = "+", -- default "╰",
        -- pinned    = "P", -- default "",
        -- filedef   = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
        -- }
      }
    end,
  }

  -- https://github.com/jose-elias-alvarez/typescript.nvim

  -- use { "tpope/vim-repeat" }

  -- use { "rockerBOO/boo-colorscheme-nvim" }

  -- use { "romgrk/barbar.nvim" }

  -- use { "voldikss/vim-floaterm" }

  -- use { "dstein64/vim-startuptime" }

  -- use { "kkga/vim-envy" }

  use { "nvim-treesitter/playground" }
  --
  use { "nvim-telescope/telescope.nvim" }

  -- use {
  --   "m-demare/hlargs.nvim",
  --   config = function()
  --     require("hlargs").setup {
  --       color = '#7a7a7a',
  --     }
  --   end,
  -- }
  --

  use {
    "kosayoda/nvim-lightbulb",
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("config.lightbulb")
    end,
  }

  -- use {
  --   "rmagatti/goto-preview",
  --   config = function()
  --     require("goto-preview").setup()
  --   end,
  -- }

  -- use {
  --   "rmagatti/auto-session",
  --   config = function()
  --     require("auto-session").setup {
  --       log_level = "error",
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     }
  --   end,
  -- }

  -- use {
  --   "rmagatti/alternate-toggler",
  --   config = function()
  --     require("alternate-toggler").setup {
  --       alternates = {
  --         ["=="] = "!=",
  --       },
  --     }
  --   end,
  --   event = { "BufReadPost" },
  -- }

  -- use { "cranberry-clockworks/coal.nvim" }

  -- use { "itchyny/vim-highlighturl" }

  -- use {
  --   "folke/zen-mode.nvim",
  --   config = function()
  --     require("zen-mode").setup {
  --       window = {
  --         width = 120,
  --       },
  --     }
  --   end,
  -- }

  -- use {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  --
  --     require("neo-tree").setup {
  --       default_component_configs = {
  --         icon = {
  --           folder_empty = "",
  --         },
  --       },
  --
  --       filesystem = {
  --         filtered_items = {
  --           hide_dotfiles = false,
  --           hide_gitignored = false,
  --           hide_hidden = false, -- Windows
  --         },
  --       },
  --     }
  --   end,
  -- }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs")
    end,
  }

  -- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
  --   require("toggleterm").setup {
  --     direction = 'float',
  --     float_opts = {
  --       width = 80,
  --       height = 20,
  --     }
  --   }
  -- end }

  --   "sudormrfbin/cheatsheet.nvim",
  --   requires = {
  --     { "nvim-telescope/telescope.nvim" },
  --     { "nvim-lua/popup.nvim" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  -- }

  use { "romainl/vim-cool" }

  -- use { "atelierbram/Base4Tone-nvim" }

  -- use {
  --   "LeonHeidelbach/trailblazer.nvim",
  --   config = function()
  --     require("trailblazer").setup()
  --   end,
  -- }

  use {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require "config.colors"
    end,
  }

  -- use {
  --   "goolord/alpha-nvim",
  --   requires = { "nvim-tree/nvim-web-devicons" },

  --   config = function()
  --     require("alpha").setup(require("alpha.themes.startify").config)
  --   end,
  -- }

  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  }

  -- use {
  --   "andymass/vim-matchup",
  --   setup = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- }

  -- use {
  --   "terrortylor/nvim-comment",
  --   config = function()
  --     require("nvim_comment").setup {
  --       comment_empty = false,
  --     }
  --   end,
  -- }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    wants = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
    },
    config = function()
      require("config.lsp.init")
    end,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    }
  }

  -- use { "ms-jpq/coq_nvim", branch = "coq", run = "python3 -m coq deps" }
  --
  -- use { "ms-jpq/coq.artifacts", branch = "artifacts" }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "typescript",
          "javascript",
          "css",
          "html",
          "sql",
          "markdown",
          "json5",
          "jsdoc",
          "lua",
          "vimdoc",
          "vim",
          "query",
          "c",
          "comment",
          "regex",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        -- matchup = {
        --   enable = true,
        -- },
      }
    end,
  }

  -- use "nvim-treesitter/nvim-treesitter-context"

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "config.null_ls"
    end,
  }

  use {
    'stevearc/oil.nvim',
    config = function() require('config.oil') end }

  -- use {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  -- }

  -- use { 'mfussenegger/nvim-dap' }
  --
  -- use {
  --   "rcarriga/nvim-dap-ui",
  --   requires = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("dapui").setup()
  --   end
  -- }
  --
  -- use {
  --   "mxsdev/nvim-dap-vscode-js",
  --   requires = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require('config.dap.init')
  --   end,
  -- }

  -- use {
  --   "tjdevries/express_line.nvim",
  --   config = function()
  --     local extensions = require "el.extensions"
  --     local subscribe = require "el.subscribe"
  --     local generator = function(_window, buffer)
  --       local segments = {}
  --       table.insert(segments, extensions.mode)
  --       table.insert(segments, "%=")
  --       table.insert(
  --         segments,
  --         subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  --           local branch = extensions.git_branch(window, buffer)
  --           if branch then
  --             return " " .. branch
  --           end
  --         end)
  --       )
  --       table.insert(segments, " [%{&ff}]")
  --       return segments
  --     end
  --     require("el").setup { generator = generator }
  --   end,
  -- }

  --   "nvim-lualine/lualine.nvim",
  --   config = function()
  --     require "config.lualine"
  --   end,
  -- }

  -- use { "kdheepak/lazygit.nvim" }

  -- use {
  --   "hkupty/iron.nvim",
  --   config = function()
  --     require "config.iron"
  --   end,
  -- }

  -- use { "yorickpeterse/nvim-window" }

  -- use {
  --   "echasnovski/mini.indentscope",
  --   branch = "stable",
  --   config = function()
  --     local MiniIndent = require "mini.indentscope"
  --     MiniIndent.setup {
  --       draw = {
  --         delay = 0,
  --         animation = MiniIndent.gen_animation.none(),
  --       },
  --     }
  --   end,
  -- }

  -- use {
  --   "lewis6991/hover.nvim",
  --   config = function()
  --     require("hover").setup {
  --       init = function()
  --         -- Require providers
  --         require "hover.providers.lsp"
  --         -- require('hover.providers.gh')
  --         -- require('hover.providers.gh_user')
  --         -- require('hover.providers.jira')
  --         -- require('hover.providers.man')
  --         -- require('hover.providers.dictionary')
  --       end,
  --       preview_opts = {
  --         border = nil,
  --       },
  --       -- Whether the contents of a currently open hover window should be moved
  --       -- to a :h preview-window when pressing the hover keymap.
  --       preview_window = false,
  --       title = true,
  --     }
  --
  --     -- Setup keymaps
  --     vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
  --     vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
  --   end,
  -- }

  -- use { "ThePrimeagen/harpoon" }

  use { "ibhagwan/fzf-lua" }

  use {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      local possession = require "nvim-possession"
      possession.setup()
      vim.keymap.set("n", "<Bslash><Bslash>", function()
        possession.list()
      end)
      vim.keymap.set("n", "<Space>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<Space>su", function()
        possession.update()
      end)
    end,
  }

  -- use {
  --   "echasnovski/mini.tabline",
  --   branch = "stable",
  --   config = function()
  --     require("mini.tabline").setup()
  --   end,
  -- }

  -- use { "RRethy/vim-illuminate",
  --   require('illuminate').configure {
  --     min_count_to_highlight = 2,
  --   }
  -- }

  -- use {
  --   "echasnovski/mini.cursorword",
  --   branch = "stable",
  --   config = function()
  --     require("mini.cursorword").setup()
  --   end,
  -- }

  -- use {
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function()
  --     require("indent_blankline").setup {
  --       show_current_context = true,
  --       show_current_context_start = true, -- underline first line
  --       use_treesitter = true,
  --     }
  --   end,
  -- }
  -- use {
  --   "Wansmer/treesj",
  --   requires = { "nvim-treesitter" },
  --   config = function()
  --     require("treesj").setup {
  --       use_default_keymaps = false,
  --     }
  --   end,
  -- }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "config.gitsigns"
    end,
  }

  -- use {
  --   "danymat/neogen",
  --   config = function()
  --     require("neogen").setup {
  --       enabled = true,
  --     }
  --   end,
  -- }
  --
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
