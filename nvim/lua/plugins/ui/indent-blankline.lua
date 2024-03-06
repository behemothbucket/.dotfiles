local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
    return
end

ibl.setup({
    exclude = {
        buftypes = {
            'nofile',
            'terminal',
        },
        filetypes = {
            'help',
            'startify',
            'aerial',
            'alpha',
            'dashboard',
            'lazy',
            'neogitstatus',
            'neo-tree',
            'Trouble',
            'dbout',
            'TelescopePrompt',
        },
    },
    scope = {
        show_start = false,
        show_end = false,
        highlight = { '@keyword' },
        char = '▏',
        include = {
            node_type = {
                lua = { 'table_constructor' },
            },
        },
    },
    whitespace = {
        remove_blankline_trail = true,
    },
    indent = { char = '▏' },
})
