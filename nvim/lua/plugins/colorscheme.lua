-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Neon Abyss (sobre base Kanagawa Wave)
-- Cyan #00DDB8 · Lime #7AF060 · Rose #FF6B8E · Green #32F08C
-- Pink #E070B8 · Amber #E8D040 · Orange #F07840 · Red #F03060
-- Lavender #9878E8 · bg #0A1018 · fg #A8D8C8
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      theme = "wave",
      background = { dark = "wave", light = "lotus" },

      colors = {
        palette = {
          -- Backgrounds
          sumiInk0      = "#060b0e",
          sumiInk1      = "#080e14",
          sumiInk2      = "#0a1018",
          sumiInk3      = "#0e1820",
          sumiInk4      = "#142a38",
          sumiInk5      = "#1a3040",
          sumiInk6      = "#224050",
          -- Text
          fujiWhite     = "#a8d8c8",
          oldWhite      = "#88b8a8",
          fujiGray      = "#3d6070",
          -- Cyan (protagonista)
          waveAqua1     = "#00ddb8",
          waveAqua2     = "#00f8d8",
          crystalBlue   = "#00ddb8",
          springBlue    = "#40e8d0",
          -- Green (strings)
          springGreen   = "#32f08c",
          autumnGreen   = "#32f08c",
          -- Lime (funciones / directorios)
          dragonGreen   = "#7af060",
          dragonGreen2  = "#50f8a0",
          -- Rose (keywords — el toque futurista)
          peachRed      = "#ff6b8e",
          samuraiRed    = "#ff6b8e",
          suraBright    = "#ff6b8e",
          autumnRed     = "#f05070",
          -- Pink (números)
          dragonPink    = "#e070b8",
          -- Amber (warnings)
          carpYellow    = "#e8d040",
          boatYellow1   = "#f07840",
          boatYellow2   = "#f0a040",
          autumnYellow  = "#e8d040",
          -- Orange
          dragonOrange  = "#f07840",
          dragonOrange2 = "#f0a040",
          -- Red (errors)
          dragonRed     = "#f03060",
          -- Lavender (decoradores, namespace)
          oniViolet     = "#9878e8",
          oniViolet2    = "#b090f8",
          springViolet1 = "#9878e8",
          springViolet2 = "#b090f8",
          -- Teal secundario
          dragonTeal    = "#20c8b0",
          dragonAqua    = "#40e8d0",
          -- Grays
          dragonGray    = "#3d6070",
          dragonGray2   = "#5a8878",
          dragonGray3   = "#88b8a8",
          -- Dragon backgrounds
          dragonBlack0  = "#060b0e",
          dragonBlack1  = "#080e14",
          dragonBlack2  = "#0a1018",
          dragonBlack3  = "#0e1820",
          dragonBlack4  = "#142a38",
          dragonBlack5  = "#1a3040",
          dragonBlack6  = "#224050",
          dragonWhite   = "#a8d8c8",
          dragonYellow  = "#e8d040",
          dragonBlue    = "#00ddb8",
          dragonBlue2   = "#00f8d8",
          dragonViolet  = "#9878e8",
          -- Wave specific
          waveBlue1     = "#1a3040",
          waveBlue2     = "#224050",
          winterGreen   = "#0a1f18",
          winterYellow  = "#1a1a08",
          winterRed     = "#1a0a12",
          winterBlue    = "#0a1018",
          katanaGray    = "#224050",
        },
      },

      overrides = function(colors)
        return {
          -- ── Básico ──────────────────────────────────────────────────────
          CursorLine   = { bg = "#0e1f2e" },
          CursorLineNr = { fg = "#00ddb8", bold = true },
          LineNr       = { fg = "#224050" },
          SignColumn   = { bg = "NONE" },

          -- ── Separadores ─────────────────────────────────────────────────
          WinSeparator = { fg = "#224050" },
          VertSplit    = { fg = "#224050" },

          -- ── Directorios (lime, muy distinto de archivos) ─────────────────
          Directory    = { fg = "#7af060", bold = true },

          -- ── Statusline ───────────────────────────────────────────────────
          StatusLine   = { bg = "#0a1018", fg = "#a8d8c8" },
          StatusLineNC = { bg = "#060b0e", fg = "#3d6070" },

          -- ── Tabs ─────────────────────────────────────────────────────────
          TabLine      = { bg = "#0a1018", fg = "#3d6070" },
          TabLineSel   = { bg = "#1a3040", fg = "#00ddb8", bold = true },
          TabLineFill  = { bg = "#060b0e" },

          -- ── Telescope ───────────────────────────────────────────────────
          TelescopeNormal        = { bg = "#0e1820", fg = "#a8d8c8" },
          TelescopeBorder        = { fg = "#224050", bg = "#0e1820" },
          TelescopePromptBorder  = { fg = "#00ddb8", bg = "#0e1820" },
          TelescopeResultsBorder = { fg = "#224050", bg = "#0e1820" },
          TelescopePreviewBorder = { fg = "#224050", bg = "#0e1820" },
          TelescopeSelection     = { bg = "#1a3040" },
          TelescopeMatching      = { fg = "#7af060", bold = true },
          TelescopePromptPrefix  = { fg = "#00ddb8" },

          -- ── Completion (cmp) ─────────────────────────────────────────────
          Pmenu        = { bg = "#0e1820", fg = "#a8d8c8" },
          PmenuSel     = { bg = "#1a3040", fg = "#a8d8c8" },
          PmenuSbar    = { bg = "#142a38" },
          PmenuThumb   = { bg = "#00ddb8" },

          -- ── Diagnostics ──────────────────────────────────────────────────
          DiagnosticError            = { fg = "#f03060" },
          DiagnosticWarn             = { fg = "#e8d040" },
          DiagnosticInfo             = { fg = "#00ddb8" },
          DiagnosticHint             = { fg = "#7af060" },
          DiagnosticVirtualTextError = { fg = "#f03060", bg = "#1a0a12" },
          DiagnosticVirtualTextWarn  = { fg = "#e8d040", bg = "#1a1a08" },
          DiagnosticVirtualTextInfo  = { fg = "#00ddb8", bg = "#081818" },
          DiagnosticVirtualTextHint  = { fg = "#7af060", bg = "#081808" },
          DiagnosticUnderlineError   = { undercurl = true, sp = "#f03060" },
          DiagnosticUnderlineWarn    = { undercurl = true, sp = "#e8d040" },

          -- ── Git diff ─────────────────────────────────────────────────────
          DiffAdd    = { bg = "#0a1f18" },
          DiffChange = { bg = "#0a1828" },
          DiffDelete = { bg = "#1a0a12" },
          DiffText   = { bg = "#1a3040" },

          -- ── Search ───────────────────────────────────────────────────────
          Search    = { bg = "#1a3040", fg = "#e8d040" },
          IncSearch = { bg = "#00ddb8", fg = "#060b0e", bold = true },
          CurSearch = { bg = "#7af060", fg = "#060b0e", bold = true },

          -- ── Indent guides ────────────────────────────────────────────────
          IblIndent = { fg = "#0e1820" },
          IblScope  = { fg = "#224050" },

          -- ── Syntax extra ────────────────────────────────────────────────
          -- Keywords → rose (futurista)
          ["@keyword"]           = { fg = "#ff6b8e", italic = true },
          ["@keyword.function"]  = { fg = "#ff6b8e", italic = true },
          ["@keyword.return"]    = { fg = "#ff6b8e", italic = true },
          -- Funciones → lime
          ["@function"]          = { fg = "#7af060" },
          ["@function.call"]     = { fg = "#7af060" },
          ["@function.builtin"]  = { fg = "#40e8d0" },
          ["@method"]            = { fg = "#7af060" },
          ["@method.call"]       = { fg = "#7af060" },
          -- Strings → green
          ["@string"]            = { fg = "#32f08c" },
          ["@string.escape"]     = { fg = "#20c8b0" },
          -- Types → cyan
          ["@type"]              = { fg = "#00ddb8" },
          ["@type.builtin"]      = { fg = "#00ddb8", italic = true },
          -- Números → pink
          ["@number"]            = { fg = "#e070b8" },
          ["@float"]             = { fg = "#e070b8" },
          ["@boolean"]           = { fg = "#e070b8", italic = true },
          -- Operadores → cyan
          ["@operator"]          = { fg = "#00ddb8" },
          -- Variables → fg normal
          ["@variable"]          = { fg = "#a8d8c8" },
          ["@parameter"]         = { fg = "#88b8a8" },
          -- Namespace → lavender
          ["@namespace"]         = { fg = "#9878e8" },
          ["@module"]            = { fg = "#9878e8" },
          -- Constantes → orange
          ["@constant"]          = { fg = "#f07840" },
          ["@constant.builtin"]  = { fg = "#f07840", italic = true },
          -- Comentarios → dim
          ["@comment"]           = { fg = "#3d6070", italic = true },
          -- Tags (HTML/JSX) → rose
          ["@tag"]               = { fg = "#ff6b8e" },
          ["@tag.attribute"]     = { fg = "#00ddb8" },
          ["@tag.delimiter"]     = { fg = "#3d6070" },
          -- Punctuation
          ["@punctuation.bracket"]   = { fg = "#5a8878" },
          ["@punctuation.delimiter"] = { fg = "#5a8878" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  { "catppuccin", enabled = false },
  { "tokyonight", enabled = false },
}
