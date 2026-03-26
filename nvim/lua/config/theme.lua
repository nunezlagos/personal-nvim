-- Tema Dark personalizado para Neovim
vim.cmd("hi clear")
vim.opt.termguicolors = true
vim.g.colors_name = "dark-custom"

local c = {
  bg = "#1A1B1D",
  fg = "#D1D3DB",
  bg_alt = "#222222",
  fg_alt = "#D5D8E0",

  -- Colores principales
  string = "#82D99F",
  keyword = "#B38CFF",
  func = "#80BBFF",
  number = "#F48CCA",
  comment = "#737780",
  tag = "#F2858C",
  variable = "#DED47E",
  operator = "#D5D8E0",
  error = "#CC4B53",
  warning = "#EB9B61",

  -- UI
  line_bg = "#292c34",
  selection = "#3579FF47",
  cursor = "#ffffff",
  line_nr = "#979AA4",
  line_nr_act = "#E0E3EE",

  -- Borders
  border = "#303031",
  border_alt = "#E0E2F217",
}

-- Highlights básicos
vim.api.nvim_set_hl(0, "Normal", { bg = c.bg, fg = c.fg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = c.bg_alt, fg = c.fg })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = c.bg_alt, fg = c.border })
vim.api.nvim_set_hl(0, "CursorLine", { bg = c.line_bg })
vim.api.nvim_set_hl(0, "Cursor", { bg = c.cursor })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.line_nr_act })
vim.api.nvim_set_hl(0, "LineNr", { fg = c.line_nr })
vim.api.nvim_set_hl(0, "Comment", { fg = c.comment })
vim.api.nvim_set_hl(0, "String", { fg = c.string })
vim.api.nvim_set_hl(0, "Number", { fg = c.number })
vim.api.nvim_set_hl(0, "Boolean", { fg = c.number })
vim.api.nvim_set_hl(0, "Float", { fg = c.number })

-- Keywords
vim.api.nvim_set_hl(0, "Keyword", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Statement", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Conditional", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Repeat", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Label", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Operator", { fg = c.operator })
vim.api.nvim_set_hl(0, "OperatorKeyword", { fg = c.keyword })

-- Functions
vim.api.nvim_set_hl(0, "Function", { fg = c.func })
vim.api.nvim_set_hl(0, "Method", { fg = c.func })
vim.api.nvim_set_hl(0, "BuiltinFunc", { fg = c.func })

-- Variables y tipos
vim.api.nvim_set_hl(0, "Variable", { fg = c.fg_alt })
vim.api.nvim_set_hl(0, "Identifier", { fg = c.fg_alt })
vim.api.nvim_set_hl(0, "Type", { fg = c.variable })
vim.api.nvim_set_hl(0, "TypeDef", { fg = c.variable })
vim.api.nvim_set_hl(0, "Class", { fg = c.variable })
vim.api.nvim_set_hl(0, "Struct", { fg = c.variable })

-- Tags HTML/XML
vim.api.nvim_set_hl(0, "Tag", { fg = c.tag })
vim.api.nvim_set_hl(0, "htmlTag", { fg = c.tag })
vim.api.nvim_set_hl(0, "HTMLTagName", { fg = c.tag })
vim.api.nvim_set_hl(0, "htmlArg", { fg = c.variable })

-- Atributos
vim.api.nvim_set_hl(0, "Attribute", { fg = c.variable })
vim.api.nvim_set_hl(0, "Property", { fg = c.fg_alt })
vim.api.nvim_set_hl(0, "Field", { fg = c.fg_alt })

-- Errores y warnings
vim.api.nvim_set_hl(0, "Error", { fg = c.error })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = c.error })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = c.warning })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = c.error })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = c.warning })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.func })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.string })

-- Search y match
vim.api.nvim_set_hl(0, "Search", { bg = "#DADDE552" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = c.selection })
vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D5D8E03D" })

-- Puntuación
vim.api.nvim_set_hl(0, "Delimiter", { fg = c.fg_alt })
vim.api.nvim_set_hl(0, "Punctuation", { fg = c.fg_alt })

