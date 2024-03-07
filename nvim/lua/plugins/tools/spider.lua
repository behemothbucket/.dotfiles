local status_ok, spider = pcall(require, 'spider')
if not status_ok then
    return
end

spider.setup({
    skipInsignificantPunctuation = true,
})
