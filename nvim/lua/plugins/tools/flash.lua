local status_ok, flash = pcall(require, 'flash')
if not status_ok then
    return
end

flash.setup({
    prompt = {
        enabled = true,
        win_config = { relative = 'editor', width = 1, height = 1, row = 1, col = 0, zindex = 1000 },
    },
    modes = {
        char = {
            jump_labels = false,
        },
    },
})
