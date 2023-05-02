local map = vim.keymap.set
local cmd = vim.cmd
-- local dap = require("dap")
-- local dapui = require("dapui")

--ZenMode
-- map("n", "<Space>z", ":ZenMode<CR>", { noremap = true, silent = true })

--PackerSync
map("n", "<Space>p", ":PackerSync<CR>", { noremap = true, silent = true, nowait = true })

--ToggleTerm
-- map("n", "<Bslash>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

--Oil
map("n", "<Bslash>f", ":Oil --float .<CR>", { noremap = true, silent = true })

--Yabs
map("n", "<Tab><Tab>", ":YABSOpen<CR>", { noremap = true, silent = true })

--Harpoon
-- map("n", "<Space>m", "<cmd>lua require('harpoon.mark').add_file()<CR><cmd>echo 'Harpoon: Mark added'<CR>",
--   { noremap = true, silent = true })
-- map("n", "<Bslash><Bslash>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

--Window
-- map("n", "<Space>w", ":lua require('nvim-window').pick()<CR>", { silent = true })

--Neogen
-- map("n", "<Space>gf", ":lua require('neogen').generate({ type = 'func' })<CR>", { noremap = true, silent = true })
-- map("n", "<Space>gc", ":lua require('neogen').generate({ type = 'class' })<CR>", { noremap = true, silent = true })

-- --Goto-preview
-- map(
--   "n",
--   "<Space>d",
--   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
--   { noremap = true, silent = true }
-- )
-- map(
--   "n",
--   "<Space>r",
--   "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
--   { noremap = true, silent = true }
-- )
-- map("n", "<Space>q", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true, silent = true })
--
--Cheatsheet
-- map("n", "<F12>", ":Cheatsheet<CR>", { noremap = truen, silent = true })

--Treesj
-- map("n", "<C-j>", function()
--   require("treesj").toggle { split = { recursive = true } }
-- end)

--Neotree
-- map("n", "<Bslash>f", ":NeoTreeRevealToggle<CR>", { noremap = true, silent = true })
-- map("n", "<Bslash>g", ":Neotree float git_status<CR>", { noremap = true, silent = true })
-- map("n", "<Tab><Tab>", ":Neotree float buffers<CR>", { noremap = true, silent = true })

--Alter-toggle false -> true, 1 -> 0, !== -> ===
-- map("n", "<M-r>", ":lua require('alternate-toggler').toggleAlternate()<CR>", { noremap = true, silent = true })

--Toggle-checkbox
map("n", "<Space>tt", ":ToggleCheckbox<CR>", { noremap = true, silent = true })

--Gitsigns toggle
map("n", "<Space>gs", ":Gitsigns toggle_signs<CR>", { noremap = true, silent = true })

--Hop
local hop = require "hop"
local directions = require("hop.hint").HintDirection
map("", "f", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
end, { remap = true })
map("", "F", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
end, { remap = true })
map("", "t", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true })
map("", "T", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true })
map("n", "ff", ":HopChar2<CR>")

--Floaterm
-- map("n", "<Bslash>t", ":FloatermToggle<CR>", { silent = true })
-- map("n", "<F5>", "<cmd>w<CR><cmd>echo 'Saved'<CR><cmd>FloatermNew! node %<CR>", { noremap = true, silent = true })

--Iron
-- map("n", "<Space>rs", ":IronRepl<CR>")
-- map("n", "<Space>rf", ":IronFocus<CR>")

--Trouble
-- map("n", "<Space>p", ":TroubleToggle<CR>")

--Mov to start/end of line
map("i", "<C-s>", "<ESC>I")
map("i", "<C-e>", "<ESC>A")

--No highlight
-- map("n", "<Space>h", ":noh<CR>", { noremap = true, silent = true })

-- Always use very magic mode for searching
map("n", "/", [[/\v]])

--Escape -> jj
map("i", "jj", "<Esc>", { nowait = true })
map("t", "jj", "<C-Bslash><C-n>", { nowait = true })
map("t", "<Esc>", "<C-Bslash><C-n>", { nowait = true })

--Open URL in browser (Windows
-- vnoremap <silent> <C-F5> :<C-U>let old_reg=@"<CR>gvy:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>
map("n", "gx", ":silent !xdg-open <cfile><CR>", { noremap = true, silent = true }) -- Not work properly

-- Linux https://www.reddit.com/r/neovim/comments/ro6oye/comment/hq2o7rc/?utm_source=share&utm_medium=web2x&context=3
-- map("n", "gx", ":execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true)", { noremap = true, silent = true })

--Plugins file
map("n", "<F3>", ":e ~/.config/nvim/lua/plugins.lua<CR>", { noremap = true, silent = true })

--Source current file
map("n", "<Space>ss", "<cmd>w | so%<CR><cmd>echo 'Sourced'<cr>", { noremap = true, nowait = true })

--Tab navigation
map("n", "<A-Left>", ":bprevious<CR>", { silent = true })
map("n", "<A-Right>", ":bnext<CR>", { silent = true })
-- Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933
map("n", "<A-d>", "<cmd>bprevious <bar> bdelete #<cr>", { silent = true })
map("n", "<A-q>", ":wqa<CR>", { silent = true })
map("n", "<C-s>", "<cmd>w<CR><cmd>echo 'Saved'<CR>")
map("n", "<A-w>", ":q<CR>", { silent = true })
map("n", "<A-c>", ":bdelete<CR>", { silent = true })
-- map("n", "<A-c>", ":BufferClose<CR>", { silent = true })
-- map("n", "<A-d>", ":w <Bar> bdelete<CR>", { silent = true })

--Resize tab
map("n", "<C-Left>", ":vertical resize -10<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +10<CR>", { silent = true })

--Move lines up and down
map("n", "<S-Up>", ":m-2<CR>", { noremap = true, silent = true })
map("n", "<S-Down>", ":m+<CR>", { noremap = true, silent = true })

--Add lines above and below
map("n", "<A-Up>", ':put!=repeat(nr2char(10), v:count1)|silent ""]-<CR>', { noremap = true, silent = true })
map("n", "<A-Down>", ':put=repeat(nr2char(10), v:count1)|silent ""]+<CR>', { noremap = true, silent = true })

-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
map("n", "<Space><Space>", "<cmd>lcd %:p:h<CR><cmd>pwd<CR>", { noremap = true, silent = false})

-- Copy entire buffer.
map("n", "<Space>y", "<cmd>%yank<cr><cmd>echo 'Copied all lines'<CR>")

-- Do not move my cursor when joining lines.
map("n", "J", function()
  vim.cmd [[
      normal! mzJ`z
      delmarks z
    ]]
end, {
  desc = "join line",
})

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>A;<Esc>i");

--Dap
-- map('n', '<F5>', function()
--   cmd("silent w")
--   dap.continue()
-- end)
-- map('n', '<F10>', dap.step_over)
-- map('n', '<F11>', dap.step_into)
-- map('n', '<F12>', dap.step_out)
-- map('n', '<Space>b', dap.toggle_breakpoint)
-- map("n", "<Space>cb", function()
--   dap.clear_breakpoints()
--   cmd("echo 'Breakpoints cleared'")
-- end)
-- map("n", "<Space>dd", dap.terminate)
-- map("n", "<Space>dl", function()
--   cmd("silent w")
--   dap.run_last()
--   cmd("echo 'Running last session'")
-- end)
-- map('n', '<Space>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

--Dapui
-- map('n', "<Space>du", dapui.toggle)
