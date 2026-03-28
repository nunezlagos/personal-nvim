-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Obsidian v2
-- Fondo neutro puro · cyan desaturado · bordes mínimos · keratoconus-friendly
-- Cyan #00A888 · Lime #78E030 · Rose #D84870 · Green #2ED870
-- Pink #B84898 · Amber #B89018 · Orange #C86018 · Red #C82840
-- Lavender #7050B8 · bg #0A0A0A · fg #BEC8B2 (cálido, sin halo)
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
          -- Backgrounds (neutral puro, sin azul)
          sumiInk0      = "#070707",
          sumiInk1      = "#0a0a0a",
          sumiInk2      = "#0f0f0f",
          sumiInk3      = "#141414",
          sumiInk4      = "#1a2018",
          sumiInk5      = "#202820",
          sumiInk6      = "#262a22",
          -- Text (cálido)
          fujiWhite     = "#bec8b2",
          oldWhite      = "#a0b094",
          fujiGray      = "#384838",
          -- Cyan desaturado (menos agresivo)
          waveAqua1     = "#00a888",
          waveAqua2     = "#18c8a0",
          crystalBlue   = "#00a888",
          springBlue    = "#18c8a0",
          -- Green (strings)
          springGreen   = "#2ed870",
          autumnGreen   = "#2ed870",
          -- Lime (funciones/dirs)
          dragonGreen   = "#78e030",
          dragonGreen2  = "#90e848",
          -- Rose (keywords)
          peachRed      = "#d84870",
          samuraiRed    = "#d84870",
          suraBright    = "#d84870",
          autumnRed     = "#e05878",
          -- Pink (números)
          dragonPink    = "#b84898",
          -- Amber (warnings)
          carpYellow    = "#b89018",
          boatYellow1   = "#c86018",
          boatYellow2   = "#d07828",
          autumnYellow  = "#b89018",
          -- Orange
          dragonOrange  = "#c86018",
          dragonOrange2 = "#d07828",
          -- Red (errors)
          dragonRed     = "#e04060",
          -- Lavender (namespace)
          oniViolet     = "#7050b8",
          oniViolet2    = "#9070d0",
          springViolet1 = "#7050b8",
          springViolet2 = "#9070d0",
          -- Grays cálidos
          dragonGray    = "#384838",
          dragonGray2   = "#506050",
          dragonGray3   = "#a0b094",
          -- Dragon backgrounds
          dragonBlack0  = "#070707",
          dragonBlack1  = "#0a0a0a",
          dragonBlack2  = "#0f0f0f",
          dragonBlack3  = "#141414",
          dragonBlack4  = "#1a2018",
          dragonBlack5  = "#202820",
          dragonBlack6  = "#262a22",
          dragonWhite   = "#bec8b2",
          dragonBlue    = "#00a888",
          dragonBlue2   = "#18c8a0",
          dragonTeal    = "#00a888",
          dragonAqua    = "#18c8a0",
          dragonYellow  = "#b89018",
          dragonViolet  = "#7050b8",
          -- Wave specific
          waveBlue1     = "#1a2018",
          waveBlue2     = "#262a22",
          winterGreen   = "#0a1808",
          winterYellow  = "#141200",
          winterRed     = "#140810",
          winterBlue    = "#0a0a0a",
          katanaGray    = "#262a22",
        },
      },

      overrides = function(colors)
        return {
          -- ── Base minimal ─────────────────────────────────────────────────
          -- Cursor line: apenas perceptible
          CursorLine   = { bg = "#111310" },
          CursorLineNr = { fg = "#00a888", bold = true },
          LineNr       = { fg = "#262a22" },
          SignColumn   = { bg = "NONE" },
          ColorColumn  = { bg = "#111310" },

          -- ── Separadores mínimos ──────────────────────────────────────────
          -- Un solo carácter │ muy apagado, sin relleno visual
          WinSeparator = { fg = "#1e2018", bg = "NONE" },
          VertSplit    = { fg = "#1e2018", bg = "NONE" },

          -- ── Floats sin borde pesado ───────────────────────────────────────
          NormalFloat  = { bg = "#0f0f0f" },
          FloatBorder  = { fg = "#262a22", bg = "#0f0f0f" },
          FloatTitle   = { fg = "#00a888", bg = "#0f0f0f" },

          -- ── Sin ~ al final del buffer ─────────────────────────────────────
          EndOfBuffer  = { fg = "#0a0a0a" },

          -- ── Directorios en lime ───────────────────────────────────────────
          Directory    = { fg = "#78e030", bold = true },

          -- ── Status minimal ───────────────────────────────────────────────
          StatusLine   = { bg = "#0a0a0a", fg = "#bec8b2" },
          StatusLineNC = { bg = "#070707", fg = "#384838" },

          -- ── Tabs ─────────────────────────────────────────────────────────
          TabLine      = { bg = "#0a0a0a", fg = "#384838" },
          TabLineSel   = { bg = "#1a2018", fg = "#00a888", bold = true },
          TabLineFill  = { bg = "#070707" },

          -- ── Visual selection ─────────────────────────────────────────────
          Visual       = { bg = "#1a2018" },

          -- ── Telescope ────────────────────────────────────────────────────
          TelescopeNormal        = { bg = "#0f0f0f", fg = "#bec8b2" },
          TelescopeBorder        = { fg = "#262a22", bg = "#0f0f0f" },
          TelescopePromptBorder  = { fg = "#00a888", bg = "#0f0f0f" },
          TelescopeResultsBorder = { fg = "#262a22", bg = "#0f0f0f" },
          TelescopePreviewBorder = { fg = "#262a22", bg = "#0f0f0f" },
          TelescopeSelection     = { bg = "#1a2018" },
          TelescopeMatching      = { fg = "#78e030", bold = true },
          TelescopePromptPrefix  = { fg = "#00a888" },

          -- ── CMP ──────────────────────────────────────────────────────────
          Pmenu        = { bg = "#0f0f0f", fg = "#bec8b2" },
          PmenuSel     = { bg = "#1a2018", fg = "#bec8b2" },
          PmenuSbar    = { bg = "#141414" },
          PmenuThumb   = { bg = "#00a888" },
          PmenuBorder  = { fg = "#262a22" },

          -- ── Diagnostics ──────────────────────────────────────────────────
          DiagnosticError            = { fg = "#c82840" },
          DiagnosticWarn             = { fg = "#b89018" },
          DiagnosticInfo             = { fg = "#00a888" },
          DiagnosticHint             = { fg = "#78e030" },
          DiagnosticVirtualTextError = { fg = "#c82840", bg = "#140810" },
          DiagnosticVirtualTextWarn  = { fg = "#b89018", bg = "#141200" },
          DiagnosticVirtualTextInfo  = { fg = "#00a888", bg = "#081210" },
          DiagnosticVirtualTextHint  = { fg = "#78e030", bg = "#0a1008" },
          DiagnosticUnderlineError   = { undercurl = true, sp = "#c82840" },
          DiagnosticUnderlineWarn    = { undercurl = true, sp = "#b89018" },

          -- ── Git diff ─────────────────────────────────────────────────────
          DiffAdd    = { bg = "#0a1808" },
          DiffChange = { bg = "#111210" },
          DiffDelete = { bg = "#140810" },
          DiffText   = { bg = "#1a2018" },

          -- ── Search ───────────────────────────────────────────────────────
          Search    = { bg = "#1a2018", fg = "#b89018" },
          IncSearch = { bg = "#00a888", fg = "#070707", bold = true },
          CurSearch = { bg = "#78e030", fg = "#070707", bold = true },

          -- ── Indent guides (barely visible) ───────────────────────────────
          IblIndent = { fg = "#111310" },
          IblScope  = { fg = "#1e2018" },

          -- ── LSP references ───────────────────────────────────────────────
          LspReferenceText  = { bg = "#1a2018" },
          LspReferenceRead  = { bg = "#1a2018" },
          LspReferenceWrite = { bg = "#202820", bold = true },

          -- ── Syntax: eliminar todo tinte azul de Kanagawa ─────────────────
          -- Keywords → rose (no azul)
          Keyword        = { fg = "#d84870", italic = true },
          Statement      = { fg = "#d84870", bold = true },
          Conditional    = { fg = "#d84870", italic = true },
          Repeat         = { fg = "#d84870", italic = true },
          Exception      = { fg = "#d84870", italic = true },
          -- Funciones → lime
          Function       = { fg = "#78e030" },
          -- Strings → green
          String         = { fg = "#2ed870" },
          -- Types → cyan desaturado
          Type           = { fg = "#00a888" },
          StorageClass   = { fg = "#00a888", italic = true },
          -- Números → pink
          Number         = { fg = "#b84898" },
          Float          = { fg = "#b84898" },
          Boolean        = { fg = "#b84898", italic = true },
          -- Constantes → orange
          Constant       = { fg = "#c86018" },
          -- Namespace/Special → lavender
          Special        = { fg = "#7050b8" },
          SpecialChar    = { fg = "#00a888" },
          -- Identifiers
          Identifier     = { fg = "#bec8b2" },
          -- Operators → cyan
          Operator       = { fg = "#00a888" },
          -- Comments → dim
          Comment        = { fg = "#384838", italic = true },
          SpecialComment = { fg = "#384838", italic = true },
          -- Preprocessor
          PreProc        = { fg = "#7050b8" },
          Include        = { fg = "#d84870", italic = true },
          Define         = { fg = "#7050b8" },

          -- TreeSitter
          ["@keyword"]           = { fg = "#d84870", italic = true },
          ["@keyword.function"]  = { fg = "#d84870", italic = true },
          ["@keyword.return"]    = { fg = "#d84870", italic = true },
          ["@keyword.operator"]  = { fg = "#d84870" },
          ["@function"]          = { fg = "#78e030" },
          ["@function.call"]     = { fg = "#78e030" },
          ["@function.builtin"]  = { fg = "#18c8a0" },
          ["@method"]            = { fg = "#78e030" },
          ["@method.call"]       = { fg = "#78e030" },
          ["@constructor"]       = { fg = "#00a888" },
          ["@string"]            = { fg = "#2ed870" },
          ["@string.escape"]     = { fg = "#00a888" },
          ["@string.special"]    = { fg = "#00a888" },
          ["@type"]              = { fg = "#00a888" },
          ["@type.builtin"]      = { fg = "#00a888", italic = true },
          ["@type.definition"]   = { fg = "#00a888" },
          ["@number"]            = { fg = "#b84898" },
          ["@float"]             = { fg = "#b84898" },
          ["@boolean"]           = { fg = "#b84898", italic = true },
          ["@operator"]          = { fg = "#00a888" },
          ["@variable"]          = { fg = "#bec8b2" },
          ["@variable.builtin"]  = { fg = "#d84870", italic = true },
          ["@parameter"]         = { fg = "#a0b094" },
          ["@field"]             = { fg = "#bec8b2" },
          ["@property"]          = { fg = "#bec8b2" },
          ["@namespace"]         = { fg = "#7050b8" },
          ["@module"]            = { fg = "#7050b8" },
          ["@constant"]          = { fg = "#c86018" },
          ["@constant.builtin"]  = { fg = "#c86018", italic = true },
          ["@comment"]           = { fg = "#384838", italic = true },
          ["@tag"]               = { fg = "#d84870" },
          ["@tag.attribute"]     = { fg = "#00a888" },
          ["@tag.delimiter"]     = { fg = "#384838" },
          ["@punctuation.bracket"]   = { fg = "#506050" },
          ["@punctuation.delimiter"] = { fg = "#506050" },
          ["@punctuation.special"]   = { fg = "#00a888" },
          -- LSP semantic tokens (evitar azules)
          ["@lsp.type.variable"]    = { fg = "#bec8b2" },
          ["@lsp.type.parameter"]   = { fg = "#a0b094" },
          ["@lsp.type.function"]    = { fg = "#78e030" },
          ["@lsp.type.method"]      = { fg = "#78e030" },
          ["@lsp.type.keyword"]     = { fg = "#d84870", italic = true },
          ["@lsp.type.type"]        = { fg = "#00a888" },
          ["@lsp.type.class"]       = { fg = "#00a888" },
          ["@lsp.type.interface"]   = { fg = "#00a888" },
          ["@lsp.type.namespace"]   = { fg = "#7050b8" },
          ["@lsp.type.property"]    = { fg = "#bec8b2" },
          ["@lsp.type.string"]      = { fg = "#2ed870" },
          ["@lsp.type.number"]      = { fg = "#b84898" },
          ["@lsp.type.operator"]    = { fg = "#00a888" },
          ["@lsp.type.comment"]     = { fg = "#384838", italic = true },
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
