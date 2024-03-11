local status_ok, arrow = pcall(require, 'arrow')
if not status_ok then
    return
end

arrow.setup({
    icons = true,
    leader_key = ';',
})
