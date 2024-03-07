local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
    return
end

saga.setup({
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },
    finder = {
        default = 'imp+def+ref',
        keys = {
            toggle_or_open = '<CR>',
            vsplit = '<C-v>',
            split = '<C-x>',
            quit = 'q',
            -- close = 'q',
        },
    },
    lightbulb = {
        enable = false,
    },
    symbol_in_winbar = {
        enable = false,
        -- separator = '  ',
        hide_keyword = true,
        show_file = false,
    },
    implement = {
        enable = false,
        sign = true,
        virtual_text = true,
        -- priority = 100,
    },
    request_timeout = 2500,
    definition = {
        keys = {
            edit = '<CR>',
            vsplit = '<C-v>',
            split = '<C-x>',
            quit = 'q',
        },
    },
    diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        max_width = 0.4,
        max_show_width = 0.7,
        show_code_action = true,
        jump_num_shortcut = true,
        keys = {
            quit = { 'q', '<ESC>' },
            exec_action = 'o',
        },
    },
    rename = {
        in_select = false,
        keys = {
            quit = '<C-c>',
        },
    },
    code_action = {
        num_shortcut = true,
        show_server_name = true,
        keys = {
            quit = 'q',
            exec = '<CR>',
        }
    },
    ui = {
        theme = 'round',
        border = 'rounded',
        code_action = '',
        diagnostic = '',
        devicon = true,
        title = true,
    },
})

--Gutter icons
local signs = {
    Error = '✘',
    Warn = '',
    Hint = '',
    Info = '',
    Question = '',
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
