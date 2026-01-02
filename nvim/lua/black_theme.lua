-- Reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.termguicolors = true
vim.g.colors_name = "black-theme"

-- Paleta
local colors = {
  bg      = "#0b0b0b",
  bg_alt  = "#111111",
  bg_sel  = "#1a1a1a",
  fg      = "#e5e5e5",
  fg_dim  = "#888888",
  fg_dark = "#555555",
  border  = "#222222",
}

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
set(0, "EndOfBuffer", { fg = colors.bg })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.fg })
set(0, "LineNr", { fg = colors.fg_dark })
set(0, "Visual", { bg = colors.bg_sel })
set(0, "Search", { fg = colors.bg, bg = colors.fg })
set(0, "IncSearch", { fg = colors.bg, bg = colors.fg })

-- UI
set(0, "VertSplit", { fg = colors.border })
set(0, "WinSeparator", { fg = colors.border })
set(0, "StatusLine", { fg = colors.fg, bg = colors.bg_alt })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg })
set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_alt })
set(0, "PmenuSel", { fg = colors.fg, bg = colors.bg_sel })

-- Diagnostics (sem cores chamativas)
set(0, "DiagnosticError", { fg = colors.fg })
set(0, "DiagnosticWarn", { fg = colors.fg_dim })
set(0, "DiagnosticInfo", { fg = colors.fg_dim })
set(0, "DiagnosticHint", { fg = colors.fg_dim })

-- Syntax minimal
set(0, "Comment", { fg = colors.fg_dark, italic = true })
set(0, "Constant", { fg = colors.fg })
set(0, "String", { fg = colors.fg })
set(0, "Identifier", { fg = colors.fg })
set(0, "Function", { fg = colors.fg })
set(0, "Statement", { fg = colors.fg })
set(0, "Keyword", { fg = colors.fg })
set(0, "Type", { fg = colors.fg })
set(0, "Operator", { fg = colors.fg })

-- Treesitter fallback
set(0, "@comment", { link = "Comment" })
set(0, "@string", { link = "String" })
set(0, "@function", { link = "Function" })
set(0, "@keyword", { link = "Keyword" })
