return {
  {
    -- lspconfig
    "neovim/nvim-lspconfig",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "ms-jpq/coq_nvim",
        branch = "coq",
        build = "python3 -m coq deps"
      },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
    },
    config = function()
      local lspconfig = require "lspconfig"
      local coq = require "coq"

      local servers = {
        "gopls",
        "jsonls",
        "cssls",
        "html",
        "emmet_ls",
        "lua_ls",
        "bashls",
        "marksman",
        "yamlls",
      }

      for _, lsp in ipairs(servers) do
        if lsp == "lua_ls" then
          lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }, -- "Global vim" warning
                },
              },
            },
          })
        else
          lspconfig[lsp].setup(coq.lsp_ensure_capabilities {})
        end
      end

      -- Diagnostic list
      -- vim.keymap.set("n", "<Space>e", function()
      --   vim.diagnostic.setloclist { open = false } -- don't open and focus
      --   local window = vim.api.nvim_get_current_win()
      --   vim.cmd.lwindow()                          -- open+focus loclist if has entries, else close -- this is the magic toggle command
      --   vim.api.nvim_set_current_win(window)       -- restore focus to window you were editing (delete this if you want to stay in loclist)
      -- end, { buffer = bunr })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <C-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
          -- vim.keymap.set("n", "<Space>d", vim.diagnostic.open_float)
          -- vim.keymap.set("n", "<Space>p", vim.diagnostic.setloclist)
          vim.keymap.set("n", "<Space>f", function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      --Enable borders in floating windows (diagnostics)
      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = _border,
      })

      --Gutter icons
      local signs = {
        Error = "",
        Warn = "",
        Hint = "",
        Info = "",
        Question = "",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      --Disable inline error text
      vim.diagnostic.config {
        virtual_text = false,
        underline = false,
        signs = {
          active = signs,
        },
        float = { border = _border },
        update_in_insert = false,
        severity_sort = true
      }

      require('lspconfig.ui.windows').default_options.border = 'rounded'

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end,
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
          },
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.code_actions.shellcheck,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.markdownlint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.formatting.xmlformat,
          null_ls.builtins.formatting.yamlfix,
          null_ls.builtins.diagnostics.yamllint,
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
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "pyright",
        "bash-language-server",
        "css-lsp",
        "emmet-ls",
        "eslint_d",
        "html-lsp",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "marksman",
        "markdownlint",
        "shellcheck",
        "shfmt",
        "stylua",
        "xmlformatter",
      },
    },
  }
}
