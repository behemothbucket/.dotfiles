vim.cmd [[colorscheme coal]]

local Main_color               = "#80a6ed"
local Type_color               = "#4EC9B0"
local Function_color           = "#93abbd"
local Red_color                = "#960019"
local Yellow_color             = "#afa100"
local Green_color              = "#369432"
local Gray_color               = "#7a7a7a"

local gruber_darker_fg         = "#e4e4ef"
local gruber_darker_fg_1       = "#f4f4ff"
local gruber_darker_fg_2       = "#f5f5f5"
local gruber_darker_white      = "#ffffff"
local gruber_darker_black      = "#000000"
local gruber_darker_bg_m1      = "#101010"
local gruber_darker_bg         = "#181818"
local gruber_darker_bg_p1      = "#282828"
local gruber_darker_bg_p2      = "#453d41"
local gruber_darker_bg_p3      = "#484848"
local gruber_darker_bg_p4      = "#52494e"
local gruber_darker_red_m1     = "#c73c3f"
local gruber_darker_red        = "#f43841"
local gruber_darker_red_p1     = "#ff4f58"
local gruber_darker_green      = "#73c936"
local gruber_darker_yellow     = "#ffdd33"
local gruber_darker_brown      = "#cc8c3c"
local gruber_darker_quartz     = "#95a99f"
local gruber_darker_niagara_m2 = "#303540"
local gruber_darker_niagara_m1 = "#565f73"
local gruber_darker_niagara    = "#96a6c8"
local gruber_darker_wisteria   = "#9e95c7"

--Main
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = gruber_darker_bg_p1, fg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = gruber_darker_bg, fg = gruber_darker_fg })
vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
vim.api.nvim_set_hl(0, "LineNr", { bg = gruber_darker_bg, fg = Gray_color })
vim.api.nvim_set_hl(0, "CursorLineNR", { bg = gruber_darker_bg, fg = gruber_darker_yellow })
vim.api.nvim_set_hl(0, "NonText", { link = "Normal" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = gruber_darker_bg })
vim.api.nvim_set_hl(0, "StatusLine", { fg = gruber_darker_quartz, bg = gruber_darker_bg_p1 })
vim.api.nvim_set_hl(0, "MsgArea", { fg = gruber_darker_quartz })
vim.api.nvim_set_hl(0, "Visual", { bg = gruber_darker_bg_p3, fg = gruber_darker_fg })
vim.api.nvim_set_hl(0, "IncSearch", { fg = gruber_darker_fg_1, bg = gruber_darker_niagara_m1 })
vim.api.nvim_set_hl(0, "Substitute", { link = "IncSearch" })
vim.api.nvim_set_hl(0, "Search", { link = "IncSearch" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = gruber_darker_niagara_m2 })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = gruber_darker_bg_p3 })
vim.api.nvim_set_hl(0, "ModeMsg", { link = "Normal" })
vim.api.nvim_set_hl(0, "TabLineSel", { link = "Normal" })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = gruber_darker_yellow, bg = gruber_darker_bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = Gray_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "MatchParen", { bg = gruber_darker_bg_p4 })
vim.api.nvim_set_hl(0, "Title", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "Comment", { fg = Gray_color, italic = true })
vim.api.nvim_set_hl(0, "Directory", { fg = gruber_darker_quartz, bold = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = Gray_color, bg = gruber_darker_bg_m1 })

--To-do
vim.api.nvim_set_hl(0, "Todo", { fg = "#4BA8FF", bg = "#0b1e33" })
vim.api.nvim_set_hl(0, "@text.todo", { link = "Todo" })
vim.api.nvim_set_hl(0, "@text.note", { fg = "#FF57FF", bg = "#1b0e23" })
vim.api.nvim_set_hl(0, "@text.warning", { fg = "#FF9900", bg = "#392a13" })
vim.api.nvim_set_hl(0, "@text.danger", { fg = "#FF8B64", bg = "#391a13" })

--TODO
--NOTE
--WARNING
--BUG

--URI
vim.api.nvim_set_hl(0, "@text.uri", { fg = gruber_darker_niagara, underline = true })

--Markdown todo checkbox
vim.api.nvim_set_hl(0, "@unchecked_list_item", { fg = "#F8F8F2" })
vim.api.nvim_set_hl(0, "@checked_list_item", { fg = Gray_color, strikethrough = true })
vim.api.nvim_set_hl(0, "@text.todo.unchecked", { link = "@unchecked_list_item" })
vim.api.nvim_set_hl(0, "@text.todo.checked", { link = "@checked_list_item" })

