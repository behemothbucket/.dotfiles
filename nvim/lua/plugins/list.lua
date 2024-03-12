local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

local plugins = {
    -- Tools
    {
        'otavioschwanck/arrow.nvim',
        opts = {
            show_icons = true,
            leader_key = ';',
        },
        config = load_config('tools.arrow'),
        lazy = false,
    },
    {
        'b0o/incline.nvim',
        config = function()
            require('incline').setup()
        end,
        -- Optional: Lazy load Incline
        event = 'VeryLazy',
    },
    {
        'NvChad/nvim-colorizer.lua',
        enabled = true,
        lazy = false,
        config = load_config('tools.colorizer'),
    },
    -- {
    --     'mhinz/vim-startify',
    --     lazy = false,
    -- },
    -- {
    --   'phaazon/hop.nvim',
    --   branch = 'v2',
    --   config = function()
    --     require('hop').setup({})
    --     --Hop
    --     local hop = require('hop')
    --     local map = vim.keymap.set
    --     local directions = require('hop.hint').HintDirection
    --     map('', 'f', function()
    --       hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    --     end, { remap = true })
    --     map('', 'F', function()
    --       hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    --     end, { remap = true })
    --     map('', 't', function()
    --       hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    --     end, { remap = true })
    --     map('', 'T', function()
    --       hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    --     end, { remap = true })
    --     map('n', 'ff', ':HopChar2<CR>')
    --   end,
    --   lazy = false,
    -- },
    {
        'numToStr/Comment.nvim',
        config = load_config('tools.comment'),
        keys = {
            {
                'gcc',
                mode = { 'n' },
                function()
                    require('Comment').toggle()
                end,
                desc = 'Comment',
            },
            {
                'gc',
                mode = { 'v' },
                function()
                    require('Comment').toggle()
                end,
                desc = 'Comment',
            },
        },
    },
    -- {
    --     'kylechui/nvim-surround',
    --     config = load_config('tools.surround'),
    --     keys = { 'cs', 'ds', 'ys' },
    -- },
    -- {
    --     'chrisgrieser/nvim-spider',
    --     config = load_config('tools.spider'),
    --     event = { 'BufReadPre', 'BufNewFile' },
    -- },
    -- {
    --     'abecodes/tabout.nvim',
    --     config = load_config('tools.tabout'),
    --     event = 'InsertEnter',
    -- },
    -- {
    --     '2kabhishek/tdo.nvim',
    --     dependencies = 'nvim-telescope/telescope.nvim',
    --     cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
    --     keys = { '[t', ']t' },
    --     lazy = false,
    -- },
    -- {
    --     'kevinhwang91/nvim-hlslens',
    --     config = load_config('tools.hlslens'),
    --     lazy = false,
    -- },
    {
        'folke/flash.nvim',
        config = load_config('tools.flash'),
        enabled = true,
        event = 'VeryLazy',
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
    },
    {
        'ahmedkhalf/project.nvim',
        lazy = false,
        config = load_config('tools.project'),
    },
    -- {
    --     'akinsho/toggleterm.nvim',
    --     event = 'ColorScheme',
    --     version = '*',
    --     config = load_config('tools.toggle-term'),
    -- },
    -- {
    --     'iamcco/markdown-preview.nvim',
    --
    --     build = function()
    --         vim.fn['mkdp#util#install']()
    --     end,
    --     ft = 'markdown',
    --     cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    -- },
    -- {
    --   'nvim-neo-tree/neo-tree.nvim',
    --   branch = 'v3.x',
    --   lazy = false,
    --
    --   cmd = 'Neotree',
    --
    --   dependencies = {
    --     'nvim-lua/plenary.nvim',
    --     'nvim-tree/nvim-web-devicons',       -- not strictly required, but recommended
    --     'MunifTanjim/nui.nvim',
    --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --   },
    --   config = load_config('tools.neo-tree'),
    -- },
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = load_config('tools.oil'),
        lazy = false,
    },
    {
        'SirZenith/oil-vcs-status',
        config = load_config('tools.oil-vcs-status'),
        lazy = false,
    },
    {
        'vidocqh/auto-indent.nvim',
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        lazy = false,
        config = load_config('tools.autopairs'),
    },
    -- {
    --     'sindrets/diffview.nvim',
    --     opts = {
    --         view = {
    --             merge_tool = {
    --                 layout = 'diff3_mixed',
    --             },
    --         },
    --     },
    --     lazy = false,
    -- },
    -- {
    --     'windwp/nvim-spectre',
    --     config = load_config('tools.spectre'),
    --     cmd = 'Spectre',
    -- },
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     event = { 'BufReadPost', 'BufNewFile' },
    --     main = 'ibl',
    --     config = load_config('ui.indent-blankline'),
    -- },

    -- UI
    -- {
    --   'rebelot/kanagawa.nvim',
    --   config = load_config('ui.kanagawa'),
    --   lazy = false,
    --   priority = 1000,
    -- },
    -- {
    --     'Mofiqul/vscode.nvim',
    --     lazy = false,
    --     config = load_config('ui.vscode-theme'),
    -- },
    { 'rose-pine/neovim', name = 'rose-pine', lazy = false, config = load_config('ui.rose-pine') },
    -- {
    --     'phha/zenburn.nvim',
    --     lazy = false,
    --     config = function()
    --         require('zenburn').setup()
    --         vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    --         vim.cmd('colorscheme zenburn')
    --     end,
    -- },
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     config = load_config('ui.lualine'),
    --     event = { 'BufReadPre', 'BufNewFile' },
    -- },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = { 'BufReadPre', 'BufNewFile' },
    },

    -- Language
    -- {
    --     'ray-x/go.nvim',
    --     dependencies = { -- optional packages
    --         'ray-x/guihua.lua',
    --         'neovim/nvim-lspconfig',
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    --     config = load_config('lang.go'),
    --     event = { 'CmdlineEnter' },
    --     ft = { 'go', 'gomod' },
    --     build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    -- },
    -- {
    --     'yanskun/gotests.nvim',
    --     ft = 'go',
    --     config = function()
    --         require('gotests').setup()
    --     end,
    -- },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
        },
        config = load_config('lang.cmp'),
        event = 'InsertEnter',
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        dependencies = { 'rafamadriz/friendly-snippets' },
        build = 'make install_jsregexp',
        event = 'InsertEnter',
    },
    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = load_config('lang.treesitter'),
        event = { 'BufReadPre', 'BufNewFile' },
    },

    -- LSP
    -- {
    --     'folke/neodev.nvim',
    --     ft = { 'lua', 'vim' },
    --     config = load_config('lang.neodev'),
    -- },
    -- {
    --     'theprimeagen/refactoring.nvim',
    --     config = function()
    --         require('refactoring').setup({})
    --     end,
    -- }
    {
        'Wansmer/symbol-usage.nvim',
        event = 'LspAttach', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
        config = load_config('lang.symbol-usage'),
    },
    {
        'AckslD/swenv.nvim',
        lazy = false,
        config = load_config('lang.swenv'),
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
        },
        config = load_config('lang.lsp-zero'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'nvimdev/lspsaga.nvim',
        config = load_config('lang.lspsaga'),
        event = 'LspAttach',
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    -- {
    --     'ThePrimeagen/refactoring.nvim',
    --     config = load_config('lang.refactoring'),
    --     lazy = false,
    -- },
    -- {
    --     'j-hui/fidget.nvim',
    --     config = function()
    --         require('fidget').setup()
    --     end,
    --     lazy = false,
    -- },
    -- {
    --     'linrongbin16/lsp-progress.nvim',
    --     config = function()
    --         require('lsp-progress').setup()
    --     end,
    --     lazy = false,
    -- }
    -- {
    --   'zbirenbaum/copilot.lua',
    --   dependencies = {
    --     'zbirenbaum/copilot-cmp',
    --   },
    --   config = load_config('lang.copilot'),
    --   event = 'InsertEnter',
    -- },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('tools.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}

local ts_parsers = {
    'bash',
    'css',
    'gitcommit',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
}

local lsp_servers = {
    'bashls',
    'gopls',
    'jsonls',
    'lua_ls',
    -- 'typos_lsp',
    'vimls',
}

local null_ls_sources = {
    'shellcheck',
    'gofmt',
    'goimports',
    'golines',
    'goimports_reviser',
    'black',
    'isort',
}

return {
    plugins = plugins,
    ts_parsers = ts_parsers,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
}