-- Constantes
vim.api.nvim_set_hl(0, "Constant", { fg = c.func })
vim.api.nvim_set_hl(0, "Special", { fg = c.number })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = c.number })

-- Preprocessor
vim.api.nvim_set_hl(0, "PreProc", { fg = c.func })
vim.api.nvim_set_hl(0, "PreCondit", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Include", { fg = c.keyword })
vim.api.nvim_set_hl(0, "Define", { fg = c.keyword })

-- Storage
vim.api.nvim_set_hl(0, "StorageClass", { fg = c.keyword })
vim.api.nvim_set_hl(0, "TypeSpecifier", { fg = c.keyword })

-- Regex
vim.api.nvim_set_hl(0, "SpecialComment", { fg = c.comment })
vim.api.nvim_set_hl(0, "Regexp", { fg = c.string })

-- Markdown
vim.api.nvim_set_hl(0, "markdownHeading", { fg = c.func, bold = true })
vim.api.nvim_set_hl(0, "markdownCode", { fg = c.string })
vim.api.nvim_set_hl(0, "markdownCodeDelimiter", { fg = c.string })
vim.api.nvim_set_hl(0, "markdownLinkText", { fg = c.func })

-- Nvim specific
vim.api.nvim_set_hl(0, "WinBar", { bg = c.bg_alt, fg = c.fg_alt })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = c.bg_alt, fg = c.comment })
vim.api.nvim_set_hl(0, "StatusLine", { bg = c.bg_alt, fg = c.fg_alt })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = c.bg_alt, fg = c.comment })
vim.api.nvim_set_hl(0, "VertSplit", { bg = c.bg_alt, fg = c.border_alt })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = c.bg_alt, fg = c.border_alt })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = c.bg_alt, fg = c.fg })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = c.bg_alt, fg = c.border })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = c.bg_alt })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = c.bg_alt, fg = c.border })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#E0E2F214", fg = c.fg })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = c.func })

-- Rainbow brackets
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F2858C" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#DED47E" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#80BBFF" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#F48CCA" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#82D99F" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B38CFF" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#66CCAA" })

-- LSP
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#264f7840" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#264f7840" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#264f7840" })
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = c.line_bg })

-- Diff
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#00A56E47" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3579FF33" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#D02A2347" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#00A56E47" })

-- NeoTree
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = c.bg, fg = c.fg })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = c.bg_alt, fg = c.fg_alt })
vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = c.bg_alt, fg = c.fg })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = c.bg_alt, fg = c.border })

-- WhichKey
vim.api.nvim_set_hl(0, "WhichKey", { fg = c.func })
vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = c.variable })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = c.fg_alt })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = c.bg_alt })

-- Indent guides
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#E0E2F217", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#E0E2F22E", nocombine = true })

-- Noice
vim.api.nvim_set_hl(0, "NoicePopupmenu", { bg = c.bg_alt, fg = c.fg })
vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { bg = c.bg_alt, fg = c.border })
vim.api.nvim_set_hl(0, "NoicePopupmenuKind", { fg = c.func })
vim.api.nvim_set_hl(0, "NoicePopupmenuSelected", { bg = "#E0E2F214", fg = c.fg })

-- Mini
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#E0E2F217" })
vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = c.bg_alt, fg = c.fg })
vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = c.bg_alt, fg = c.border })
vim.api.nvim_set_hl(0, "MiniPickHeader", { fg = c.func })
vim.api.nvim_set_hl(0, "MiniPickMatchText", { bg = c.selection })

-- Visual
vim.api.nvim_set_hl(0, "Visual", { bg = c.selection })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = c.selection })

-- Folded
vim.api.nvim_set_hl(0, "Folded", { bg = c.bg_alt, fg = c.comment })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = c.bg, fg = c.comment })

-- Git signs
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#66CCAA" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.func })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.error })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = c.error })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = c.warning })

-- Quickfix
vim.api.nvim_set_hl(0, "qfFileName", { fg = c.func })
vim.api.nvim_set_hl(0, "qfLineNr", { fg = c.comment })