--Semantic
vim.api.nvim_set_hl(0, "@keyword", { fg = gruber_darker_yellow, bold = true })
vim.api.nvim_set_hl(0, "@function", { fg = gruber_darker_niagara })
vim.api.nvim_set_hl(0, "@method", { link = "@function" })
vim.api.nvim_set_hl(0, "@field", { link = "Identifier" }) -- links to Function
vim.api.nvim_set_hl(0, "Identifier", { fg = gruber_darker_fg_1 })
vim.api.nvim_set_hl(0, "@constructor", { link = "@function" })
vim.api.nvim_set_hl(0, "Repeat", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@repeat", { link = "Repeat" })
vim.api.nvim_set_hl(0, "@label", { link = "String" })
vim.api.nvim_set_hl(0, "@variable", { fg = gruber_darker_fg_1 })
vim.api.nvim_set_hl(0, "@type", { fg = gruber_darker_quartz })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@constant", { link = "@type" })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = gruber_darker_yellow })
vim.api.nvim_set_hl(0, "String", { fg = gruber_darker_green })
vim.api.nvim_set_hl(0, "Error", { fg = gruber_darker_red })
vim.api.nvim_set_hl(0, "ErrorMsg", { link = "Error" })
vim.api.nvim_set_hl(0, "@operator", { link = "@variable" })
vim.api.nvim_set_hl(0, "Boolean", { link = "String" })
vim.api.nvim_set_hl(0, "PreProc", { fg = gruber_darker_quartz })
vim.api.nvim_set_hl(0, "SpecialChar", { link = "String" })         --\n \r RegExp
vim.api.nvim_set_hl(0, "Tag", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "SpecialComment", { link = "SpecialChar" }) --?
vim.api.nvim_set_hl(0, "StorageClass", { link = "@keyword" })
vim.api.nvim_set_hl(0, "Function", { link = "@function" })
vim.api.nvim_set_hl(0, "@punctuation.special", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = gruber_darker_fg })
vim.api.nvim_set_hl(0, "Special", { link = "@keyword" })
-- vim.api.nvim_set_hl(0, "@property", { fg = Main_color })
vim.api.nvim_set_hl(0, "Conditional", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@conditional", { link = "Conditional" })
vim.api.nvim_set_hl(0, "Exception", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@exception", { link = "Exception" })
-- vim.api.nvim_set_hl(0, "Number", { fg = "#225a99" })
-- vim.api.nvim_set_hl(0, "Float", { link = "Number" })

--Languanges
vim.api.nvim_set_hl(0, "@css.property_name", { fg = Gray_color })

vim.api.nvim_set_hl(0, "@c.primitive_type", { link = "@type" })
vim.api.nvim_set_hl(0, "@c.function_identifier", { link = "@variable" })

-- *Type    int, long, char, etc.
--  StorageClass  static, register, volatile, etc.
--  Structure  struct, union, enum, etc.
--  Typedef  A typedef

-- *Special  any special symbol
--   SpecialChar  special character in a constant
--   Tag    you can use CTRL-] on this
--   Delimiter  character that needs attention
--   SpecialComment  special things inside a comment
--   Debug    debugging statements

--Diagnostic
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = gruber_darker_red })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = gruber_darker_yellow })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = Gray_color })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#4BA8FF" })
vim.api.nvim_set_hl(0, "DiagnosticError", { link = "DiagnosticSignError" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "DiagnosticSignWarn" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "DiagnosticSignHint" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { link = "DiagnosticSignInfo" })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = gruber_darker_fg, bg = "#0A2517" })
vim.api.nvim_set_hl(0, "DiffAdded", { fg = Green_color })
vim.api.nvim_set_hl(0, "DiffChange", { link = "@text.warning" })
vim.api.nvim_set_hl(0, "DiffChanged", { fg = Yellow_color })
vim.api.nvim_set_hl(0, "DiffDelete", { link = "@text.danger" })
vim.api.nvim_set_hl(0, "DiffRemoved", { fg = Red_color })
vim.api.nvim_set_hl(0, "DiffText", { link = "DiffAdd" })
--Git
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = gruber_darker_green })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = gruber_darker_yellow })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = gruber_darker_red })

--Plugins
-- vim.api.nvim_set_hl(0, "ZenBg", { bg = "#0C0C0C" })
--
-- vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = Main_color })
-- vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = Main_color })
-- vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = Main_color })
-- vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = Main_color })
-- vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#7a7a7a" })
-- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#0C0C0C" })
-- vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = Green_color, bold = true, italic = true })
-- vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#c6c6c6" })

-- vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = Yellow_color })
-- vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = "#785705" })

-- .zshrc >> export FZF_DEFAULT_OPTS="--color=bg+:#0b1e33,fg+:#4BA8FF,gutter:-1"
-- vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { link = "@text.todo" })

--Scheme icon
vim.api.nvim_set_hl(0, "DevIconScheme", { fg = gruber_darker_red })

--Dapui
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = "Error", linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = "@text.warning", linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = "Error", linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = "Error", linehl = '', numhl = '' })

--Lsp
vim.fn.sign_define('LspInfoBorder', { link = "FloatBorder" })

--Oil
vim.api.nvim_set_hl(0, 'OilDir', { link = "Directory" })

--Mason
vim.api.nvim_set_hl(0, 'MasonHeader', { link = "StatusLine" })

--Illuminate
-- vim.cmd "hi IlluminatedWordText term=NONE gui=NONE"
-- vim.cmd "hi IlluminatedWordWrite term=NONE gui=NONE"
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#0d2538", underline = false })
