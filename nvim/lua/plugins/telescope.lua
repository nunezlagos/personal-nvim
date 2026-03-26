-- Configuración minimalista de Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        results_title = false,
        prompt_prefix = " >",
        selection_caret = "",
        entry_prefix = "  ",
        path_display = { "truncate" },
        border = false,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devkit = false,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
          file_ignore_patterns = {
            "mnt/",           -- Ignorar mounts SSHFS
            "%.git/",
            "node_modules/",
            "%.next/",
            "vendor/",
            "__pycache__/",
          },
        },
        oldfiles = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
      },
    },
  },
}
