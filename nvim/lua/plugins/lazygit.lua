return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = {
    {
      "<leader>gg",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        -- Si estamos en Oil, extraer el path real (oil:///ruta/ → /ruta/)
        local real_path = bufname:match("^oil://(.+)")
        if real_path then
          -- Quitar trailing slash
          real_path = real_path:gsub("/$", "")
          require("lazygit").lazygit(real_path)
        else
          vim.cmd("LazyGitCurrentFile")
        end
      end,
      desc = "Open LazyGit",
    },
  },
  opts = {
    floating_window = true,
    use_float = true,
    config = {
      theme = "kanagawa",
    },
  },
}
