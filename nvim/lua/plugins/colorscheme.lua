-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Everforest + colores saturados + fondo neutro puro
-- green: #98c870 · aqua: #68cc88 · yellow: #dcb860 · orange: #e88462
-- red: #e86262 · purple: #d87fad · blue: #65bfb8
-- bg: #141414 (neutro puro via Alacritty, sin filtro)
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  { "rebelot/kanagawa.nvim", enabled = false },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background                   = "hard",
        transparent_background_level = 1,   -- bg neutro de Alacritty (#141414)
        italics                      = true,
        disable_italic_comments      = false,
        sign_column_background       = "none",
        ui_contrast                  = "low",
        dim_inactive_windows         = false,
        diagnostic_text_highlight    = false,
        diagnostic_virtual_text      = "coloured",
        diagnostic_line_highlight    = false,
        show_eob                     = false,
      })

      local set = vim.api.nvim_set_hl

      -- ── UI neutral (sin tinte verde de Everforest) ───────────────────────
      set(0, "NormalFloat",  { bg = "#1e1e1e" })
      set(0, "FloatBorder",  { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "FloatTitle",   { fg = "#98c870", bg = "#1e1e1e" })
      set(0, "Pmenu",        { bg = "#1e1e1e", fg = "#d5c8a5" })
      set(0, "PmenuSel",     { bg = "#2a2a2a", fg = "#d5c8a5" })
      set(0, "PmenuSbar",    { bg = "#222222" })
      set(0, "PmenuThumb",   { bg = "#98c870" })
      set(0, "Visual",       { bg = "#2a2a2a" })
      set(0, "CursorLine",   { bg = "#1c1c1c" })
      set(0, "WinSeparator", { fg = "#2a2a2a", bg = "NONE" })

      -- ── Telescope ────────────────────────────────────────────────────────
      set(0, "TelescopeNormal",        { bg = "#1e1e1e", fg = "#d5c8a5" })
      set(0, "TelescopeBorder",        { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopePromptBorder",  { fg = "#68cc88", bg = "#1e1e1e" })
      set(0, "TelescopeResultsBorder", { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopePreviewBorder", { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopeSelection",     { bg = "#2a2a2a" })
      set(0, "TelescopeMatching",      { fg = "#98c870", bold = true })
      set(0, "TelescopePromptPrefix",  { fg = "#68cc88" })

      -- ── Syntax saturada ──────────────────────────────────────────────────
      -- Strings → green vibrante
      set(0, "String",  { fg = "#98c870" })
      set(0, "@string", { fg = "#98c870" })
      set(0, "@string.escape", { fg = "#68cc88" })

      -- Funciones → aqua/green
      set(0, "Function",       { fg = "#68cc88" })
      set(0, "@function",      { fg = "#68cc88" })
      set(0, "@function.call", { fg = "#68cc88" })
      set(0, "@method",        { fg = "#68cc88" })
      set(0, "@method.call",   { fg = "#68cc88" })
      set(0, "@function.builtin", { fg = "#65bfb8" })

      -- Keywords → rojo-rosa
      set(0, "Keyword",   { fg = "#e86262", italic = true })
      set(0, "Statement", { fg = "#e86262", bold = true })
      set(0, "@keyword",  { fg = "#e86262", italic = true })
      set(0, "@keyword.function", { fg = "#e86262", italic = true })
      set(0, "@keyword.return",   { fg = "#e86262", italic = true })

      -- Types → teal/blue
      set(0, "Type",           { fg = "#65bfb8" })
      set(0, "@type",          { fg = "#65bfb8" })
      set(0, "@type.builtin",  { fg = "#65bfb8", italic = true })
      set(0, "@constructor",   { fg = "#65bfb8" })

      -- Números → naranja
      set(0, "Number",   { fg = "#e88462" })
      set(0, "Float",    { fg = "#e88462" })
      set(0, "Boolean",  { fg = "#e88462", italic = true })
      set(0, "@number",  { fg = "#e88462" })
      set(0, "@float",   { fg = "#e88462" })
      set(0, "@boolean", { fg = "#e88462", italic = true })

      -- Constantes → yellow
      set(0, "Constant",          { fg = "#dcb860" })
      set(0, "@constant",         { fg = "#dcb860" })
      set(0, "@constant.builtin", { fg = "#dcb860", italic = true })

      -- Operadores → aqua
      set(0, "Operator",   { fg = "#68cc88" })
      set(0, "@operator",  { fg = "#68cc88" })

      -- Namespace/Special → purple
      set(0, "Special",    { fg = "#d87fad" })
      set(0, "@namespace", { fg = "#d87fad" })
      set(0, "@module",    { fg = "#d87fad" })

      -- Tags (HTML/JSX)
      set(0, "@tag",           { fg = "#e86262" })
      set(0, "@tag.attribute", { fg = "#dcb860" })
      set(0, "@tag.delimiter", { fg = "#5a5a5a" })

      -- LSP semantic tokens
      set(0, "@lsp.type.function",   { fg = "#68cc88" })
      set(0, "@lsp.type.method",     { fg = "#68cc88" })
      set(0, "@lsp.type.type",       { fg = "#65bfb8" })
      set(0, "@lsp.type.class",      { fg = "#65bfb8" })
      set(0, "@lsp.type.interface",  { fg = "#65bfb8" })
      set(0, "@lsp.type.namespace",  { fg = "#d87fad" })
      set(0, "@lsp.type.string",     { fg = "#98c870" })
      set(0, "@lsp.type.number",     { fg = "#e88462" })
      set(0, "@lsp.type.keyword",    { fg = "#e86262", italic = true })

      -- Diagnostics
      set(0, "DiagnosticError", { fg = "#e86262" })
      set(0, "DiagnosticWarn",  { fg = "#dcb860" })
      set(0, "DiagnosticInfo",  { fg = "#68cc88" })
      set(0, "DiagnosticHint",  { fg = "#98c870" })

      -- Search
      set(0, "IncSearch", { bg = "#68cc88", fg = "#141414", bold = true })
      set(0, "CurSearch",  { bg = "#98c870", fg = "#141414", bold = true })

      -- Cursor line número
      set(0, "CursorLineNr", { fg = "#68cc88", bold = true })
      set(0, "LineNr",       { fg = "#3a3a3a" })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "everforest" },
  },

  { "catppuccin", enabled = false },
  { "tokyonight", enabled = false },
}
