local status_ok, go = pcall(require, 'go')
if not status_ok then
    return
end

go.setup({
    -- comment_placeholder = '',
    -- gocoverage_sign = '┃',
    -- duplicate from ./init.lua
    diagnostic = {
        virtual_text = false,
        underline = false,
        severity_sort = true,
        signs = true,
        update_in_insert = false,
    },
    floaterm = {
        posititon = 'right', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
        width = 0.5,         -- width of float window if not auto
    },
    icons = true,
    lsp_document_formatting = false,
    lsp_inlay_hints = {
        enable = false,
    },
    lsp_keymaps = false,

    luasnip = true,
    max_line_len = 100,
    test_runner = 'go',
    run_in_floaterm = true,
})
