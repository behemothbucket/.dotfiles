local status_ok, flash = pcall(require, 'flash')
if not status_ok then
    return
end

flash.setup({
    search = {
        multi_window = false,
        exclude = {
            'notify',
            'cmp_menu',
            'noice',
            'flash_prompt',
            function(win)
                -- exclude non-focusable windows
                return not vim.api.nvim_win_get_config(win).focusable
            end,
        },
    },
    -- prompt = {
    --     enabled = true,
    --     win_config = { relative = 'editor', width = 1, height = 1, row = 1, col = 0, zindex = 1000 },
    -- },
    modes = {
        search = { enabled = true },
        char = {
            enabled = false,
        },
    },
})
