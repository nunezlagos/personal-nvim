-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Obsidian (sobre base Kanagawa Wave)
-- Fondo neutro puro, sin tintes azules — keratoconus-friendly
-- Cyan #00C8A0 · Lime #78E030 · Rose #E04870 · Green #2ED870
-- Pink #C050A0 · Amber #C8A018 · Orange #D06018 · Red #D02848
-- Lavender #8060C8 · bg #0A0A0A · fg #C4CDB8 (cálido, sin halo)
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
          -- Backgrounds (neutral puro, CERO tinte azul)
          sumiInk0      = "#070707",
          sumiInk1      = "#0a0a0a",
          sumiInk2      = "#0f0f0f",
          sumiInk3      = "#141414",
          sumiInk4      = "#1a2018",
          sumiInk5      = "#202820",
          sumiInk6      = "#282a24",
          -- Text (cálido, no azulado)
          fujiWhite     = "#c4cdb8",
          oldWhite      = "#a8b89c",
          fujiGray      = "#3a4a38",
          -- Cyan protagonista
          waveAqua1     = "#00c8a0",
          waveAqua2     = "#20e8b8",
          crystalBlue   = "#00c8a0",
          springBlue    = "#20e8b8",
          -- Green (strings)
          springGreen   = "#2ed870",
          autumnGreen   = "#2ed870",
          -- Lime (funciones, directorios)
          dragonGreen   = "#78e030",
          dragonGreen2  = "#98f050",
          -- Rose (keywords)
          peachRed      = "#e04870",
          samuraiRed    = "#e04870",
          suraBright    = "#e04870",
          autumnRed     = "#f06888",
          -- Pink (números)
          dragonPink    = "#c050a0",
          -- Amber (warnings)
          carpYellow    = "#c8a018",
          boatYellow1   = "#d06018",
          boatYellow2   = "#e08028",
          autumnYellow  = "#c8a018",
          -- Orange
          dragonOrange  = "#d06018",
          dragonOrange2 = "#e08028",
          -- Red (errors)
          dragonRed     = "#e04060",
          -- Lavender (namespace)
          oniViolet     = "#8060c8",
          oniViolet2    = "#a080e0",
          springViolet1 = "#8060c8",
          springViolet2 = "#a080e0",
          -- Grays (cálidos)
          dragonGray    = "#3a4a38",
          dragonGray2   = "#5a7058",
          dragonGray3   = "#a8b89c",
          -- Dragon backgrounds
          dragonBlack0  = "#070707",
          dragonBlack1  = "#0a0a0a",
          dragonBlack2  = "#0f0f0f",
          dragonBlack3  = "#141414",
          dragonBlack4  = "#1a2018",
          dragonBlack5  = "#202820",
          dragonBlack6  = "#282a24",
          dragonWhite   = "#c4cdb8",
          dragonBlue    = "#00c8a0",
          dragonBlue2   = "#20e8b8",
          dragonTeal    = "#00c8a0",
          dragonAqua    = "#20e8b8",
          dragonYellow  = "#c8a018",
          dragonViolet  = "#8060c8",
          -- Wave specific
          waveBlue1     = "#1a2018",
          waveBlue2     = "#282a24",
          winterGreen   = "#0a180a",
          winterYellow  = "#181400",
          winterRed     = "#180810",
          winterBlue    = "#0a0a0a",
          katanaGray    = "#282a24",
        },
      },

      overrides = function(colors)
        return {
          -- ── Base ────────────────────────────────────────────────────────
          CursorLine   = { bg = "#161a14" },
          CursorLineNr = { fg = "#00c8a0", bold = true },
          LineNr       = { fg = "#282a24" },
          SignColumn   = { bg = "NONE" },

          -- ── Separadores ─────────────────────────────────────────────────
          WinSeparator = { fg = "#282a24" },
          VertSplit    = { fg = "#282a24" },

          -- ── Directorios en lime (muy distinto de archivos) ───────────────
          Directory    = { fg = "#78e030", bold = true },

          -- ── Status ───────────────────────────────────────────────────────
          StatusLine   = { bg = "#0a0a0a", fg = "#c4cdb8" },
          StatusLineNC = { bg = "#070707", fg = "#3a4a38" },

          -- ── Tabs ─────────────────────────────────────────────────────────
          TabLine      = { bg = "#0a0a0a", fg = "#3a4a38" },
          TabLineSel   = { bg = "#1a2018", fg = "#00c8a0", bold = true },
          TabLineFill  = { bg = "#070707" },

          -- ── Telescope ────────────────────────────────────────────────────
          TelescopeNormal        = { bg = "#0f0f0f", fg = "#c4cdb8" },
          TelescopeBorder        = { fg = "#282a24", bg = "#0f0f0f" },
          TelescopePromptBorder  = { fg = "#00c8a0", bg = "#0f0f0f" },
          TelescopeResultsBorder = { fg = "#282a24", bg = "#0f0f0f" },
          TelescopePreviewBorder = { fg = "#282a24", bg = "#0f0f0f" },
          TelescopeSelection     = { bg = "#1a2018" },
          TelescopeMatching      = { fg = "#78e030", bold = true },
          TelescopePromptPrefix  = { fg = "#00c8a0" },

          -- ── CMP ──────────────────────────────────────────────────────────
          Pmenu        = { bg = "#0f0f0f", fg = "#c4cdb8" },
          PmenuSel     = { bg = "#1a2018", fg = "#c4cdb8" },
          PmenuSbar    = { bg = "#141414" },
          PmenuThumb   = { bg = "#00c8a0" },

          -- ── Diagnostics ──────────────────────────────────────────────────
          DiagnosticError            = { fg = "#d02848" },
          DiagnosticWarn             = { fg = "#c8a018" },
          DiagnosticInfo             = { fg = "#00c8a0" },
          DiagnosticHint             = { fg = "#78e030" },
          DiagnosticVirtualTextError = { fg = "#d02848", bg = "#180810" },
          DiagnosticVirtualTextWarn  = { fg = "#c8a018", bg = "#181400" },
          DiagnosticVirtualTextInfo  = { fg = "#00c8a0", bg = "#081410" },
          DiagnosticVirtualTextHint  = { fg = "#78e030", bg = "#0a1008" },
          DiagnosticUnderlineError   = { undercurl = true, sp = "#d02848" },
          DiagnosticUnderlineWarn    = { undercurl = true, sp = "#c8a018" },

          -- ── Git diff ─────────────────────────────────────────────────────
          DiffAdd    = { bg = "#0a180a" },
          DiffChange = { bg = "#121412" },
          DiffDelete = { bg = "#180810" },
          DiffText   = { bg = "#1a2018" },

          -- ── Search ───────────────────────────────────────────────────────
          Search    = { bg = "#1a2018", fg = "#c8a018" },
          IncSearch = { bg = "#00c8a0", fg = "#070707", bold = true },
          CurSearch = { bg = "#78e030", fg = "#070707", bold = true },

          -- ── Indent guides ────────────────────────────────────────────────
          IblIndent = { fg = "#141414" },
          IblScope  = { fg = "#282a24" },

          -- ── Syntax ───────────────────────────────────────────────────────
          -- Keywords → rose
          ["@keyword"]           = { fg = "#e04870", italic = true },
          ["@keyword.function"]  = { fg = "#e04870", italic = true },
          ["@keyword.return"]    = { fg = "#e04870", italic = true },
          -- Funciones → lime
          ["@function"]          = { fg = "#78e030" },
          ["@function.call"]     = { fg = "#78e030" },
          ["@function.builtin"]  = { fg = "#20e8b8" },
          ["@method"]            = { fg = "#78e030" },
          ["@method.call"]       = { fg = "#78e030" },
          -- Strings → green
          ["@string"]            = { fg = "#2ed870" },
          ["@string.escape"]     = { fg = "#00c8a0" },
          -- Types → cyan
          ["@type"]              = { fg = "#00c8a0" },
          ["@type.builtin"]      = { fg = "#00c8a0", italic = true },
          -- Números → pink
          ["@number"]            = { fg = "#c050a0" },
          ["@float"]             = { fg = "#c050a0" },
          ["@boolean"]           = { fg = "#c050a0", italic = true },
          -- Operadores → cyan
          ["@operator"]          = { fg = "#00c8a0" },
          -- Variables → fg
          ["@variable"]          = { fg = "#c4cdb8" },
          ["@parameter"]         = { fg = "#a8b89c" },
          -- Namespace → lavender
          ["@namespace"]         = { fg = "#8060c8" },
          ["@module"]            = { fg = "#8060c8" },
          -- Constantes → orange
          ["@constant"]          = { fg = "#d06018" },
          ["@constant.builtin"]  = { fg = "#d06018", italic = true },
          -- Comentarios → dim
          ["@comment"]           = { fg = "#3a4a38", italic = true },
          -- Tags HTML/JSX → rose
          ["@tag"]               = { fg = "#e04870" },
          ["@tag.attribute"]     = { fg = "#00c8a0" },
          ["@tag.delimiter"]     = { fg = "#3a4a38" },
          -- Punctuation
          ["@punctuation.bracket"]   = { fg = "#5a7058" },
          ["@punctuation.delimiter"] = { fg = "#5a7058" },
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
