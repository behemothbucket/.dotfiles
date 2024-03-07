local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

mason.setup({
    -- - "prepend": Use mason binary, "append": Use system binary
    PATH = 'prepend',

    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 8,

    ui = {
        check_outdated_packages_on_open = true,
        border = 'rounded',
        width = 0.8,
        height = 0.8,
    },
})
