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
      local util = require 'lspconfig/util'

      lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- "Global vim" warning
            },
          },
        },
      })

      lspconfig.gopls.setup(coq.lsp_ensure_capabilities {
        cmd = { 'gopls' },
        filetypes = { 'go', 'go.mod' },
        root_dir = util.root_pattern("go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              unusedvariable = true,
              unusedwrite = true,
              fieldalignment = true,
              nilness = true,
              useany = true,
            },
            codelenses = {
              generate = true,
              run_govulncheck = true,
              tidy = true,
              upgrade_dependency = true,
            },
            hints = {
              constantValues = true
            },
            staticcheck = true,
            gofumpt = true,
            semanticTokens = true,
          }
        }
      })

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
    end,
  },
}
