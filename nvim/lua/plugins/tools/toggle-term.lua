local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

local highlights = require('rose-pine.plugins.toggleterm')

local opts = {
    open_mapping = [[<Bslash><Bslash>]],
    shade_filetypes = {},
    direction = 'horizontal',
    autochdir = true,
    persist_mode = true,
    insert_mappings = false,
    start_in_insert = true,
    highlights = highlights,
    size = function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.4)
        end
    end,
}

toggleterm.setup(opts)
