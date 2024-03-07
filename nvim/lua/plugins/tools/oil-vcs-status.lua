local status_ok, oilvcs = pcall(require, 'oil-vcs-status')
if not status_ok then
    return
end

local status_const = require('oil-vcs-status.constant.status')
local StatusType = status_const.StatusType

oilvcs.setup({
    status_symbol = {
        [StatusType.Added] = 'A',
        [StatusType.Copied] = 'C',
        [StatusType.Deleted] = 'D',
        [StatusType.Ignored] = '!',
        [StatusType.Modified] = 'M',
        [StatusType.Renamed] = 'R',
        [StatusType.TypeChanged] = 'T',

        [StatusType.Unmodified] = ' ',
        [StatusType.Unmerged] = 'U',
        [StatusType.Untracked] = '?',
        [StatusType.External] = 'X',

        [StatusType.UpstreamAdded] = 'A',
        [StatusType.UpstreamCopied] = 'C',
        [StatusType.UpstreamDeleted] = 'D',
        [StatusType.UpstreamIgnored] = '!',
        [StatusType.UpstreamModified] = 'M',
        [StatusType.UpstreamRenamed] = 'R',

        [StatusType.UpstreamTypeChanged] = 'T',
        [StatusType.UpstreamUnmodified] = ' ',
        [StatusType.UpstreamUnmerged] = 'U',
        [StatusType.UpstreamUntracked] = '?',
        [StatusType.UpstreamExternal] = 'X',
        [StatusType.UpstreamExternal] = 'X',
    },
})

vim.api.nvim_set_hl(0, 'OilVcsStatusAdded', { bg = 'none', fg = '#31748f' })
vim.api.nvim_set_hl(0, 'OilVcsStatusCopied', { bg = 'none', fg = '#403d52' })
vim.api.nvim_set_hl(0, 'OilVcsStatusDeleted', { bg = 'none', fg = '#eb6f92' })
vim.api.nvim_set_hl(0, 'OilVcsStatusIgnored', { bg = 'none', fg = '#6e6a86' })
vim.api.nvim_set_hl(0, 'OilVcsStatusModified', { bg = 'none', fg = '#f6c177' })
vim.api.nvim_set_hl(0, 'OilVcsStatusRenamed', { bg = 'none', fg = '#ebbcba' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUntracked', { bg = 'none', fg = '#c4a7e7' })

vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamAdded', { bg = 'none', fg = '#31748f' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamCopied', { bg = 'none', fg = '#403d52' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamDeleted', { bg = 'none', fg = '#eb6f92' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamIgnored', { bg = 'none', fg = '#6e6a86' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamModified', { bg = 'none', fg = '#f6c177' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamRenamed', { bg = 'none', fg = '#ebbcba' })
vim.api.nvim_set_hl(0, 'OilVcsStatusUpstreamUntracked', { bg = 'none', fg = '#c4a7e7' })
