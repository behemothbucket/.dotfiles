local opt = vim.opt
local g = vim.g

-- g.loaded_netrwPlugin = 1 -- Don't load netrw
-- g.loaded_netrw = 1       -- gx won't work
-- g.netrw_browse_split = 0
-- g.netrw_banner = 0
-- g.netrw_winsize = 25

g.gist_is_private = true

opt.number = true
-- opt.autowrite = true -- Enable auto write
-- opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.completeopt = 'menu,menuone,noselect'
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.ff = 'unix'
-- opt.laststatus = 3    -- statusline per neovim instance
opt.showtabline = 0   -- Tabs on/off
opt.pumblend = 0      -- Popup blend/transparency
opt.pumheight = 10    -- Maximum number of entries in a popup
opt.scrolloff = 4     -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2    -- Size of an indent
opt.mouse = 'nvc'     -- Enable mouse mode("a") or disable
opt.smartindent = true
opt.spelllang = { 'en' }
opt.tabstop = 4
opt.expandtab = true
opt.formatoptions = 'ljcq'
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.autoindent = true
opt.splitright = true
opt.splitbelow = true

-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--      ["+"] = 'win32yank.exe -i --crlf',
--      ["*"] = 'win32yank.exe -i --crlf',
--    },
--   paste = {
--      ["+"] = 'win32yank.exe -o --lf',
--      ["*"] = 'win32yank.exe -o --lf',
--   },
--   cache_enabled = 0,
-- }
opt.clipboard = 'unnamedplus'
opt.wildmenu = true
opt.wildignorecase = true --Show matching brackets
opt.showmatch = true
-- opt.shortmess:append { W = true, I = true, c = true }
opt.shortmess = 'filnxtToOFc'
opt.showmode = false  -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.incsearch = true
opt.emoji = true
opt.termguicolors = true
opt.undofile = true
opt.hidden = true
opt.signcolumn = 'yes:1'
-- opt.signcolumn = 'number'
opt.undolevels = 10000
opt.updatetime = 1000
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap
opt.background = 'dark'
opt.selection = 'old'              -- No need extra block character to copy (Viusal mode)

---------------------------------------------------------------------------------------------------
-- Setup python path
---------------------------------------------------------------------------------------------------
local possible_python_paths = {
  -- Extend the list for possible python path. Will use the 1st possible one
  os.getenv('HOME') .. '~/qa/autotests_jm_landing/.venv/bin/python3',   -- Python3's venv (dev)
  -- os.getenv("HOME") .. "/opt/anaconda3/envs/dev/bin/python", -- MacOS's conda (dev)
  -- os.getenv("HOME") .. "/anaconda3/envs/dev/bin/python",     -- Linux's conda (dev)
  os.getenv('HOME') .. '/.conda/envs/dev/bin/python',   -- Linux's alternative conda (dev)
  -- os.getenv("HOME") .. "/.pyenv/shims/python",               -- pyenv's default path
  '/usr/bin/python3',                                   -- System default python3
  '/usr/bin/python',                                    -- System default python
}
for _, python_path in pairs(possible_python_paths) do
  if io.open(python_path, 'r') ~= nil then
    g.python3_host_prog = python_path
    break
  end
end

---------------------------------------------------------------------------------------------------
-- Deactivate unused providers
---------------------------------------------------------------------------------------------------
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

opt.undodir = vim.fn.expand('~/.config/nvim/undo')

-- if vim.fn.has "nvim-0.9.0" == 1 then
--   opt.splitkeep = "screen"
--   opt.shortmess:append { C = true }
-- end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

--Floaterm
-- cmd "let g:floaterm_height = 0.9 | let g:floaterm_title = 'Terminal'"
