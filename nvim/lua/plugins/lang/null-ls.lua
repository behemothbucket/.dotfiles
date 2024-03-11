local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local format = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
-- local action = null_ls.builtins.code_actions
local comp = null_ls.builtins.completion
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Buily in sources: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
    debug = false,
    border = 'rounded',
    log_level = 'info',
    diagnostics_format = '#{c} #{m} (#{s})',
    sources = {
        -- action.refactoring,
        -- comp.spell,
        comp.tags,
        diag.actionlint,
        diag.golangci_lint,
        diag.todo_comments,
        diag.trail_space,
        diag.vint,
        -- diag.write_good,
        format.prettier,
        format.shfmt,
        format.gofumpt,
        format.goimports_reviser,
        format.golines,
        format.black,
        format.isort,
        format.stylua,
        hover.dictionary,
        hover.printenv,
    },
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})

local installed_sources = require('plugins.list').null_ls_sources

require('mason-null-ls').setup({
    ensure_installed = installed_sources,
    automatic_installation = true,
})
