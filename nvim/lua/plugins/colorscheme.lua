-- ═══════════════════════════════════════════════════════════════════════════════
-- Colorscheme - Everforest Dark Hard
-- Tema establecdio, warm/café, armónico, diseñado para coding de larga duración
-- bg: #272e33 · fg: #d3c6aa · green: #a7c080 · aqua: #83c092 · blue: #7fbbb3
-- yellow: #dbbc7f · orange: #e69875 · red: #e67e80 · purple: #d699b6
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  -- Quitar kanagawa
  { "rebelot/kanagawa.nvim", enabled = false },

  -- Everforest (Lua port, LazyVim-compatible)
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background              = "hard",           -- más contraste, fondo más oscuro
        transparent_background_level = 0,           -- fondo propio del tema (sin filtros del terminal)
        italics                 = true,
        disable_italic_comments = false,
        sign_column_background  = "none",
        ui_contrast             = "low",            -- bordes sutiles
        dim_inactive_windows    = false,
        diagnostic_text_highlight = false,
        diagnostic_virtual_text = "coloured",
        diagnostic_line_highlight = false,
        show_eob                = false,            -- sin ~ al final del buffer
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },

  { "catppuccin", enabled = false },
  { "tokyonight", enabled = false },
}
