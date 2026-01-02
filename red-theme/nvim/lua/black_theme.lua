-- Reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.termguicolors = true
vim.g.colors_name = "red-theme"

local colors = {
  bg       = "#120607",
  bg_alt   = "#1a0a0d",
  bg_sel   = "#2a0f13",

  fg       = "#f2eaea",
  fg_light = "#ffffff",
  fg_med   = "#d6bcbc",
  fg_dim   = "#9a7a7a",
  fg_dark  = "#6b4a4a",

  accent   = "#ff4d5a",
  accent_d = "#b11226",
  border   = "#3a1a1e",
}

local set = vim.api.nvim_set_hl

-- =====================
-- Editor
-- =====================
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
set(0, "EndOfBuffer", { fg = colors.bg })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.accent })
set(0, "LineNr", { fg = colors.fg_dark })
set(0, "Visual", { bg = colors.bg_sel })
set(0, "Search", { fg = colors.bg, bg = colors.accent })
set(0, "IncSearch", { fg = colors.bg, bg = colors.accent })

-- =====================
-- UI
-- =====================
set(0, "VertSplit", { fg = colors.border })
set(0, "WinSeparator", { fg = colors.border })
set(0, "StatusLine", { fg = colors.fg_light, bg = colors.bg_alt })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg })
set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_alt })
set(0, "PmenuSel", { fg = colors.accent, bg = colors.bg_sel })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.fg_dim })

-- =====================
-- Diagnostics (discretos, sem poluir)
-- =====================
set(0, "DiagnosticError", { fg = colors.accent_d })
set(0, "DiagnosticWarn", { fg = colors.fg_med })
set(0, "DiagnosticInfo", { fg = colors.fg_dim })
set(0, "DiagnosticHint", { fg = colors.fg_dark })

-- =====================
-- Syntax
-- =====================
set(0, "Comment", { fg = colors.fg_dark, italic = true })
set(0, "Constant", { fg = colors.fg_med })
set(0, "String", { fg = colors.fg_med })
set(0, "Number", { fg = colors.fg_dark })
set(0, "Identifier", { fg = colors.fg_dim })
set(0, "Function", { fg = colors.fg_light })
set(0, "Statement", { fg = colors.accent })
set(0, "Keyword", { fg = colors.accent, italic = true })
set(0, "Type", { fg = colors.fg_med })
set(0, "Operator", { fg = colors.fg })

-- =====================
-- Treesitter
-- =====================
set(0, "@comment", { link = "Comment" })
set(0, "@string", { link = "String" })
set(0, "@number", { link = "Number" })
set(0, "@function", { link = "Function" })
set(0, "@keyword", { link = "Keyword" })
set(0, "@type", { link = "Type" })
set(0, "@variable", { link = "Identifier" })
set(0, "@constant", { link = "Constant" })
set(0, "@operator", { link = "Operator" })

-- =====================
-- Extras
-- =====================
set(0, "CursorColumn", { bg = colors.bg_alt })
set(0, "ColorColumn", { bg = "#18090b" })
set(0, "MatchParen", {
  fg = colors.accent,
  bg = colors.bg_sel,
  bold = true
})
