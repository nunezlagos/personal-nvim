return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      -- Abrir oil en el directorio del archivo actual
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open oil (current file)" },
      -- Abrir oil en cwd
      { "<leader>E", function() require("oil").open(vim.fn.getcwd()) end, desc = "Open oil (cwd)" },
    },
    opts = {
      -- Mostrar como buffer full, no float lateral
      default_file_explorer = true,
      delete_to_trash = true,
      -- Columnas: solo el nombre, sin iconos ni permisos
      columns = { "icon" },
      -- Keymaps dentro de oil
      keymaps = {
        -- Navegar directorios en el mismo buffer (no abre nuevo buffer)
        ["<CR>"]       = "actions.select",
        ["l"]          = "actions.select",
        ["<Right>"]    = "actions.select",   -- → entrar a directorio
        ["h"]          = "actions.parent",
        ["<Left>"]     = "actions.parent",   -- ← subir un nivel
        ["<BS>"]       = "actions.parent",
        ["-"]          = "actions.parent",
        ["q"]     = "actions.close",
        ["<Esc>"] = "actions.close",
        ["r"]     = "actions.refresh",
        ["R"]     = "actions.rename",
        ["H"]     = "actions.toggle_hidden",
        ["gs"]    = "actions.change_sort",
        ["g."]    = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
      -- Reusar el mismo buffer al navegar (no acumular buffers)
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Vista: sin borde, buffer limpio
      float = {
        padding = 2,
        border = "rounded",
      },
      -- Preview en la ventana adyacente
      preview = {
        max_width = 0.5,
        min_width = 0.3,
      },
    },
  },
}
