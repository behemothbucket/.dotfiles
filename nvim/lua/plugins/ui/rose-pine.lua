local status_ok, rose_pine = pcall(require, 'rose-pine')
if not status_ok then
    return
end

rose_pine.setup({
    variant = 'auto',      -- auto, main, moon, or dawn
    dark_variant = 'main', -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true,        -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },

    groups = {
        border = 'muted',
        link = 'iris',
        panel = 'surface',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        note = 'pine',
        todo = 'rose',
        warn = 'gold',

        git_add = 'foam',
        git_change = 'rose',
        git_delete = 'love',
        git_dirty = 'rose',
        git_ignore = 'muted',
        git_merge = 'iris',
        git_rename = 'pine',
        git_stage = 'iris',
        git_text = 'rose',
        git_untracked = 'subtle',

        h1 = 'iris',
        h2 = 'foam',
        h3 = 'rose',
        h4 = 'gold',
        h5 = 'pine',
        h6 = 'foam',
    },

    -- highlight_groups = {
    --     Normal = { bg = 'none' },
    --     FloatBorder = { bg = 'none' },
    --     StatusLine = { bg = '#1c1c1c' },
    --     CursorLine = { bg = 'none' },
    --     ColorColumn = { bg = '#1c1c1c' },
    --     Cursor = { bg = '#c5c9c5', fg = '#181618' },
    --     -- MatchParen = { bg = 'none', fg = '#338fff', bold = true },
    -- },
})

vim.cmd('colorscheme rose-pine')
