-- Configuración minimalista de Telescope — sin preview en ningún lado
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- Forzar preview desactivado en defaults
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        results_title    = false,
        prompt_title     = false,
        path_display     = { "filename_first" },
        previewer        = false,   -- deshabilitar previewer por defecto
        layout_strategy  = "cursor",
        layout_config    = {
          cursor = { width = 0.6, height = 0.5 },
        },
        sorting_strategy = "ascending",
      })

      -- Sin preview en todos los pickers
      local np = { previewer = false }
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files  = vim.tbl_extend("force", np, {
          hidden = true,
          file_ignore_patterns = {
            "mnt/", "%.git/", "node_modules/", "%.next/", "vendor/", "__pycache__/",
          },
        }),
        oldfiles    = np,
        live_grep   = np,
        buffers     = np,
        help_tags   = np,
        grep_string = np,
        git_files   = np,
        git_commits = np,
        git_status  = np,
        diagnostics = np,
      })

      return opts
    end,

    -- Forzar después del setup con hook
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
}
