local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
    return
end

gitsigns.setup({
    -- ┃
    signs = {
        -- add = { text = '+' },
        -- change = { text = '~' },
        -- topdelete = { text = '-' },
        -- delete = { text = '-' },
        -- changedelete = { text = '~' },
        add = { text = '┃' },
        change = { text = '┃' },
        topdelete = { text = '┃' },
        delete = { text = '┃' },
        changedelete = { text = '┃' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false,
    -- current_line_blame_opts = {
    -- virt_text = false,
    -- virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    -- delay = 1000,
    -- ignore_whitespace = false,
    -- },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    -- yadm = {
    --     enable = false,
    -- },
})
