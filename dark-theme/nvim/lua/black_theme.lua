-- Reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.termguicolors = true
vim.g.colors_name = "black-theme"

-- Paleta monocromática final
local colors = {
  -- Fundos
  bg       = "#0b0b0b",  -- fundo principal
  bg_alt   = "#141414",  -- fundo alternativo (CursorLine, menus)
  bg_sel   = "#1f1f1f",  -- seleção visual
  -- Texto
  fg       = "#e5e5e5",  -- texto principal
  fg_light = "#f5f5f5",  -- cinza claro (funções, keywords)
  fg_med   = "#cccccc",  -- cinza médio (constantes, strings, tipos)
  fg_dim   = "#888888",  -- cinza escuro (identificadores, hints)
  fg_dark  = "#555555",  -- cinza bem escuro (comentários, números, linhas)
  border   = "#222222",  -- separadores e bordas
}

local set = vim.api.nvim_set_hl

-- =====================
-- Editor
-- =====================
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
set(0, "EndOfBuffer", { fg = colors.bg })  -- esconde ~
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.fg_light })
set(0, "LineNr", { fg = colors.fg_dark })
set(0, "Visual", { bg = colors.bg_sel })
set(0, "Search", { fg = colors.bg, bg = colors.fg_light })
set(0, "IncSearch", { fg = colors.bg, bg = colors.fg_light })

-- =====================
-- UI
-- =====================
set(0, "VertSplit", { fg = colors.border })
set(0, "WinSeparator", { fg = colors.border })
set(0, "StatusLine", { fg = colors.fg_light, bg = colors.bg_alt })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg })
set(0, "Pmenu", { fg = colors.fg, bg = colors.bg_alt })
set(0, "PmenuSel", { fg = colors.fg_light, bg = colors.bg_sel })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.fg_dim })

-- =====================
-- Diagnostics (seguem escala de cinza)
-- =====================
set(0, "DiagnosticError", { fg = colors.fg_dark })
set(0, "DiagnosticWarn", { fg = colors.fg_dim })
set(0, "DiagnosticInfo", { fg = colors.fg_med })
set(0, "DiagnosticHint", { fg = colors.fg_dim })

-- =====================
-- Syntax (hierarquia de cinza)
-- =====================
set(0, "Comment", { fg = colors.fg_dark, italic = true })   -- mais escuro
set(0, "Constant", { fg = colors.fg_med })                  -- cinza médio
set(0, "String", { fg = colors.fg_med })
set(0, "Number", { fg = colors.fg_dark })
set(0, "Identifier", { fg = colors.fg_dim })  -- cinza escuro
set(0, "Function", { fg = colors.fg_light })  -- cinza claro
set(0, "Statement", { fg = colors.fg_light })
set(0, "Keyword", { fg = colors.fg_light, italic = true })
set(0, "Type", { fg = colors.fg_med })
set(0, "Operator", { fg = colors.fg })

-- =====================
-- Treesitter fallback
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
-- Extras para legibilidade
-- =====================
set(0, "CursorColumn", { bg = colors.bg_alt })                                    -- coluna do cursor
set(0, "ColorColumn", { bg = "#181818" })                                         -- limite de coluna
set(0, "MatchParen", { fg = colors.fg_light, bg = colors.bg_sel, bold = true })   -- parênteses combinados
