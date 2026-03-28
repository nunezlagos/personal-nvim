-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Everforest + fondo neutro puro
-- Nvim transparente → hereda #141414 de Alacritty (sin filtro)
-- Colores Everforest para sintaxis: armónicos, warm, diseñados para coding largo
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
        background              = "hard",
        -- Transparente: el fondo lo pone Alacritty (#141414, neutro puro)
        transparent_background_level = 1,
        italics                 = true,
        disable_italic_comments = false,
        sign_column_background  = "none",
        ui_contrast             = "low",
        dim_inactive_windows    = false,
        diagnostic_text_highlight = false,
        diagnostic_virtual_text = "coloured",
        diagnostic_line_highlight = false,
        show_eob                = false,
      })

      -- Overrides: UI elements con fondo neutral (sin tinte verde de Everforest)
      local set = vim.api.nvim_set_hl
      set(0, "NormalFloat",  { bg = "#1e1e1e" })
      set(0, "FloatBorder",  { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "FloatTitle",   { fg = "#a7c080", bg = "#1e1e1e" })
      set(0, "Pmenu",        { bg = "#1e1e1e", fg = "#d3c6aa" })
      set(0, "PmenuSel",     { bg = "#2a2a2a", fg = "#d3c6aa" })
      set(0, "PmenuSbar",    { bg = "#222222" })
      set(0, "PmenuThumb",   { bg = "#a7c080" })
      set(0, "Visual",       { bg = "#2a2a2a" })
      set(0, "CursorLine",   { bg = "#1c1c1c" })
      set(0, "WinSeparator", { fg = "#2a2a2a", bg = "NONE" })
      -- Telescope
      set(0, "TelescopeNormal",        { bg = "#1e1e1e", fg = "#d3c6aa" })
      set(0, "TelescopeBorder",        { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopePromptBorder",  { fg = "#83c092", bg = "#1e1e1e" })
      set(0, "TelescopeResultsBorder", { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopePreviewBorder", { fg = "#3a3a3a", bg = "#1e1e1e" })
      set(0, "TelescopeSelection",     { bg = "#2a2a2a" })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "everforest" },
  },

  { "catppuccin", enabled = false },
  { "tokyonight", enabled = false },
}
