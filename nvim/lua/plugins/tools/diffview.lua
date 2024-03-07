local status_ok, diffview = pcall(require, 'diffview')
if not status_ok then
    return
end

diffview.setup({
    opts = {
        view = {
            merge_tool = {
                layout = 'diff3_mixed',
            },
        },
    },
})
